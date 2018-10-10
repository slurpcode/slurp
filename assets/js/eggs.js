function animate_flower(){
    $("#imgo").animate({
        height: "+=550"
    }, 4000, function() {
        // Animation complete.
    });
}

function eggs() {
    $("#px").click(function () {
        effect(1);
        $("header").css({"visibility":"hidden"});
        $("nav").css({"visibility":"hidden"});
        $("#overlay").css({"display":"block"});
        animate_flower();
    });
    $("#overlay").click(function () {
        reset();
    });
    var easterEggs = ['reset', 'fuchsia', 'king', 'winter', 'digger', 'matrix', 'jurassic', 'christmas', 'easter', 'harley', 'jorge', 'barney', 'karine', 'jedi', 'anjuna', 'asot', 'progressive', 'chill', 'jazz'];
    var keyHistory = '';
    var match;
    var winter = false;
    $(document).keypress(function (e) {
        keyHistory += String.fromCharCode(e.which);
        for (var i = 0; i < easterEggs.length; i++) {
            var eggLength = easterEggs[i].length;
            match = keyHistory.match(easterEggs[i]);
            if (match) {
                //alert(match);
                $('#c').remove();
                switch(match.toString()){
                    case 'reset':
                        if(winter) {
                            stopPlay(true);
                            winter = false;
                        }
                        reset();
                        break;
                    case 'fuchsia':
                        if(winter) {
                            stopPlay(true);
                            winter = false;
                        }
                        effect(2);
                        break;
                    case 'harley':
                        loadUrl("https://www.upwork.com/fl/harleya");
                        break;
                    case 'jorge':
                        loadUrl("https://www.upwork.com/freelancers/~01abf139414e3d1c0d");
                        break;
                    case 'barney':
                        loadUrl("https://www.upwork.com/fl/johnbampton");
                        break;
                    case 'karine':
                        loadUrl("https://www.upwork.com/freelancers/~016cd3dcf007c09abd");
                        break;
                    case 'jedi':
                        if(winter) {
                            stopPlay(true);
                            winter = false;
                        }
                        play("https://www.youtube-nocookie.com/embed/ut4WoDi-AEM?rel=0&amp;start=11");
                        break;
                    case 'anjuna':
                        if(winter) {
                            stopPlay(true);
                            winter = false;
                        }
                        play("https://www.youtube-nocookie.com/embed/jiLkBxw2pbs?rel=0");
                        break;
                    case 'asot':
                        if(winter) {
                            stopPlay(true);
                            winter = false;
                        }
                        play("https://www.youtube-nocookie.com/embed/pv4xBTrNeoQ?rel=0");
                        break;
                    case 'progressive':
                        if(winter) {
                            stopPlay(true);
                            winter = false;
                        }
                        play("https://www.youtube-nocookie.com/embed/KvRVky0r7YM?rel=0");
                        break;
                    case 'chill':
                        if(winter) {
                            stopPlay(true);
                            winter = false;
                        }
                        play("https://www.youtube-nocookie.com/embed/nUlazURAjDE?rel=0");
                        break;
                    case 'jazz':
                        if(winter) {
                            stopPlay(true);
                            winter = false;
                        }
                        play("https://www.youtube-nocookie.com/embed/Vls4h1GAP-c?rel=0");
                        break;
                    default:
                        if(winter) {
                            stopPlay(true);
                            winter = false;
                        } else {
                            stopPlay(false);
                        }
                        effect(1);
                        var url = "/assets/images/backgrounds/" + match + ".jpg";
                        $("body").css("background", "url(" + url + ") 0px 65px");

                        if(match.toString()==='matrix'){
                            $("#youtube").after("<canvas id=\"c\"></canvas>");
                            rain();
                        }

                        if(match.toString()==='winter' && winter === false){
                            winter = true;
                            stopPlay(false);
                            $.getScript("/assets/js/snowstorm-min.js", function(){
                                snowStorm.flakesMaxActive = 75;
                                snowStorm.useTwinkleEffect = true;
                                snowStorm.toggleSnow();
                            });
                        }
                }
                keyHistory = match = '';
            } else if (keyHistory.length > 30) {
                keyHistory = keyHistory.substr((keyHistory.length - eggLength - 1));
            }
        }
    });
}

function rain(){
    var c = document.getElementById("c");
    var ctx = c.getContext("2d");

//making the canvas full screen
    c.height = document.body.scrollHeight;
    c.width = window.innerWidth;

//chinese characters - taken from the unicode charset
    var chinese = "田由甲申甴电甶男甸甹町画甼甽甾甿畀畁畂畃畄畅畆畇畈畉畊畋界畍畎畏畐畑";
//converting the string into an array of single characters
    chinese = chinese.split("");

    var font_size = 17;
    var columns = c.width/font_size; //number of columns for the rain
//an array of drops - one per column
    var drops = [];
//x below is the x coordinate
//1 = y co-ordinate of the drop(same for every drop initially)
    for(var x = 0; x < columns; x++)
        drops[x] = 1;

//drawing the characters
    function draw()
    {
        //Black BG for the canvas
        //translucent BG to show trail
        ctx.fillStyle = "rgba(0, 0, 0, 0.05)";
        ctx.fillRect(0, 0, c.width, c.height);

        ctx.fillStyle = "#0F0"; //green text
        ctx.font = font_size + "px arial";
        //looping over drops
        for(var i = 0; i < drops.length; i++)
        {
            //a random chinese character to print
            var text = chinese[Math.floor(Math.random()*chinese.length)];
            //x = i*font_size, y = value of drops[i]*font_size
            ctx.fillText(text, i*font_size, drops[i]*font_size);

            //sending the drop back to the top randomly after it has crossed the screen
            //adding a randomness to the reset to make the drops scattered on the Y axis
            if(drops[i]*font_size > c.height && Math.random() > 0.975)
                drops[i] = 0;

            //incrementing Y coordinate
            drops[i] +=  Math.floor(Math.random()*2);
        }
    }
    setInterval(draw, 33);
}

function stopPlay(n){
    $("#overlay").css({"display":"none"});
    if(n===true){snowStorm.toggleSnow();}
    $("#vid").remove();
    $("#youtube").css({"height":"0", "visibility":"hidden"});
}

function play(url){
    effect(1);
    $("#youtube").css({"height":"315", "visibility":"visible"});
    $("#youtube").append('<iframe id="vid" width="560" height="315" src="" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>');
    var videoURL = url + "&amp;autoplay=1";
    $("#vid").prop('src', videoURL);
    $("#vid").css({"width":"560", "height":"315", "visibility":"visible"});
}

function reset(){
    location.reload();
}

function loadUrl(url){
    stopPlay(false);
    window.open(url, "_self");
}

function effect(n){
    $("header").css({"height":"50"});
    $(".site-title").empty();
    $(".site-title").append("Fuchsia Programming");
    $("main").remove();
    $("footer").remove();
    $("header").css({"visibility":"visible"});
    if(n===1){
        $("body").css({"background-color":"black","height":"1145","background-image":"none"});
        $(".site-header").css({"border-bottom":"5px solid #424242","border-top":"5px solid #424242"});
        $("nav").css({"visibility":"visible"});
    } else {
        $("body").css({"background-color":"#FF0080","height":"1080","background-image":"none"});
        $(".site-header").css({"border-bottom":"5px solid #FF0080","border-top":"5px solid #FF0080"});
        $("nav").css({"visibility":"hidden"});
    }
    window.scrollTo(0,0);
}
