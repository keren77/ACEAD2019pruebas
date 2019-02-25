<?php

require_once "../controladores/alumnos.controlador.php";
require_once "../modelos/alumnos.modelo.php";

class ajaxMatriculaAlumno{

	/*=============================================
	EDITAR USUARIO
	=============================================*/

	public $idAlumno;

	public function ajaxMatriculaAlumno(){

		$item = "Id_Alumno";
		$valor = $this->idAlumno;

		$respuesta = ControladorAlumnos::ctrMostrarAlumnos($item, $valor);

		echo json_encode($respuesta);

	}




}




/*=============================================
EDITAR USUARIO
=============================================*/
if(isset($_POST["idAlumno"])){

	$editar = new ajaxMatriculaAlumno();
	$editar -> idAlumno = $_POST["idAlumno"];
	$editar -> ajaxMatriculaAlumno();

}

/
