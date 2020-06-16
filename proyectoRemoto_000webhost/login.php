<?php
session_start(); // Iniciando sesion

$error=''; // Variable para almacenar el mensaje de error
if (isset($_POST['submit'])) {
if (empty($_POST['username']) || empty($_POST['password'])) {
$error = "Username or Password is invalid";
}
else
{
// Define $username y $password
$username=$_POST['username'];
$password=$_POST['password'];

// Estableciendo la conexion a la base de datos
include("db.php");//Contiene de conexion a la base de datos
 


$sql = "SELECT usuario_admin, contra_admin FROM tb_administrador WHERE usuario_admin = '" .$username. "' and contra_admin='".$password."';";
$query=mysqli_query($conexion,$sql);
$counter=mysqli_num_rows($query);

if ($counter==1){
		$_SESSION['login_user_sys']=$username; // Iniciando la sesion
		header("location: 0-PRINCIPAL.php"); // Redireccionando a la pagina profile.php
	
	
} else {
$error = "El correo electrónico o la contraseña es inválida.";	
}
}
}



?>