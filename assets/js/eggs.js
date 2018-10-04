function eggs() {
    var easterEggs = ['reset', 'fuchsia', 'king', 'winter', 'digger', 'matrix', 'jurassic', 'christmas', 'easter', 'harley', 'jorge', 'barney'];
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
                        $("main").css({"background-image":"none", "background-color":"#94AFD1"});
                        break;
                    case 'fuchsia':
                        $("main").css({"background-image":"none", "background-color":"#FF0080"});
                        break;
                    case 'harley':
                        window.open("https://www.upwork.com/fl/harleya", "_self");
                        break;
                    case 'jorge':
                        window.open("https://www.upwork.com/freelancers/~01abf139414e3d1c0d", "_self");
                        break;
                    case 'barney':
                        window.open("https://www.upwork.com/fl/johnbampton", "_self");
                        break;
                    default:
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