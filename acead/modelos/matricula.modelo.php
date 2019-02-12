<?php
require_once "conexion.php";

class ModeloMatricula{

/*=============================================
CARGAR SELECT
=============================================*/
static public function mdlCargarSelect($tabla){

  $stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT * FROM $tabla");
  $stmt -> execute();

  return $stmt -> fetchall();

  }


}
