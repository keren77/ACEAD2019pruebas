<?php

require_once "../controladores/matricula.controlador.php";
require_once "../modelos/matricula.modelo.php";



if (isset($_GET["id"])) {

    $editar = new AjaxMatricula();
    $editar->id = $_GET["id"];
    $editar->ajaxOrientaciones();
}


class AjaxMatricula{

 public $id;

 public function ajaxOrientaciones(){

	 $tabla = "tbl_orientacion";
	 $valor = $this->id;

	 $respuesta = ModeloMatricula::mdlCargarOrientacion($tabla, $valor);

		$con = array();
 		$n=0;

 	while($row = $respuesta->fetch_row()){
 		$con[$n]['Id_Orientacion']= $row[0];
 		$con[$n]['Orientacion']=$row[1];
 		$n++;

 	}

 	echo json_encode($con, JSON_UNESCAPED_UNICODE);

 }



}
