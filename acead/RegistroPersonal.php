<?php
  session_start();
  if((isset($_SESSION['id'])) && ($_SESSION['estado'] == 3)) {
    header("Location: home.php");
  }
?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="img/logo_mini.jpg">

    <title>Registro</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  </head>

  <body class="text-center">
<!--////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
      <div class="row">
        <div class="col-lg-12">
          <div class="card mb-3">
            <div class="card-header" id="ingresar_actualizar">
              <i id="i_ingresar_actualizar" class="fas fa-plus"></i> Registro</div>
            <div class="card-body">
             <!-- formulario de registro de Alumnos -->

              <form>
              <div class="tab-content">
              <!-- formulario 1 -->
              <div class="tab-pane active" id="formulario1">
                <div class="form-group">
                  <div class="form-row">
                    <div class="col-md-6">
                      <label >Primer Nombre</label>
                      <input class="form-control" name="auto_primer_nombre" id="InputNombre1" type="text" placeholder="Ingrese su Primer Nombre">
                    </div>
                    <div class="col-md-6">
                      <label >Segundo Nombre</label>
                      <input class="form-control" name="auto_segundo_nombre"id="InputNombre2" type="text" placeholder="Ingrese su Segundo Nombre">
                    </div>
                  </div>
                  <div class="form-row">
                    <div class="col-md-6">
                      <label >Primer Apellido</label>
                      <input class="form-control" name="auto_primer_apellido"id="InputApellido1" type="text" placeholder="Ingrese su Primer Apellido">
                    </div>
                    <div class="col-md-6">
                      <label >Segundo Apellido</label>
                      <input class="form-control" name="auto_segundo_apellido" id="InputApellido2" type="text" placeholder="Ingrese su Segundo Apellido">
                    </div>
                  </div>

                </div>
                <div class="form-group">
                  <label >Email</label>
                  <input class="form-control" name="auto_email" id="InputEmail" type="email" placeholder="Ingrese email">
                </div>
                <div class="form-group">
                <div class="form-row">
                      <div class="col-md-6">
                      <label>Sexo</label>
                            <div class="col-sm-10">
                              <select class="form-control" name='cbosexo' id="SelectSexo">
                                  <option selected>Sexo...</option>
                                  <option value="M">Masculino</option>
                                  <option value="F">Femenino</option>
                                </select>
                            </div>
                    </div>
                    <div class="col-md-6">
                      <label >Numero de Cedula</label>
                      <input class="form-control" name="auto_cedula" id="InputCedula" type="text" placeholder="Ingrese su Numero de identidad (sin guiones)">
                    </div>
                  </div>
                </div>

                  <div class="form-group">
                  <div class="form-row">
                    <div class="col-md-6">
                            <label>Estado Civil</label>
                            <div class="col-sm-10">
                              <select class="form-control" name='cboestadocivil' id="SelectCivil">
                                  <option selected>Estado Civil...</option>
                                  <option value="Casado">Casado</option>
                                  <option value="Soltero">Soltero</option>
                                </select>
                            </div>
                    </div>
                    <div class="col-md-6">
                      <label for="inputTelfono1">Telefono </label>
                      <input type="text" class="form-control" name= "auto_telefono" id="InputTelefono">
                    </div>
                  </div>
                </div>
                <button type="button" onclick="formu(0)" class="btn btn-primary btn-block" >Siguiente</button>

                <!-- fin formulario 1 -->
                </div>

                <!-- formulario 2 -->

                <div class="tab-pane " id="formulario2">

                <div class="form-group">
                  <label >Usuario</label>
                  <input class="form-control" name='auto_usuario' id="InputUsuario" type="text" placeholder="Ingrese un nombre de usuario" maxlength="10" minlength="5"  style="text-transform:uppercase">
                </div>

                <div class="form-group">
                  <div class="form-row">
                    <div class="col-md-6">
                      <label >Password</label>
                      <input class="form-control" name="auto_password" id="InputPassword" type="password" required="" placeholder="Password"  maxlength="20" minlength="8" >
                    </div>
                    <div class="col-md-6">
                      <label >Confirmar password</label>
                      <input class="form-control" name='auto_pass_confirmar' id="ConfirmarPassword" type="password" placeholder="Confirmar password">
                    </div>
                  </div>
                </div>
                  <div class="form-row">
                    <div class="form-group col-md-6">
                    <button type="button" onclick="formu(1)" class="btn btn-primary btn-block" >Volver</button>
                    </div>
                    <div class="form-group col-md-6">
                    <button type="button" onclick="formu(2)" class="btn btn-primary btn-block" >Siguiente</button>
                    </div>
                  </div>

                </div>

                <!-- fin formulario 2 -->

                <!-- formulario 3 -->

                <div class="tab-pane " id="formulario3">
                  <center><label>Para completar su registro presione sobre el boton de Registrar, sera redireccionado a la pagina de inicio de sesion, debe introducir sus credenciales y seguir los pasos de primer ingreso al sistema.</label></center>

                <div class="form-row">
                    <div class="form-group col-md-6">
                    <button type="button" onclick="formu(3)" class="btn btn-primary btn-block" >Volver</button>
                    </div>
                    <div class="form-group col-md-6">
                    <button  type="reset" onclick="formu(4)" class="btn btn-primary btn-block" >Registrar</button>
                    </div>
                  </div>


                </div>

                <!-- fin formulario 3 -->

                </div>
              </form>

             <!-- fin formulario de registro de Alumnos -->
            </div>
            <div class="card-footer small text-muted">
               <label id="error" style="color: red; font-size:large;"></label>
            </div>
          </div>
        </div>
        </div>

<?php

include '../acead/php/conexion.php';

if (isset($_POST['cbosexo'])){
    $auto_sexo = $_POST['cbosexo'];
  } else {
      echo 'aqui se dio el error';
  }

  if (isset($_POST['cboestadocivil'])){
      $auto_sexo = $_POST['cboestadocivil'];
    } else {
        echo 'aqui se dio el error';
    }

$auto_prim_nombre = $_POST ['auto_primer_nombre'];
$auto_seg_nombre = $_POST ['auto_segundo_nombre'];
$auto_prim_apellido = $_POST ['auto_primer_apellido'];
$auto_seg_apellido = $_POST ['auto_segundo_nombre'];
$auto_telefono = $_POST ['auto_telefono'];
$auto_cedula = $_POST ['auto_cedula'];
$auto_pass = $_POST ['auto_password'];
$auto_pass_conf = $_POST ['auto_pass_confirmar'];
$auto_usuario = $_POST ['auto_usuario'];

$sql1 = "SELECT MAX(id_empleado) FROM tbl_personal";
//$idtemp = $mysqli->query($sql1);
$idtemp =  $mysqli->query($sql1);

while($row = mysqli_fetch_array($idtemp)) {
$cal = $row['MAX(id_empleado)']+1;
//print_r($row);
echo $row['MAX(id_empleado)'];
echo $cal;
//print_r($cal);
}

$sql2 = "INSERT INTO tbl_personal(PrimerNombre, SegundoNombre,PrimerApellido, SegundoApellido,Telefono,Cedula,Email, CreadoPor, ModifcadoPor, FechaCreacion, FechaModificacion, Id_Departamento, Id_estado, Id_genero)
VALUES($auto_prim_nombre, $auto_seg_nombre, $) "


 ?>




<!--//////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
    <script src="js/controlador.js"></script>
  </body>
</html>
