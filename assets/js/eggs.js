function eggs() {
    var easterEggs = ['reset', 'fuchsia', 'king', 'winter', 'digger', 'matrix', 'jurassic', 'christmas', 'easter', 'harley', 'jorge', 'barney', 'jedi', 'anjuna'];
    var keyHistory = '';
    var match;
    $(document).keypress(function (e) {
        keyHistory += String.fromCharCode(e.which);
        for (let i = 0; i < easterEggs.length; i++) {
            var eggLength = easterEggs[i].length;
            match = keyHistory.match(easterEggs[i]);
            if (match) {
                //alert(match);
                switch(match.toString()){
                    case 'reset':
                        stopPlay();
                        reset();
                        break;
                    case 'fuchsia':
                        stopPlay();
                        $("main").css({"background-image":"none", "background-color":"#FF0080"});
                        break;
                    case 'harley':
                        stopPlay();
                        window.open("https://www.upwork.com/fl/harleya", "_self");
                        break;
                    case 'jorge':
                        stopPlay();
                        window.open("https://www.upwork.com/freelancers/~01abf139414e3d1c0d", "_self");
                        break;
                    case 'barney':
                        stopPlay();
                        window.open("https://www.upwork.com/fl/johnbampton", "_self");
                        break;
                    case 'jedi':
                        reset();
                        play("https://www.youtube-nocookie.com/embed/ut4WoDi-AEM?rel=0&amp;start=11");
                        break;
                    case 'anjuna':
                        reset();
                        play("https://www.youtube-nocookie.com/embed/jiLkBxw2pbs?rel=0");
                        break;
                    default:
                        stopPlay();
                        var url = "/assets/images/backgrounds/" + match + ".jpg";
                        $("main").css("background-image", "url(" + url + ")");
                }
                keyHistory = match = '';
            } else if (keyHistory.length > 30) {
                keyHistory = keyHistory.substr((keyHistory.length - eggLength - 1));
            }
        }
    });
}

function stopPlay(){
    $("iframe").remove();
    $("#youtube").css({"height":"0", "visibility":"hidden"});
}

function play(url){
    $("#youtube").css({"height":"315", "visibility":"visible"});
    $("#youtube").append('<iframe width="560" height="315" src="" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>');
    var videoURL = url + "&amp;autoplay=1";
    $("iframe").prop('src', videoURL);
    $("iframe").css({"width":"560", "height":"315", "visibility":"visible"});
}

function reset(){
    $("main").css({"background-image":"none", "background-color":"#94AFD1"});
}
