<?php
include("db.php");

$nomape_admin = '';
$fono_admin= '';
$usuario_admin= '';
$contra_admin= '';



if  (isset($_GET['idAdmin'])) {

  $idAdmin = $_GET['idAdmin'];

  $query = "SELECT * FROM tb_administrador WHERE idAdmin=$idAdmin";
  $resultado_actualizado = mysqli_query($conexion, $query);

  if (mysqli_num_rows($resultado_actualizado) == 1) {
    $row = mysqli_fetch_array($resultado_actualizado);

    $nombre = $row['nomape_admin'];
    $telefono = $row['fono_admin'];
    $usuario = $row['usuario_admin'];
    $clave = $row['contra_admin'];

  }
}

if (isset($_POST['update'])) {
  $idAdmin = $_GET['idAdmin'];

  $nombre = $_POST['nomape_admin'];   
  $telefono = $_POST['fono_admin']; 
  $usuario = $_POST['usuario_admin']; 
  $clave = $_POST['contra_admin']; 
 

  $query = "UPDATE tb_administrador set nomape_admin = '$nombre', 
                                        fono_admin = '$telefono',
                                        usuario_admin = '$usuario',
                                        contra_admin = '$clave'
                          
                                  WHERE idAdmin=$idAdmin";

  mysqli_query($conexion, $query);

  $_SESSION['message'] = 'Administrador(a) Actualizado(a)!';
  $_SESSION['message_type'] = 'warning';
  header('Location: 6-ADMINISTRADORES.php');
}

?>


<?php include('includes/header.php'); ?>
<div class="container p-4">
  <div class="row">
    <div class="col-md-4 mx-auto">
      <div class="card card-body">

      <br><br>
<h1 class="text-center">FORMULACION DE EDICION PARA CIUDADANO(A)</h1>
<br>


      <form action="editar_administrador.php?idAdmin=<?php echo $_GET['idAdmin']; ?>" method="POST">


        <div class="form-group">
          <input name="nomape_admin" type="text" class="form-control" value="<?php echo $nombre; ?>" placeholder="Nombre :">
        </div>

        
        <div class="form-group">
        <input name="fono_admin" type="text" class="form-control" value="<?php echo $telefono; ?>" placeholder="Telefono :">
        </div>

        <div class="form-group">
        <input name="usuario_admin" type="text" class="form-control" value="<?php echo $usuario; ?>" placeholder="Usuario :">
        </div>

        <div class="form-group">
        <input name="contra_admin" type="text" class="form-control" value="<?php echo $clave; ?>" placeholder="Clave :">
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
