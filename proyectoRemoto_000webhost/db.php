<?php

if(!isset($_SESSION)) 
    { 
        session_start(); //(esto se agrego para poder darle el alert en los registros)
    } 



$conexion = mysqli_connect(
   'localhost',
  'id13648985_covid19',
  'Prado123456789!',
  'id13648985_proyectocovid19'
) or die(mysqli_erro($mysqli));

?>
