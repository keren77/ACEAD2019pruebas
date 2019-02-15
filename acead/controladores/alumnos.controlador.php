<?php

class ControladorAlumnos{

	/*=============================================
	REGISTRO DE ALUMNOS
	=============================================*/

	static public function ctrCrearAlumno(){

		if(isset($_POST["nuevoAlumno"])){

			if(preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["nuevoNombre1"])){


				$tabla = "tbl_alumnos";
				$nuevo = 1;

				$datos = array("PrimerNombre" => $_POST["nuevoNombre1"],
										 "PrimerApellido"	=> $_POST["nuevoApellido1"],
										 "SegundoNombre"	=> $_POST["nuevoNombre2"],
										 "SegundoApellido"	=> $_POST["nuevoApellido2"],
										 "FechaNacimiento" => $_POST["nuevoFechaNac"],
										 "CorreoElectronico" => $_POST["nuevoEmail"],
										 "Telefono" => $_POST["nuevoTelefono"],
										 "Cedula" => $_POST['nuevoCedula'],
										 "Id_EstadoCivil" => $_POST["nuevoEstCivil"],
										 "Id_Genero" => $_POST["nuevoGenero"]);

										 echo $_POST['nuevoCedula'];

				$respuesta = ModeloAlumnos::mdlIngresarAlumno($tabla, $datos);

				if($respuesta == "ok"){

					echo '<script>

					swal({

						type: "success",
						title: "¡El Alumno ha sido guardado correctamente!",
						showConfirmButton: true,
						confirmButtonText: "Cerrar",
						closeOnConfirm: false

					}).then((result)=>{

						if(result.value){

							window.location = "alumnos";

						}

					});


					</script>';


				}


			}else{

				echo '<script>

					swal({

						type: "error",
						title: "¡El Alumno no puede ir vacío o llevar caracteres especiales!",
						showConfirmButton: true,
						confirmButtonText: "Cerrar",
						closeOnConfirm: false

					}).then((result)=>{

						if(result.value){

							window.location = "alumnos";

						}

					});


				</script>';

			}


		}


	}

	/*=============================================
	MOSTRAR ALUMNO
	=============================================*/

	static public function ctrMostrarAlumnos($item, $valor){

		$tabla = "tbl_alumnos";

		$respuesta = ModeloAlumnos::MdlMostrarAlumnos($tabla, $item, $valor);

		return $respuesta;
	}

	/*=============================================
	EDITAR ALUMNO
	=============================================*/

	static public function ctrEditarAlumno(){

		if(isset($_POST["editarAlumno"])){

			if(preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarNombre1"])){



				$tabla = "tbl_alumnos";


				$datos = array("PrimerNombre" => $_POST["editarNombre1"],
										 "PrimerApellido"	=> $_POST["editarApellido1"],
										 "SegundoNombre"	=> $_POST["editarNombre2"],
										 "SegundoApellido"	=> $_POST["editarApellido2"],
										 "FechaNacimiento" => $_POST["editarFechaNac"],
										 "CorreoElectronico" => $_POST["editarEmail"],
										 "Telefono" => $_POST["editarTelefono"],
										 "Cedula" => $_POST["editarCedula"],
										 "Id_EstadoCivil" => $_POST["editarEstCivil"],
										 "Id_Genero" => $_POST["editarGenero"]);

				$respuesta = ModeloAlumnos::mdlEditarAlumno($tabla, $datos);

				if($respuesta == "ok"){

					echo'<script>

					swal({
						  type: "success",
						  title: "El Alumno ha sido editado correctamente",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar",
						  closeOnConfirm: false
						  }).then((result) => {
									if (result.value) {

									window.location = "alumnos";

									}
								})

					</script>';

				}


			}else{

				echo'<script>

					swal({
						  type: "error",
						  title: "¡El nombre no puede ir vacío o llevar caracteres especiales!",
						  showConfirmButton: true,
						  confirmButtonText: "Cerrar",
						  closeOnConfirm: false
						  }).then((result) => {
							if (result.value) {

							window.location = "alumnos";

							}
						})

			  	</script>';

			}

		}

	}

	/*=============================================
	BORRAR ALUMNO
	=============================================*/

	static public function ctrBorrarAlumno(){

		if(isset($_GET["idAlumno"])){


			$tabla = "tbl_alumnos";
			$datos = $_GET["idAlumno"];

			$respuesta = ModeloAlumnos::mdlBorrarAlumno($tabla, $datos);

			if($respuesta == "ok"){

				echo'<script>

				swal({
					  type: "success",
					  title: "El Alumno ha sido borrado correctamente",
					  showConfirmButton: true,
					  confirmButtonText: "Cerrar",
					  closeOnConfirm: false
					  }).then((result) => {
								if (result.value) {

								window.location = "alumnos";

								}
							})

				</script>';

			}

		}

	}


	/*=============================================
	MOSTRAR GENERO
	=============================================*/

	static public function ctrCargarSelectGenero(){

		$tabla = "tbl_genero";

		$respuesta = ModeloAlumnos::mdlCargarSelect($tabla);

		return $respuesta;

	}

	/*=============================================
	MOSTRAR ESTADO CIVIL
	=============================================*/

	static public function ctrCargarSelectEstCivil(){

		$tabla = "tbl_estadocivil";

		$respuesta = ModeloAlumnos::mdlCargarSelect($tabla);

		return $respuesta;

	}


}
