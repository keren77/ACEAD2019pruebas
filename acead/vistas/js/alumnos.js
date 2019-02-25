
/*=============================================
EDITAR ALUMNOS
=============================================*/

$(".tablas").on("click", ".btnEditarAlumno", function(){
        
	var idAlumno = $(this).attr("idAlumno");

	var datos = new FormData();
        
	datos.append("idAlumno", idAlumno);
        
	$.ajax({

		url:"ajax/alumnos.ajax.php",
		method: "POST",
		data: datos,
		cache: false,
		contentType: false,
		processData: false,
		dataType: "json",
		success: function(respuesta){

                        alert(respuesta);
			$("#editarAlumno").val(respuesta["Id_Alumno"]);
			$("#editarNombre1").val(respuesta["PrimerNombre"]);
			$("#editarNombre2").val(respuesta["SegundoNombre"]);
			$("#editarApellido1").val(respuesta["PrimerApellido"]);
			$("#editarApellido2").val(respuesta["SegundoApellido"]);

			$("#editarTelefono").val(respuesta["Telefono"]);
			$("#editarCedula").val(respuesta["Cedula"]);
			$("#editarEmail").val(respuesta["CorreoElectronico"]);
			$("#editarEstCivil").val(respuesta["Id_EstadoCivil"]);
			$("#editarGenero").val(respuesta["Id_Genero"]);


		},
                error: function(xhr, status){
                    alert("ERROR: " + xhr + " >> " + status);
                }

	});

})


/*=============================================
REVISAR SI EL ALUMNO YA ESTÁ REGISTRADO
=============================================*/

$("#nuevoAlumno").change(function(){

	$(".alert").remove();

	var alumno = $(this).val();

	var datos = new FormData();
	datos.append("validarAlumno", alumno);

	 $.ajax({
	    url:"ajax/alumnos.ajax.php",
	    method:"POST",
	    data: datos,
	    cache: false,
	    contentType: false,
	    processData: false,
	    dataType: "json",
	    success:function(respuesta){

	    	if(respuesta){

	    		$("#nuevoAlumno").parent().after('<div class="alert alert-warning">Este alumno ya existe en la base de datos</div>');

	    		$("#nuevoAlumno").val("");

	    	}

	    }

	})
})

/*=============================================
ELIMINAR ALUMNO
=============================================*/
$(".tablas").on("click", ".btnEliminarAlumno", function(){

  var idAlumno = $(this).attr("idAlumno");


  swal({
    title: '¿Está seguro de borrar el alumno?',
    text: "¡Si no lo está puede cancelar la accíón!",
    type: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      cancelButtonText: 'Cancelar',
      confirmButtonText: 'Si, borrar alumno!'
  }).then((result)=>{

    if(result.value){


      window.location = "index.php?ruta=alumnos&idAlumno="+idAlumno;


    }

  })

})


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

			$("#IdAlumno").val(respuesta["Id_Alumno"]);



			}

	});

})
