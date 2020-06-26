<?php
include("db.php");

$departamento = '';
$condicion= '';
$resultado= '';



if  (isset($_GET['cod_sintomas'])) {

  $cod_sintomas = $_GET['cod_sintomas'];

  $query =   "SELECT s.cod_sintomas,u.nom_usuario, u.ape_usuario,s.Departamento, s.Condicion, s.Resultado from tb_sintomas s inner join tb_usuario u on s.cod_usuario = u.cod_usuario WHERE cod_sintomas=$cod_sintomas";
  $resultado_actualizado = mysqli_query($conexion, $query);

  if (mysqli_num_rows($resultado_actualizado) == 1) {
    $row = mysqli_fetch_array($resultado_actualizado);

    $nombre = $row['nom_usuario'];
    $apellido = $row['ape_usuario'];
    $departamento = $row['Departamento'];
    $condicion = $row['Condicion'];
    $resultado = $row['Resultado'];

  }
}

if (isset($_POST['update'])) {
  $cod_sintomas = $_GET['cod_sintomas'];


  $Condicion = $_POST['Condicion']; 
  $resultado = $_POST['Resultado']; 	



  $query = "UPDATE tb_sintomas set Condicion = '$Condicion',
                                   Resultado = '$resultado'
                    
                            
                                  WHERE cod_sintomas=$cod_sintomas";

  mysqli_query($conexion, $query);

  $_SESSION['message'] = 'Condicion Actualizado!';
  $_SESSION['message_type'] = 'warning';
  header('Location: 4-CIFRAS.php');
}
?>



<?php include('includes/header.php'); ?>
<div class="container p-4">
  <div class="row">
    <div class="col-md-4 mx-auto">
      <div class="card card-body">


      <form action="editar_cifras.php?cod_sintomas=<?php echo $_GET['cod_sintomas']; ?>" method="POST" onsubmit="return validar()"> 

      <h1 class="text-center">Condiciones Actuales</h1>
      <h6 class="text-center">---------------------------------------------------------</h6>
     
      <h6>Nombre :  
        <input name="nom_usuario" type="text" placeholder="<?php echo $row['nom_usuario'] ?>"  style="border:none;"></h6>
      <h6>Apellido :  
        <input name="ape_usuario" type="text" placeholder="<?php echo $row['ape_usuario'] ?>"  style="border:none;"></h6>
      <h6>Departamento :  
        <input name="Departamento" type="text" placeholder="<?php echo $row['Departamento'] ?>"  style="border:none;"></h6>  
      <h6>----------------------------------------------------</h6>

      <div class="form-group"><h6>Condicion de Salud :</h6>
					<label for="Condicion" class="col-sm-2 control-label"></label>

						<select class="form-control" id="Condicion" name="Condicion">
              <option value="" <?php if($row['Condicion']=='') echo 'selected'; ?>>Seleccione..</option>
							<option value="Grave" <?php if($row['Condicion']=='Grave') echo 'selected'; ?>>Grave</option>
							<option value="Moderado" <?php if($row['Condicion']=='Moderado') echo 'selected'; ?>>Moderado</option>
							<option value="Saludable" <?php if($row['Condicion']=='Saludable') echo 'selected'; ?>>Saludable</option>
						</select><label id="error" style="color:red"></label>
			</div>








      <div class="form-group"><h6>Situacion actual :</h6> 
					<label for="Resultado" class="col-sm-2 control-label"></label>
          
						<select class="form-control" id="Resultado" name="Resultado">
              <option value="" <?php if($row['Resultado']=='') echo 'select'; ?>>Seleccione..</option>
              <option value="No Confirmado" <?php if($row['Resultado']=='No Confirmado') echo 'selected'; ?>>No Confirmado</option>
							<option value="Confirmado" <?php if($row['Resultado']=='Confirmado') echo 'selected'; ?>>Confirmado</option>
              <option value="Hospitalizado" <?php if($row['Resultado']=='Hospitalizado') echo 'selected'; ?>>Hospitalizado</option>
							<option value="Fallecido" <?php if($row['Resultado']=='Fallecido') echo 'selected'; ?>>Fallecido</option>
							<option value="Recuperado" <?php if($row['Resultado']=='Recuperado') echo 'selected'; ?>>Recuperado</option>
						</select><label id="error2" style="color:red"></label>
			</div>


        <button class="btn-success" name="update"
          onclick="borrar_condicion1(); borrar_resultado1();">
          Actualizar
       </button>
    

      </form>
      </div>
    </div>
  </div>
</div>
<?php include('includes/footer.php'); ?>
<script src = 'validacion/formCondicion.js'></script>