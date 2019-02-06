$(document).ready(function() {

$('#user').keypress(function(tecla) {
        if(tecla.charCode == 32) return false;
    });

$('#pass').keypress(function(tecla) {
        if(tecla.charCode == 32) return false;
    });

$('#nuevoNombre1').keypress(function(tecla) {
        if(tecla.charCode == 32) return false;
    });

$('#nuevoUsuario').keypress(function(tecla) {
        if(tecla.charCode == 32) return false;
    });

    $('#nuevoPassword').keypress(function(tecla) {
            if(tecla.charCode == 32) return false;
        });

});
