/*=============================================
EDITAR USUARIO
=============================================*/

$(".btnMatriculaAlumno").click(function(){

	var idUsuario = $(this).attr("idUsuario");

	var datos = new FormData();
	datos.append("idUsuario", idUsuario);

	$.ajax({

		url:"ajax/usuarios.ajax.php",
		method: "POST",
		data: datos,
		cache: false,
		contentType: false,
		processData: false,
		dataType: "json",
		success: function(respuesta){

			$("#matriculaAlumno").val(respuesta["Usuario"]);
			$("#editarNombre1").val(respuesta["PrimerNombre"]);
			$("#editarNombre2").val(respuesta["SegundoNombre"]);
			$("#editarApellido1").val(respuesta["PrimerApellido"]);
			$("#editarApellido2").val(respuesta["SegundoApellido"]);
			$("#editarTelefono").val(respuesta["Telefono"]);
			$("#editarCedula").val(respuesta["Cedula"]);
			$("#editarEmail").val(respuesta["CorreoElectronico"]);
			$("#editarDpto").val(respuesta["Id_Departamento"]);
			$("#editarEstCivil").val(respuesta["Id_EstadoCivil"]);
			$("#editarGenero").val(respuesta["Id_Genero"]);
			$("#editarRol").val(respuesta["Id_Rol"]);


			$("#fotoActual").val(respuesta["foto"]);

			$("#passwordActual").val(respuesta["password"]);

			if(respuesta["foto"] != ""){

				$(".previsualizar").attr("src", respuesta["foto"]);

			}

		}

	});

})
