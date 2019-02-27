<div class="content-wrapper">

  <section class="content-header">
    <ol class="breadcrumb">
      <li><a href="inicio"><i class="fa fa-dashboard "></i><strong>Inicio</strong></a></li>
      <li class="active"><strong>Gestión de Secciones</strong></li>
    </ol>    
    </br>  
  </section>

  <section class="content">

    <div class="panel panel-primary ">

        <div class="panel-heading">
            <h3 class="text-center"><strong>Gestión de Secciones</strong></h3>
            <button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#nuevoSeccion">
              <span class="glyphicon glyphicon-plus-sign"></span> Nuevo
            </button>
        </div>
        
        <div class="panel-body">                
          <table class = "table">
            <tr>
               <th>Product</th>
               <th>Price </th>
            </tr>
            
            <tr>
               <td>Product A</td>
               <td>200</td>
            </tr>
            
            <tr>
               <td>Product B</td>
               <td>400</td>
            </tr>
          </table>                            
        </div>           
    </div>

    <div class="modal fade bd-example-modal-lg" id="nuevoSeccion" tabindex="-1" role="dialog" aria-labelledby="myNuevaSeccionLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
    
          <div class="modal-header bg-primary text-center">
            <h3 class="modal-title">Nueva Sección</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
    
          <div class="modal-body bg-info">

              <form role="form">

                <div class="form-group row">
                  <div class="col-xs-4 col-sm-4 col-md-4">
                    <label for="pNombre">Descripción</label>
                    <input type="text" id="nuevoDescipcion" class="form-control" placeholder="Primer Nombre" required > 
                  </div>
                  <div class="col-xs-4 col-sm-4 col-md-4">
                    <label for="sNombre">Aula de Clase</label>
                    <input type="text" id="nuevaAula" class="form-control" placeholder="Segundo Nombre" required > 
                  </div>
                   <div class="col-xs-4 col-sm-4 col-md-4">
                    <label for="pApellido">Hora</label>
                    <input type="time" id="nuevaHora" class="form-control" placeholder="Primer Apellido" required > 
                  </div>  
                </div>                  
                
                <div class="form-group row">
                  <div class="col-xs-4 col-sm-4 col-md-4">
                    <label for="genero">Clase</label>
                    <select class="form-control" id="nuevaClase">
                      <option selected="true" value="null" >Elija una Clase</option>
                    </select>
                  </div>

                  <div class="col-xs-4 col-sm-4 col-md-4">
                    <label for="estadoCivil">Empleado</label>
                    <select class="form-control" id="nuevoEmpleado">
                      <option selected="true" value="null" >Elija un Empleado</option>
                    </select>
                  </div>
                  <div class="col-xs-4 col-sm-4 col-md-4">
                    <label for="departamento">Período Académico</label>
                    <select class="form-control" id="nuevoPeriodoAcademico">
                      <option selected="true" value="null" >Elija un Período Académico</option>
                    </select>
                  </div>
                </div>  
                                  
                <div class="form-group text-right">                         
                  <button type="button " class="btn btn-success " id="guardar">
                      <span class="glyphicon glyphicon-save"></span> Guardar
                  </button>
                  <button type="button" class="btn btn-danger" data-dismiss="modal">
                    <span class="glyphicon glyphicon-remove"></span>Cerrar
                  </button>
                </div>       
            </form>                       
          </div>

        </div>
      </div>
    </div>

    <div class="modal fade bd-example-modal-lg" id="nuevoSeccion" tabindex="-1" role="dialog" aria-labelledby="myEditarSeccionLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
    
          <div class="modal-header text-center">
            <h5 class="modal-title">Editar Sección</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
    
          <div class="modal-body">
              <form role="form">

                <div class="form-group row">
                  <div class="col-xs-4 col-sm-4 col-md-4">
                    <label for="pNombre">Descripción</label>
                    <input type="text" id="editarDescripcion" class="form-control" placeholder="Primer Nombre" required > 
                  </div>
                  <div class="col-xs-4 col-sm-4 col-md-4">
                    <label for="sNombre">Aula de Clase</label>
                    <input type="text" id="editarAula" class="form-control" placeholder="Segundo Nombre" required > 
                  </div>
                  <div class="col-xs-4 col-sm-4 col-md-4">
                    <label for="pApellido">Hora</label>
                    <input type="text" id="editarHora" class="form-control" placeholder="Primer Apellido" required > 
                  </div>  
                </div>                  
                
                <div class="form-group row">
                  <div class="col-xs-4 col-sm-4 col-md-4">
                    <label for="genero">Clase</label>
                    <select class="form-control" id="editarClase">
                      <option selected="true" value="null" >Elija una Clase</option>
                    </select>
                  </div>

                  <div class="col-xs-4 col-sm-4 col-md-4">
                    <label for="estadoCivil">Empleado</label>
                    <select class="form-control" id="editarEmpleado">
                      <option selected="true" value="null" >Elija una Empleado</option>
                    </select>
                  </div>
                  <div class="col-xs-4 col-sm-4 col-md-4">
                    <label for="departamento">Periodo Academico</label>
                    <select class="form-control" id="editarPeriodoAcademico">
                      <option selected="true" value="null" >Elija una Período Académico</option>
                    </select>
                  </div>
                </div>  
                                  
                <div class="form-group text-right">                         
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">
                    <span class="glyphicon glyphicon-save"></span>Cerrar
                  </button>
                  <button type="button " class="btn btn-info " id="guardar">
                      <span class="glyphicon glyphicon-save"></span> Guardar
                  </button>
                </div>       

                <div class="form-group text-right">                         
                  <button type="button " class="btn btn-success " id="guardar">
                      <span class="glyphicon glyphicon-save"></span> Guardar
                  </button>
                  <button type="button" class="btn btn-danger" data-dismiss="modal">
                    <span class="glyphicon glyphicon-remove"></span>Cerrar
                  </button>
                </div> 
            </form>
            
          </div>
        </div>
      </div>
    </div>      
  </section>
</div>
  