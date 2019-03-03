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
    echo "<script type='text/javascript'>alert('sql script')</script>";

		$stmt = ConexionBD::Abrir_Conexion()->prepare("INSERT INTO $tabla(PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, CorreoElectronico, Telefono, Cedula, Usuario, Contrasena, Id_Departamento, Id_Estado, Id_EstadoCivil, Id_Genero, Id_Rol, PrimerIngreso)
																									VALUES (:nombre1, :nombre2, :apellido1, :apellido2, :email, :telefono, :cedula, :usuario, :password, :departmento, :estado, :estcivil, :genero, :rol, :primeringreso)");


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
    $stmt->bindParam(":primeringreso", $datos["PrimerIngreso"], PDO::PARAM_INT);

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

        $stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT Id_usuario, PrimerIngreso FROM tbl_usuarios WHERE Id_usuario = ".$uid);
        $stmt->execute();

        //$stmt->bind_result($idu, $pingreso);
        $arregloU = $stmt->fetch(PDO::FETCH_BOTH);
        $pingreso = $arregloU['PrimerIngreso'];
        //echo '<script>alert("'.$pingreso.'");</script>';
        if($pingreso !== 1 && $pingreso !== '1'){
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
    case 'metcorreo':
        metodo_porcorreo();
        break;
    case 'metpreguntas':
        metodo_porpreguntas();
        break;
    case 'verifuser':
        metodo_verifuser();
        break;
    case 'cargapreguntas':
        metodo_cargapreguntas();
        break;
    case 'metcorreo':
        metodo_porcorreo();
        break;
    case 'metpreguntas':
        metodo_porpreguntas();
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

            //Llamado para la bitacora
            ConexionBD::Inserta_bitacora($fechaActual, 'Cambio de password', 'Cambiando el password en el primer acceso del usuario', $IdU, 6);

            echo '1';
        }else{
            echo '0';
        }

        //echo $result[0]['Contrasena'];
    }

    function metodo_porcorreo(){
         $usuario = filter_input(INPUT_POST, 'usuario');
         $stmt= ConexionBD::Abrir_Conexion()->prepare("select * from tbl_usuarios where usuario='".$usuario."';");
         $stmt->execute();
    }

    function metodo_porpreguntas(){
        $usuario = filter_input(INPUT_POST, 'usuario');
        $stmt= ConexionBD::Abrir_Conexion()->prepare("select * from tbl_usuarios where usuario='".$usuario."';");
        $stmt->execute();
    }

    function metodo_verifuser(){
        $usuario = filter_input(INPUT_POST, 'usuario');

        $stmt= ConexionBD::Abrir_Conexion()->prepare("select * from tbl_usuarios where usuario='".$usuario."';");
        $stmt->execute();

        $result = $stmt->fetchAll(PDO::FETCH_BOTH);

        if(isset($result)){
            echo json_encode($result);
        }else{
            echo '0';
        }
    }

    function metodo_cargapreguntas(){
        $uname = filter_input(INPUT_GET, 'un');

        $stmt = ConexionBD::Abrir_Conexion()->prepare("SELECT TU.Id_usuario, TU.Usuario, TU.correoElectronico, TU.contrasena FROM tbl_Usuarios TU WHERE Usuario = '".$uname."';");
        $stmt->execute();

        $result = $stmt->fetchAll(PDO::FETCH_BOTH);

        //Este es el ID del usuario del que se intenta cambiar el password
        //echo json_encode($result[0]['Id_usuario']);
        $idU = $result[0]['Id_usuario'];

        $stmt2 = ConexionBD::Abrir_Conexion()->prepare("select tpu.id_pregunta, tp.pregunta, tpu.respuesta, tpu.id_usuario from tbl_preguntasusuario tpu inner join tbl_preguntas tp on tpu.id_pregunta = tp.id_pregunta where tpu.id_usuario =".$idU.";");
        $stmt2->execute();
        $result2 = $stmt2->fetchAll(PDO::FETCH_BOTH);

        echo json_encode($result2);
        /*
        foreach($result as $fila){
            echo '<option value="'.$fila["Id_Pregunta"].'">'.$fila["Pregunta"].'</option>';
        }*/
    }
    /*
    function metodo_porcorreo(){
         $usuario = filter_input(INPUT_POST, 'usuario');
         $stmt= ConexionBD::Abrir_Conexion()->prepare("select * from tbl_usuarios where usuario='".$usuario."';");
         $stmt->execute();
    }

    function metodo_porpreguntas(){
        $usuario = filter_input(INPUT_POST, 'usuario');
        $stmt= ConexionBD::Abrir_Conexion()->prepare("select * from tbl_usuarios where usuario='".$usuario."';");
        $stmt->execute();
    }*/
