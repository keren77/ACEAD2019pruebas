<?php 
include 'conexion.php';

if ((isset($_POST['user']))&&(isset($_POST['pass']))) {
	
	$user=inputSeguro($mysqli,$_POST['user']);
	$pass=inputSeguro($mysqli,$_POST['pass']);
	$consulta="SELECT * FROM TBL_Usuarios WHERE Usuario='".$user."' AND Contrasena='".$pass."'";
	$stmt = $mysqli->query($consulta);
	session_start();
	if($row=mysqli_fetch_array($stmt)){
		$_SESSION['id']=$row['Id_usuario'];
		$_SESSION['nombre']=$row['Usuario'];
		$_SESSION['correo']=$row['CorreoElectronico'];
		$_SESSION['estado']=$row['Id_Estado'];
		$_SESSION['rol']=$_row['Id_Rold'];
		if($_SESSION['estado']==1){
			header("Location: ../preguntas.php");
		}elseif($_SESSION['estado']==2){
			header("Location: ../index.php?error=2");
		}elseif($_SESSION['estado']==3){
			header("Location: ../home.php");
		}elseif($_SESSION['estado']==4){
			header("Location: ../index.php?error=2");
		}
	}
	else{
		$_SESSION['intentos']+=1;
		header("Location: ../index.php?error=1");
	}
	$mysqli->close();

}else{
	header("Location: ../index.php");
}



function inputSeguro($conexion,$post)
{
    $input = htmlentities($post);
    $seguro = mysqli_real_escape_string ($conexion,$input);
    return $seguro;
}
 ?>
