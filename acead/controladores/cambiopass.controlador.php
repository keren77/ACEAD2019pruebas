<?php
include 'PHPMailer/PHPMailerAutoload.php';

class ControladorPass{

  /*================================================
  OBTENER ID DE USUARIO Y COMPARAR SI EXISTE O NO
  ================================================*/

  static public function ctrCambioPass(){

      if(isset($_POST["cambioUsuario"])){

        if(preg_match('/^[A-Za-z0-9]+$/', $_POST["cambioUsuario"])){

          $tabla = "tbl_usuarios";

  				$item = "Usuario";

  				$valor = strtoupper($_POST["cambioUsuario"]);

          //$code = $_POST["code"];

          $respuesta = ModeloPass::mdlCambioPass($tabla, $item, $valor);

          if($respuesta["Usuario"] == strtoupper($_POST["cambioUsuario"])){

            $id = $respuesta["Id_usuario"];

          }else{

            echo '<br><div class="alert alert-danger">Error al ingresar, Usuario Invalido.</div>';

          }

        }

      }

    }

  /*=============================================
  CORREO
  =============================================*/

  static public function ctrEMAIL(){


      //require_once "../PHPMailer/PHPMailerAutoload.php";

      if(isset($_POST["cambioUsuario"])){

        if(preg_match('/^[A-Za-z0-9]+$/', $_POST["cambioUsuario"])){

          $tabla = "tbl_usuarios";

          $item = "Usuario";

          $bus = "CorreoElectronico";
          $bus2 = "code";

          $valor = strtoupper($_POST["cambioUsuario"]);

          $respuesta = ModeloPass::mdlObtenerCorreo($tabla, $item, $bus, $valor);


    	 	$code = $respuesta["code"];
    		$correo = $respuesta["CorreoElectronico"];



	//Envio de correo

  		$email_address = $correo;

    	$email_subject = "Recuperacion de contrasena: ";

    	$email_body= "<p>Hola <b>".$valor."</b> Su Link de recuperacion de contrasena es el siguiente:</p>
    							</p> http://localhost/acead/nuevacontrsena.php?user=".$valor."&code=".$code."</p>";


    $mail=new PHPMailer();

    $mail->isSMTP();

    $mail->SMTPDebug = 0;

    $mail->Debugoutput = 'html';

    $mail->Host = 'smtp.gmail.com';

    $mail->Port = 587;

    $mail->SMTPSecure = 'tls';

    $mail->SMTPAuth = true;

    $mail->Username = "academiacead@gmail.com";

    $mail->Password = "Academia2019";

    $mail->setFrom('academiacead@gmail.com', 'Academia Cead');

    $mail->addAddress($email_address, $valor);

    $mail->Subject = $email_subject;
    $mail->MsgHTML($email_body);


    if (!$mail->send()) {
        echo "Mailer Error: " . $mail->ErrorInfo;
    } else {
        header("Location: ../index.php");
    		$_SESSION["recuperar"]=1;
    		$_SESSION["ERRORRECUPERAR"]=2;
    }

    		////////////////////////////////////////////////////////////////////////////////////////////////////////////

    	}
    	else{
    		header("Location: ../index.php?ruta=Recuperar");
    		$_SESSION["ERRORRECUPERAR"]=1;
    	}


    }
  }












}
