<?php

include('db.php');


if (isset($_POST['grabar_tb_usuario'])) {

  $nombre = $_POST['nom_usuario'];   
  $apellido = $_POST['ape_usuario']; 
  $tipoDocumento = $_POST['TipoDoc_usuario']; 	
  $documento = $_POST['doc_usuario'];  
  $telefono = $_POST['tel_usuario'];  
  $usuario = $_POST['login_usuario'];  
  $clave = $_POST['pass_usuario'];  

  $query="INSERT INTO tb_usuario(nom_usuario, ape_usuario, TipoDoc_usuario, doc_usuario, tel_usuario, login_usuario, pass_usuario) VALUES('{$nombre}','{$apellido}','{$tipoDocumento}','{$documento}','{$telefono}','{$usuario}','{$clave}')";
  $resultado_insert=mysqli_query($conexion,$query);


  if(!$resultado_insert) {
    die("Query Failed.");
  }

  $_SESSION['message'] = 'Ciudadano Registrado Exitosamente';
  $_SESSION['message_type'] = 'success';
  header('Location: 2-CIUDADANO.php');

}

?>
