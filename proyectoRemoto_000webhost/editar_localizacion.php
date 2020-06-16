<?php
include("db.php");

$latitud = '';
$longitud= '';
$direccion= '';



if  (isset($_GET['cod_sintomas'])) {

  $cod_sintomas = $_GET['cod_sintomas'];

  $query = "SELECT * FROM tb_sintomas WHERE cod_sintomas=$cod_sintomas";
  $resultado_actualizado = mysqli_query($conexion, $query);

  if (mysqli_num_rows($resultado_actualizado) == 1) {
    $row = mysqli_fetch_array($resultado_actualizado);

    $latitud = $row['Latitud'];
    $longitud = $row['Longitud'];
    $direccion = $row['Direccion'];

  }
}

if (isset($_POST['update'])) {
  $cod_sintomas = $_GET['cod_sintomas'];

  $latitud = $_POST['Latitud'];   
  $longitud = $_POST['Longitud']; 
  $direccion = $_POST['Direccion']; 

 

  $query = "UPDATE tb_sintomas set Latitud = '$latitud', 
                                   Longitud = '$longitud',
                                   Direccion = '$direccion'
                          
                                  WHERE cod_sintomas=$cod_sintomas";

  mysqli_query($conexion, $query);

  $_SESSION['message'] = 'Localizacion Actualizado!';
  $_SESSION['message_type'] = 'warning';
  header('Location: 5-LOCALIZACION.php');
}

?>


<?php include('includes/header.php'); ?>
<div class="container p-4">
  <div class="row">
    <div class="col-md-4 mx-auto">
      <div class="card card-body">


      <h1 class="text-center">Formulario de Actualizacion</h1>
      <h6 class="text-center">----------------------------------------------------</h6>
      <br>

      <form action="editar_localizacion.php?cod_sintomas=<?php echo $_GET['cod_sintomas']; ?>" method="POST">


        <div class="form-group">
          <input name="Latitud" type="text" class="form-control" value="<?php echo $latitud; ?>" placeholder="Latitud :">
        </div>

        
        <div class="form-group">
        <input name="Longitud" type="text" class="form-control" value="<?php echo $longitud; ?>" placeholder="Longitud :">
        </div>

        <div class="form-group">

        <input name="Direccion" type="text" class="form-control" value="<?php echo $direccion; ?>" placeholder="Direccion :">
        </div>



        <button class="btn-success" name="update">
          Actualizar
        </button>

      </form>
      </div>
    </div>
  </div>
</div>
<?php include('includes/footer.php'); ?>
