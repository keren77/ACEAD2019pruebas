<?php
//session_start();


 ?>

 <div class="login-box">

   <div class="login-box-body">

    <p class="login-box-msg">Cambio de Contraseña</p>

    <form method="post">

      <div class="form-group has-feedback">

        <!-- ENTRADA PARA EL USUADIO -->
          <div class="input-group">
              <span class="input-group-addon"><i class="fa fa-user"></i></span>
              <input type="text" class="form-control" placeholder="Ingrese su usuario" id="cambioUsuario" name="cambioUsuario" maxlength="15" minlength="5" style="text-transform: uppercase" autofocus autocomplete="off" required>

            </div>

      </div>

      <div class="row">
        <div class="col-xs-8">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Generar Nueva Contraseña</button>
        </div>
      </div>

      <?php

        $pass = new ControladorPass();
        $pass -> ctrCambioPass();
        $pass -> ctrEMAIL();


      ?>

    </form>
   </div>
 </div>
