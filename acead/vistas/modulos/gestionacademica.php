<div class="content-wrapper">

  <section class="content-header">

    <h1>

      Gestión Acadadémica

    </h1>

    <ol class="breadcrumb">

      <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>

      <li class="active">Administrar Gestión Académica</li>

    </ol>

  </section>

  <section class="content">

    <div class="box">

      <div class="box-body">

       <table class="table table-bordered table-striped dt-responsive tablas">

        <thead>

         <tr>

           <th style="width:10px">#</th>
           <th style="width:10px">Id</th>
           <th>Nombre</th>
           <th>Apellido</th>
           <th>Modalidad</th>
           <th>Clase 1</th>
           <th>Clase 2</th>
           <th>Clase 3</th>
           <th>Período Académico</th>
           <th>Estado</th>
           <th>Acciones</th>

         </tr>

        </thead>

        <tbody>

        <?php

	//Keren & Yeimi XD was here! y Estoy probando varias cosas (Att: Yeimi. Te quiero Keren ;* // A vos Tambien Nico. XD)

        $item = null;
        $valor = null;

        $matricula = ControladorMatricula::ctrMostrarmatricula($item, $valor);

       foreach ($matricula as $key => $value){

          echo ' <tr>
                  <td>'.($key+1).'</td>
                  <td>'.$value["Id_Matricula"].'</td>
                  <td>'.$value["Id_Alumno"].'</td>
                  <td>'.$value["Id_Seccion"].'</td>
                  <td>'.$value["Id_PeriodoAcm"].'</td>';

	/*OBTENER EL ESTADO DE PAGO DE LOS ALUMNOS
                  switch ($value["Id_Estado"]) {
                    case '1':
                        echo '<td><button class="btn btn-warning btn-xs btnActivar" idAlumno="'.$value["Id_Alumno"].'" estadoUsuario="1">PAGADO</button></td>';
                      break;

                    case '2':
                        echo '<td><button class="btn btn-danger btn-xs btnActivar" idAlumno="'.$value["Id_Alumno"].'" estadoUsuario="2">MORA</button></td>';
                      break;

                  }*/

                  '</td>


                  <td>

                    <div class="btn-group">

                      <button class="btn btn-warning btnEditarMatricula" idMatricula="'.$value["Id_Matricula"].'" data-toggle="modal" data-target="#modalEditarMatricula"><i class="fa fa-pencil"></i></button>



                    </div>

                  </td>

                </tr>';
        }


        ?>


        </tbody>

       </table>

      </div>

    </div>

  </section>

</div>
