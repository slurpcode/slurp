const ALLOWED_TARGET_URL = "https://prestonhunter.github.io/resume/"

addEventListener("fetch", event => {
  return event.respondWith(
    fetch(new URL(ALLOWED_TARGET_URL).toString())
  )
})
