<?php

require_once "conexion.php";

class ModeloMatricula{

	/*=============================================
	MOSTRAR MATRÍCULA
	=============================================*/

	static public function MdlMostrarMatricula($tabla, $item, $valor){


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
  REGISTRO DE MODALIDAD
  =============================================*/

  static public function mdlIngresarModalidad($tabla, $datos){


    $stmt = ConexionBD::Abrir_Conexion()->prepare("INSERT INTO $tabla (DescripModalidad)
                                                  VALUES (:descripmodalidad1)");


    $stmt->bindParam(":descripmodalidad1", $datos["DescripModalidad"], PDO::PARAM_STR);

    if($stmt->execute()){

      return "ok";

    }else{

      return "error";
      echo "<script type='text/javascript'>alert('neles')</script>";
    }

    $stmt->close();

    $stmt = null;

  }



 /*=============================================
  CARGAR SELECT
  =============================================*/
  static public function mdlCargarSelect($tabla){

    $stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT * FROM $tabla");
  	$stmt -> execute();

  	return $stmt -> fetchall();

    }



}
