<?php
include("db.php");

$titulo = '';
$descripcion= '';



if  (isset($_GET['idnoticia'])) {

  $idnoticia = $_GET['idnoticia'];

  $query = "SELECT * FROM tb_noticias WHERE idnoticia=$idnoticia";
  $resultado_actualizado = mysqli_query($conexion, $query);

  if (mysqli_num_rows($resultado_actualizado) == 1) {
    $row = mysqli_fetch_array($resultado_actualizado);

    $titulo = $row['titulo_noticia'];
    $descripcion = $row['contenido_noticia'];

  }
}

if (isset($_POST['update'])) {
  $idnoticia = $_GET['idnoticia'];

  $titulo = $_POST['titulo_noticia'];   
  $descripcion = $_POST['contenido_noticia']; 
 

  $query = "UPDATE tb_noticias set titulo_noticia = '$titulo', 
                                  contenido_noticia = '$descripcion'
                          
                                  WHERE idnoticia=$idnoticia";

  mysqli_query($conexion, $query);

  $_SESSION['message'] = 'Noticia Actualizada!';
  $_SESSION['message_type'] = 'warning';
  header('Location: 1-NOTICIAS.php');
}

?>


<?php include('includes/header.php'); ?>
<div class="container p-4">
  <div class="row">
    <div class="col-md-4 mx-auto">
      <div class="card card-body">


      <form action="editar_noticia.php?idnoticia=<?php echo $_GET['idnoticia']; ?>" method="POST">


        <div class="form-group">
          <input name="titulo_noticia" type="text" class="form-control" value="<?php echo $titulo; ?>" placeholder="Titulo :">
        </div>

        
        <div class="form-group">
        <input name="contenido_noticia" type="text" class="form-control" value="<?php echo $descripcion; ?>" placeholder="Descripcion :">
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
