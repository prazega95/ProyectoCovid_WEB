<?php include("db.php"); ?>

<?php include('includes/header.php'); ?>

<br>
<h1 class="text-center">LISTA DE TRIAJE REGISTRADOS</h1>
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
						<th>APELLIDOS</th>
						<th>DEPARTAMENTO</th>
						<th>PROVINCIA</th>
						<th>DISTRITO</th>
						<th>DIRECCION</th>
						<th>CANTIDAD FAMILIAR</th>
						<th>PROFESION</th>
						<th>EMAIL</th>
						<th>SINTOMAS</th>
					</tr>
				</thead>


        <tbody>

          <?php
          $query = "SELECT s.cod_sintomas,u.nom_usuario, u.ape_usuario,s.Departamento, s.Provincia, s.Distrito, s.Direccion, s.Latitud, s.Longitud, s.NumeroFamiliar, s.Profesion,s.Email, s.PrimerSintoma, s.SegundoSintoma, s.TercerSintoma, s.CuartoSintoma, s.QuintoSintoma, s.SextoSintoma,s.Condicion, s.Resultado from tb_sintomas s inner join tb_usuario u on s.cod_usuario = u.cod_usuario";
          $resultado_insert = mysqli_query($conexion, $query);    
          while($row = mysqli_fetch_assoc($resultado_insert)) { ?>


         <tbody class="text-center">

					<tr>
            <td><?php echo $row['cod_sintomas']; ?></td>
		        <td><?php echo $row['nom_usuario']; ?></td>
            <td><?php echo $row['ape_usuario']; ?></td>
            <td><?php echo $row['Departamento']; ?></td>
            <td><?php echo $row['Provincia']; ?></td>
            <td><?php echo $row['Distrito']; ?></td>
     
            <td>
               <button  class="btn btn-primary" href="listar_coordenadas_sintomas.php?cod_sintomas=<?php echo $row['cod_sintomas'] ?>" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModalCoordenadas<?php echo $row['cod_sintomas']?>">
		 							Visualizar
					  	 </button>	
            </td>

            <td><?php echo $row['NumeroFamiliar']; ?></td>
            <td><?php echo $row['Profesion']; ?></td>
            <td><?php echo $row['Email']; ?></td>

            <td>
               <button  class="btn btn-primary" href="listar_coordenadas_sintomas.php?cod_sintomas=<?php echo $row['cod_sintomas'] ?>" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModalSintomas<?php echo $row['cod_sintomas']?>">
		 							Visualizar
					  	 </button>	
            </td>

          </tr>





<!-- Modal DIRECCION Y COORDENADAS-->
<div class="modal fade" id="myModalCoordenadas<?php echo $row['cod_sintomas']?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">DIRECCION REGISTRADO</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>

      <div class="modal-body">
       
       <h6>CIUDADANO :  
        <input type="text" placeholder="<?php echo $row['nom_usuario'] ?>" style="border:none;"></h6>
       <h6>---------------------------------------------------------</h6>

    <form>

        <div>
          <h6>Ubicacion : <input type="text" placeholder="<?php echo $row['Direccion'] ?>"  style="border:none;" size="50"></h6>
        </div>

     </form>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>









<!-- Modal SINTOMAS-->
<div class="modal fade" id="myModalSintomas<?php echo $row['cod_sintomas']?>" tabindex="-2" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">SUS SINTOMAS REGISTRADOS SON: </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>


      <div class="modal-body">
       
       <h6>CIUDADANO :  
        <input type="text" placeholder="<?php echo $row['nom_usuario'] ?>" style="border:none;"></h6>
       <h6>---------------------------------------------------------</h6>

    <form>
		      	
          <div>
						<h6>1º Sintoma:   <input type="text" placeholder="<?php echo $row['PrimerSintoma'] ?>" style="border:none;" size="50"></h6>
					</div>

					<div>
						<h6>2º Sintoma:   <input type="text" placeholder="<?php echo $row['SegundoSintoma'] ?>" style="border:none;" size="50"></h6>
					</div>

					<div>
						<h6>3º Sintoma:   <input type="text" placeholder="<?php echo $row['TercerSintoma'] ?>" style="border:none;" size="50"></h6>
					</div>

					<div>
						<h6>4º Sintoma:   <input type="text" placeholder="<?php echo $row['CuartoSintoma'] ?>" style="border:none;" size="50"></h6>
					</div>

					<div>
						<h6>5º Sintoma:   <input type="text" placeholder="<?php echo $row['QuintoSintoma'] ?>" style="border:none;" size="50"></h6>
					</div>

					<div>
						<h6>6º Sintoma:   <input type="text" placeholder="<?php echo $row['SextoSintoma'] ?>" style="border:none;" size="50"></h6>
					</div>
					
					<h6>--------------------------------------------------------------------</h6>
					<h6>SU CONDICION ES  : <input type="text" placeholder="<?php echo $row['Condicion'] ?>" style="border:none;"></h6>
					

     </form>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</div>











<?php } ?>


        </tbody>
      </table>
    </div>
  </div>
</main>

<?php include('includes/footer.php'); ?>
