<?php

require_once "conexion.php";

class ModeloPass{

  /*=============================================

  =============================================*/

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

  /*=============================================
  OBTENER CORREO DEL USUARIO
  =============================================*/

  static public function mdlObtenerCorreo($tabla, $item, $bus, $valor){

    $stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT $bus FROM $tabla WHERE $item = :$item");

    $stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

    $stmt -> execute();
    //echo "<script type='text/javascript'>alert('yes')</script>";
    return $stmt -> fetch();


  }


  /*=============================================
  CAMBIAR CONTRASEÑA
  =============================================*/

  static public function mdlCambioContrasena($tabla, $datos){

    $stmt = ConexionBD::Abrir_Conexion()->prepare("UPDATE $tabla SET Contrasena = :Contrasena WHERE Usuario = :Usuario");

    $stmt->bindParam(":Usuario", $datos["Usuario"], PDO::PARAM_STR);
    $stmt->bindParam(":Contrasena", $datos["Contrasena"], PDO::PARAM_STR);

    if($stmt->execute()){

      return "ok";

    }else{

      return "error";

    }

    $stmt->close();

    $stmt = null;

  }




}
