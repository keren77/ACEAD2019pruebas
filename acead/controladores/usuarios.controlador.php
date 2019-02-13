<?php

class ControladorUsuarios{

	/*=============================================
	INGRESO DE USUARIO
	=============================================*/

	static public function ctrIngresoUsuario(){


	if(isset($_POST["ingUsuario"])){

			if(preg_match('/^[A-Za-z0-9]+$/', $_POST["ingUsuario"])){

				$tabla = "tbl_usuarios";

				$item = "Usuario";

				$valor = strtoupper($_POST["ingUsuario"]);


				$respuesta = ModeloUsuarios::MdlMostrarUsuarios($tabla, $item, $valor);

				if($respuesta["Usuario"] == strtoupper($_POST["ingUsuario"]) && password_verify($_POST["ingPassword"], $respuesta['Contrasena'])){
					$_SESSION['intentos']=0;

					switch($respuesta["Id_Estado"]){
						case '3':

						$_SESSION["iniciarSesion"] = "ok";
						$_SESSION["id"] = $respuesta["Id_usuario"];
						$_SESSION["usuario"] = $respuesta["Id_usuario"];
						$_SESSION["nombre"] = $respuesta["PrimerNombre"];
						$_SESSION["perfil"] = $respuesta["Id_Rol"];


						/*=============================================
						REGISTRAR FECHA PARA SABER EL ÚLTIMO LOGIN
						=============================================*/

						date_default_timezone_set('America/Tegucigalpa');

						$fecha = date('Y-m-d');
						$hora = date('H:i:s');

						$fechaActual = $fecha.' '.$hora;

						$item1 = "FechaUltimaConex";
						$valor1 = $fechaActual;

						$item2 = "Id_usuario";
						$valor2 = $respuesta["Id_usuario"];

						$ultimoLogin = ModeloUsuarios::mdlActualizarUsuario($tabla, $item1, $valor1, $item2, $valor2);

						if($ultimoLogin == "ok"){

							echo '<script>

								window.location = "inicio";

							</script>';

						}

						break;


						case '2':
						echo '<br><div class="alert alert-danger">El usuario no está activo, contacte a su administrador.</div>';

						break;


						case '1':

						$_SESSION["iniciarSesion"] = "ok";
						$_SESSION["id"] = $respuesta["Id_usuario"];
						$_SESSION["usuario"] = $respuesta["Id_usuario"];
						$_SESSION["nombre"] = $respuesta["PrimerNombre"];
						$_SESSION["perfil"] = $respuesta["Id_Rol"];


						/*=============================================
						REGISTRAR FECHA PARA SABER EL ÚLTIMO LOGIN
						=============================================*/

						date_default_timezone_set('America/Tegucigalpa');

						$fecha = date('Y-m-d');
						$hora = date('H:i:s');

						$fechaActual = $fecha.' '.$hora;

						$item1 = "FechaUltimaConex";
						$valor1 = $fechaActual;

						$item2 = "Id_usuario";
						$valor2 = $respuesta["Id_usuario"];

						$ultimoLogin = ModeloUsuarios::mdlActualizarUsuario($tabla, $item1, $valor1, $item2, $valor2);

						if($ultimoLogin == "ok"){

							echo '<script>

								window.location = "categorias";

							</script>';

						}

						break;

					}


					}else{

					$_SESSION['intentos']+=1;

					echo '<br><div class="alert alert-danger">Error al ingresar, Usuario y/o Contraseña Invalidos</div>';


				}

			 }

		}

	}

	/*=============================================
   BLOQUEO DE USUARIO
	=============================================*/

	public function ctrBloquearUsuario(){

		if (isset($_POST['ingUsuario'])) {

			$tabla = "tbl_usuarios";

			$datos = array(
						 "Usuario" => $_POST["ingUsuario"],
						 "Id_Estado" => 2);

						 $respuesta = ModeloUsuarios::mdlBloquearUsuario($tabla, $datos);

					 }
		}



