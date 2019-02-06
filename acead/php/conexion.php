<?php 

$servidor = "localhost";
$usuario = "root";
$password = "";

$db = "ACADEMIACEAD";
$mysqli = new mysqli($servidor, $usuario, $password, $db);
mysqli_set_charset($mysqli, 'utf8');

 ?>