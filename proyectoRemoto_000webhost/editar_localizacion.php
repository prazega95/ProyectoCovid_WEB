<?php
include("db.php");

$departamento = '';
$provincia = '';
$distrito = '';
$latitud = '';
$longitud= '';
$direccion= '';


if  (isset($_GET['cod_sintomas'])) {

  $cod_sintomas = $_GET['cod_sintomas'];

  $query = "SELECT * FROM tb_sintomas WHERE cod_sintomas=$cod_sintomas";
  $resultado_actualizado = mysqli_query($conexion, $query);

  if (mysqli_num_rows($resultado_actualizado) == 1) {
    $row = mysqli_fetch_array($resultado_actualizado);

    $departamento = $row['Departamento'];
    $provincia = $row['Provincia'];
    $distrito = $row['Distrito'];
    $latitud = $row['Latitud'];
    $longitud = $row['Longitud'];
    $direccion = $row['Direccion'];

  }
}

if (isset($_POST['update'])) {
  $cod_sintomas = $_GET['cod_sintomas'];

  $departamento = $_POST['Departamento'];
  $provincia = $_POST['Provincia'];
  $distrito = $_POST['Distrito'];
  $latitud = $_POST['Latitud'];   
  $longitud = $_POST['Longitud']; 
  $direccion = $_POST['Direccion']; 

 

  $query = "UPDATE tb_sintomas set Departamento = '$departamento', 
                                   Provincia = '$provincia',
                                   Distrito = '$distrito',
                                   Latitud = '$latitud', 
                                   Longitud = '$longitud',
                                   Direccion = '$direccion'
                          
                                  WHERE cod_sintomas=$cod_sintomas";

  mysqli_query($conexion, $query);

  $_SESSION['message'] = 'Localizacion Actualizada!';
  $_SESSION['message_type'] = 'warning';
  header('Location: 5-LOCALIZACION.php');
}

?>


<?php include('includes/header.php'); ?>
<div class="container p-6">
  <div class="row">
    <div class="col-md-6 mx-auto">




      <!--boton regresars-->
        <a href="5-LOCALIZACION.php" class="btn btn-secondary">
           <i class="fa fa-arrow-circle-left" aria-hidden="true"></i>
        </a>

       <!--Contenedor-->
      <div class="card card-body">


      <h1 class="text-center">Formulario de Actualizacion</h1>
      <h6 class="text-center">---------------------------------------------------------</h6>
      <br>

      <form name="form1" action="editar_localizacion.php?cod_sintomas=<?php echo $_GET['cod_sintomas']; ?>" method="POST" onsubmit="return validar()">


       <div class="form-group">
          <h6>Departamento :</h6> 
						<select class="form-control" id="Departamento" name="Departamento">
              <option value="Amazonas" <?php if($row['Departamento']=='Amazonas') echo 'selected'; ?>>Amazonas</option>
							<option value="Ancash" <?php if($row['Departamento']=='Ancash') echo 'selected'; ?>>Ancash</option>
              <option value="Apurimac" <?php if($row['Departamento']=='Apurimac') echo 'selected'; ?>>Apurimac</option>
							<option value="Arequipa" <?php if($row['Departamento']=='Arequipa') echo 'selected'; ?>>Arequipa</option>
							<option value="Ayacucho" <?php if($row['Departamento']=='Ayacucho') echo 'selected'; ?>>Ayacucho</option>
              <option value="Cajamarca" <?php if($row['Departamento']=='Cajamarca') echo 'selected'; ?>>Cajamarca</option>
              <option value="Callao" <?php if($row['Departamento']=='Callao') echo 'selected'; ?>>Callao</option>
							<option value="Cusco" <?php if($row['Departamento']=='Cusco') echo 'selected'; ?>>Cusco</option>
							<option value="Huancavelica" <?php if($row['Departamento']=='Huancavelica') echo 'selected'; ?>>Huancavelica</option>
              <option value="Huanuco" <?php if($row['Departamento']=='Huanuco') echo 'selected'; ?>>Huanuco</option>
              <option value="Ica" <?php if($row['Departamento']=='Ica') echo 'selected'; ?>>Ica</option>
							<option value="Junin" <?php if($row['Departamento']=='Junin') echo 'selected'; ?>>Junin</option>
							<option value="La Libertad" <?php if($row['Departamento']=='La Libertad') echo 'selected'; ?>>La Libertad</option>
              <option value="Lambayeque" <?php if($row['Departamento']=='Lambayeque') echo 'selected'; ?>>Lambayeque</option>
              <option value="Lima" <?php if($row['Departamento']=='Lima') echo 'selected'; ?>>Lima</option>
							<option value="Loreto" <?php if($row['Departamento']=='Loreto') echo 'selected'; ?>>Loreto</option>
							<option value="Madre De Dios" <?php if($row['Departamento']=='Madre De Dios') echo 'selected'; ?>>Madre De Dios</option>
              <option value="Moquegua" <?php if($row['Departamento']=='Moquegua') echo 'selected'; ?>>Moquegua</option>
              <option value="Pasco" <?php if($row['Departamento']=='Pasco') echo 'selected'; ?>>Pasco</option>
							<option value="Piura" <?php if($row['Departamento']=='Piura') echo 'selected'; ?>>Piura</option>
							<option value="Puno" <?php if($row['Departamento']=='Puno') echo 'selected'; ?>>Puno</option>
              <option value="San Martin" <?php if($row['Departamento']=='San Martin') echo 'selected'; ?>>San Martin</option>
              <option value="Tacna" <?php if($row['Departamento']=='Tacna') echo 'selected'; ?>>Tacna</option>
							<option value="Tumbes" <?php if($row['Departamento']=='Tumbes') echo 'selected'; ?>>Tumbes</option>
							<option value="Ucayali" <?php if($row['Departamento']=='Ucayali') echo 'selected'; ?>>Ucayali</option>
						</select>
		  	</div>



      
        <div class="form-group">
        <h6>Provincia :</h6> 
          <input name="Provincia" type="text" class="form-control" value="<?php echo $provincia; ?>" placeholder="Provincia :">
          <label id="error" style="color:red"></label>
        </div>

        <div class="form-group">
           <h6>Distrito :</h6> 
          <input name="Distrito" type="text" class="form-control" value="<?php echo $distrito; ?>" placeholder="Distrito :">
          <label id="error2" style="color:red"></label>



        <div class="form-group">
        <h6>Latitud :</h6> 
          <input name="Latitud" type="text" class="form-control" value="<?php echo $latitud; ?>" placeholder="Latitud :">
          <label id="error3" style="color:red"></label>
        </div>

        
        <div class="form-group">
        <h6>Longitud :</h6> 
          <input name="Longitud" type="text" class="form-control" value="<?php echo $longitud; ?>" placeholder="Longitud :">
          <label id="error4" style="color:red"></label>
        </div>

        <div class="form-group">
        <h6>Direccion :</h6> 
          <input name="Direccion" type="text" class="form-control" value="<?php echo $direccion; ?>" placeholder="Direccion :">
          <label id="error5" style="color:red"></label>
        </div>



        <button class="btn-success" name="update"
        onclick="borrar_provincia(); borrar_distrito(); borrar_latitud(); borrar_longitud(); borrar_direccion();">
          Actualizar
        </button>

      </form>
      </div>
    </div>
  </div>
</div>
<?php include('includes/footer.php'); ?>
<script src = 'validacion/formLocalidad.js'></script>