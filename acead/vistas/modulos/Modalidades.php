<div class="content-wrapper">

  <section class="content-header">

    <h1>

      Administrar Modalidades

    </h1>

    <ol class="breadcrumb">

      <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>

      <li class="active">Mantenimiento Academico</li>

    </ol>

  </section>

  <!-- Main content -->
  <section class="content">

    <div class="box">

      <!-- BOTON AGREGAE USUARIO -->
            <div class="box-header with-border">

              <button class="btn btn-primary" data-toggle="modal" data-target="#modalAgregarModalidad">

                Agregar Modalidades

              </button>

            </div>


            <div class="box-body">

             <table class="table table-bordered table-striped dt-responsive tablas">

              <thead>

               <tr>

                 <th style="width:10px">#</th>
                 <th style="width:10px">Id</th>
                 <th>Modalidad</th>
                 <th>Acciones</th>


               </tr>

              </thead>

              <tbody>

              <?php



              $item = null;
              $valor = null;

              $mod = ControladorModalidades::ctrMostrarModalidades($item, $valor);

             foreach ($mod as $key => $value){

                echo ' <tr>
                        <td>'.($key+1).'</td>
                        <td>'.$value["Id_Modalidad"].'</td>
                        <td>'.$value["DescripModalidad"].'</td>

                        <td>

                          <div class="btn-group">

                            <button class="btn btn-warning btnEditarModalidad" idUsuario="'.$value["Id_Modalidad"].'" data-toggle="modal" data-target="#modalEditarUsuario"><i class="fa fa-pencil"></i></button>



                          </div>

                        </td>

                      </tr>';
              }


              ?>


              </tbody>

             </table>

    </div>
    <!-- /.box -->

  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->
