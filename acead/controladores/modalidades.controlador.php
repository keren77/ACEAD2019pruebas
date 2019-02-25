<?php

class ControladorModalidades{

  /*=============================================
  MOSTRAR MODALIDADES
  =============================================*/

  static public function ctrMostrarModalidades($item, $valor){

    $tabla = "tbl_modalidades";

    $respuesta = ModeloModalidades::MdlMostrarModalidades($tabla, $item, $valor);

    return $respuesta;
  }




}
