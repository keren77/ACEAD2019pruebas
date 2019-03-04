var id_pregunta, respuesta, contrasena, confcontrasena;

var usuariotemporal = JSON.parse(localStorage.getItem("obj1"));

var uT;
var dataT = JSON.parse(localStorage.getItem("obj2"));

$("#btnojito2").mousedown(function () {
    $("#nuevopass").removeAttr("type");
    $("#nuevopass").attr("type", "text");

});

$("#btnojito2").mouseup(function () {
    $("#nuevopass").removeAttr("type");
    $("#nuevopass").attr("type", "password");

});


$("#btnojito3").mousedown(function () {
    $("#confirmapass").removeAttr("type");
    $("#confirmapass").attr("type", "text");

});

$("#btnojito3").mouseup(function () {
    $("#confirmapass").removeAttr("type");
    $("#confirmapass").attr("type", "password");

});


$('#btngenviar').on("click", function () {
    id_pregunta = $("#cbopreguntas").val();
    respuesta = $("#resp1").val();
    contrasena = $("#nuevopass").val();
    confcontrasena = $("#confirmapass").val();

    if ((id_pregunta == '' || id_pregunta == null) || (respuesta == '' || respuesta == null) || (contrasena == '' || contrasena == null) || (confcontrasena == '' || confcontrasena == null)) {
        alert("debe contestar todos los campos");
    } else {
        if (contrasena !== confcontrasena) {
            alert("Las contraseñas no coinciden")
        } else {
            uT = usuarioT;
            var param2= {
                "uname": dataT.uname,
                "idpreg": id_pregunta,
                "resp": respuesta,
                "contrasena": contrasena,
                "confcontrasena": confcontrasena
            }
            
            $.ajax({
                type: "POST",
                url: "../acead/modelos/usuarios.modelo.php?caso=cambiauserpass&un=" + dataT.uname,
                data: param2,
                dataType: 'json',
                success: function(msj){  
                    
                   if(msj=='exito'){
                        alert("se actualizo la nueva ");
                        window.location.href="acceso";
                        act_pass();
                    }else{
                        alert('la respuesta no es la misma');
                    }
                },
                error: function(xhr, status){
                    alert(xhr.response + " -- " + status);
                }
            });            
            
        }
    }


});

function act_pass(){
    uT = usuarioT;
            var param3= {
                "uname": dataT.uname,
                "idpreg": id_pregunta,
                "resp": respuesta,
                "contrasena": contrasena,
                "confcontrasena": confcontrasena
            }
            
    $.ajax({
                type: "POST",
                url: "../acead/modelos/usuarios.modelo.php?caso=actpass&un=" + dataT.uname,
                data: param3,
                dataType: 'json',
                success: function(msj){
                    //alert(msj);
                },
                error: function(xhr, status){
                    //alert(xhr.response);
                }
            });
}