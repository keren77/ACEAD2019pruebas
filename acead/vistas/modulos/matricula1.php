<!--=====================================
MODAL MATRICULA ALUMNO
======================================-->

<div id="modalMatriculaAlumno" class="modal fade" role="dialog">

  <div class="modal-dialog" style="width:1300px;">

    <div class="modal-content">

      <form role="form" method="post" enctype="multipart/form-data">

        <!--=====================================
        CABEZA DEL MODAL
        ======================================-->

        <div class="modal-header" style="background:#D81B60; color:white">

          <button type="button" class="close" data-dismiss="modal">&times;</button>

          <h4 class="modal-title">Matricula Alumno</h4>

        </div>

        <!--=====================================
        CUERPO DEL MODAL
        ======================================-->

        <div class="modal-body">

          <div class="box-body">

            <div class="container">

              <!-- ENTRADA PARA EL ALUMNO -->

               <div class="form-group">

                <div class="input-group">

                  <span class="input-group-addon"><i class="fa fa-id-badge"></i></span>

                  <input type="text" class="form-control input-lg" id="IdAlumno" name="IdAlumno" readonly value="">


                </div>

               </div>

               <!-- ENTRADA PARA EL NOMBRE -->

                <div class="form-group">

                 <div class="input-group">

                   <span class="input-group-addon"><i class="fa fa-id-badge"></i></span>

                   <input type="text" class="form-control input-lg" id="nombreAlumno" name="nombreAlumno" readonly value="">


                 </div>

                </div>




              <!-- ENTRADA PARA SELECCIONAR LA MODALIDAD -->

              <div class="form-group">

                <div class="input-group">

                  <span class="input-group-addon"><i class="fa fa-asterisk"></i></span>

                  <select class="form-control input-lg" id="matriculaModalidad" name="matriculaModalidad">

                    <option value="">Seleccionar Modalidad</option>

                    <?php

                    $mod = ControladorMatricula::ctrCargarSelectModalidades();
                    foreach ($mod as $key => $value) {
                      echo "<option value='".$value['Id_Modalidad']."'>".$value['DescripModalidad']."</option>";
                    }
                    ?>

                  </select>

                </div>

              </div>




              <!-- MATRICULA DE CLASES -->

                <div id="row">
                  <div class="card-deck mb-3 text-center">

                    <div class="card mb-3 box-shadow">

                      <div class="card-header">
                        <h4 class="my-0-font-weight-normal">Matricula</h4>
                      </div>

                      <div class="card-body">

                        <div class="row">
                          <div class="col-lg-4 col-sm-4 mb-4">
                              <select class="form-control" id="adicionar1" size="9" name="adicionar1"></select>




                            
                          </div>

                          <div class="col-xl-4 col-sm-4 mb-4">
                            <select class="form-control" id="adicionar2" size="9" name="adicionar2"></select>
                          </div>

                          <div class="col-xl-4 col-sm-4 mb-4">
                            <select class="form-control" id="adicionar3" size="9" name="adicionar3"></select>
                          </div>
                        </div>

                      </div>

                    </div>

                  </div>

                </div>



            </div>

          </div>

        </div>

        <!--=====================================
        PIE DEL MODAL
        ======================================-->

        <div class="modal-footer">

          <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Salir</button>

          <button type="submit" class="btn btn-primary">Matricular Alumno</button>

        </div>

        <?php

        $editarAlumno = new ControladorAlumnos();
        $editarAlumno -> ctrEditarAlumno();


        ?>



      </form>



    </div>

  </div>

</div>

<script src="../acead/vistas/js/matricula1.js"></script>
