<?php

require_once "../controladores/alumnos.controlador.php";
require_once "../modelos/alumnos.modelo.php";
require_once "../controladores/matricula.controlador.php";
require_once "../modelos/matricula.modelo.php";

class AjaxAlumnos{

	/*=============================================
	EDITAR ALUMNOS
	=============================================*/

	public $idAlumno;

	public function ajaxEditarAlumno(){
		echo 'hiiii';
		$item = "Id_Alumno";
		$valor = $this->idAlumno;

		$respuesta = ControladorAlumnos::ctrMostrarAlumnos($item, $valor);

		echo json_encode($respuesta);

	}


/*=============================================
EDITAR ALUMNO
=============================================*/
if(isset($_POST["idAlumno"])){

	$editar = new AjaxAlumnos();
	$editar -> idAlumno = $_POST["idAlumno"];
	$editar -> ajaxEditarAlumno();

}

/*=============================================
VALIDAR NO REPETIR ALUMNO
=============================================*/

if(isset( $_POST["validarAlumno"])){

	$valUsuario = new AjaxAlumnos();
	$valUsuario -> validarAlumno = $_POST["validarAlumno"];
	$valUsuario -> ajaxValidarAlumno();

}
