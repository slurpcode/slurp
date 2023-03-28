let game;

function animate_flower() {
  $('#imgo').animate({ height: '+=550' }, 4000, () => {
    // Animation complete.
  });
}

function eggs() {
  $('#px').click(() => {
    effect(1);
    $('header').css({ visibility: 'hidden' });
    $('nav').css({ visibility: 'hidden' });
    $('#overlay').css({ display: 'block' });
    animate_flower();
  });
  $('#overlay').click(() => {
    reset();
  });
  const easterEggs = [
    'reset',
    'fuchsia',
    'king',
    'winter',
    'digger',
    'matrix',
    'jurassic',
    'christmas',
    'easter',
    'flowers',
    'orange',
    'yeti',
    'min',
    'alien',
    'dino',
    'bear',
    'bubble',
    'ghost',
    'darth',
    'thexder',
    'fireball',
    'space',
    'police',
    'karate',
    'punch',
    'jaguar',
    'beasts',
    'lucky',
    'harley',
    'jorge',
    'barney',
    'karine',
    'sugi',
    'jedi',
    'timecop',
    'midnight',
    'gunship',
    'invaders',
    'rain',
    'adem',
    'preston',
    'natasha',
    'platformer',
    'fighter',
    'andrew',
    'aleah'
  ];
  let keyHistory = '';
  let match;
  let winter = false;
  $(document).keypress((e) => {
    keyHistory += String.fromCharCode(e.which);
    for (let i = 0; i < easterEggs.length; i++) {
      const eggLength = easterEggs[i].length;
      match = keyHistory.match(easterEggs[i]);
      if (match) {
        // alert(match);
        $('#c').remove();
        $('#starfield').remove();
        $('#gamecontainer').remove();
        $('#info').remove();
        if (game) game.stop();

        if (winter) {
          stopPlay(true);
          winter = false;
        } else {
          stopPlay(false);
        }
        switch (match.toString()) {
        case 'reset':
          reset();
          break;
        case 'fuchsia':
          effect(3);
          break;
        case 'harley':
          loadUrl('https://www.upwork.com/fl/harleya');
          break;
        case 'jorge':
          loadUrl(
            'https://www.upwork.com/freelancers/~01abf139414e3d1c0d'
          );
          break;
        case 'barney':
          loadUrl('https://www.upwork.com/o/profiles/users/~015e56316c3aa9a286');
          break;
        case 'karine':
          loadUrl(
            'https://www.upwork.com/freelancers/~016cd3dcf007c09abd'
          );
          break;
        case 'sugi':
          loadUrl(
            'https://www.upwork.com/freelancers/~01e12d81269df3013f'
          );
          break;
        case 'adem':
          loadUrl(
            'https://www.upwork.com/freelancers/~01f7de714857f22bab'
          );
          break;
        case 'preston':
          loadUrl(
            'https://www.upwork.com/freelancers/~012ab645e1d96a5c7f'
          );
          break;
        case 'natasha':
          loadUrl(
            'https://www.upwork.com/freelancers/~0147c7f6022695298b'
          );
          break;
        case 'andrew':
          loadUrl(
            'https://www.upwork.com/freelancers/~015e5954268934128d'
          );
          break;
        case 'aleah':
          loadUrl(
            'https://www.upwork.com/freelancers/~012f83431b8bc482b3'
          );
          break;
        default:
          effect(1);
          var background = match.toString();
          if (
            background === 'orange' ||
                            background === 'yeti' ||
                            background === 'min' ||
                            background === 'alien' ||
                            background === 'dino' ||
                            background === 'bear' ||
                            background === 'bubble' ||
                            background === 'ghost' ||
                            background === 'darth' ||
                            background === 'thexder' ||
                            background === 'fireball' ||
                            background === 'space' ||
                            background === 'police' ||
                            background === 'karate' ||
                            background === 'punch' ||
                            background === 'jaguar' ||
                            background === 'beasts' ||
                            background === 'lucky' ||
                            background === 'flowers' ||
                            background === 'invaders' ||
                            background === 'platformer'
          ) {
            background = 'flowers';
          }
          if (background === 'rain') {
            $('body').css({
              background:
                                    '-moz-linear-gradient(top,  rgba(8,13,40,1) 0%, rgba(38,19,0,1) 100%)',
              background:
                                    '-webkit-linear-gradient(top,  rgba(8,13,40,1) 0%,rgba(38,19,0,1) 100%)',
              background:
                                    'linear-gradient(to bottom,  rgba(8,13,40,1) 0%,rgba(38,19,0,1) 100%)'
            });
          } else {
            const url =
                                `assets/images/backgrounds/${ 
                                  background 
                                }.jpg`;
            $('body').css(
              'background',
              `url(${  url  }) 0px 65px`
            );
            switch (background) {
            case 'digger':
              play(
                'https://www.youtube-nocookie.com/embed/l0yQfyJlqdA?rel=0',
                2
              );
              break;
            case 'king':
              play(
                'https://www.youtube-nocookie.com/embed/bdrjMcwZ0wk?rel=0',
                2
              );
              break;
            case 'christmas':
              play(
                'https://www.youtube-nocookie.com/embed/z-wT3HXS_sA?rel=0',
                2
              );
              break;
            case 'easter':
              play(
                'https://www.youtube-nocookie.com/embed/uDfVZj0PKoU?rel=0',
                2
              );
              break;
            case 'jurassic':
              play(
                'https://www.youtube-nocookie.com/embed/PJlmYh27MHg?rel=0',
                2
              );
              break;
            case 'midnight':
              play(
                'https://www.youtube-nocookie.com/embed/TiNWEm7fjv0?rel=0',
                2
              );
              break;
            case 'gunship':
              play(
                'https://www.youtube-nocookie.com/embed/ri9IefTuNzc?start=8&amp;rel=0',
                2
              );
              break;
            case 'timecop':
              play(
                'https://www.youtube-nocookie.com/embed/651c5aqbqm4?rel=0',
                2
              );
              break;
            case 'jedi':
              play(
                'https://www.youtube-nocookie.com/embed/ut4WoDi-AEM?rel=0&amp;start=11',
                2
              );
              break;
            case 'fighter':
              play(
                'https://www.youtube-nocookie.com/embed/Vs4mePDYg4Q?rel=0&amp;start=43',
                2
              );
              $('#youtube').after(
                '<canvas id="c"></canvas>'
              );
              beastsHorizontal('fireball');
              break;
            }
          }

          if (match.toString() === 'matrix') {
            $('#youtube').after('<canvas id="c"></canvas>');
            matrix();
          }

          if (match.toString() === 'rain') {
            $('#youtube').after('<canvas id="c"></canvas>');
            stopPlay(false);
            $('#audio').append(
              '<audio id="my_audio" src="assets/audio/rain.mp4" loop></audio>'
            );
            const promise = document
              .querySelector('audio')
              .play();
            if (promise !== undefined) {
              promise
                .then((_) => {
                  // Autoplay started!
                })
                .catch((error) => {
                  // Autoplay was prevented.
                  // Show a "Play" button so that user can start playback.
                });
            }
            $.getScript(
              'assets/js/raindrops.js',
              () => {}
            );
          }

          if (match.toString() === 'platformer') {
            h = $(window).height() - 60;
            $('#youtube').after(
              `<iframe id="c" src="assets/games/platformer/index.html" height="${ 
                h 
              }" frameborder="0" allowfullscreen></iframe>`
            );
          }

          if (match.toString() === 'invaders') {
            $('#youtube').after(
              '<div id="starfield"></div><div id="gamecontainer"><canvas id="gameCanvas"></canvas></div><div id="info"><p>Move with arrow keys, fire with the space bar.</p></div>'
            );
            invaders();
          }

          if (match.toString() === 'flowers') {
            $('#youtube').after('<canvas id="c"></canvas>');
            flowers();
          }

          if (
            match.toString() === 'orange' ||
                            match.toString() === 'yeti' ||
                            match.toString() === 'min' ||
                            match.toString() === 'alien' ||
                            match.toString() === 'dino' ||
                            match.toString() === 'bear' ||
                            match.toString() === 'bubble' ||
                            match.toString() === 'ghost' ||
                            match.toString() === 'darth' ||
                            match.toString() === 'thexder' ||
                            match.toString() === 'space' ||
                            match.toString() === 'police' ||
                            match.toString() === 'karate' ||
                            match.toString() === 'punch' ||
                            match.toString() === 'jaguar'
          ) {
            $('#youtube').after('<canvas id="c"></canvas>');
            beasts(match.toString());
          }

          if (match.toString() === 'fireball') {
            $('#youtube').after('<canvas id="c"></canvas>');
            beastsHorizontal(match.toString());
          }

          if (
            match.toString() === 'beasts' ||
                            match.toString() === 'lucky'
          ) {
            $('#youtube').after('<canvas id="c"></canvas>');
            allBeasts(match.toString());
          }

          if (match.toString() === 'winter' && winter === false) {
            winter = true;
            stopPlay(false);
            $('#audio').append(
              '<audio id="my_audio" src="assets/audio/winter.mp4" loop></audio>'
            );
            const promise = document
              .querySelector('audio')
              .play();
            if (promise !== undefined) {
              promise
                .then((_) => {
                  // Autoplay started!
                })
                .catch((error) => {
                  // Autoplay was prevented.
                  // Show a "Play" button so that user can start playback.
                });
            }
            $.getScript(
              'assets/js/snowstorm-min.js',
              () => {
                snowStorm.flakesMaxActive = 75;
                snowStorm.useTwinkleEffect = true;
                snowStorm.toggleSnow();
              }
            );
          }
        }
        keyHistory = match = '';
      } else if (keyHistory.length > 30) {
        keyHistory = keyHistory.substr(
          keyHistory.length - eggLength - 1
        );
      }
    }
  });
}

