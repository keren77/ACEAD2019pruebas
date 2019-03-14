<?php
//session_start();


 ?>

 <div class="login-box">

   <div class="login-box-body">

    <p class="login-box-msg">Cambio de Contraseña</p>

    <form method="post">

      <div class="form-group has-feedback">


            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                <input type="password" class="form-control" placeholder="CONTRASEÑA" id="cambiopass" name="cambiopassword" autofocus autocomplete="off" pattern="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^*-]).{5,8}$" required>

              </div>
            </div>

            <div class="form-group has-feedback">
              <div class="input-group">
                  <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                  <input type="password" class="form-control" placeholder="CONTRASEÑA" id="confirmapass" name="confirmapass" autofocus autocomplete="off" pattern="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^*-]).{5,8}$" required>

                </div>

            </div>

      <div class="row">
        <div class="col-xs-8">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Contraseña</button>
        </div>
      </div>

      <?php

      $cambio = new ControladorPass();
      $cambio -> ctrCambioContraseña();

      ?>

    </form>
   </div>
 </div>
