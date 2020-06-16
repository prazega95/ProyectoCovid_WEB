<?php

include("db.php");

if(isset($_GET['idnoticia'])) {

  $idnoticia = $_GET['idnoticia'];

  $query = "DELETE FROM tb_noticias WHERE idnoticia=$idnoticia";
  $resultado_eliminado = mysqli_query($conexion, $query);
  if(!$resultado_eliminado) {
    die("query fallando..");
  }

  $_SESSION['message'] = 'Noticia Eliminada!';
  $_SESSION['message_type'] = 'danger';
  header('Location: 1-NOTICIAS.php');
}

?>
