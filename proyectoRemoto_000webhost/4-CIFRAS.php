<?php include("db.php"); ?>

<?php include('includes/header.php'); ?>


<br>
<h1 class="text-center">SITUACION MEDICA DE LOS CIUDADANOS</h1>
<br>



<main class="container p-4">
  <div class="row">


      <!-- MENSAJE DE GUARDADO-->
      <?php if (isset($_SESSION['message'])) { ?>
      <div class="alert alert-<?= $_SESSION['message_type']?> alert-dismissible fade show" role="alert">
        <?= $_SESSION['message']?>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <?php session_unset(); } ?>





    <div class="col-md">
      <table class="table table-hover table-bordered">
        <thead thead class="thead-dark text-center">
          <tr>
              <th>ID</th>
							<th>NOMBRES </th>
						  <th>APELLIDOS COMPLETOS</th>
              <th>TIPO DE DOCUMENTO</th>     
              <th>DEPARTAMENTO</th>
						  <th>CONDICION</th>
						  <th>RESULTADO</th>
							<th>ACCION</th>
          </tr>
        </thead>





        <tbody>

          <?php
          $query = "SELECT s.cod_sintomas,u.nom_usuario, u.ape_usuario, u.TipoDoc_usuario, s.Departamento, s.Provincia, s.Distrito, s.Direccion, s.Latitud, s.Longitud, s.NumeroFamiliar, s.Profesion,s.Email, s.PrimerSintoma, s.SegundoSintoma, s.TercerSintoma, s.CuartoSintoma, s.QuintoSintoma, s.SextoSintoma,s.Condicion, s.Resultado from tb_sintomas s inner join tb_usuario u on s.cod_usuario = u.cod_usuario";
          $resultado_insert = mysqli_query($conexion, $query);    
          while($row = mysqli_fetch_assoc($resultado_insert)) { ?>

          <tr class="text-center" >
            <td><?php echo $row['cod_sintomas']; ?></td>
            <td><?php echo $row['nom_usuario']; ?></td>
            <td><?php echo $row['ape_usuario']; ?></td>
            <td><?php echo $row['TipoDoc_usuario']; ?></td>
            <td><?php echo $row['Departamento']; ?></td>
            <td><?php echo $row['Condicion']; ?></td>
            <td><?php echo $row['Resultado']; ?></td>
            <td>
                <a href="editar_cifras.php?cod_sintomas=<?php echo $row['cod_sintomas']?>" class="btn btn-secondary">
                <i class="fas fa-marker"></i>
            </td>
          </tr>


        





 <?php } ?>
        </tbody>
      </table>
    </div>
  </div>
</main>

<?php include('includes/footer.php'); ?>
