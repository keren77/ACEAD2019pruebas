<?php

require_once "conexion.php";

class ModeloPass{

  static public function mdlCambioPass($tabla, $item, $valor){

    if($item != null){

      $stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

      $stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

      $stmt -> execute();
      //echo "<script type='text/javascript'>alert('yes')</script>";
      return $stmt -> fetch();

    }else{

      $stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT * FROM $tabla");

      $stmt -> execute();

      return $stmt -> fetchAll();

    }


    $stmt -> Cerrar_Conexion();

    $stmt = null;

  }


static public function mdlObtenerCorreo($tabla, $item, $bus, $valor){

  $stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT $bus2 FROM $tabla WHERE $item = :$item");

  $stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

  $stmt -> execute();
  //echo "<script type='text/javascript'>alert('yes')</script>";
  return $stmt -> fetch();




}





}
