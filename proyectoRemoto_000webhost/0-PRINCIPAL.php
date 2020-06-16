<?php 
/*include('session.php'); /// (ESTO SE COMENTO PORQUE NO DABA ALERT EN LOS REGISTROS)*/

?>

<?php include('includes/header.php'); ?>


<br>
<h1 class="text-center">INICIO</h1>
<br>


<main class="container p-4">
  <div class="row">
    <div class="col-md">

	       <h3>Bienvenid@ al Sistema<i><?php /*echo $login_session;*/ ?></i></h3>
			
			<div class="clear"> </div>
				<h4><a href="logout.php"> Cerrar Sesión</a></h4>
	 </div>
  </div>

</main>

<?php include('includes/footer.php'); ?>
