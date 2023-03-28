async function handleRequest(request) {
  const init = {
    headers: {
      'content-type': 'text/html;charset=UTF-8',
    },
  };
  return new Response(someHTML, init);
}
addEventListener('fetch', event => {
  return event.respondWith(handleRequest(event.request));
});
const someHTML =  `<!doctype html>
<html lang="en" prefix="og: http://ogp.me/ns#">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Magic Worker Boom !!! 😈 👿 👹 👺 🤡 💩 👻 💀 ☠️ 👽 👾 🤖</title>
    <meta property="og:image" content="https://fuchsia.surf/assets/images/movies/fuchsia-327.png">
    <meta property="og:image:alt" content="Ready Player One.....">
    <meta property="og:title" content="Magic Worker Boom !!!">
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://magic.slurp.workers.dev/">
  </head>
  <body>
    <div id="banner">Magic Worker Boom !?? 😈 👿 👹 👺 🤡 💩 👻 💀 ☠️ 👽 👾 🤖</div>
    <script>
        const t = document.getElementById('banner');
        const s = t.innerHTML.trim();
        let index = 0;
        window.setInterval(function(){
            if(index==57)index=0;
            let title = s.slice(index) + s.slice(0, index);
            t.innerHTML = title;
            index++;
        }, 500);
    </script>
  </body>
</html>
`;
