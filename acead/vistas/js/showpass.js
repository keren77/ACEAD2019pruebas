$(document).ready(function() {

$(".reveal1").mousedown(function() {
$(".pwd1").replaceWith($('.pwd1').clone().attr('type', 'text'));
})
.mouseup(function() {
$(".pwd1").replaceWith($('.pwd1').clone().attr('type', 'password'));
})
.mouseout(function() {
$(".pwd1").replaceWith($('.pwd1').clone().attr('type', 'password'));
});

});

var pass, nuevopass,confpass;

$("#pwd2").mousedown(function(){
    $("#confirmapass").removeAttr("type");
    $("#confirmapass").attr("type","text");

});

$("#pwd2").mouseup(function(){
    $("#confirmapass").removeAttr("type");
    $("#confirmapass").attr("type","password");

});

$("#pwd1").mousedown(function(){
    $("#cambiopass").removeAttr("type");
    $("#cambiopass").attr("type","text");

});

$("#pwd1").mouseup(function(){
    $("#cambiopass").removeAttr("type");
    $("#cambiopass").attr("type","password");

});
