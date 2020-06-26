<?php

include('db.php');


if (isset($_POST['grabar_tb_noticias'])) {

  $titulo = $_POST['titulo_noticia'];   
  $descripcion = $_POST['contenido_noticia']; 


  $query="INSERT INTO tb_noticias(titulo_noticia, contenido_noticia) VALUES('{$titulo}','{$descripcion}')";
  $resultado_insert=mysqli_query($conexion,$query);


  if(!$resultado_insert) {
    die("Query Failed.");
  }

 

  $_SESSION['message'] = 'Noticia Registrado Exitosamente!';
  $_SESSION['message_type'] = 'success';
  header('Location: 1-NOTICIAS.php');

}

?>
