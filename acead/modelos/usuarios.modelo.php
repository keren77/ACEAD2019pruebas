<?php
//@session_start();
require_once "conexion.php";

class ModeloUsuarios{

	/*OBTENER VALOR DE BD PARA LOS INTENTOS*/
static public function mdlObtenerIntentos(){

  $stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT valor FROM TBL_Parametros WHERE Parametro='ADMIN_INTENTOS_INVALIDOS'");
	$stmt -> execute();

	return $stmt -> fetch();

  }


	/*=============================================
	MOSTRAR USUARIOS
	=============================================*/

	static public function mdlMostrarUsuarios($tabla, $item, $valor){

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
	REGISTRO DE USUARIO
	=============================================*/

	static public function mdlIngresarUsuario($tabla, $datos){


		$stmt = ConexionBD::Abrir_Conexion()->prepare("INSERT INTO $tabla(PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, CorreoElectronico, Telefono, Cedula, Usuario, Contrasena, Id_Departamento, Id_Estado, Id_EstadoCivil, Id_Genero, Id_Rol)
																									VALUES (:nombre1, :apellido1, :email, :telefono, :cedula, :usuario, :password, :departmento, :estado, :estcivil, :genero, :rol)");


		$stmt->bindParam(":nombre1", $datos["PrimerNombre"], PDO::PARAM_STR);
    $stmt->bindParam(":nombre2", $datos["SegundoNombre"], PDO::PARAM_STR);
		$stmt->bindParam(":apellido1", $datos["PrimerApellido"], PDO::PARAM_STR);
    $stmt->bindParam(":apellido2", $datos["SegundoApellido"], PDO::PARAM_STR);
		$stmt->bindParam(":email", $datos["CorreoElectronico"], PDO::PARAM_STR);
		$stmt->bindParam(":telefono", $datos["Telefono"], PDO::PARAM_STR);
		$stmt->bindParam(":cedula", $datos["Cedula"], PDO::PARAM_STR);
		$stmt->bindParam(":usuario", $datos["Usuario"], PDO::PARAM_STR);
    $stmt->bindParam(":password", $datos["Contrasena"], PDO::PARAM_STR);
		$stmt->bindParam(":departmento", $datos["Id_Departamento"], PDO::PARAM_STR);
    $stmt->bindParam(":estado", $datos["Id_Estado"], PDO::PARAM_STR);
    $stmt->bindParam(":estcivil", $datos["Id_EstadoCivil"], PDO::PARAM_STR);
    $stmt->bindParam(":genero", $datos["Id_Genero"], PDO::PARAM_STR);
    $stmt->bindParam(":rol", $datos["Id_Rol"], PDO::PARAM_STR);

		//$stmt->bindParam(":perfil", $datos["perfil"], PDO::PARAM_STR);
		//$stmt->bindParam(":foto", $datos["foto"], PDO::PARAM_STR);


		if($stmt->execute()){

			return "ok";

		}else{

			return "error";

		}

		$stmt->close();

		$stmt = null;

	}

	/*=============================================
	EDITAR USUARIO
	=============================================*/

	static public function mdlEditarUsuario($tabla, $datos){


		$stmt = ConexionBD::Abrir_Conexion()->prepare("UPDATE $tabla SET PrimerNombre = :nombre1,
                                                                   SegundoNombre = :nombre2,
                                                                   PrimerApellido = :apellido1,
                                                                   SegundoApellido = :apellido2,
                                                                   CorreoElectronico = :email,
                                                                   Telefono = :telefono,
                                                                   Cedula = :cedula,
                                                                   Contrasena = :password,
                                                                   Id_Departamento = :departmento,
                                                                   Id_EstadoCivil = :estcivil, 
                                                                   Id_Genero = :genero,
                                                                   Id_Rol = :rol
                                                                WHERE Usuario = :usuario");

	  $stmt->bindParam(":nombre1", $datos["PrimerNombre"], PDO::PARAM_STR);
    $stmt->bindParam(":nombre2", $datos["SegundoNombre"], PDO::PARAM_STR);
		$stmt->bindParam(":apellido1", $datos["PrimerApellido"], PDO::PARAM_STR);
    $stmt->bindParam(":apellido2", $datos["SegundoApellido"], PDO::PARAM_STR);
		$stmt->bindParam(":email", $datos["CorreoElectronico"], PDO::PARAM_STR);
		$stmt->bindParam(":telefono", $datos["Telefono"], PDO::PARAM_STR);
		$stmt->bindParam(":cedula", $datos["Cedula"], PDO::PARAM_STR);
		$stmt->bindParam(":usuario", $datos["Usuario"], PDO::PARAM_STR);
    $stmt->bindParam(":password", $datos["Contrasena"], PDO::PARAM_STR);
		$stmt->bindParam(":departmento", $datos["Id_Departamento"], PDO::PARAM_STR);
    $stmt->bindParam(":estcivil", $datos["Id_EstadoCivil"], PDO::PARAM_STR);
    $stmt->bindParam(":genero", $datos["Id_Genero"], PDO::PARAM_STR);
    $stmt->bindParam(":rol", $datos["Id_Rol"], PDO::PARAM_STR);


		if($stmt -> execute()){

			return "ok";

		}else{

			return "error";

		}

		$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	BLOQUEAR USUARIO
	=============================================*/

	static public function mdlBloquearUsuario($tabla, $datos){


		$stmt = ConexionBD::Abrir_Conexion()->prepare("UPDATE $tabla SET Id_Estado = :estado WHERE Usuario = :usuario");

	//	$stmt -> bindParam(":nombre", $datos["nombre"], PDO::PARAM_STR);
		$stmt -> bindParam(":estado", $datos["Id_Estado"], PDO::PARAM_STR);
	//	$stmt -> bindParam(":perfil", $datos["perfil"], PDO::PARAM_STR);
	//	$stmt -> bindParam(":foto", $datos["foto"], PDO::PARAM_STR);
		$stmt -> bindParam(":usuario", $datos["Usuario"], PDO::PARAM_STR);


		if($stmt -> execute()){

			return "ok";

		}else{

			return "error";

		}

		$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	ACTUALIZAR USUARIO
	=============================================*/

	static public function mdlActualizarUsuario($tabla, $item1, $valor1, $item2, $valor2){

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
	BORRAR USUARIO
	=============================================*/

	static public function mdlBorrarUsuario($tabla, $datos){


		$stmt = ConexionBD::Abrir_Conexion()->prepare("DELETE FROM $tabla WHERE Id_usuario = :id");

		$stmt -> bindParam(":id", $datos, PDO::PARAM_INT);

		if($stmt -> execute()){

			return "ok";

		}else{

			return "error";

		}

		$stmt -> close();

		$stmt = null;


	}




	static public function mdlCargarSelect0($tabla, $item, $valor){

		if($item != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}

		$stmt -> close();

		$stmt = null;

	}

  static public function mdlCargarSelect($tabla){

    $stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT * FROM $tabla");
  	$stmt -> execute();

  	return $stmt -> fetchall();

    }
    
    static public function obtenerPrimerIngreso($uid){
        
        $stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT Id_usuario, PrimerIngreso, Id_estado FROM tbl_usuarios WHERE Id_usuario = ".$uid);
        $stmt->execute();
        
        //$stmt->bind_result($idu, $pingreso);
        $arregloU = $stmt->fetch(PDO::FETCH_BOTH);
        $pingreso = $arregloU['PrimerIngreso'];
        $estadoUsuario = $arregloU['Id_estado'];
        
        //echo '<script>alert("'.$pingreso.'");</script>';
        //$pingreso !== 1 && $pingreso !== '1'
        //if(($estadoUsuario === 1 || $estadoUsuario === '1') && ($pingreso !== 1 || $pingreso !== '1')){
        if($pingreso !== '1' && $estadoUsuario === '1'){
            return true;
        }else{
            return false;
        }
        
    }
    
    



}

// ELEMENTOS AGREGADOS POR NICOLLE
$funcion = filter_input(INPUT_GET, 'caso');
//$r = filter_input(INPUT_GET, 'r');
//$ip = filter_input(INPUT_GET, 'ip');

switch ($funcion){
    case 'respuestas':        
        Agregarespuesta();
        break;
    case 'cambiapass':
         DirigeCambioPass();
        break;
    case 'evaluaresp':
        limiterespuestas();
        break;
    case 'cambiopass':
        cambiopass();
        break;
}
      

function DirigeCambioPass(){
    session_start();
    $stmt = ConexionBD::Abrir_Conexion()->prepare("UPDATE tbl_usuarios SET PrimerIngreso = 1 WHERE id_usuario = ".$_SESSION['id']);
    $stmt->execute();
    
}

function Agregarespuesta() {
        //$IdU = $_SESSION['id'];
    //echo '<script>alert("Hola");</script>';
        session_start();
        $IdU = $_SESSION["id"];
        
        $fecha = date('Y-m-d');
        $hora = date('H:i:s');

        $fechaActual2 = $fecha.' '.$hora;
        
        //$IdU = 1;
        $hoy = getdate();
        $fechaactual = $hoy['year']."-".$hoy['mon']."-".$hoy['mday'];
        $r= filter_input(INPUT_POST, 'Respuesta');
        $IdP= filter_input(INPUT_POST, 'Id_Pregunta');
        //echo "<script>alert('INSERT INTO tbl_preguntasusuario(Respuesta, Id_usuario, Id_Pregunta, FechaCreacion, FechaModificacion, CreadoPor, ModificadoPor) VALUES('".$r."', ".$IdU.", ".$IdP.", '".$fechaactual."', '".$fechaactual."', 'Autoregistro', 'Autoregistro')');</script>";
        //$stmt = ConexionBD::Abrir_Conexion()->prepare("Insert into tbl_preguntasusuario(Respuesta, Id_usuario, Id_Pregunta, FechaCreacion, FechaModificacion, CreadoPor, ModificadoPor) values('".$r."', ".$IdU.", ".$IdP.", '".$fechaactual."', '".$fechaactual."', 'AutoRegistro', 'Autoregistro')");
                       
        $stmt = ConexionBD::Abrir_Conexion()->prepare("INSERT INTO tbl_Preguntasusuario(Respuesta, Id_usuario, Id_Pregunta, FechaCreacion, FechaModificacion, CreadoPor, ModificadoPor) VALUES('".$r."',".$IdU.",".$IdP.",'".$fechaactual."','".$fechaactual."','Autoregistro','Autoregistro')");
        $stmt ->execute();        
        
        ConexionBD::Inserta_bitacora($fechaActual2, 'Seguridad en acceso', 'Agregando pregunta de seguridad', $IdU, 2);
        //$stmt->close(); 
                
    }
    
    
    function limiterespuestas(){
        session_start();
        $IdU = $_SESSION['id'];
        $stmt= ConexionBD::Abrir_Conexion()->prepare("select count(*) AS cantidad from tbl_Preguntasusuario where Id_usuario=".$IdU."");
        $stmt->execute();
        $result=$stmt->fetchAll(PDO::FETCH_BOTH);
        $long = count($result);
        
        $arreglo=array();
        if($long==0){
            echo '{"sEcho":1,"iTotalRecords":"0","iTotalDisplayRecords":"0","aaData":[]}';
        }else{
            foreach ($result as $data) {
                $arreglo["data"][] = $data;
                
                
            }
            echo json_encode($arreglo);
        }
           
    }
    
    function cambiopass(){
        session_start();
        $IdU = $_SESSION['id'];
        
        $fecha = date('Y-m-d');
        $hora = date('H:i:s');

        $fechaActual = $fecha.' '.$hora;
        
        $pass = filter_input(INPUT_POST, 'Contrasena');
        $nuevoPass = filter_input(INPUT_POST, 'nuevopass');
        $confpass = filter_input(INPUT_POST, 'confpass');
        
        $stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT Contrasena FROM tbl_usuarios WHERE Id_usuario = ".$IdU.";");
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_BOTH);
        
        if(password_verify($pass, $result[0]['Contrasena'])){
            $stmt2 = ConexionBD::Abrir_Conexion()->prepare("UPDATE tbl_usuarios SET Contrasena = '". password_hash($nuevoPass, PASSWORD_DEFAULT)."' WHERE Id_usuario = ".$IdU.";");
            $stmt2->execute();
            
            $stmt3 = ConexionBD::Abrir_Conexion()->prepare("UPDATE tbl_Usuarios SET Id_Estado = 3 WHERE Id_Usuario = ".$IdU.";");
            $stmt3->execute();
            //Llamado para la bitacora
            ConexionBD::Inserta_bitacora($fechaActual, 'Cambio de password', 'Cambiando el password en el primer acceso del usuario', $IdU, 6);
            
            echo '1';
        }else{
            echo '0';
        }
        
        //echo $result[0]['Contrasena'];
    }
    
