<?php

class ControladorConfiguracion{

  /*=============================================
  MOSTRAR PARAMETROS
  =============================================*/

  static public function ctrMostrarConfig($item, $valor){

    $tabla = "tbl_parametros";

    $respuesta = ModeloConfiguracion::MdlMostrarConfig($tabla, $item, $valor);

    return $respuesta;
  }

  /*=============================================
  EDITAR PARAMETROS
  =============================================*/

  static public function ctrEditarParametro(){


    if(isset($_POST["editarParametro"])){

      $tabla = "tbl_parametros";

      date_default_timezone_set('America/Tegucigalpa');

        $fecha = date('Y-m-d');
        $hora = date('H:i:s');

        $fechaActual = $fecha.' '.$hora;


        $datos = array("Parametro" => $_POST["editarParametro"],
                       "FechaModificacion" => $fechaActual,
                       "Valor" => $_POST["editarVal"]);


        $respuesta = ModeloConfiguracion::mdlEditarParametro($tabla, $datos);

        if($respuesta == "ok"){

          echo'<script>

          swal({
              type: "success",
              title: "El parametro ha sido editado correctamente",
              showConfirmButton: true,
              confirmButtonText: "Cerrar",
              closeOnConfirm: false
              }).then((result) => {
                  if (result.value) {

                  window.location = "configuracio";

                  }
                })

          </script>';

        }

    }

  }

  /*=============================================
	AGREGAR PARAMETRO NUEVO
	=============================================*/

	static public function ctrCrearParametro(){

		if(isset($_POST["nuevoParametro"])){

      date_default_timezone_set('America/Tegucigalpa');

        $fecha = date('Y-m-d');
        $hora = date('H:i:s');

        $fechaActual = $fecha.' '.$hora;

        $usuario = $_SESSION["id"];
				$tabla = "tbl_parametros";


				$datos = array("Parametro" => strtoupper($_POST["nuevoParametro"]),
										   "Valor" => $_POST["nuevoVal"],
                       "FechaCreacion"=> $fechaActual,
                       "Id_usuario" => $usuario);


				$respuesta = ModeloConfiguracion::mdlIngresarParametro($tabla, $datos);

				if($respuesta == "ok"){

					echo '<script>

					swal({

						type: "success",
						title: "¡El Parametro ha sido guardado correctamente!",
						showConfirmButton: true,
						confirmButtonText: "Cerrar",
						closeOnConfirm: false

					}).then((result)=>{

						if(result.value){

							window.location = "configuracion";

						}

					});


					</script>';


				}else {
          echo "<script type='text/javascript'>alert('error')</script>";
        }

		}


	}



}