function allBeasts(which) {
  const c = document.getElementById('c');
  const ctx = c.getContext('2d');
  c.height = document.body.scrollHeight;
  c.width = window.innerWidth;
  const font_size = 32;
  const columns = c.width / font_size;

  $('#allBeast').append(
    '<img id="img_orange" src="assets/images/beasts/orange.png">'
  );
  $('#allBeast').append(
    '<img id="img_alien" src="assets/images/beasts/alien.png">'
  );
  $('#allBeast').append(
    '<img id="img_darth" src="assets/images/beasts/darth.png" alt="darth">'
  );
  $('#allBeast').append(
    '<img id="img_jaguar" src="assets/images/beasts/jaguar.png">'
  );
  $('#allBeast').append(
    '<img id="img_min" src="assets/images/beasts/min.png">'
  );
  $('#allBeast').append(
    '<img id="img_ghost" src="assets/images/beasts/ghost.png">'
  );
  $('#allBeast').append(
    '<img id="img_bubble" src="assets/images/beasts/bubble.png">'
  );
  $('#allBeast').append(
    '<img id="img_bear" src="assets/images/beasts/bear.png">'
  );
  $('#allBeast').append(
    '<img id="img_thexder" src="assets/images/beasts/thexder.png">'
  );
  $('#allBeast').append(
    '<img id="img_dino" src="assets/images/beasts/dino.png">'
  );
  $('#allBeast').append(
    '<img id="img_space" src="assets/images/beasts/space.png">'
  );
  $('#allBeast').append(
    '<img id="img_yeti" src="assets/images/beasts/yeti.png">'
  );
  $('#allBeast').append(
    '<img id="img_police" src="assets/images/beasts/police.png">'
  );
  $('#allBeast').append(
    '<img id="img_karate" src="assets/images/beasts/karate.png">'
  );
  $('#allBeast').append(
    '<img id="img_punch" src="assets/images/beasts/punch.png">'
  );

  // var image = document.getElementById('source');
  // 13 images
  const image0 = document.getElementById('img_orange');
  const image1 = document.getElementById('img_alien');
  const image2 = document.getElementById('img_darth');
  const image3 = document.getElementById('img_jaguar');
  const image4 = document.getElementById('img_min');
  const image5 = document.getElementById('img_ghost');
  const image6 = document.getElementById('img_bubble');
  const image7 = document.getElementById('img_bear');
  const image8 = document.getElementById('img_thexder');
  const image9 = document.getElementById('img_dino');
  const image10 = document.getElementById('img_bear');
  const image11 = document.getElementById('img_space');
  const image12 = document.getElementById('img_yeti');
  const image13 = document.getElementById('img_police');
  const image14 = document.getElementById('img_karate');
  const image15 = document.getElementById('img_punch');

  // an array of drops - one per column
  const drops = [];

  // x below is the x coordinate
  // 1 = y co-ordinate of the drop(same for every drop initially)
  for (let x = 0; x < columns; x++) drops[x] = 0;
  // single random image
  const imgRand = Math.floor(Math.random() * 16);

  // drawing the characters
  function draw() {
    // Black BG for the canvas
    // translucent BG to show trail
    ctx.fillStyle = 'rgba(0, 0, 0, 0.05)';
    ctx.fillRect(0, 0, c.width, c.height);

    // ctx.fillStyle = fillColor; //orange text
    ctx.font = `${ font_size  }px arial`;
    // looping over drops
    for (let i = 0; i < drops.length; i++) {
      ctx.drawImage(
        eval(`image${  which === 'beasts' ? i % 16 : imgRand }`),
        i * font_size,
        drops[i] * font_size
      );

      // sending the drop back to the top randomly after it has crossed the
      // screen adding a randomness to the reset to make the drops scattered on
      // the Y axis
      if (drops[i] * font_size > c.height && Math.random() > 0.975)
        drops[i] = 0;

      // incrementing Y coordinate
      drops[i] += Math.floor(Math.random() * 1.5);
    }
  }
  setInterval(draw, 33);
}

