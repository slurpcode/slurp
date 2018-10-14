document.addEventListener( 'click', function (e) {
    Cookies.set('clicks', Cookies.get('clicks') && (+Cookies.get('clicks') + 1) || 0);
    if(+Cookies.get('clicks') === 25){
        Cookies.remove('clicks');
    }
    var x = +Cookies.get('clicks') % 7;
    var cols = ['cyan', 'yellow', 'darkpink', 'red', 'blue', 'green', 'white', 'olive', 'black', 'lime', 'fuchsia', 'purple', 'navy', 'teal', 'aqua', 'maroon'];
    var randomColor = cols[+Cookies.get('clicks') % 16];

    const burst1 = new mojs.Burst({
        radius:   { 0: 100 },
        count:    20,
        angle:    { 0: 90 },
        children: {
            shape:      'polygon',
            radius:     25,
            points:     200,
            fill:       cols,
            angle:      { 360: 0 },
            duration:   2000,
            delay:      'stagger( rand(0, 100) )',
            stroke:     randomColor,
            strokeWidth: 5
        }
    });
    const burst2 = new mojs.Burst({
        radius:   { 0: 100 },
        count:    5,
        children: {
            radius:       25,
            shape:        'circle',
            fill:         ['green', 'cyan', 'yellow'],
            strokeWidth:  5,
            duration:     2000,
            stroke:     randomColor,
            strokeWidth: 5
        }
    });
// yellow and greenish pentagons fade out spin
    const burst3 = new mojs.Burst({
        radius:   { 0: 100 },
        count:    10,
        children: {
            shape:      'polygon',
            radius:     25,
            points:     5,
            fill:       { 'cyan' : 'yellow' },
            angle:      { 360: 0 },
            duration:   2000,
            delay:      'stagger(0, 100)',
            stroke: randomColor,
            strokeWidth: 5
        }
    });
// yellow circles fade out
    const burst4 = new mojs.Burst({
        radius:   { 0: 100 },
        count:    7,
        angle:    { 0: 90 },
        opacity:  { 1: 0 },
        children: {
            radius: 50,
            duration:   2000,
            fill: 'yellow',
            stroke: randomColor,
            strokeWidth: 5
        }
    });
    const burst5 = new mojs.Burst({
        radius:   { 0: 100 },
        count:    10,
        angle:    { 0: 90 },
        opacity:  { 1: 0 },
        children: {
            shape: 'zigzag',
            radius: 50,
            duration:   2000,
            fill: cols,
            stroke: randomColor,
            strokeWidth: 5
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
            fill:       ['cyan', 'yellow', 'darkpink', 'red', 'blue', 'green', 'white'],
            stroke:     randomColor,
            strokeWidth:5,
            angle:      { 360: 0 },
            duration:   2000,
            delay:      'stagger(0, 100)'
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
        default:
            const OPTS = {
                fill:           'none',
                radius:         25,
                strokeWidth:    { 50 : 0 },
                scale:          { 0: 1 },
                duration:       500,
                left: 0,        top: 0,
                easing: 'cubic.out'
            };

            const mainCircle = new mojs.Shape({
                ...OPTS,
                stroke:         'cyan',
            });

            const smallCircles = [];
            const colors = [ 'deeppink', 'magenta', 'yellow', '#00F87F' ];

            for ( let i = 0; i < 4; i++ ) {
                smallCircles.push(new mojs.Shape({
                        ...OPTS,
                        parent:         mainCircle.el,
                        radius:         { 0 : 15 },
                        strokeWidth:    { 30: 0 },
                        left: '50%',    top: '50%',
                        stroke:         colors[ i % colors.length],
                        delay:          'rand(0, 350)',
                        x:              'rand(-50, 50)',
                        y:              'rand(-50, 50)',
                        radius:         'rand(5, 20)'
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
    }
});
function bur(b, e){
    b
        .tune({ x: e.pageX - ($("body").width() / 2), y: e.pageY - (window.innerHeight / 2) })
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