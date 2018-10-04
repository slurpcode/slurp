function eggs() {
    var easterEggs = ['reset', 'fuchsia', 'king', 'winter', 'digger', 'matrix'];
    var keyHistory = '';
    var match;
    $(document).keypress(function (e) {
        keyHistory += String.fromCharCode(e.which);
        for (let i = 0; i < easterEggs.length; i++) {
            var eggLength = easterEggs[i].length;
            match = keyHistory.match(easterEggs[i]);
            if (match) {
                //alert(match);
                var url = "/assets/images/backgrounds/" + match + ".jpg";
                if(match.toString()==='reset'){
                    $("main").css("background-image", "none");
                }else if(match.toString()==='fuchsia'){
                    $("main").css({"background-image":"none","background-color":"#FF0080"});
                }else{
                    $("main").css("background-image", "url(" + url + ")");
                }
                keyHistory = match = '';
            } else if (keyHistory.length > 30) {
                keyHistory = keyHistory.substr((keyHistory.length - eggLength - 1));
            }
        }
    });
}