function beasts(background) {
  $('#source').remove();
  const c = document.getElementById('c');
  const ctx = c.getContext('2d');
  c.height = document.body.scrollHeight;
  c.width = window.innerWidth;
  const font_size = 32;
  const columns = c.width / font_size;
  const effectImage = `assets/images/beasts/${  background  }.png`;
  $('#effect').append(`<img id="source" src="${  effectImage  }">`);
  const image = document.getElementById('source');
  // an array of drops - one per column
  const drops = [];

  // x below is the x coordinate
  // 1 = y co-ordinate of the drop(same for every drop initially)
  for (let x = 0; x < columns; x++) drops[x] = 0;

  // drawing the characters
  function draw() {
    // Black BG for the canvas
    // translucent BG to show trail
    ctx.fillStyle = 'rgba(0, 0, 0, 0.05)';
    ctx.fillRect(0, 0, c.width, c.height);

    // ctx.fillStyle = fillColor; //orange text
    ctx.font = `${ font_size  }px arial`;
    // looping over drops
    for (let i = 0; i < drops.length; i++) {
      // a random chinese character to print
      // var text = chinese[Math.floor(Math.random()*chinese.length)];
      // x = i*font_size, y = value of drops[i]*font_size
      // ctx.fillText(text, i*font_size, drops[i]*font_size);

      ctx.drawImage(image, i * font_size, drops[i] * font_size);

      // sending the drop back to the top randomly after it has crossed the
      // screen adding a randomness to the reset to make the drops scattered on
      // the Y axis
      if (drops[i] * font_size > c.height && Math.random() > 0.975)
        drops[i] = 0;

      // incrementing Y coordinate
      drops[i] += Math.floor(Math.random() * 1.5);
    }
  }
  setInterval(draw, 33);
}

