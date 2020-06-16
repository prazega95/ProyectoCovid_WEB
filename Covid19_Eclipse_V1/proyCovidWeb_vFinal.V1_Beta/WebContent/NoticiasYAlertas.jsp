<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<script>
		  function validar_titulo(){
				
				var titulo=document.form1.txtTitulo.value;
				var error=document.getElementById("error");
				var valida=/^[a-zA-Z0-9_ ]*$/;
				
				if(titulo===""){
					error.textContent="* Error: Necesita Ingresar Titulo";
					return false;
					
				}
				/*else if(titulo.length>50){
					
					error.textContent="* Error: Demasiado caracteres";
					return false;
				
				}
				else if(!valida.test(titulo)){
					
					error.textContent="* Error: Sólo se permite letras";
					return false;
					*/
				else{
					return true;
				}
					
			}
		  
		  function validar_descripcion(){
				
				var descripcion=document.form1.txtDescripcion.value;
				var error2=document.getElementById("error2");
				var valida=/^[a-zA-Z_ ]*$/;
				
				if(descripcion===""){
					error2.textContent="* Error: Necesita Ingresar Descripción";
					return false;
					
				}
				/*else if(descripcion.length>100){
					
					error2.textContent="* Error: Demasiado caracteres";
					return false;
				
				}
				/*else if(!valida.test(apellido)){
					
					error2.textContent="* Error: Sólo se permite letras";
					return false;
					*/
				else{
					return true;
				}
					
			}
				
		  function borrar_titulo(){
			  var borrar=document.getElementById("error");
			  borrar.textContent="";
		  }
		  
		  function borrar_descripcion(){
			  var borrar2=document.getElementById("error2");
			  borrar2.textContent="";
		  }
		  
		  function validar(){
				
				if(!validar_titulo() || !validar_descripcion()){
					validar_titulo();
					validar_descripcion();
					
					
					return false;
				}
		  }
		  
		  </script>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
		<title login-heading> PROYECTO COVID19</title>
	</head>
	
	<body>
	
	<h1 class="text-center"  >NOTICIAS Y ALERTAS</h1>
    <br>


		<div class="d-flex">	
	
		<div class="row align-items-start"> 
		
			<div class="card col-sm-4">
		
				<div class="card-body">
					<form name="form1" action="ControladorNoticias?menu=Noticia" method="POST" onsubmit="return validar()">
					
						<div class="form-group" >
							<label>TITULO</label>
							<input value="${noticia.getTituloNoti() }"  name="txtTitulo" class="form-control" width="50">
							<label id="error" style="color:red"></label>
						</div>
						
						<div class="form-group">
							<label>DESCRIPCION</label>
							<input type="text" value="${noticia.getDescripNoti() }" name="txtDescripcion" class="form-control">
							<label id="error2" style="color:red"></label>
						</div>
						
						
						<input type="submit" name="accion" value="Agregar" onclick="borrar_titulo(); borrar_descripcion();" class="btn btn-info">
						<input type="submit" name="accion" value="Actualizar" onclick="borrar_titulo(); borrar_descripcion();" class="btn btn-success">
					</form>
				</div>
			</div>
		
			
		
		
		
			<div class="col-sm-8">
				<table class="table table-hover">
					<thead>	
						<tr>
							<th>ID</th>
							<th>TITULO</th>
						    <th>CONTENIDO</th>
		
						</tr>
					</thead>
					<tbody>
						<c:forEach var="noti" items="${noticias}">
						<tr> 
						<td>${noti.getIdNoti() }</td>
						<td>${noti.getTituloNoti() }</td>
						<td>${noti.getDescripNoti() }</td>
							<td>
								<a class="btn btn-warning" href="ControladorNoticias?menu=Noticia&accion=Editar&id=${noti.getIdNoti() }">Editar</a>
								<a class="btn btn-danger" href="ControladorNoticias?menu=Noticia&accion=Eliminar&id=${noti.getIdNoti() }">Eliminar</a>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		

		
		
		
		
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	</body>
</html>