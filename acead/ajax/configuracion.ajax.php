<?php

require_once "../controladores/configuracion.controlador.php";
require_once "../modelos/configuracion.modelo.php";

class AjaxConfiguracion{

	/*=============================================
	EDITAR USUARIO
	=============================================*/

	public $idParametro;

	public function ajaxEditarParametro(){

		$item = "Id_Parametro";
		$valor = $this->idParametro;

		$respuesta = ControladorConfiguracion::ctrMostrarConfig($item, $valor);

		echo json_encode($respuesta);

	}


	/*=============================================
	VALIDAR NO REPETIR USUARIO
	=============================================*/

	public $validarUsuario;

	public function ajaxValidarUsuario(){

		$item = "usuario";
		$valor = $this->validarUsuario;

		$respuesta = ControladorUsuarios::ctrMostrarUsuarios($item, $valor);

		echo json_encode($respuesta);

	}
}

/*=============================================
EDITAR USUARIO
=============================================*/
if(isset($_POST["idParametro"])){

	$editar = new AjaxConfiguracion();
	$editar ->idParametro = $_POST["idParametro"];
	$editar -> ajaxEditarParametro();

}


/*=============================================
VALIDAR NO REPETIR USUARIO
=============================================*/

if(isset( $_POST["validarUsuario"])){

	$valUsuario = new AjaxUsuarios();
	$valUsuario -> validarUsuario = $_POST["validarUsuario"];
	$valUsuario -> ajaxValidarUsuario();

}