function beastsHorizontal(background) {
  $('#source').remove();
  const c = document.getElementById('c');
  const ctx = c.getContext('2d');
  c.height = document.body.scrollHeight;
  c.width = window.innerWidth;
  const font_size = 32;
  const rows = c.height / font_size;
  const effectImage = `assets/images/beasts/${  background  }.png`;
  $('#effect').append(`<img id="source" src="${  effectImage  }">`);
  const image = document.getElementById('source');
  // an array of drops - one per row
  const drops = [];

  // j = x co-ordinate of the drop(same for every drop initially at x=0 moving
  // left to right
  for (let j = 0; j < rows; j++) drops[j] = 0;

  // drawing the characters
  function draw() {
    // Black BG for the canvas
    // translucent BG to show trail
    ctx.fillStyle = 'rgba(0, 0, 0, 0.05)';
    ctx.fillRect(0, 0, c.width, c.height);

    ctx.fillStyle = 'blue'; // orange text
    ctx.font = `${ font_size  }px arial`;
    // looping over drops
    for (let i = 0; i < drops.length; i++) {
      // a random chinese character to print
      // var text = chinese[Math.floor(Math.random()*chinese.length)];
      // x = i*font_size, y = value of drops[i]*font_size
      // ctx.fillText(text, i*font_size, drops[i]*font_size);

      ctx.drawImage(image, drops[i] * font_size, i * font_size);

      // sending the drop back to the top randomly after it has crossed the
      // screen adding a randomness to the reset to make the drops scattered on
      // the Y axis
      if (drops[i] * font_size > c.width && Math.random() > 0.975)
        drops[i] = 0;

      // incrementing X coordinate
      drops[i] += Math.floor(Math.random() * 1.5);
    }
  }
  setInterval(draw, 33);
}

