function eggs() {
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
                        }
                        effect(1);
                        var url = "/assets/images/backgrounds/" + match + ".jpg";
                        $("body").css("background", "url(" + url + ") 0px 65px");
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

function stopPlay(n){
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
