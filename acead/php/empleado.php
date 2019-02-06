<!doctype html>
<?php
include '../header.php';
include '../lateral.php';
?>

        <div class="breadcrumbs">
            <div class="col-sm-4">
                <div class="page-header float-left">
                    <div class="page-title">
                        <h1>Inicio</h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li><a href="#">Inicio</a></li>
                            <li><a href="#">Usuarios</a></li>
                            <li class="active">Creaci&oacute;n de Empleado</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <div class="content mt-3">
            <div class="animated fadeIn">


                <div class="row">

                  <div class="col-sm-12">
                    <div class="card">
                      <div class="card-header">
                        <strong>Creaci&oacute;n de Empleado</strong>
                      </div>
                      <div class="card-body card-block">
                        <form action="empleado.php" method="post" enctype="multipart/form-data" class="form-horizontal">
                          <div class="row form-group">
                            <div class="col col-md-3"><label class=" form-control-label">ID Empleado</label></div>
                            <div class="col-12 col-md-9">
                              <p class="form-control-static">ID</p>
                            </div>
                          </div>


                          <div class="row form-group">
                            <div class="col-12 col-md-3">
                            <input type="text" id="PrimerNombre" name="emp_primer_nombre" placeholder="Primer Nombre" maxlength="20" minlength="3" pattern="|^[a-zA-ZñÑáéíóúÁÉÍÓÚüÜ]*$|" title="No deje espacios en blanco ni introduzca datos númericos " class="form-control"></div>
                            <div class="col-12 col-md-3">
                            <input type="text" id="SegundoNombre" name="emp_segundo_nombre" placeholder="Segundo Nombre" maxlength="20" minlength="3" pattern="|^[a-zA-ZñÑáéíóúÁÉÍÓÚüÜ]*$|" title="No deje espacios en blanco ni introduzca datos númericos " class="form-control"></div>
                          </div>


						  <div class="row form-group">
                            <div class="col-12 col-md-3">
                            <input type="text" id="PrimerApellido" name="emp_primer_apellido" placeholder="Primer Apellido" maxlength="20" minlength="3" pattern="|^[a-zA-ZñÑáéíóúÁÉÍÓÚüÜ]*$|" title="No deje espacios en blanco ni introduzca datos númericos "class="form-control"></div>
                            <div class="col-12 col-md-3">
                            <input type="text" id="SegundoApellido" name="emp_segundo_apellido" placeholder="Segundo apellido" maxlength="20" minlength="3" pattern="|^[a-zA-ZñÑáéíóúÁÉÍÓÚüÜ]*$|" title="No deje espacios en blanco ni introduzca datos númericos " class="form-control"></div>
                          </div>


                           <div class="row form-group">
                            <div class="col-12 col-md-3">
                            <input type="text" id="Telefono" name="emp_tel" maxlength="8" minlength="8" pattern="[0-9]{8}" placeholder="Tel&eacute;fono" class="form-control" title="Solo introduzca datos númericos ni deje espacios en blanco y minimo 8 datos "></div>
                            <div class="col-12 col-md-3">
                            <input type="text" id="Cedula" name="emp_cedula" pattern="[0-9]{13}" placeholder="N&uacute;mero de Identidad (Sin guiones)" class="form-control"></div>
                          </div>


                          <div class="row form-group">
                            <div class="col-12 col-md-3"><input type="text" id="genero" name="text-input" placeholder="G&eacute;nero" class="form-control">
                            </div>
                          </div>


                           <div class="row form-group">
                            <div class="col-12 col-md-3">
                              <select name="select" id="estado_civil" class="form-control">
                                <option value="0">Estado Civil</option>
                                <option value="1">Soltero</option>
                                <option value="2">Casado</option>
                                <option value="2">Union libre</option>
                              </select>
                            </div>
                          </div>


						  <div class="row form-group">
                            <div class="col-12 col-md-6"><input type="email" id="apellido" name="emp_correo" placeholder="Correo Electronico"minlength="5" pattern="^[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]{2,200}\.[a-zA-Z]{2,6}$" class="form-control"></div>
                          </div>

						  <hr>

						   <div class="row form-group">
                          <div class="col-12 col-md-7"><textarea name="textarea-input" id="direccion" rows="3" placeholder="Direcci&oacute;n" class="form-control"></textarea></div>
                          </div>

                          <button type="submit" class="btn btn-primary btn-sm" name="botonagregar">
                            <i class="fa fa-dot-circle-o"></i> Guardar</a>
                          </button>

                          <!--<button type="reset" class="btn btn-primary btn-sm">
                            <i class="fa fa-dot-circle-o"></i> Actualizar
                          </button>

                            <button type="submit" class="btn btn-primary btn-sm">
                            <i class="fa fa-dot-circle-o"></i> Eliminar
                          </button>-->
                          <button type="reset" class="btn btn-danger btn-sm">
                            <i class="fa fa-ban"></i> Salir
                          </button>

                        </form>
                      </div>


                      <div class="card-footer">


                      </div>
                    </div>
                  </div>
                </div>
            </div><!-- .animated -->
        </div><!-- .content -->
    </div><!-- /#right-panel -->

    <?php
    include 'conexion.php';

    if (isset($_POST['botonagregar'])) {
      // code...
      $emp_prim_nombre = $_POST['emp_primer_nombre'];
      $emp_seg_nombre = $_POST['emp_segundo_nombre'];
      $emp_prim_apellido = $_POST['emp_primer_apellido'];
      $emp_seg_apellido = $_POST['emp_segundo_apellido'];
      $emp_telefono = $_POST['emp_tel'];
      $emp_ced = $_POST['emp_cedula'];
      $emp_correo = $_POST['emp_correo'];


  if ($mysqli->connect_error) {
     die("Connection failed: " . $conn->connect_error);
 }

 $sql = "INSERT INTO tbl_personal (PrimerNombre, PrimerApellido, SegundoNombre, SegundoApellido,Telefono, Cedula, email, id_estadocivil, id_genero)
 VALUES (upper('$emp_prim_nombre'),upper('$emp_prim_apellido'), upper('$emp_seg_nombre'), upper('$emp_seg_apellido'),'$emp_telefono','$emp_ced','$emp_correo','1','2')";

 if ($mysqli->query($sql) === TRUE) {
     //echo "New record created successfully";
 } else {
     echo "Error: " . $sql . "<br>" . $mysqli->error;
 }

 $mysqli->close();
    }

        ?>



</body>
</html>
