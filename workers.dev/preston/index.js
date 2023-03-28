addEventListener('fetch', event => {
  return event.respondWith(
    fetch('https://prestonhunter.github.io/resume/')
  );
});
