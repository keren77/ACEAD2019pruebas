<!-- <div class="content-wrapper"> -->

  <section class="content-header">

    <h1>
<!--
      Seguridad

      <small>Control de contraseña</small> -->

    </h1>

  </section>

  <!-- Main content -->
  <section class="content">

    <!-- Default box -->
    <div class="box">

      <div class="box-header with-border">
        <h3 class="box-title">Cambio de contraseña</h3>
      </div>

      <div class="box-body">

          <div class="row">
              <div class="col-md-12">
                <form role="form">

                <div class="box-body">



                  <div class="form-group">
                    <label for="exampleInputEmail1">Nuevo password</label>

                     <div class="input-group">

                          <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                           <input type="password" class="form-control" id="nuevopass" name="nuevopass" placeholder="Ingrese la nueva contraseña">
                           <span class="input-group-btn">
                           <button id="btnojito2" class="btn btn-default reveal1" type="button"> <i class="fa fa-eye" id="ojito"></i></button>
                           </span>
                    </div>

                  </div>


                  <div class="form-group">
                      <label for="exampleInputPassword1">Confirmar Password</label>
                    <div class="input-group">

                      <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                       <input type="password" class="form-control" id="confirmapass" name="confirmapass" placeholder="Confirma la nueva contraseña">
                       <span class="input-group-btn">
                       <button id="btnojito3" class="btn btn-default reveal1" type="button"> <i class="fa fa-eye" id="ojito"></i></button>
                       </span>

                    </div>
                  </div>

                </div>
                <!-- /.box-body -->

                <div class="box-footer">
                    <button type="submit" class="btn btn-primary" id="btnenviar">Guardar</button>
                </div>

                <?php
                  $cambio = new ControladorPass();
                  $cambio -> ctrCambioContraseña();
                ?>


              </form>
              </div>
          </div>
      </div>
      <!-- /.box-body -->
      <div class="box-footer" id="pie1">

      </div>
      <!-- /.box-footer-->
    </div>
    <!-- /.box -->

  </section>
  <!-- /.content -->
<!-- </div>  -->
<!-- /.content-wrapper -->
<script src="../acead/vistas/js/cambiopass.js"></script>
