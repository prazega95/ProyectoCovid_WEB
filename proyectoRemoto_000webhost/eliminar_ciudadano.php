<?php

include("db.php");

if(isset($_GET['cod_usuario'])) {

  $cod_usuario = $_GET['cod_usuario'];

  $query = "DELETE FROM tb_usuario WHERE cod_usuario=$cod_usuario";
  $resultado_eliminado = mysqli_query($conexion, $query);
  if(!$resultado_eliminado) {
    die("Query Failed.");
  }

  $_SESSION['message'] = 'Task Removed Successfully';
  $_SESSION['message_type'] = 'danger';
  header('Location: 2-CIUDADANO.php');
}

?>
