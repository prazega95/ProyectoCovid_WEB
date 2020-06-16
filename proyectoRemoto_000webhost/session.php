<?php
// Estableciendo la conexion a la base de datos
include("db.php");//Contiene de conexion a la base de datos

/*session_start();*/ // Iniciando Sesion (ESTO SE COMENTO PORQUE NO DABA ALERT EN LOS REGISTROS)


// Guardando la sesion
$user_check=$_SESSION['login_user_sys'];
// SQL Query para completar la informacion del usuario
$ses_sql=mysqli_query($conexion, "select usuario_admin from tb_administrador where usuario_admin='$user_check'");
$row = mysqli_fetch_assoc($ses_sql);
$login_session =$row['usuario_admin'];
if(!isset($login_session)){
mysqli_close($conexion); // Cerrando la conexion
header('Location: index.php'); // Redirecciona a la pagina de inicio
}
?>