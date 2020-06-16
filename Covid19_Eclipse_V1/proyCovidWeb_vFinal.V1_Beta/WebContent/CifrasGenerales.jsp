<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>







<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<title>PROYECTO COVID19</title>

</head>

<body>

	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<h1 class="text-center">CIFRAS GENERALES</h1>
			</div>
			<div class="col-md-4 mb-2" >
				<select id="id_departamento" class="custom-select">
					<c:forEach var="item" items="${requestScope.listaDepartamentos}">
       						<option value="${item.codigo}">${item.nombre}</option>
       				</c:forEach>
				</select>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table" id="table">
					<thead class="thead-light text-center">
						<tr>
							<th>DEPARTAMENTO</th>
							<th>CONFIRMADOS</th>
							<th>RECUPERADOS</th>
							<th>FALLECIDOS</th>
							<th>HOSPITALIZADOS</th>
						</tr>
					</thead>
					<tbody class="text-center">

					</tbody>
				</table>

			</div>
		</div>

		<br>
		<br>


	</div>




	<!--  
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
		-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>
	<script>
		$(function(){
			cargarDatos();
			
			$("#id_departamento").bind("change",function(){
				cargarDatos();
			});
		});
		
		
		function cargarDatos() {
			var departamento=$('#id_departamento').val();
			
			$.get('ControladorCifras', {accion: 'listarCifras', departamento:departamento}, function(data, status){
				$('#table tbody').html('');
				
				data.map(function(e, i) {
					$('#table tbody').html('<tr><td>' + e.departamento + '</td><td>' + e.infectados + '</td><td>' + e.recuperados + '</td><td>' + e.muertos + '</td><td>' + e.hospitalizados + '</td><tr>')
				});
			});
		}
	</script>
		
</body>
</html>