<?php include("db.php"); 

?>

<?php include('includes/header.php'); ?>
<script src = 'validacion/formCiudadano.js'></script>

<br>
<h1 class="text-center">LISTA DE CIUDADANOS</h1>
<br>

<main class="container p-4">
  <div class="row">
    <div class="col-md-4">

    <script>

    </script>



    <!-- CAPTURANDO EL VALOR DE TIPO DE DOCUMENTO Y MANDANDOLO A UN LABEL O INPUTTEXT PARA QUE LO GUARDE A MYSQL-->
     <script>
     function seleccionarCondicion() 
    {
     var d=document.getElementById("IDCondicion")
     var displaytext=d.options[d.selectedIndex].text;
     document.getElementById("txtCondicionScript").value=displaytext;
     }
    </script>


      <!-- MENSAJE DE GUARDADO-->


      <?php if (isset($_SESSION['message'])) { ?>
      <div class="alert alert-<?= $_SESSION['message_type']?> alert-dismissible fade show" role="alert">
        <?= $_SESSION['message']?>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <?php session_unset(); } ?>
    



      <!-- INSERSION DE NUEVO CIUDADANO -->
      <div class="card card-body">

      <h5 class="text-center">Formulario de administracion</h5>
      <h6 class="text-center">----------------------------------------------------</h6><br>

        <form name="form1" action="insertar_ciudadano.php" method="POST" onsubmit="return validar()">


          <div class="form-group"><h6>Nombres :</h6>
            <input type="text" name="nom_usuario" class="form-control" placeholder="Nombre" autofocus >
            <label id="error" style="color:red"></label>
          </div>

          <div class="form-group"><h6>Apellidos :</h6>
            <input type="text" name="ape_usuario" class="form-control" placeholder="Apellido" autofocus>
            <label id="error2" style="color:red"></label>
          </div>

      
          <div class="form-group"><h6>Tipo de Documento :</h6> 
	
          		  <select id="IDCondicion" onchange="seleccionarCondicion();" class="form-control">
							    <option value="" selected>Tipo de Documento ...</option>
                  <option value="1">DNI</option>
                  <option value="2">RUC</option>
                </select><label id="error3" style="color:red"></label>
					</div>

          <div class="form-group">
          <h6>Nº de documento :</h6>
            <div class="row">
              <div class="col-md-3">
                <input type="text"  style="width:90px;" class="form-control" id="txtCondicionScript" name="TipoDoc_usuario" autofocus readonly>
                <label id="errorCajaTipo" style="color:red"></label>
              </div>
              <div class="col-md-7">
                <input type="number" style="width:220px;" id="nDOCUMENTO" name="doc_usuario" class="form-control" placeholder="Nº Documento" autofocus >
                <label id="error4" style="color:red"></label>
              </div> 
             </div>
          </div>   
                
           
          <div class="form-group"><h6>Telefono :</h6>
            <input type="number" id="formatotelefono" name="tel_usuario"  class="form-control" placeholder="Telefono" autofocus>
            <label id="error5" style="color:red"></label>
          </div>

          <div class="form-group"><h6>Usuario :</h6>
            <input type="text" name="login_usuario" class="form-control" placeholder="Usuario" autofocus>
            <label id="error6" style="color:red"></label>
          </div>

          <div class="form-group"><h6>Password :</h6>
            <textarea name="pass_usuario" rows="2" class="form-control" placeholder="Contraseña"></textarea>
            <label id="error7" style="color:red"></label>
          </div>

          <input type="submit" name="grabar_tb_usuario" class="btn btn-success btn-block" 
                 onclick="borrar_nombre(); borrar_apellido(); borrar_TipoDoc(); borrar_cajaTipo(); borrar_documento(); borrar_telefono(); borrar_usuario(); borrar_clave();"
                 value="REGISTRAR NUEVO">

        </form>
      </div>
    </div>


    <div class="col-md-8">
    <table class="table table-hover table-bordered">
        <thead thead class="thead-dark text-center">
          <tr>
              <th>ID</th>
							<th>NOMBRES</th>
						  <th>APELLIDO</th>
						  <th>TIPO</th>
						  <th>DOCUMENTO</th>
							<th>TELEFONO</th>
							<th>USUARIO</th>
							<th>CONTRASEÑA</th>
							<th>ACCION</th>
          </tr>
        </thead>


        <tbody>

          <?php
          $query = "SELECT * FROM tb_usuario";
          $resultado_insert = mysqli_query($conexion, $query);    
          while($row = mysqli_fetch_assoc($resultado_insert)) { ?>

          <tr>
            <td><?php echo $row['cod_usuario']; ?></td>
            <td><?php echo $row['nom_usuario']; ?></td>
            <td><?php echo $row['ape_usuario']; ?></td>
            <td><?php echo $row['TipoDoc_usuario']; ?></td>
            <td><?php echo $row['doc_usuario']; ?></td>
            <td><?php echo $row['tel_usuario']; ?></td>
            <td><?php echo $row['login_usuario']; ?></td>
            <td><?php echo $row['pass_usuario']; ?></td>

            <td>

              <a href="editar_ciudadano.php?cod_usuario=<?php echo $row['cod_usuario']?>" class="btn btn-secondary">
                <i class="fas fa-marker"></i>
              </a>

              <a href="eliminar_ciudadano.php?cod_usuario=<?php echo $row['cod_usuario']?>" class="btn btn-danger">
                <i class="far fa-trash-alt"></i>
              </a>


            </td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
    </div>
  </div>
</main>

<?php include('includes/footer.php'); ?>
