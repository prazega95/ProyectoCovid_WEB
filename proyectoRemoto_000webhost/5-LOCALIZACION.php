<?php include("db.php"); ?>

<?php include('includes/header.php'); ?>

<br>
<h1 class="text-center">UBICACION GEOGRAFICA DEL CIUDADANO</h1>
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

      <table class="table table-hover table-bordered" id="table">
				<thead class="thead-dark text-center">
					<tr>
            <th>ID</th>
						<th>NOMBRES</th>
						<th>APELLIDO</th>
            <th>FECHA REGISTRADO</th>
						<th>DEPARTAMENTO</th>
						<th>PROVINCIA</th>
						<th>DISTRITO</th>
						<th>DIRECCION</th>
						<th>LATITUD</th>
						<th>LONGITUD</th>
						<th>ACCION</th>
					</tr>
				</thead>


        <tbody>

          <?php
          $query = "SELECT s.cod_sintomas,u.nom_usuario, u.ape_usuario,s.Departamento, s.Provincia, s.Distrito, s.Direccion, s.Latitud, s.Longitud, s.NumeroFamiliar, s.Profesion,s.Email, s.Fecha, s.PrimerSintoma, s.SegundoSintoma, s.TercerSintoma, s.CuartoSintoma, s.QuintoSintoma, s.SextoSintoma,s.Condicion, s.Resultado from tb_sintomas s inner join tb_usuario u on s.cod_usuario = u.cod_usuario";
          $resultado_insert = mysqli_query($conexion, $query);    
          while($row = mysqli_fetch_assoc($resultado_insert)) { ?>


       <tbody class="text-center">

				<tr>
            <td><?php echo $row['cod_sintomas']; ?></td>
		        <td><?php echo $row['nom_usuario']; ?></td>
            <td><?php echo $row['ape_usuario']; ?></td>
            <td><?php echo $row['Fecha']; ?></td>
            <td><?php echo $row['Departamento']; ?></td>
            <td><?php echo $row['Provincia']; ?></td>
            <td><?php echo $row['Distrito']; ?></td>
            <td><?php echo $row['Direccion']; ?></td>
            <td><?php echo $row['Latitud']; ?></td>
            <td><?php echo $row['Longitud']; ?></td>
            <td>
               <a href="editar_localizacion.php?cod_sintomas=<?php echo $row['cod_sintomas']?>" class="btn btn-secondary">
                 <i class="fas fa-marker"></i>
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
