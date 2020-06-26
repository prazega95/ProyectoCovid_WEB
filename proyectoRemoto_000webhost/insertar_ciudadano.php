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



  /*Consultar si el valor es 0 (no hay considencias se registra), si el row es 1 es porque existe igual registro y no registra*/
	$sql= mysqli_query($conexion,"SELECT COUNT(*) AS total FROM tb_usuario WHERE doc_usuario='{$documento}'");
  $row=mysqli_fetch_object($sql);
  if($row->total == 0){

    $insert="INSERT INTO tb_usuario(nom_usuario, ape_usuario, TipoDoc_usuario, doc_usuario, tel_usuario, login_usuario, pass_usuario) VALUES('{$nombre}','{$apellido}','{$tipoDocumento}','{$documento}','{$telefono}','{$usuario}','{$clave}')";
    $resultado_insert=mysqli_query($conexion,$insert);

       $_SESSION['message'] = 'REGISTRO DE CIUDADANO EXITOSO';
       $_SESSION['message_type'] = 'success';
       header('Location: 2-CIUDADANO.php');
  }
  else{
       
        $_SESSION['message'] = 'EL Nº DE DOCUMENTO YA EXISTE';
        $_SESSION['message_type'] = 'warning';
        header('Location: 2-CIUDADANO.php');
      }  

 }
mysqli_close($conexion);  


?>
