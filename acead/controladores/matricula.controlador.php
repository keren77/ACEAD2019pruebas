<?php


class ControladorMatricula{

  /*=============================================
  MOSTRAR MODALIDADES
  =============================================*/

  static public function ctrCargarSelectModalidades(){

    $tabla = "tbl_modalidades";

    $respuesta = ModeloUsuarios::mdlCargarSelect($tabla);

    return $respuesta;

  }






}
