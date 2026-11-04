const test = require("node:test")
const assert = require("node:assert")
const fs = require("node:fs")
const path = require("node:path")
const vm = require("node:vm")

const TARGET_URL = "https://prestonhunter.github.io/resume/"

// Load the worker script with stubbed Workers globals and return its handler
// plus the list of URLs it passed to fetch.
function loadWorker() {
  const fetched = []
  let handler
  const context = {
    addEventListener: (type, fn) => {
      if (type === "fetch") handler = fn
    },
    fetch: input => {
      fetched.push(typeof input === "string" ? input : input.url)
      return Promise.resolve(new Response("ok"))
    },
  }
  const source = fs.readFileSync(path.join(__dirname, "index.js"), "utf8")
  vm.runInNewContext(source, context)
  return { handler, fetched }
}

const attacks = [
  new Request("https://preston.example.workers.dev/?url=http://169.254.169.254/latest/meta-data/"),
  new Request("https://preston.example.workers.dev/http://localhost:8080/admin"),
  new Request("https://preston.example.workers.dev/", {
    headers: { "X-Forward-Url": "http://127.0.0.1/", Host: "10.0.0.1" },
  }),
  new Request("https://preston.example.workers.dev/", {
    method: "POST",
    body: "http://192.168.0.1/",
  }),
]

for (const request of attacks) {
  test(`only fetches the fixed upstream for ${request.method} ${request.url}`, () => {
    const { handler, fetched } = loadWorker()
    let responded
    handler({ request, respondWith: r => (responded = r) })
    return Promise.resolve(responded).then(() => {
      assert.deepStrictEqual(fetched, [TARGET_URL])
    })
  })
}
