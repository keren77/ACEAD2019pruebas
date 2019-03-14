<?php

require_once "conexion.php";

class ModeloAlumnos{

	/*=============================================
	MOSTRAR ALUMNOS
	=============================================*/

	static public function MdlMostrarAlumnos($tabla, $item, $valor){


		if($item != null){

			$stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

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
	REGISTRO DE ALUMNOS
	=============================================*/

	static public function mdlIngresarAlumno($tabla, $datos){


		$stmt = ConexionBD::Abrir_Conexion()->prepare("INSERT INTO $tabla (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, FechaNacimiento, CorreoElectronico, Telefono, Cedula,  Id_estadocivil, Id_genero)
																									VALUES (:nombre1, :nombre2, :apellido1, :apellido2, :FechaNac, :email, :telefono, :cedula, :estcivil, :genero)");


		$stmt->bindParam(":nombre1", $datos["PrimerNombre"], PDO::PARAM_STR);
    $stmt->bindParam(":nombre2", $datos["SegundoNombre"], PDO::PARAM_STR);
		$stmt->bindParam(":apellido1", $datos["PrimerApellido"], PDO::PARAM_STR);
    $stmt->bindParam(":apellido2", $datos["SegundoApellido"], PDO::PARAM_STR);
		$stmt->bindParam(":FechaNac", $datos["FechaNacimiento"], PDO::PARAM_STR);
		$stmt->bindParam(":email", $datos["CorreoElectronico"], PDO::PARAM_STR);
		$stmt->bindParam(":telefono", $datos["Telefono"], PDO::PARAM_STR);
		$stmt->bindParam(":cedula", $datos["Cedula"], PDO::PARAM_STR);
    $stmt->bindParam(":estcivil", $datos["Id_EstadoCivil"], PDO::PARAM_STR);
    $stmt->bindParam(":genero", $datos["Id_Genero"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
			echo "<script type='text/javascript'>alert('neles')</script>";
		}

		$stmt->close();

		$stmt = null;

	}

	/*=============================================
	EDITAR ALUMNO
	=============================================*/

	static public function mdlEditarUsuario($tabla, $datos){
		//echo "<script type='text/javascript'>alert('sql script')</script>";


		$stmt = ConexionBD::Abrir_Conexion()->prepare("UPDATE $tabla SET PrimerNombre = :nombre1,
                                                                   SegundoNombre = :nombre2,
                                                                   PrimerApellido = :apellido1,
                                                                   SegundoApellido = :apellido2,
																																	 CorreoElectronico = :email,
                                                                   Telefono = :telefono,
                                                                   Cedula = :cedula,
                                                                   Id_EstadoCivil = :estcivil,
                                                                   Id_Genero = :genero,
                                                                WHERE Id_Alumno = :id");

		$stmt->bindParam(":id", $datos["Id_Alumno"], PDO::PARAM_STR);
		$stmt->bindParam(":nombre1", $datos["PrimerNombre"], PDO::PARAM_STR);
    $stmt->bindParam(":nombre2", $datos["SegundoNombre"], PDO::PARAM_STR);
		$stmt->bindParam(":apellido1", $datos["PrimerApellido"], PDO::PARAM_STR);
    $stmt->bindParam(":apellido2", $datos["SegundoApellido"], PDO::PARAM_STR);
		$stmt->bindParam(":FechaNac", $datos["FechaNacimiento"], PDO::PARAM_STR);
		$stmt->bindParam(":email", $datos["CorreoElectronico"], PDO::PARAM_STR);
		$stmt->bindParam(":telefono", $datos["Telefono"], PDO::PARAM_STR);
		$stmt->bindParam(":cedula", $datos["Cedula"], PDO::PARAM_STR);
    $stmt->bindParam(":estcivil", $datos["Id_EstadoCivil"], PDO::PARAM_STR);
    $stmt->bindParam(":genero", $datos["Id_Genero"], PDO::PARAM_STR);



		if($stmt -> execute()){

			return "ok";

		}else{

			return "error";

		}

		$stmt -> close();

		$stmt = null;

	}


	/*=============================================
	ACTUALIZAR ALUMNO
	=============================================*/

	static public function mdlActualizarAlumno($tabla, $item1, $valor1, $item2, $valor2){

		$stmt = ConexionBD::Abrir_Conexion()->prepare("UPDATE $tabla SET $item1 = :$item1 WHERE $item2 = :$item2");

		$stmt -> bindParam(":".$item1, $valor1, PDO::PARAM_STR);
		$stmt -> bindParam(":".$item2, $valor2, PDO::PARAM_STR);

		if($stmt -> execute()){

			return "ok";

		}else{

			return "error";

		}

		$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	BORRAR ALUMNO
	=============================================*/

	static public function mdlBorrarAlumno($tabla, $datos){

    $stmt = ConexionBD::Abrir_Conexion()->prepare("DELETE FROM tbl_alumnos WHERE Id_Alumno = :id");

    $stmt -> bindParam(":id", $datos, PDO::PARAM_INT);


		if($stmt -> execute() ){

			return "ok";



		}else{

			return "error";

		}

		$stmt -> close();

		$stmt = null;


	}




 /*=============================================
  CARGAR SELECT
  =============================================*/
  static public function mdlCargarSelect($tabla){

    $stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT * FROM $tabla");
  	$stmt -> execute();

  	return $stmt -> fetchall();

    }



}

/*
 * Selector de funciones para cargar los Selects en cascada
 * 
 */
$funcion = filter_input(INPUT_GET, 'caso');

switch ($funcion){
    case 'cargaorientacion': 
    metodo_cargaorientacion();
    break;
    case 'cargaclases': 
    metodo_cargaclases();
    break;
    case 'cargasecciones': 
    metodo_cargasecciones();
    break;
}

function metodo_cargaorientacion(){
    $idmodalidad = filter_input(INPUT_POST, 'idmodalidad');
    
    $stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT TOR.id_orientacion AS ID, TOR.nombre AS nombre FROM tbl_Orientacion TOR WHERE TOR.Id_modalidad = ".$idmodalidad.";");
    $stmt->execute();
    
    $resultado = $stmt->fetchAll(PDO::FETCH_BOTH);
    
    echo json_encode($resultado);
    
}
function metodo_cargaclases(){
    $idmodalidad = filter_input(INPUT_POST, 'idorientacion');
    
    $stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT TC.id_clase AS IDC, TC.DescripClase AS DC, TC.Duracion AS DUR FROM tbl_Clases TC WHERE TC.Id_orientacion = ".$idmodalidad.";");
    $stmt->execute();
    
    $resultado = $stmt->fetchAll(PDO::FETCH_BOTH);
    
    echo json_encode($resultado);
    
}
function metodo_cargasecciones(){
    $idclase = filter_input(INPUT_POST, 'idclase');
    
    $stmt = ConexionBD::Abrir_Conexion()->prepare("select TS.id_seccion AS ISE, TS.DescripSeccion AS DS from tbl_secciones TS WHERE TS.id_clase = ".$idclase.";");
    $stmt->execute();
    
    $resultado = $stmt->fetchAll(PDO::FETCH_BOTH);
    
    echo json_encode($resultado);
    
}


