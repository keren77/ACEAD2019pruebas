<?php

/*
 Descripcion:       Define todas las opèraciones que se van a usar en todas las pantallas
 * Proyecto:        Academia CEAD
 * Desarrollador:   Nicolle Varela
 * Fecha:           24/10/2018
 */

session_start();
include 'db.php';

$conector = new basedatos();


//$creadopor = $_SESSION['userid'];

//validacion de los combobox
if (isset($_POST['cboroles'])){
    $roles = $_POST['cboroles'];

} else {
    echo 'aqui se dio el error';
}

if (isset($_POST['cbousuario'])){
    $usuarioid = $_POST['cbousuario'];
} else {
    echo '<script>alert("Debe seleccionar un usuario");window.location="nuevousuario.php";</script>';
}


//tomando el resto de los datos
$contraseña = $_POST['txtcontraseña1'];
$confirmacontraseña = $_POST['txtconfirmacontraseña'];
$usuario = $_POST['txtusuario'];
$fechavencimiento = $_POST['txtfechavencimiento'];
$correo = $_POST['txtcorreo'];
//$userid = $_SESSION['user_name'];

if ($contraseña === $confirmacontraseña){


}else{
    echo '<script>alert("Las contraseñas no coinciden");window.location="nuevousuario.php";</script>';
}


//aqui se llama a la funcion para crear un nuevo usuario
$conector->abrir_conexion();
$conector->insertausuario($usuario, $contraseña, $fechavencimiento, $correo, $roles, $usuarioid, "admin", $conector->CONECTOR());
$conector->cerrar_connexion();
