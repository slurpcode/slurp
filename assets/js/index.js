document.addEventListener( 'click', function (e) {
    Cookies.set('clicks', Cookies.get('clicks') && (+Cookies.get('clicks') + 1) || 0);
    let x;
    if(+Cookies.get('clicks') === 25){
        // sonic boom
        x = 12;
    }else {
        x = Math.floor(Math.random()*9);
    }
    if(+Cookies.get('clicks') >= 25){
        Cookies.remove('clicks');
    }

    var cols = ['cyan', 'yellow', 'darkpink', 'red', 'blue', 'green', 'white', 'olive', 'black', 'lime', 'fuchsia',
                'purple', 'navy', 'teal', 'aqua', 'maroon', 'pink', 'deeppink', 'lightsalmon', 'teal', 'ivory',
                'orange', 'peru', 'plum'];
    var randomColor = cols[Math.floor(Math.random()*24)];
    var randomColor2 = cols[Math.floor(Math.random()*24)];
    var filler = {};
    var stroker = {};
    stroker[randomColor2] = randomColor;
    filler[randomColor] = randomColor2;

    // min 20 many colored circles spinning and fading out
    const burst1 = new mojs.Burst({
        radius:   { 0: 200 },
        count:    Math.floor(Math.random()*31) + 25,
        angle:    { 0: 90 },
        children: {
            shape:      'polygon',
            radius:     Math.floor(Math.random()*26) + 35,
            points:     200,
            fill:       cols,
            angle:      { 360: 0 },
            duration:   2000,
            delay:      'stagger( rand(0, 100) )',
            stroke:     stroker,
            strokeWidth: Math.floor(Math.random()*10) + 5
        }
    });
    // colored circles going straight out
    // try min 4
    const burst2 = new mojs.Burst({
        radius:   { 0: 100 },
        count:    Math.floor(Math.random()*17) + 4,
        children: {
            radius:       Math.floor(Math.random()*46) + 25,
            shape:        'circle',
            fill:         cols,
            strokeWidth:  Math.floor(Math.random()*10) + 5,
            duration:     2000,
            stroke:       stroker
        }
    });
    // yellow and greenish pentagons spin and fade out spin
    // try min 7
    const burst3 = new mojs.Burst({
        radius:   { 0: 100 },
        count:    Math.floor(Math.random()*14) + 7,
        children: {
            shape:          'polygon',
            radius:         30,
            points:         5,
            fill:           filler,
            angle:          { 360: 0 },
            duration:       2000,
            delay:          'stagger(0, 100)',
            stroke:         stroker,
            strokeWidth:    Math.floor(Math.random()*10) + 5
        }
    });
    // yellow circles fade out
    // min 7
    const burst4 = new mojs.Burst({
        radius:   { 0: 100 },
        count:    Math.floor(Math.random()*24) + 8,
        angle:    { 360: 0 },
        opacity:  { 1: 1 },
        children: {
            radius:         Math.floor(Math.random()*26) + 75,
            duration:       6000,
            fill:           filler,
            stroke:         stroker,
            strokeWidth:    Math.floor(Math.random()*10) + 20
        }
    });
    // min 7
    const burst5 = new mojs.Burst({
        radius:   { 0: 100 },
        count:    Math.floor(Math.random()*94) + 7,
        angle:    { 0: 90 },
        opacity:  { 1: 0 },
        children: {
            shape:          'zigzag',
            radius:         50,
            duration:       2000,
            fill:           cols,
            stroke:         stroker,
            strokeWidth:    5
        }
    });
    // triangles many colors fade out
    const burst6 = new mojs.Burst({
        radius:   { 0: 100 },
        count:    7,
        angle:    { 0: 90 },
        children: {
            shape:      'polygon',
            radius:     50,
            points:     3,
            fill:       cols,
            stroke:     stroker,
            strokeWidth:5,
            angle:      { 360: 0 },
            duration:   2000,
            delay:      'stagger(0, 100)'
        }
    });
    // sonic boom
    const burst7 = new mojs.Burst({
        radius:   { 0: 250 },
        count:    20,
        degree:   {0: 180},
        children: {
            shape:      'circle',
            radius:     {1: 50},
            fill:       cols,
            stroke:     stroker,
            strokeWidth: {1: 15},
            duration:   3000,
        }
    });


    const burst8 = new mojs.Burst({
        radius:   { 0: 250 },
        count:    20,
        degree:   {0: 180},
        angle:  180,
        children: {
            shape:      'circle',
            radius:     {1: 65},
            fill:       cols,
            stroke:     stroker,
            strokeWidth: {1: 25},
            duration:   3000,
        }
    });

    const burst9 = new mojs.Burst({
        radius:   { 0: 250 },
        count:    100,
        angle:    { 360 : 0 },
        children: {
            shape:      'polygon',
            radius:     100,
            points:     4,
            fill:       cols,
            stroke:     stroker,
            strokeWidth:15,
            angle:      { 360: 0 },
            duration:   2000,
            delay:      'stagger(0, 10)'
        }
    });

    const burst10 = new mojs.Burst({
        radius:   { 0: 350 },
        count:    Math.floor(Math.random()*94) + 75,
        angle:    { 0: 270 },
        opacity:  { 1: 0 },
        children: {
            shape:          'zigzag',
            radius:         75,
            duration:       3000,
            fill:           cols,
            stroke:         stroker,
            strokeWidth:    15,
            delay:      'stagger(0, 10)',
            angle:      { 0 : 360 }
        }
    });

    const burst11 = new mojs.Burst({
        radius:   { 0: 150 },
        count:    Math.floor(Math.random()*14) + 7,
        children: {
            shape:          'polygon',
            radius:         100,
            points:         5,
            fill:           filler,
            angle:          { 360: 0 },
            duration:       3000,
            delay:          'stagger(0, 1000)',
            stroke:         stroker,
            strokeWidth:    Math.floor(Math.random()*10) + 15
        }
    });

    switch (x) {
        case 0:
            bur(burst1, e);
            break;
        case 1:
            bur(burst2, e);
            break;
        case 2:
            bur(burst3, e);
            break;
        case 3:
            bur(burst4, e);
            break;
        case 4:
            bur(burst5, e);
            break;
        case 5:
            bur(burst6, e);
            break;
        case 6:
            bur(burst7, e);
            break;
        case 7:
            bur(burst8, e);
            break;
        case 8:
            bur(burst9, e);
            break;
        case 9:
            bur(burst10, e);
            break;
        case 10:
            bur(burst11, e);
            break;
        case 11:
            const OPTS = {
                fill:           'none',
                radius:         25,
                strokeWidth:    { 50 : 0 },
                scale:          { 0: 1 },
                duration:       500,
                left: 0,        top: 0,
                easing: 'cubic.out'
            };

            var MAIN_OPTS = Object.assign({}, OPTS, {
                stroke:         'cyan'
            })
            const mainCircle = new mojs.Shape(MAIN_OPTS);

            const smallCircles = [];
            const colors = cols;

            for ( let i = 0; i < 10; i++ ) {
                var SMALL_OPTS = Object.assign({}, OPTS, {
                    parent:         mainCircle.el,
                    strokeWidth:    { 30: 0 },
                    left: '50%',    top: '50%',
                    stroke:         colors[ i % colors.length],
                    delay:          'rand(0, 350)',
                    x:              'rand(-50, 50)',
                    y:              'rand(-50, 50)',
                    radius:         'rand(5, 20)'
                });
                smallCircles.push(new mojs.Shape({
                        SMALL_OPTS
                    })
                );
            }

            mainCircle
                .tune({ x: e.pageX, y: e.pageY  })
                .replay();

            for ( let i = 0; i < smallCircles.length; i++ ) {
                smallCircles[i]
                    .generate()
                    .replay();
            }
            break;
        default:
            // sonic boom 25 clicks
            bur(burst1, e);
            bur(burst2, e);
            bur(burst3, e);
            bur(burst4, e);
            bur(burst5, e);
            bur(burst6, e);
            bur(burst7, e);
            bur(burst8, e);
            bur(burst9, e);
            bur(burst10, e);
            bur(burst11, e);
    }
});
function bur(b, e){
    b
        .tune({ x: e.pageX - ($("body").width() / 2),
                y: e.pageY - (window.innerHeight / 2)})
        .setSpeed(3)
        .replay();
}