function flowers() {
  $('#source').remove();
  const c = document.getElementById('c');
  const ctx = c.getContext('2d');
  c.height = document.body.scrollHeight;
  c.width = window.innerWidth;
  const font_size = 32;
  const columns = c.width / font_size;
  $('#effect').append(
    '<img id="source" src="assets/images/icons/favicon-32x32.png">'
  );
  const image = document.getElementById('source');
  // an array of drops - one per column
  const drops = [];
  // x below is the x coordinate
  // 1 = y co-ordinate of the drop(same for every drop initially)
  for (let x = 0; x < columns; x++) drops[x] = 0;

  // drawing the characters
  function draw() {
    // Black BG for the canvas
    // translucent BG to show trail
    ctx.fillStyle = 'rgba(0, 0, 0, 0.05)';
    ctx.fillRect(0, 0, c.width, c.height);

    ctx.fillStyle = '#FF0080'; // green text
    ctx.font = `${ font_size  }px arial`;
    // looping over drops
    for (let i = 0; i < drops.length; i++) {
      // a random chinese character to print
      // var text = chinese[Math.floor(Math.random()*chinese.length)];
      // x = i*font_size, y = value of drops[i]*font_size
      // ctx.fillText(text, i*font_size, drops[i]*font_size);

      ctx.drawImage(image, i * font_size, drops[i] * font_size);

      // sending the drop back to the top randomly after it has crossed the
      // screen adding a randomness to the reset to make the drops scattered on
      // the Y axis
      if (drops[i] * font_size > c.height && Math.random() > 0.975)
        drops[i] = 0;

      // incrementing Y coordinate
      drops[i] += Math.floor(Math.random() * 1.5);
    }
  }
  setInterval(draw, 33);
}

