<?php

class ConexionBD{

	static public function Abrir_Conexion(){

		$link = new PDO("mysql:host=localhost;dbname=academiacead",
			            "root",
			            "");

		$link->exec("set names utf8");

		return $link;

	}

	  static public function Inserta_bitacora($f, $a, $d, $iu, $io){
            $stmt = ConexionBD::Abrir_Conexion()->prepare("CALL sp_addbitacora('".$f."','".$a."','".$d."',".$iu.",".$io.");");
            $stmt->execute();
        }


}
