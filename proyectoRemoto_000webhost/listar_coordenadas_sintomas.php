<?php
include("db.php");


if  (isset($_GET['cod_sintomas'])) {

  $cod_sintomas = $_GET['cod_sintomas'];

  $query = "SELECT * FROM tb_sintomas WHERE cod_sintomas=$cod_sintomas";
  $resultado_actualizado = mysqli_query($conexion, $query);

  if (mysqli_num_rows($resultado_actualizado) == 1) {
    $row = mysqli_fetch_array($resultado_actualizado);



  }
}



?>
















<?php include('includes/footer.php'); ?>
