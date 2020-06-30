<?PHP
$hostname_localhost ="localhost";
$database_localhost ="id13648985_proyectocovid19";
$username_localhost ="id13648985_covid19";
$password_localhost ="Prado123456789!";


$json=array();
	if(isset($_GET["doc_usuario"])){
		$documento=$_GET['doc_usuario'];
	
		
		$conexion = mysqli_connect($hostname_localhost,$username_localhost,$password_localhost,$database_localhost);
		
		$consulta="SELECT cod_usuario, nom_usuario FROM tb_usuario WHERE doc_usuario= '{$documento}'";
		$resultado=mysqli_query($conexion,$consulta);

		if($consulta){
		
			if($reg=mysqli_fetch_array($resultado)){
				$json['usuario'][]=$reg;
			}
			mysqli_close($conexion);
			echo json_encode($json);
		}


		else{
			$results["cod_usuario"]='';
			$results["nom_usuario"]='';
			$json['usuario'][]=$results;
			echo json_encode($json);
		}
		
	}
	else{
		   	$results["cod_usuario"]='';
			$results["nom_usuario"]='';
			$json['usuario'][]=$results;
			echo json_encode($json);
		}
?>