	/*=============================================
	REGISTRO DE USUARIO
	=============================================*/

	static public function ctrCrearUsuario(){

		if(isset($_POST["nuevoUsuario"])){

			if(preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["nuevoNombre1"])){

			   	/*=============================================
				VALIDAR IMAGEN
				=============================================*/
/*
				$ruta = "";

				if(isset($_FILES["nuevaFoto"]["tmp_name"])){

					list($ancho, $alto) = getimagesize($_FILES["nuevaFoto"]["tmp_name"]);

					$nuevoAncho = 500;
					$nuevoAlto = 500;
*/
					/*=============================================
					CREAMOS EL DIRECTORIO DONDE VAMOS A GUARDAR LA FOTO DEL USUARIO
					=============================================*/
/*
					$directorio = "vistas/img/usuarios/".$_POST["nuevoUsuario"];

					mkdir($directorio, 0755);
*/
					/*=============================================
					DE ACUERDO AL TIPO DE IMAGEN APLICAMOS LAS FUNCIONES POR DEFECTO DE PHP
					=============================================*/
/*
					if($_FILES["nuevaFoto"]["type"] == "image/jpeg"){
*/
						/*=============================================
						GUARDAMOS LA IMAGEN EN EL DIRECTORIO
						=============================================*/
/*
						$aleatorio = mt_rand(100,999);

						$ruta = "vistas/img/usuarios/".$_POST["nuevoUsuario"]."/".$aleatorio.".jpg";

						$origen = imagecreatefromjpeg($_FILES["nuevaFoto"]["tmp_name"]);

						$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

						imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

						imagejpeg($destino, $ruta);

					}

					if($_FILES["nuevaFoto"]["type"] == "image/png"){
*/
						/*=============================================
						GUARDAMOS LA IMAGEN EN EL DIRECTORIO
						=============================================*/
/*
						$aleatorio = mt_rand(100,999);

						$ruta = "vistas/img/usuarios/".$_POST["nuevoUsuario"]."/".$aleatorio.".png";

						$origen = imagecreatefrompng($_FILES["nuevaFoto"]["tmp_name"]);

						$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

						imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

						imagepng($destino, $ruta);

					}

				}
*/
				$tabla = "tbl_usuarios";

				$encriptar = password_hash($_POST["nuevoPassword"], PASSWORD_DEFAULT);

				$datos = array("PrimerNombre" => $_POST["nuevoNombre1"],
										 "PrimerApellido"	=> $_POST["nuevoApellido1"],
										 "CorreoElectronico" => $_POST["nuevoEmail"],
										 "Telefono" => $_POST["nuevoTelefono"],
										 "Cedula" => $_POST["nuevoCedula"],
					           "Usuario" => $_POST["nuevoUsuario"],
					           "Contrasena" => $encriptar);
					          /* "perfil" => $_POST["nuevoPerfil"],*/

					           /*"foto"=>$ruta)*/

				$respuesta = ModeloUsuarios::mdlIngresarUsuario($tabla, $datos);

				if($respuesta == "ok"){

					echo '<script>

					swal({

						type: "success",
						title: "¡El usuario ha sido guardado correctamente!",
						showConfirmButton: true,
						confirmButtonText: "Cerrar",
						closeOnConfirm: false

					}).then((result)=>{

						if(result.value){

							window.location = "usuarios";

						}

					});


					</script>';


				}


			}else{

				echo '<script>

					swal({

						type: "error",
						title: "¡El usuario no puede ir vacío o llevar caracteres especiales!",
						showConfirmButton: true,
						confirmButtonText: "Cerrar",
						closeOnConfirm: false

					}).then((result)=>{

						if(result.value){

							window.location = "usuarios";

						}

					});


				</script>';

			}


		}


	}

	/*=============================================
	MOSTRAR USUARIO
	=============================================*/

	static public function ctrMostrarUsuarios($item, $valor){

		$tabla = "tbl_usuarios";

		$respuesta = ModeloUsuarios::MdlMostrarUsuarios($tabla, $item, $valor);

		return $respuesta;
	}

	/*=============================================
	EDITAR USUARIO
	=============================================*/

	static public function ctrEditarUsuario(){

		if(isset($_POST["editarUsuario"])){

			if(preg_match('/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["editarNombre"])){

				/*=============================================
				VALIDAR IMAGEN
				=============================================*/


	/*			$ruta = $_POST["fotoActual"];


				if(isset($_FILES["editarFoto"]["tmp_name"]) && !empty($_FILES["editarFoto"]["tmp_name"])){

					list($ancho, $alto) = getimagesize($_FILES["editarFoto"]["tmp_name"]);

					$nuevoAncho = 500;

					$nuevoAlto = 500;     */


					/*=============================================
					CREAMOS EL DIRECTORIO DONDE VAMOS A GUARDAR LA FOTO DEL USUARIO
					=============================================*/

			/*		$directorio = "vistas/img/usuarios/".$_POST["editarUsuario"];   */


					/*=============================================
					PRIMERO PREGUNTAMOS SI EXISTE OTRA IMAGEN EN LA BD
					=============================================*/


			/*		if(!empty($_POST["fotoActual"])){


						unlink($_POST["fotoActual"]);

					}else{

						mkdir($directorio, 0755);

					}

*/

					/*=============================================
					DE ACUERDO AL TIPO DE IMAGEN APLICAMOS LAS FUNCIONES POR DEFECTO DE PHP
					=============================================*/


/*					if($_FILES["editarFoto"]["type"] == "image/jpeg"){    */


						/*=============================================
						GUARDAMOS LA IMAGEN EN EL DIRECTORIO
						=============================================*/


	/*					$aleatorio = mt_rand(100,999);


						$ruta = "vistas/img/usuarios/".$_POST["editarUsuario"]."/".$aleatorio.".jpg";

						$origen = imagecreatefromjpeg($_FILES["editarFoto"]["tmp_name"]);

						$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

						imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

						imagejpeg($destino, $ruta);

					}

					if($_FILES["editarFoto"]["type"] == "image/png"){    */


						/*=============================================
						GUARDAMOS LA IMAGEN EN EL DIRECTORIO
						=============================================*/


/*						$aleatorio = mt_rand(100,999);


						$ruta = "vistas/img/usuarios/".$_POST["editarUsuario"]."/".$aleatorio.".png";

						$origen = imagecreatefrompng($_FILES["editarFoto"]["tmp_name"]);

						$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

						imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

						imagepng($destino, $ruta);

					}

				}

*/

				$tabla = "tbl_usuarios";

				if($_POST["editarPassword"] != ""){


					$encriptar = password_hash($_POST["editarPassword"], PASSWORD_DEFAULT);

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



				$respuesta = ModeloUsuarios::mdlEditarUsuario($tabla, $datos);

				if($respuesta == "ok"){

					echo'<script>

					swal({
						  type: "success",
						  title: "El usuario ha sido editado correctamente",
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

							window.location = "usuarios";

							}
						})

			  	</script>';

			}

		}

	}

	/*=============================================
	BORRAR USUARIO
	=============================================*/

	static public function ctrBorrarUsuario(){

		if(isset($_GET["idUsuario"])){


			$tabla ="tbl_usuarios";
			$datos = $_GET["idUsuario"];



			$respuesta = ModeloUsuarios::mdlBorrarUsuario($tabla, $datos);

			if($respuesta == "ok"){

				echo'<script>

				swal({
					  type: "success",
					  title: "El usuario ha sido borrado correctamente",
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

		}

	}


	/*=============================================
	MOSTRAR GENERO
	=============================================*/

	static public function ctrCargarSelectGenero(){

		$tabla = "tbl_genero";

		$respuesta = ModeloUsuarios::mdlCargarSelect();

		return $respuesta;

	}

}
