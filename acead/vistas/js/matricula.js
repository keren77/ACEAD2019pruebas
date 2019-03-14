
/*=============================================
MATRICULA ALUMNO
=============================================*/

$(".tablas").on("click", ".btnMatriculaAlumno", function(){

	var idAlumno = $(this).attr("idAlumno");

	var datos = new FormData();
	datos.append("idAlumno", idAlumno);

	$.ajax({

		url:"ajax/matricula.ajax.php",
		method: "POST",
		data: datos,
		cache: false,
		contentType: false,
		processData: false,
		dataType: "json",
		success: function(respuesta){

			$("#editarAlumno").val(respuesta["PrimerNombre"]);
                            
			}

	});

});