<?php 

require_once 'modelos/conexion.php';

class ModeloSeccion 
{
	
	function __construct()
	{
		echo "Este es el modelo de sección";
		$this->conn = new ConexionBD();	
	}

	public function obtenerSecciones()
	{
		$this->conn->establecerConexion();

		$query = 'CALL SP_OBTENER_SECCIONES(@pcMensajeError)';

		$this->conn->prepareStatement($query);

		$this->conn->beginTransaction();

		$this->conn->executeStatement();		

		$result = $this->conn->getResult();

		$this->conn->freeResult();

		//Especificamos cuales son los parametros de salida del procedimiento, para poder obtenerlos
		$parametrosDeSalida = array("@pcMensajeError");

		//Obtenemos en un arreglo con los parametros de salida
		$outParameter = $this->conn->getParametrosOUT($parametrosDeSalida);

		//Obteneros uno por uno cada parmetro de salida
		$mensajeError = $outParameter["@pcMensajeError"];

		$modalidades = array();

		if ($mensajeError == NULL)
		{
			

			foreach ($result as $indice => $row)
			{
                                $modalidades [$indice] = 
				{
					"codigo" => $row["Cod"],
					"nombre" => $row["Desc"]
				}
			}

		}
		else
		{
			//Realizar un volcado de las transacciones anteriores
			$this->conn->rollback();

			$modalidades[0] = ["error" => $mensajeError];
		}

		return json_encode($modalidades);
	}

	public function insertarSeccion()
	{
		$this->conn->establecerConexion();

		$query = 'CALL SP_INSERTAR_SECCION(:pcDescripSeccion, :pcHraClase, :pcAulaClase, :pcId_Clase, :pcId_Empleado, :pcId_PeriodoAcm, @pcMensajeError)';

		$this->conn->prepareStatement($query);

		$this->conn->beginTransaction();

		$this->conn->executeStatement($parametros);

		$result = $this->conn->getResult();

		$this->conn->freeResult();

		//Especificamos cuales son los parametros de salida del procedimiento, para poder obtenerlos
		$parametrosDeSalida = array("@pcMensajeError");

		//Obtenemos en un arreglo los parametros de salida
		$outParameter = $this->conn->getParametrosOUT($parametrosDeSalida);

		//debemos verificar si el procedimiento arrojo algún error y así poder manejarlo
		$mensajeError = $outParameter["@pcMensajeError"];

		$respuesta = array();

		//Determinamos si hubo error en la transacción 
		if ($mensajeError == NULL)
		{
			$respuesta = array('error' => NULL, );
		}
		else
		{
			//Realizar un volcado de las transacciones anteriores
			$this->conn->rollback();

			$modalidades[0] = ["error" => $mensajeError];
		}

		return json_encode($modalidades);
	}

	public function actualizarSeccion()
	{
		$this->conn->establecerConexion();

		$query = 'CALL SP_ACTUALIZAR_SECCION(:pcId_Seccion, :pcDescripSeccion, :pcHraClase, :pcAulaClase, :pcId_Clase, :pcId_Empleado, :pcId_PeriodoAcm, @pcMensajeError)';

		$this->conn->prepareStatement($query);

		$this->conn->beginTransaction();

		$this->conn->executeStatement($parametros);

		$result = $this->conn->getResult();

		$this->conn->freeResult();

		//Especificamos cuales son los parametros de salida del procedimiento, para poder obtenerlos
		$parametrosDeSalida = array("@pcMensajeError");

		//Obtenemos en un arreglo los parametros de salida
		$outParameter = $this->conn->getParametrosOUT($parametrosDeSalida);

		//debemos verificar si el procedimiento arrojo algún error y así poder manejarlo
		$mensajeError = $outParameter["@pcMensajeError"];

		$respuesta = array();

		//Determinamos si hubo error en la transacción 
		if ($mensajeError == NULL)
		{
			$respuesta = array('error' => NULL, );
		}
		else
		{
			//Realizar un volcado de las transacciones anteriores
			$this->conn->rollback();

			$modalidades[0] = ["error" => $mensajeError];
		}

		return json_encode($modalidades);
	}


	public function eliminarSeccion()
	{
		$this->conn->establecerConexion();

		$query = 'CALL SP_ELIMINAR_SECCION(:pcId_Seccion, @pcMensajeError)';

		$this->conn->prepareStatement($query);

		$this->conn->beginTransaction();

		$this->conn->executeStatement($parametros);

		$result = $this->conn->getResult();

		$this->conn->freeResult();

		//Especificamos cuales son los parametros de salida del procedimiento, para poder obtenerlos
		$parametrosDeSalida = array("@pcMensajeError");

		//Obtenemos en un arreglo los parametros de salida
		$outParameter = $this->conn->getParametrosOUT($parametrosDeSalida);

		//debemos verificar si el procedimiento arrojo algún error y así poder manejarlo
		$mensajeError = $outParameter["@pcMensajeError"];

		$respuesta = array();

		//Determinamos si hubo error en la transacción 
		if ($mensajeError == NULL)
		{
			$respuesta = array('error' => NULL, );
		}
		else
		{
			//Realizar un volcado de las transacciones anteriores
			$this->conn->rollback();

			$modalidades[0] = ["error" => $mensajeError];
		}

		return json_encode($modalidades);
	}
}

?>