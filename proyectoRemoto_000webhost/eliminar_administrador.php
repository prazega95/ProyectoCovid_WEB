<?php

include("db.php");

if(isset($_GET['idAdmin'])) {

  $idAdmin = $_GET['idAdmin'];

  $query = "DELETE FROM tb_administrador WHERE idAdmin=$idAdmin";
  $resultado_eliminado = mysqli_query($conexion, $query);
  if(!$resultado_eliminado) {
    die("query fallando..");
  }

  $_SESSION['message'] = 'Administrador(a) Eliminado(a)!';
  $_SESSION['message_type'] = 'danger';
  header('Location: 6-ADMINISTRADORES.php');
}

?>
