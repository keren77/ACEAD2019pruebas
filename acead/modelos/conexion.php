<?php

class ConexionBD{

	static public function Abrir_Conexion(){

		$link = new PDO("mysql:host=localhost;dbname=academiacead",
			            "root",
			            "");

		$link->exec("set names utf8");

		return $link;

	}

}
