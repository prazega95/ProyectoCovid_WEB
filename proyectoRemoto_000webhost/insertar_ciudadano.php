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

	$sql1= mysqli_query($conexion,"SELECT COUNT(*) AS total FROM tb_usuario WHERE doc_usuario='{$documento}'");
  $row1=mysqli_fetch_object($sql1);

  $sql2= mysqli_query($conexion,"SELECT COUNT(*) AS total FROM tb_usuario WHERE tel_usuario='{$telefono}'");
  $row2=mysqli_fetch_object($sql2);

  $sql3= mysqli_query($conexion,"SELECT COUNT(*) AS total FROM tb_usuario WHERE login_usuario='{$usuario}'");
  $row3=mysqli_fetch_object($sql3);

   
  if($row1->total == 1){   
    die('ERROR: El Nº de Documento existe!, regresar y corregir');
    
  


  }
  else if($row2->total == 1){
    die('ERROR: El Telefono existe!, regresar y corregir');

 
  }
  else if($row3->total == 1){
    die('ERROR: El Usuario existe!, regresar y corregir');

  }else{

    $insert="INSERT INTO tb_usuario(nom_usuario, ape_usuario, TipoDoc_usuario, doc_usuario, tel_usuario, login_usuario, pass_usuario) VALUES('{$nombre}','{$apellido}','{$tipoDocumento}','{$documento}','{$telefono}','{$usuario}','{$clave}')";
    $resultado_insert=mysqli_query($conexion,$insert);

       $_SESSION['message'] = 'REGISTRO DE CIUDADANO EXITOSO';
       $_SESSION['message_type'] = 'success';
       header('Location: 2-CIUDADANO.php');
  }

      /*  $_SESSION['message'] = 'EL Nº DE DOCUMENTO YA EXISTE';
        $_SESSION['message_type'] = 'warning';
        header('Location: 2-CIUDADANO.php');*/
        

 }
mysqli_close($conexion); 


?>
