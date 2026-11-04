// The upstream is fixed and must never be derived from the incoming request
// (URL, headers or body); doing so would turn this worker into an open proxy.
const TARGET_URL = "https://prestonhunter.github.io/resume/"

addEventListener("fetch", event => {
  return event.respondWith(fetch(TARGET_URL))
})
