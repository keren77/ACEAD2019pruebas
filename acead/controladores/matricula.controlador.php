<?php


class ControladorMatricula{

  /*=============================================
  MOSTRAR MODALIDADES
  =============================================*/

  static public function ctrCargarSelectModalidades(){

    $tabla = "tbl_modalidades";

    $respuesta = ModeloMatricula::mdlCargarSelect($tabla);

    return $respuesta;

  }


  /*=============================================
	REGISTRO DE MODALIDAD
	=============================================*/

	static public function ctrCrearModalidad(){

		if(isset($_POST["nuevoDescripModalidad"])){

			if(preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["nuevoDescripModalidad"])){


				$tabla = "tbl_modalidades";


				$datos = array("DescripModalidad" => $_POST["nuevoDescripModalidad"]);


				$respuesta = ModeloMatricula::mdlIngresarModalidad($tabla, $datos);

				if($respuesta == "ok"){

					echo '<script>

					swal({

						type: "success",
						title: "¡La Modalidad sido guardado correctamente!",
						showConfirmButton: true,
						confirmButtonText: "Cerrar",
						closeOnConfirm: false

					}).then((result)=>{

						if(result.value){

							window.location = "gestionacademica";

						}

					});


					</script>';


				}


			}else{

				echo '<script>

					swal({

						type: "error",
						title: "¡El nombre de la Modalidad no puede ir vacía o llevar caracteres especiales!",
						showConfirmButton: true,
						confirmButtonText: "Cerrar",
						closeOnConfirm: false

					}).then((result)=>{

						if(result.value){

							window.location = "gestionacademica";

						}

					});


				</script>';

			}


		}


	}
  /*=============================================
	MOSTRAR MATRICULA
	=============================================*/

	static public function ctrMostrarMatricula($item, $valor){

		$tabla = "tbl_matricula";

		$respuesta = ModeloMatricula::MdlMostrarMatricula($tabla, $item, $valor);

		return $respuesta;
	}



}
