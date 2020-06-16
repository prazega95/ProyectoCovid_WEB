<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
    
    
<!DOCTYPE html>
<html>

	<head>
	<script>
		  function validar_departamento(){
				
				var departamento=document.form1.txtdepartamento.value;
				var error=document.getElementById("error");
				var valida=/^[a-zA-Z_ ]*$/;
				
				if(departamento===""){
					error.textContent="* Error: Necesita Ingresar Departamento";
					return false;
					
				}
				else if(departamento.length>80){
					
					error.textContent="* Error: Demasiado caracteres";
					return false;
				
				}
				else if(!valida.test(departamento)){
					
					error.textContent="* Error: Sólo se permite letras";
					return false;
					
				}else{
					return true;
				}
					
			}
		  
		  function validar_provincia(){
				
				var provincia=document.form1.txtprovincia.value;
				var error2=document.getElementById("error2");
				var valida=/^[a-zA-Z_ ]*$/;
				
				if(provincia===""){
					error2.textContent="* Error: Necesita Ingresar Provincia";
					return false;
					
				}
				else if(provincia.length>80){
					
					error2.textContent="* Error: Demasiado caracteres";
					return false;
				
				}
				else if(!valida.test(provincia)){
					
					error2.textContent="* Error: Sólo se permite letras";
					return false;
					
				}else{
					return true;
				}
					
			}
		  
		  	function validar_distrito(){
				
				var distrito=document.form1.txtdistrito.value;
				var error3=document.getElementById("error3");
				var valida=/^[a-zA-Z_ ]*$/;
				
				if(distrito===""){
					error3.textContent="* Error: Necesita Ingresar Distrito";
					return false;
					
				}
				else if(distrito.length>80){
					
					error3.textContent="* Error: Demasiado caracteres";
					return false;
				
				}
				else if(!valida.test(distrito)){
					
					error3.textContent="* Error: Sólo se permite letras";
					return false;
					
				}else{
					return true;
				}
					
			}
		  	
			function validar_direccion(){
				
				var direccion=document.form1.txtdireccion.value;
				var error4=document.getElementById("error4");
				var valida1=/^[a-z-A-Z0-9_ ]*$/;
				
				if(direccion===""){
					error4.textContent="* Error: Necesita Ingresar Dirección";
					return false;
					
				}else{
					return true;
				}
					
			}
		  
		  function validar_latitud(){
				
				var latitud=document.form1.txtlatitud.value;
				var error5=document.getElementById("error5");
				var valida1=/^(\-?\d+(\.\d+)?)[0-9]$/;
				
				if(latitud===""){
					error5.textContent="* Error: Necesita Ingresar Latitud";
					return false;
					
				}else{
					return true;
				}
					
			}
		  
		  	function validar_longitud(){
				
				var longitud=document.form1.txtlongitud.value;
				var error6=document.getElementById("error6");
				var valida1=/^(\-?\d+(\.\d+)?)[0-9]$/;
				
				if(longitud===""){
					error6.textContent="* Error: Necesita Ingresar Longitud";
					return false;
					
				}else{
					return true;
				}
					
			}
		  	
		  	function borrar_departamento(){
				  var borrar=document.getElementById("error");
				  borrar.textContent="";
			  }
			  
			  function borrar_provincia(){
				  var borrar2=document.getElementById("error2");
				  borrar2.textContent="";
			  }
			  
			  function borrar_distrito(){
				  var borrar3=document.getElementById("error3");
				  borrar3.textContent="";
			  }
			  
			  function borrar_direccion(){
				  var borrar4=document.getElementById("error4");
				  borrar4.textContent="";
			  }
			  
			  function borrar_latitud(){
				  var borrar5=document.getElementById("error5");
				  borrar5.textContent="";
			  }
			  
			  function borrar_longitud(){
				  var borrar6=document.getElementById("error6");
				  borrar6.textContent="";
			  }
			  
			  function validar(){
					
					if(!validar_departamento() || !validar_provincia() || !validar_distrito() || !validar_direccion() || !validar_latitud() || !validar_longitud()){
						validar_departamento();
						validar_provincia();
						validar_distrito();
						validar_direccion();
						validar_latitud();
						validar_longitud();
						
						return false;
					}
				
					
			}
			  
		  
		
		  </script>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
		<title>PROYECTO COVID19</title>
		
		
		
		<script>
         function seleccionarCondicion() 
		 {
           var d=document.getElementById("IDCondicion")
           var displaytext=d.options[d.selectedIndex].text;
		   document.getElementById("txtCondicionScript").value=displaytext;
         }
        </script>
		
		
		<script>
         function seleccionarResultado() 
		 {
           var d=document.getElementById("IDResultado")
           var displaytext=d.options[d.selectedIndex].text;
		   document.getElementById("txtResultadoScript").value=displaytext;
         }
        </script>
		
		
		

	</head>
	
		<body>
		
			<h1 class="text-center">UBICACION GEOGRAFICA DEL CIUDADANO</h1><br>
		
		
		
		
			<div class="d-flex">
	
		<div class="row align-items-start"> 
		
			<div class="card col-sm-4">
		
				<div class="card-body">
					<form name="form1" action="ControladorLocalidad?menu=Localidad" method="POST" onsubmit="return validar()">
					
						<div class="form-group">
							<label >FORMULARIO DE LOCALIDAD DEL CIUDADANO</label>
							<input type="submit" name="accion" value="Actualizar" onclick="borrar_departamento(); borrar_provincia(); borrar_distrito(); borrar_direccion(); borrar_latitud(); borrar_longitud();" class="btn btn-success">
						   <h6>---------------------------------------------------------</h6>
						</div>
						
						
							<div class="form-group">
							<label>DEPARTAMENTO: </label>
							<input type="text" value="${localidad.getDepartamento() }" name="txtdepartamento" class="form-control">
							<label id="error" style="color:red"></label>
						</div>
						
							<div class="form-group">
							<label>PROVINCIA:</label>
							<input type="text" value="${localidad.getProvincia() }" name="txtprovincia" class="form-control">
							<label id="error2" style="color:red"></label>
						</div>
						
						<div class="form-group">
							<label>DISTRITO:</label>
							<input type="text" value="${localidad.getDistrito() }" name="txtdistrito" class="form-control">
							<label id="error3" style="color:red"></label>
						</div>
						
						<div class="form-group">
							<label>DIRECCION:</label>
							<input type="text" value="${localidad.getDireccion() }" name="txtdireccion" class="form-control">
							<label id="error4" style="color:red"></label>
						</div>
						
						<div class="form-group">
							<label>LATITUD:</label>
							<input type="text" value="${localidad.getLatitud() }" name="txtlatitud" class="form-control">
							<label id="error5" style="color:red"></label>
						</div>
						
						<div class="form-group">
							<label>LONGITUD:</label>
							<input type="text" value="${localidad.getLongitud() }" name="txtlongitud" class="form-control">
							<label id="error6" style="color:red"></label>
						</div>
						
					
						
						
					</form>
				</div>
			</div>
		
		
		
		
		
		
		
			<div class="col-sm-8">
				<table class="table text-center table-hover">
					<thead>	
						<tr>
			            <th>ID</th>
						<th>NOMBRES</th>
						<th>DEPART.</th>
						<th>PROVINCIA</th>
						<th>DISTRITO</th>
						<th>DIRECCION</th>
						<th>LATITUD</th>
						<th>LONGITUD</th>
						<th>ACCION</th>
				    
				    
						</tr>
					</thead>
					<tbody>
					  <c:forEach var="locali" items="${localidades }">
						<tr> 
	                        <td>${locali.getIdSintom() }</td>		
							<td>${locali.getPaciente().getNomPac() }</td>
							<td>${locali.getDepartamento() }</td>		
							<td>${locali.getProvincia() }</td>
							<td>${locali.getDistrito() }</td>
							<td>${locali.getDireccion() }</td>											
						    <td>${locali.getLatitud() }</td>
						    <td>${locali.getLongitud() }</td>
								<td>
								<a class="btn btn-warning" href="ControladorLocalidad?menu=Localidad&accion=Editar&id=${locali.getIdSintom() }">Editar</a>
								
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