function matrix() {
  $('#audio').append(
    '<audio id="my_audio" src="assets/audio/matrix.mp4" loop></audio>'
  );
  const promise = document.querySelector('audio').play();
  if (promise !== undefined) {
    promise
      .then((_) => {
        // Autoplay started!
      })
      .catch((error) => {
        // Autoplay was prevented.
        // Show a "Play" button so that user can start playback.
      });
  }

  const c = document.getElementById('c');
  const ctx = c.getContext('2d');

  // making the canvas full screen
  c.height = document.body.scrollHeight;
  c.width = window.innerWidth;

  // chinese characters - taken from the unicode charset
  let chinese =
        '田由甲申甴电甶男甸甹町画甼甽甾甿畀畁畂畃畄畅畆畇畈畉畊畋界畍畎畏畐畑';
    // converting the string into an array of single characters
  chinese = chinese.split('');

  const font_size = 17;
  const columns = c.width / font_size; // number of columns for the rain
  // an array of drops - one per column
  const drops = [];
  // x below is the x coordinate
  // 1 = y co-ordinate of the drop(same for every drop initially)
  for (let x = 0; x < columns; x++) drops[x] = 1;

  // drawing the characters
  function draw() {
    // Black BG for the canvas
    // translucent BG to show trail
    ctx.fillStyle = 'rgba(0, 0, 0, 0.05)';
    ctx.fillRect(0, 0, c.width, c.height);

    ctx.fillStyle = '#0F0'; // green text
    ctx.font = `${ font_size  }px arial`;
    // looping over drops
    for (let i = 0; i < drops.length; i++) {
      // a random chinese character to print
      const text = chinese[Math.floor(Math.random() * chinese.length)];
      // x = i*font_size, y = value of drops[i]*font_size
      ctx.fillText(text, i * font_size, drops[i] * font_size);

      // sending the drop back to the top randomly after it has crossed the
      // screen adding a randomness to the reset to make the drops scattered on
      // the Y axis
      if (drops[i] * font_size > c.height && Math.random() > 0.975)
        drops[i] = 0;

      // incrementing Y coordinate
      drops[i] += Math.floor(Math.random() * 2);
    }
  }
  setInterval(draw, 33);
}

function stopPlay(n) {
  $('#my_audio').remove();
  $('#overlay').css({ display: 'none' });
  if (n === true) {
    snowStorm.toggleSnow();
  }
  $('#vid').remove();
  $('#youtube').css({ height: '0', visibility: 'hidden' });
}

function play(url, nopicture = 1) {
  // 1 for black hack
  effect(nopicture);
  $('#youtube').css({ height: '315', visibility: 'visible' });
  $('#youtube').append(
    '<iframe id="vid" width="560" height="315" src="" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'
  );
  const videoURL = `${ url  }&amp;autoplay=1`;
  $('#vid').prop('src', videoURL);
  $('#vid').css({ width: '560', height: '315', visibility: 'visible' });
}

function reset() {
  location.reload();
}

function loadUrl(url) {
  stopPlay(false);
  window.open(url, '_self');
}

function effect(n) {
  $('header').css({ height: '50' });
  $('.site-title').empty();
  $('.site-title').append('Fuchsia Programming');
  $('main').remove();
  $('footer').remove();
  $('header').css({ visibility: 'visible' });
  if (n === 1) {
    $('body').css({
      'background-color': 'black',
      height: '1145',
      'background-image': 'none'
    });
    $('.site-header').css({
      'border-bottom': '5px solid #424242',
      'border-top': '5px solid #424242'
    });
  } else if (n !== 2) {
    $('body').css({
      'background-color': '#FF0080',
      height: '1080',
      'background-image': 'none'
    });
    $('.site-header').css({
      'border-bottom': '5px solid #FF0080',
      'border-top': '5px solid #FF0080'
    });
  }
  $('nav').css({ visibility: 'hidden' });
  window.scrollTo(0, 0);
}

function invaders() {
  //  Create the starfield.
  const container = document.getElementById('starfield');
  const starfield = new Starfield();
  starfield.initialise(container);
  starfield.start();

  //  Setup the canvas.
  const canvas = document.getElementById('gameCanvas');
  canvas.width = 800;
  canvas.height = 600;
  //  Create the game.
  game = new Game();

  //  Initialise it with the game canvas.
  game.initialise(canvas);

  //  Start the game.
  game.start();

  //  Listen for keyboard events.
  window.addEventListener('keydown', (e) => {
    const keycode = e.which || window.event.keycode;
    //  Supress further processing of left/right/space (37/29/32)
    if (keycode == 37 || keycode == 39 || keycode == 32) {
      e.preventDefault();
    }
    game.keyDown(keycode);
  });
  window.addEventListener('keyup', (e) => {
    const keycode = e.which || window.event.keycode;
    game.keyUp(keycode);
  });

  function toggleMute() {
    game.mute();
    document.getElementById('muteLink').innerText = game.sounds.mute
      ? 'unmute'
      : 'mute';
  }
}
