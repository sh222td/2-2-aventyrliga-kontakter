removeMSG = function () {
    var element = document.getElementById("sucessMSG");
    element.parentNode.removeChild(element);
}

removeContactMSG = function () {
    var element = document.getElementById("removeContactMSG");
    element.parentNode.removeChild(element);
}

//removeUser = function () {

//    var Ok = confirm('Är du säkert på att du vill ta bort kontakten?');
//    if (Ok) {
//        console.log('lol');
//        return true;
//    }
//    else {
//        console.log('trll');
//        return false;
//    }
//    if (confirm('Är du säkert på att du vill ta bort kontakten?')) {
//        console.log('true');
//        return true;
//    } else {
//        window.close()
//        console.log('false');
//        return false;
//    }
   
//}