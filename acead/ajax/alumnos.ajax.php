<?php

require_once "../controladores/alumnos.controlador.php";
require_once "../modelos/alumnos.modelo.php";


class AjaxAlumnos{

	/*=============================================
	EDITAR ALUMNOS
	=============================================*/

	public $idAlumno;

	public function ajaxEditarAlumno(){
echo "<script type='text/javascript'>alert('ajax')</script>";
$item = "Id_Alumno";
$valor = $this->idAlumno;

$respuesta = ControladorUsuarios::ctrMostrarUsuarios($item, $valor);

echo json_encode($respuesta);

	}

}


	/*=============================================
	EDITAR ALUMNO
	=============================================*/
	if(isset($_POST["idAlumno"])){

		$editar = new AjaxAlumnos();
		$editar -> idAlumno = $_POST["idAlumno"];
		$editar -> ajaxEditarAlumno();

	}
