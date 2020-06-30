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

  mysqli_close($conexion);  
?>


<?php include('includes/header.php'); ?>
<script src = 'validacion/formCiudadano.js'></script>


    <!-- CAPTURANDO EL VALOR DE TIPO DE DOCUMENTO Y MANDANDOLO A UN LABEL O INPUTTEXT PARA QUE LO GUARDE A MYSQL-->
    <script>
     function seleccionarCondicion() 
    {
     var d=document.getElementById("IDCondicion")
     var displaytext=d.options[d.selectedIndex].text;
     document.getElementById("txtCondicionScript").value=displaytext;
     }
    </script>



<div class="container p-4">

  <div class="row">

    <div class="col-md-6 mx-auto">

        <!--boton regresars-->
        <a href="2-CIUDADANO.php" class="btn btn-secondary">
           <i class="fa fa-arrow-circle-left" aria-hidden="true"></i>
        </a>

       <!--Contenedor-->
      <div class="card card-body">
      <form name="form1" action="editar_ciudadano.php?cod_usuario=<?php echo $_GET['cod_usuario']; ?>" method="POST" onsubmit="return validar()">
   
      <h1 class="text-center"> Formulario de Actualizacion</h1>
      <h6 class="text-center">---------------------------------------------------------</h6>
 
        <div class="form-group"><h6>Nombres :</h6>
          <input name="nom_usuario" type="text" class="form-control" value="<?php echo $nombre; ?>" placeholder="Nombre(s):">
          <label id="error" style="color:red"></label>
        </div>

        
        <div class="form-group"><h6>Apellidos :</h6>
        <input name="ape_usuario" type="text" class="form-control" value="<?php echo $apellido; ?>" placeholder="Apellido(s) :">
        <label id="error2" style="color:red"></label>
        </div>



        <div class="form-group"><h6>Tipo de Documento :</h6> 
            <!--se extrae a un inputtext lo seleccionado del option, sin el input registrara el valor entero mas no la descripcion-->
            <!--el value del input es para que extraiga el valor del ciudadano seleccionado y esta en hidden para invisibilidad-->
           <input type="hidden" id="txtCondicionScript" value="<?php echo $tipoDocumento; ?>" name="TipoDoc_usuario" class="form-control" autofocus readonly>

           <select id="IDCondicion" class="form-control" onchange="seleccionarCondicion();">
              <option value="" <?php if($row['TipoDoc_usuario']=='') echo 'selected'; ?>>Seleccione..</option>
							<option value="1" <?php if($row['TipoDoc_usuario']=='DNI') echo 'selected'; ?>>DNI</option>
              <option value="2" <?php if($row['TipoDoc_usuario']=='RUC') echo 'selected'; ?>>RUC</option>
						</select><label id="error3" style="color:red"></label>
		  
		    </div>



        <div class="form-group"><h6>Nº de documento :</h6>
        <input id="nDOCUMENTO" name="doc_usuario" type="text" class="form-control" value="<?php echo $documento; ?>" placeholder="Documento :">
        <label id="error4" style="color:red"></label>
        </div>

        <div class="form-group"><h6>Telefono :</h6>
        <input name="tel_usuario" type="text" class="form-control" value="<?php echo $telefono; ?>" placeholder="Teléfono :">
        <label id="error5" style="color:red"></label>
        </div>

        <div class="form-group"><h6>Usuario :</h6>
        <input name="login_usuario" type="text" class="form-control" value="<?php echo $usuario; ?>" placeholder="Usuario :">
        <label id="error6" style="color:red"></label>
        </div>

        <div class="form-group"><h6>Password :</h6>
        <input name="pass_usuario" type="text" class="form-control" value="<?php echo $clave; ?>" placeholder="Contraseña :">
        <label id="error7" style="color:red"></label>
        </div>
   

        <button id ="" class="btn-success" name="update"
          onclick="borrar_nombre(); borrar_apellido(); borrar_TipoDoc(); borrar_cajaTipo(); borrar_documento(); borrar_telefono(); borrar_usuario(); borrar_clave();">
          Actualizar
       </button>


        

  

      </form>
 
      </div>
 
    </div>
  </div>
</div>
<?php include('includes/footer.php'); ?>
