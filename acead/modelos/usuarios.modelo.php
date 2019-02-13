<?php

require_once "conexion.php";

class ModeloUsuarios{

	/*OBTENER VALOR DE BD PARA LOS INTENTOS*/
static public function mdlObtenerIntentos(){

  $stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT valor FROM TBL_Parametros WHERE Parametro='ADMIN_INTENTOS_INVALIDOS'");
	$stmt -> execute();

	return $stmt -> fetch();

  }


	/*=============================================
	MOSTRAR USUARIOS
	=============================================*/

	static public function mdlMostrarUsuarios($tabla, $item, $valor){

		if($item != null){

			$stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT * FROM $tabla");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}


		$stmt -> Cerrar_Conexion();

		$stmt = null;

	}

	/*=============================================
	REGISTRO DE USUARIO
	=============================================*/

	static public function mdlIngresarUsuario($tabla, $datos){


		$stmt = ConexionBD::Abrir_Conexion()->prepare("INSERT INTO $tabla(PrimerNombre, PrimerApellido, CorreoElectronico, Telefono, Cedula, Usuario, Contrasena)
																									VALUES (:nombre1, :apellido1, :email, :telefono, :cedula, :usuario, :password)");


		$stmt->bindParam(":nombre1", $datos["PrimerNombre"], PDO::PARAM_STR);
		$stmt->bindParam(":apellido1", $datos["PrimerApellido"], PDO::PARAM_STR);
		$stmt->bindParam(":email", $datos["CorreoElectronico"], PDO::PARAM_STR);
		$stmt->bindParam(":telefono", $datos["Telefono"], PDO::PARAM_STR);
		$stmt->bindParam(":cedula", $datos["Cedula"], PDO::PARAM_STR);
		$stmt->bindParam(":usuario", $datos["Usuario"], PDO::PARAM_STR);
		$stmt->bindParam(":password", $datos["Contrasena"], PDO::PARAM_STR);
		//$stmt->bindParam(":perfil", $datos["perfil"], PDO::PARAM_STR);
		//$stmt->bindParam(":foto", $datos["foto"], PDO::PARAM_STR);


		if($stmt->execute()){

			return "ok";

		}else{

			return "error";

		}

		$stmt->close();

		$stmt = null;

	}

	/*=============================================
	EDITAR USUARIO
	=============================================*/

	static public function mdlEditarUsuario($tabla, $datos){


		$stmt = ConexionBD::Abrir_Conexion()->prepare("UPDATE $tabla SET Contrasena = :password WHERE Usuario = :usuario");

	//	$stmt -> bindParam(":nombre", $datos["nombre"], PDO::PARAM_STR);
		$stmt -> bindParam(":password", $datos["Contrasena"], PDO::PARAM_STR);
	//	$stmt -> bindParam(":perfil", $datos["perfil"], PDO::PARAM_STR);
	//	$stmt -> bindParam(":foto", $datos["foto"], PDO::PARAM_STR);
		$stmt -> bindParam(":usuario", $datos["Usuario"], PDO::PARAM_STR);


		if($stmt -> execute()){

			return "ok";

		}else{

			return "error";

		}

		$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	BLOQUEAR USUARIO
	=============================================*/

	static public function mdlBloquearUsuario($tabla, $datos){


		$stmt = ConexionBD::Abrir_Conexion()->prepare("UPDATE $tabla SET Id_Estado = :estado WHERE Usuario = :usuario");

	//	$stmt -> bindParam(":nombre", $datos["nombre"], PDO::PARAM_STR);
		$stmt -> bindParam(":estado", $datos["Id_Estado"], PDO::PARAM_STR);
	//	$stmt -> bindParam(":perfil", $datos["perfil"], PDO::PARAM_STR);
	//	$stmt -> bindParam(":foto", $datos["foto"], PDO::PARAM_STR);
		$stmt -> bindParam(":usuario", $datos["Usuario"], PDO::PARAM_STR);


		if($stmt -> execute()){

			return "ok";

		}else{

			return "error";

		}

		$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	ACTUALIZAR USUARIO
	=============================================*/

	static public function mdlActualizarUsuario($tabla, $item1, $valor1, $item2, $valor2){

		$stmt = ConexionBD::Abrir_Conexion()->prepare("UPDATE $tabla SET $item1 = :$item1 WHERE $item2 = :$item2");

		$stmt -> bindParam(":".$item1, $valor1, PDO::PARAM_STR);
		$stmt -> bindParam(":".$item2, $valor2, PDO::PARAM_STR);

		if($stmt -> execute()){

			return "ok";

		}else{

			return "error";

		}

		$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	BORRAR USUARIO
	=============================================*/

	static public function mdlBorrarUsuario($tabla, $datos){


		$stmt = ConexionBD::Abrir_Conexion()->prepare("DELETE FROM $tabla WHERE Id_usuario = :id");

		$stmt -> bindParam(":id", $datos, PDO::PARAM_INT);

		if($stmt -> execute()){

			return "ok";

		}else{

			return "error";

		}

		$stmt -> close();

		$stmt = null;


	}




	static public function mdlCargarSelect0($tabla, $item, $valor){

		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}

		$stmt -> close();

		$stmt = null;

	}



  static public function mdlCargarSelect(){
    $stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT * FROM tbl_genero");
  	$stmt -> execute();

  	return $stmt -> fetchall();
  }


}
