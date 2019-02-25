<?php

require_once "controladores/plantilla.controlador.php";
require_once "controladores/usuarios.controlador.php";
require_once "controladores/alumnos.controlador.php";
//require_once "controladores/modalidades.controlador.php";
require_once "controladores/clientes.controlador.php";
require_once "controladores/matricula.controlador.php";
require_once "controladores/cambiopass.controlador.php";

require_once "modelos/usuarios.modelo.php";
require_once "modelos/alumnos.modelo.php";
//require_once "modelos/modalidades.modelo.php";
require_once "modelos/clientes.modelo.php";
require_once "modelos/matricula.modelo.php";
require_once "modelos/cambiopass.modelo.php";

//require_once "../PHPMailer/PHPMailerAutoload.php";

$plantilla = new ControladorPlantilla();
$plantilla -> ctrPlantilla();
