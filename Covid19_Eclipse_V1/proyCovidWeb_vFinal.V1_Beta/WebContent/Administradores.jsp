<%@page import="javax.servlet.jsp.tagext.TagLibraryValidator"%>
<%@page import="javax.servlet.jsp.tagext.TagLibraryInfo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		  <script>
		  function validar_nombre(){
				
				var nombre=document.form1.txtnombres.value;
				var error=document.getElementById("error");
				var valida=/^[a-zA-Z_ ]*$/;
				
				if(nombre===""){
					error.textContent="* Error: Necesita Ingresar Nombres";
					return false;
					
				}
				else if(nombre.length>20){
					
					error.textContent="* Error: Demasiado caracteres";
					return false;
				
				}
				else if(!valida.test(nombre)){
					
					error.textContent="* Error: Sólo se permite letras";
					return false;
					
				}else{
					return true;
				}
					
			}
		  
		  function validar_fono(){
				
				var fono=document.form1.txtfono.value;
				var error2=document.getElementById("error2");
				var valida1=/^[0-9_]{1,9}$/;
				
				if(fono===""){
					error2.textContent="* Error: Necesita Ingresar Teléfono/Celular";
					return false;
					
				}
				else if(fono.length>9){
					
					error2.textContent="* Error: Error: Sólo se permite 9 caracteres";
					return false;
				
				}
				else if(!valida1.test(fono)){
					
					error2.textContent="* Error: Sólo se permite números";
					return false;
					
				}else{
					return true;
				}
					
			}
		  
		  function validar_usuario(){
				
				var usuario=document.form1.txtuser.value;
				var error3=document.getElementById("error3");
				var validar=/^[a-z-A-Z0-9_]*$/;
				
				if(usuario===""){
					error3.textContent="* Error: Necesita Ingresar Usuario";
					return false;
					
				}
				else if(usuario.length>20){
					
					error3.textContent="* Error: Demasiado caracteres";
					return false;
				
				}
				else if(!validar.test(usuario)){
					
					error3.textContent="* Error: Sólo se permite números o letras";
					return false;
					
				}else{
					return true;
				}
					
			}
		  
		  function validar_contra(){
				
				var contra=document.form1.txtpass.value;
				var error4=document.getElementById("error4");
				var validar1=/^[a-zA-Z0-9_]*$/;
				
				if(contra===""){
					error4.textContent="* Error: Necesita Ingresar Contraseña";
					return false;
					
				}
				else if(contra.length>20){
					
					error4.textContent="* Error: Demasiado caracteres";
					return false;
				
				}
				else if(!validar1.test(contra)){
					
					error4.textContent="* Error: No se permiten espacios ni símbolos, sólo números o letras";
					return false;
					
				}else{
					return true;
				}
					
			}
		  
		  function borrar_nombre(){
			  var borrar=document.getElementById("error");
			  borrar.textContent="";
		  }
		  
		  function borrar_usuario(){
			  var borrar1=document.getElementById("error3");
			  borrar1.textContent="";
		  }
		  function borrar_contra(){
			  var borrar2=document.getElementById("error4");
			  borrar2.textContent="";
		  }
		  function borrar_fono(){
			  var borrar3=document.getElementById("error2");
			  borrar3.textContent="";
		  }
				
				
				function validar(){
					
						if(!validar_nombre() || !validar_fono() || !validar_usuario() || !validar_contra()){
							validar_nombre();
							validar_fono();
							validar_usuario();
							validar_contra();
							return false;
						}
					
						
				}
					
				
					
					
			
		  </script>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
		
		<link rel="stylesheet" href="resources/main/css/diseñologin.css">
		
     	<title>PROYECTO COVID19</title>
	</head>
	<body>
	
		<h1 class="text-center">ADMINISTRADORES</h1>
		
		<div class="d-flex">
			<div class="card col-sm-4">
				<div class="card-body">
					<form name="form1" action="ControladorPrinc?menu=Administradores" method="POST" onsubmit="return validar()">
						<div class="form-group">
							<label id="error" style="color:red"></label> 
							<input type="text" value="${administrador.getNomapeAdmin() }" placeholder="INGRESA TUS NOMBRES" name="txtnombres" class="form-control">						
							
						</div>
						<div class="form-group">
							<label id="error2" style="color:red"></label>
							<input type="text" value="${administrador.getTelAdmin() }" placeholder="INGRESA TU TELEFONO/CELULAR"name="txtfono" class="form-control">
							
						</div>
						<div class="form-group">
							<label id="error3" style="color:red"></label>
							<input type="text" value="${administrador.getUserAdmin() }" placeholder="INGRESA TU USUARIO" name="txtuser" class="form-control">
							
						</div>
						<div class="form-group">
							<label id="error4" style="color:red"></label>
							<input type="text" value="${administrador.getPassAdmin() }" placeholder="INGRESA TU CONTRASEÑA" name="txtpass" class="form-control">
							
						</div>
						<input type="submit" name="accion" value="Agregar" onclick="borrar_nombre(); borrar_fono(); borrar_usuario(); borrar_contra();" class="btn btn-info">
						<input type="submit" name="accion" value="Actualizar" onclick="borrar_nombre(); borrar_fono(); borrar_usuario(); borrar_contra();" class="btn btn-success">
					</form>
					
		
				</div>
			</div>
		
			<div class="col-sm-8">
				<table class="table table-hover">
				
					<thead>	
						<tr>
							<th>ID</th>
							<th>NOMBRES</th>
							<th>TELEFONO</th>
							<th>USUARIO</th>
							<th>CONTRASEÑA</th>
							<th>ACCION</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="admi" items="${administradores }">
						<tr> 
							<td>${admi.getIdAdmin() } </td> 
							<td>${admi.getNomapeAdmin() }</td>
							<td>${admi.getTelAdmin() }</td>
							<td>${admi.getUserAdmin() }</td>
							<td>${admi.getPassAdmin() }</td>
							<td>
								<a class="btn btn-warning" href="ControladorPrinc?menu=Administradores&accion=Editar&id=${admi.getIdAdmin() }">Editar</a>
								<a class="btn btn-danger" href="ControladorPrinc?menu=Administradores&accion=Eliminar&id=${admi.getIdAdmin() }">Eliminar</a>
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