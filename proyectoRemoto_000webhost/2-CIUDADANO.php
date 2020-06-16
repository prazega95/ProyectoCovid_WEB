<?php include("db.php"); 

?>

<?php include('includes/header.php'); ?>


<br>
<h1 class="text-center">LISTA DE CIUDADANOS</h1>
<br>

<main class="container p-4">
  <div class="row">
    <div class="col-md-4">


    <!-- CAPTURANDO EL VALOR DE TIPO DE DOCUMENTO-->
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

        <form action="insertar_ciudadano.php" method="POST">


          <div class="form-group">
            <input type="text" name="nom_usuario" class="form-control" placeholder="Nombre" autofocus>
          </div>

          <div class="form-group">
            <input type="text" name="ape_usuario" class="form-control" placeholder="Apellido" autofocus>
          </div>


          <div class="form-group">
              <input type="hidden"  id="txtCondicionScript" name="TipoDoc_usuario" class="form-control" placeholder="DNI"  autofocus>
	
          		  <select id="IDCondicion" onchange="seleccionarCondicion();" class="form-control">
							    <option selected>Tipo de Documento ..</option>
                  <option>DNI</option>
                  <option>RUC</option>
                  <option>Pasaporte</option>
                </select>
					</div>

          <div class="form-group">
            <input type="number" name="doc_usuario" required="" class="form-control" placeholder="Documento" autofocus >
          </div>

          <div class="form-group">
            <input type="number" name="tel_usuario" class="form-control" placeholder="Telefono" autofocus>
          </div>

          <div class="form-group">
            <input type="text" name="login_usuario" class="form-control" placeholder="Usuario" autofocus>
          </div>

          <div class="form-group">
            <textarea name="pass_usuario" rows="2" class="form-control" placeholder="Contraseña"></textarea>
          </div>

          <input type="submit" name="grabar_tb_usuario" class="btn btn-success btn-block" value="REGISTRAR NUEVO">

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
