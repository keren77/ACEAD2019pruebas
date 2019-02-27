<?php

require_once 'modelos/seccion.modelo.php';

class ControladorSeccion
{
	private viewSeccion;
	
	function __construct()
	{
		echo "Controlador de Sección";
		$this->viewSeccion = new ModeloSeccion();
	}


	public function obtenerSecciones()
	{
		return $this->modelSeccion->obtenerSecciones();
	}

	public function insertarSeccion()
	{
		$pcDescripSeccion = $_POST['desSeccionI'];
		$pcHraClase = $_POST['horaClaseI'];
		$pcAulaClase = $_POST['aulaI'];
		$pcId_Clase = $_POST['idClaseI'];
		$pcId_Empleado = $_POST['idEmpleadoI'];
		$pcId_PeriodoAcm = $_POST['idPeriodoI'];

		$parametros = array
		(
			'pcDescripSeccion' => $pcDescripSeccion, 
			'pcHraClase' => $pcHraClase,
			'pcAulaClase' => $pcAulaClase,
			'pcId_Clase' => $pcId_Clase,
			'pcId_Empleado' => $pcId_Empleado,
			'pcId_PeriodoAcm' => $pcId_PeriodoAcm
		);
		return $this->modelSeccion->insertarSeccion($parametros);
	}

	public function actualizarSeccion()
	{
		$pcId_Seccion = $_POST['idseccionA'];
		$pcDescripSeccion = $_POST['desSeccionA'];
		$pcHraClase = $_POST['horaClaseA'];
		$pcAulaClase = $_POST['aulaA'];
		$pcId_Clase = $_POST['idClaseA'];
		$pcId_Empleado = $_POST['idEmpleadoA'];
		$pcId_PeriodoAcm = $_POST['idPeriodoA'];

		$$parametros = array
		(
			'pcDescripSeccion' => $pcDescripSeccion, 
			'pcHraClase' => $pcHraClase,
			'pcAulaClase' => $pcAulaClase,
			'pcId_Clase' => $pcId_Clase,
			'pcId_Empleado' => $pcId_Empleado,
			'pcId_PeriodoAcm' => $pcId_PeriodoAcm
		);
		return $this->modelSeccion->actualizarSeccion($parametros);
	}

	public function eliminarSeccion()
	{
		return $this->modelSeccion->actualizarSeccion($parametros);
	}

}

?>