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

			/*	$encriptar = password_hash($_POST["nuevoPassword"], PASSWORD_DEFAULT);*/

				$datos = array("PrimerNombre" => $_POST["nuevoNombre1"],
				             "SegundoNombre" => $_POST["nuevoNombre2"],
										 "PrimerApellido"	=> $_POST["nuevoApellido1"],
										 "SegundoApellido"	=> $_POST["nuevoApellido2"],
										 "FechaNacimientno"	=> $_POST["nuevoFechanac"],
										 "CorreoElectronico" => $_POST["nuevoEmail"],
										 "Telefono" => $_POST["nuevoTelefono"],
										 "Cedula" => $_POST["nuevoCedula"]);


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
	MOSTRAR ALUMNOS
	=============================================*/

	static public function ctrMostrarAlumnos($item, $valor){

		$tabla = "tbl_alumnos";

		$respuesta = ModeloAlumnos::MdlMostrarAlumnos($tabla, $item, $valor);

		return $respuesta;
	}

	/*=============================================
	EDITAR ALUMNOS
	=============================================*/

	static public function ctrEditarAlumno(){

		if(isset($_POST["editarAlumno"])){

			if(preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarNombre"])){


				$tabla = "tbl_alumnos";

				$datos = $_GET["id_Alumno"];


				/*	$encriptar = password_hash($_POST["editarPassword"], PASSWORD_DEFAULT);

					}else{

						echo'<script>

								swal({
									  type: "error",

									  title: "¡La contraseña no puede ir vacía",

									  showConfirmButton: true,
									  confirmButtonText: "Cerrar",
									  closeOnConfirm: false
									  }).then((result) => {
										if (result.value) {

										window.location = "usuarios";

										}
									})

						  	</script>';


										}

				$datos = array(//"Usuario" => $_POST["editarNombre"],
							   "Usuario" => $_POST["editarUsuario"],
							   "Contrasena" => $encriptar,
							  // "Id_Rol" => $_POST["editarPerfil"]
							);
							   //"foto" => $ruta)
*/


				$respuesta = Modeloalumnos::mdlEditaralumno($tabla, $datos);

				if($respuesta == "ok"){

					echo'<script>

					swal({
						  type: "success",
						  title: "El alumno ha sido editado correctamente",
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

		if(isset($_GET["id_Alumno"])){


			$tabla ="tbl_alumnos";
			$datos = $_GET["id_Alumno"];



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

	static public function ctrCargarSelectGenero($item, $valor){

		$tabla = "tbl_genero";

		$respuesta = ModeloUsuarios::mdlCargarSelect($tabla, $item, $valor);

		return $respuesta;

	}

}
