<?php

include('db.php');


if (isset($_POST['grabar_tb_administrador'])) {

  $nombre = $_POST['nomape_admin'];   
  $telefono = $_POST['fono_admin']; 
  $usuario = $_POST['usuario_admin']; 
  $clave = $_POST['contra_admin']; 


  $query="INSERT INTO tb_administrador(nomape_admin, fono_admin,usuario_admin,contra_admin) VALUES('{$nombre}','{$telefono}','{$usuario}','{$clave}')";
  $resultado_insert=mysqli_query($conexion,$query);


  if(!$resultado_insert) {
    die("Query Failed.");
  }

  $_SESSION['message'] = 'Administrador(a) Registrado(a) Exitosamente!';
  $_SESSION['message_type'] = 'success';
  header('Location: 6-ADMINISTRADORES.php');

}

?>
