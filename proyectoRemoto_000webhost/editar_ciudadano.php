<?php
include("db.php");

$nombre = '';
$apellido= '';
$tipoDocumento= '';
$documento= '';
$telefono= '';
$usuario= '';
$clave= '';


if  (isset($_GET['cod_usuario'])) {

  $cod_usuario = $_GET['cod_usuario'];

  $query = "SELECT * FROM tb_usuario WHERE cod_usuario=$cod_usuario";
  $resultado_actualizado = mysqli_query($conexion, $query);

  if (mysqli_num_rows($resultado_actualizado) == 1) {
    $row = mysqli_fetch_array($resultado_actualizado);

    $nombre = $row['nom_usuario'];
    $apellido = $row['ape_usuario'];
    $tipoDocumento = $row['TipoDoc_usuario'];
    $documento = $row['doc_usuario'];
    $telefono = $row['tel_usuario'];
    $usuario = $row['login_usuario'];
    $clave = $row['pass_usuario'];
  }
}

if (isset($_POST['update'])) {
  $cod_usuario = $_GET['cod_usuario'];

  $nombre = $_POST['nom_usuario'];   
  $apellido = $_POST['ape_usuario']; 
  $tipoDocumento = $_POST['TipoDoc_usuario']; 	
  $documento = $_POST['doc_usuario'];  
  $telefono = $_POST['tel_usuario'];  
  $usuario = $_POST['login_usuario'];  
  $clave = $_POST['pass_usuario'];  

	$sql= mysqli_query($conexion,"SELECT COUNT(*) AS total FROM tb_usuario WHERE doc_usuario='{$documento}'");
  $row=mysqli_fetch_object($sql);
  if($row->total == 0){

  $query = "UPDATE tb_usuario set nom_usuario = '$nombre', 
                                  ape_usuario = '$apellido',
                                  TipoDoc_usuario = '$tipoDocumento',
                                  doc_usuario = '$documento',
                                  tel_usuario = '$telefono',
                                  login_usuario = '$usuario',
                                  pass_usuario = '$clave'
                            
                                  WHERE cod_usuario=$cod_usuario";
  mysqli_query($conexion, $query);

  $_SESSION['message'] = 'Ciudadano Actualizado!';
  $_SESSION['message_type'] = 'warning';
  header('Location: 2-CIUDADANO.php');
} 
   else{
       
  $_SESSION['message'] = 'EL Nº DE DOCUMENTO YA EXISTE';
  $_SESSION['message_type'] = 'warning';
  header('Location: 2-CIUDADANO.php');
}  


}
mysqli_close($conexion);  


?>


<?php include('includes/header.php'); ?>
<script src = 'validacion/formCiudadano.js'></script>

<div class="container p-4">
  <div class="row">
    <div class="col-md-4 mx-auto">
      <div class="card card-body">


      <form name="form1" action="editar_ciudadano.php?cod_usuario=<?php echo $_GET['cod_usuario']; ?>" method="POST" onsubmit="return validar()">


      <h1 class="text-center">Formulario de Actualizacion</h1>
      <h6 class="text-center">---------------------------------------------------------</h6>

        <div class="form-group">
          <input name="nom_usuario" type="text" class="form-control" value="<?php echo $nombre; ?>" placeholder="Nombre(s):">
          <label id="error" style="color:red"></label>
        </div>

        
        <div class="form-group">
        <input name="ape_usuario" type="text" class="form-control" value="<?php echo $apellido; ?>" placeholder="Apellido(s) :">
        <label id="error2" style="color:red"></label>
        </div>



        <div class="form-group"><h6>Tipo de Documento :</h6> 
			
						<select id="IDCondicion" class="form-control" id="TipoDoc_usuario" name="TipoDoc_usuario">
              <option value="" <?php if($row['TipoDoc_usuario']=='') echo 'selected'; ?>>Seleccione..</option>
							<option value="DNI" <?php if($row['TipoDoc_usuario']=='DNI') echo 'selected'; ?>>DNI</option>
              <option value="RUC" <?php if($row['TipoDoc_usuario']=='RUC') echo 'selected'; ?>>RUC</option>
							<option value="Pasaporte" <?php if($row['TipoDoc_usuario']=='Pasaporte') echo 'selected'; ?>>Pasaporte</option>
							<option value="Carnet de extranjeria" <?php if($row['TipoDoc_usuario']=='Carnet de extranjeria') echo 'selected'; ?>>Carnet de extranjeria</option>
						</select><label id="error3" style="color:red"></label>
		    	</div>





        <div class="form-group">
        <input name="doc_usuario" type="text" class="form-control" value="<?php echo $documento; ?>" placeholder="Documento :">
        <label id="error4" style="color:red"></label>
        </div>

        <div class="form-group">
        <input name="tel_usuario" type="text" class="form-control" value="<?php echo $telefono; ?>" placeholder="Teléfono :">
        <label id="error5" style="color:red"></label>
        </div>

        <div class="form-group">
        <input name="login_usuario" type="text" class="form-control" value="<?php echo $usuario; ?>" placeholder="Usuario :">
        <label id="error6" style="color:red"></label>
        </div>

        <div class="form-group">
        <input name="pass_usuario" type="text" class="form-control" value="<?php echo $clave; ?>" placeholder="Contraseña :">
        <label id="error7" style="color:red"></label>
        </div>


        <button class="btn-success" name="update"
          onclick="borrar_nombre(); borrar_apellido(); borrar_TipoDoc(); borrar_documento(); borrar_telefono(); borrar_usuario(); borrar_clave();">
          Actualizar
       </button>

      </form>
      </div>
    </div>
  </div>
</div>
<?php include('includes/footer.php'); ?>
