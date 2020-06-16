<?php include("db.php"); ?>

<?php include('includes/header.php'); ?>

<br>
<h1 class="text-center">GEOGRAFIA</h1>
<br>


<!DOCTYPE html>
<html>
<head> 
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0">
    <title>Maps JavaScript API</title>
	<style> 
  	#map {
        height: 100%;
        }
     
        html, body {
        height: 100%;
        margin: 0;
        padding: 0;
        }
	</style> 
</head>  







	<body>
		<div id ="map"> 

    </div> 

    <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDHMC2AwCXtblDaZDCXUBBrkembuwYIXBs&callback=initMap">
    </script>

	<script>
  



    var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 43.5293101, lng: -5.6773233},
          zoom: 13
        });
      }


	</script>
	</body> 
</html>








<?php include('includes/footer.php'); ?>
