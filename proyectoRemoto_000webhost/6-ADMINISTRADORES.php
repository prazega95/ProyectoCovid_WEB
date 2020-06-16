<?php include("db.php");  ?>

<?php include('includes/header.php'); ?>

<br>
<h1 class="text-center">LISTA DE ADMINISTRADORES</h1>
<br>

<main class="container p-4">
  <div class="row">
    <div class="col-md-4">


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

        <form action="insertar_administrador.php" method="POST">


          <div class="form-group">
            <input type="text" name="nomape_admin" class="form-control" placeholder="Nombre:"  autofocus>
          </div>
          <div class="form-group" >
            <input type="number" name="fono_admin" class="form-control" placeholder="Telefono:" autofocus>
          </div>
          <div class="form-group">
            <input type="text" name="usuario_admin" class="form-control" placeholder="Usuario:"  autofocus>
          </div>
          <div class="form-group">
            <input type="text" name="contra_admin" class="form-control" placeholder="Clave:"  autofocus>
          </div>
    

          <input type="submit" name="grabar_tb_administrador" class="btn btn-success btn-block" value="REGISTRAR NUEVO">

        </form>
      </div>
    </div>


    <div class="col-md-8">
      <table class="table table-bordered">
        <thead  class="thead-dark">
          <tr>
              <th>ID</th>
							<th>NOMBRES</th>
							<th>TELEFONO</th>
							<th>USUARIO</th>
							<th>CONTRASEÑA</th>
							<th>ACCION</th>
          </tr>
        </thead>


        <tbody>

          <?php
          $query = "SELECT * FROM tb_administrador";
          $resultado_insert = mysqli_query($conexion, $query);    
          while($row = mysqli_fetch_assoc($resultado_insert)) { ?>

          <tr>
            <td><?php echo $row['idAdmin']; ?></td>
            <td><?php echo $row['nomape_admin']; ?></td>
            <td><?php echo $row['fono_admin']; ?></td>
            <td><?php echo $row['usuario_admin']; ?></td>
            <td><?php echo $row['contra_admin']; ?></td>
     

            <td>

              <a href="editar_administrador.php?idAdmin=<?php echo $row['idAdmin']?>" class="btn btn-secondary">
                <i class="fas fa-marker"></i>
              </a>

              <a href="eliminar_administrador.php?idAdmin=<?php echo $row['idAdmin']?>" class="btn btn-danger">
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