// animejs code
var colorTestEls = document.querySelectorAll('.color-test');

function createTest(el) {
    var testValues = ['#FF0080', '#800080'];
    anime({
        targets: el,
        backgroundColor: [testValues[0], testValues[1]],
        direction: 'alternate',
        easing: 'easeInOutSine',
        duration: 4000,
        loop: true
    });
}

for (var i = 0; i < colorTestEls.length; i++) createTest(colorTestEls[i]);


var ml4 = {};
ml4.opacityIn = [0,1];
ml4.scaleIn = [0.2, 1];
ml4.scaleOut = 3;
ml4.durationIn = 800;
ml4.durationOut = 600;
ml4.delay = 500;

console.log(ml4);

anime.timeline({loop: true})
    .add({
        targets: '.ml4 .letters-1',
        opacity: ml4.opacityIn,
        scale: ml4.scaleIn,
        duration: ml4.durationIn
    }).add({
    targets: '.ml4 .letters-1',
    opacity: 0,
    scale: ml4.scaleOut,
    duration: ml4.durationOut,
    easing: "easeInExpo",
    delay: ml4.delay
}).add({
    targets: '.ml4 .letters-2',
    opacity: ml4.opacityIn,
    scale: ml4.scaleIn,
    duration: ml4.durationIn
}).add({
    targets: '.ml4 .letters-2',
    opacity: 0,
    scale: ml4.scaleOut,
    duration: ml4.durationOut,
    easing: "easeInExpo",
    delay: ml4.delay
}).add({
    targets: '.ml4 .letters-3',
    opacity: ml4.opacityIn,
    scale: ml4.scaleIn,
    duration: ml4.durationIn
}).add({
    targets: '.ml4 .letters-3',
    opacity: 0,
    scale: ml4.scaleOut,
    duration: ml4.durationOut,
    easing: "easeInExpo",
    delay: ml4.delay
}).add({
    targets: '.ml4',
    opacity: 0,
    duration: 500,
    delay: 500
});