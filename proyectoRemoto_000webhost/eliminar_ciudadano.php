<?php

include("db.php");

if(isset($_GET['cod_usuario'])) {

  $cod_usuario = $_GET['cod_usuario'];

  $query = "DELETE FROM tb_usuario WHERE cod_usuario=$cod_usuario";
  $resultado_eliminado = mysqli_query($conexion, $query);
  if(!$resultado_eliminado) {
    
    $_SESSION['message'] = 'Error: Ciudadano con triaje registrado!';
    $_SESSION['message_type'] = 'danger';
    header('Location: 2-CIUDADANO.php');
   
  }
  else{
    $_SESSION['message'] = 'Ciudadano Eliminado!';
    $_SESSION['message_type'] = 'danger';
    header('Location: 2-CIUDADANO.php');

  }
}
mysqli_close($conexion); 

?>
