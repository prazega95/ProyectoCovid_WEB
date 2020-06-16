<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
    
    
<!DOCTYPE html>
<html>

	<head>
	
			<script>
		  	function validar_Condicion(){
		  		
		  		var lista=document.getElementById("IDCondicion").selectedIndex;
		  		var error=document.getElementById("error");
		  		
		  		if(lista==0 || lista==null || lista==""){
		  			
		  			error.textContent="* Error: Debe elegir una Condición";
		  			
		  			return false;
		  		}else{
		  			
		  			return true;
		  		}
		  	}
		  	
			function validar_Resultado(){
		  		
		  		var lista1=document.getElementById("IDResultado").selectedIndex;
		  		var error2=document.getElementById("error2");
		  		
		  		if(lista1==0 || lista1==null || lista1==""){
		  			
		  			error2.textContent="* Error: Debe elegir un Resultado";
		  			
		  			return false;
		  		}else{
		  			
		  			return true;
		  		}
		  	}
			
			function borrar_condicion(){
				  error=document.getElementById("error");
				  error.textContent="";
			}
			
			function borrar_resultado(){
				  error2=document.getElementById("error2");
				  error2.textContent="";
			}
		
			
			function validar(){
				
				if(!validar_Condicion() || !validar_Resultado()){
					validar_Condicion();
					validar_Resultado();
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
		
		
			<h1 class="text-center">SITUACION MEDICA DE LOS CIUDADANOS</h1><br>
		
			<div class="d-flex">
	
		<div class="row align-items-start"> 
		
			<div class="card col-sm-4">
		
				<div class="card-body">
					<form action="ControladorCondicion?menu=Condicion" method="POST" onsubmit="return validar()">
					
						<div class="form-group">
							<label >FORMULARIO DE ACTUALIZACION</label>
						   <h6>---------------------------------------------------------</h6>
						</div><br>
						
						
						
						
	                      <div class="form-group">
							<label>CONDICION : <input type="text" id="txtCondicionScript" value="${condicion.getCondicion() }"   name="txtcondicion"  style="border:none;" readonly></label>
				
							  <select id="IDCondicion" onchange="seleccionarCondicion();" class="form-control">
							    <option value="" selected>Seleccione ...</option>
                                <option value="1">Grave</option>
                                <option value="2">Moderado</option>
                                <option value="3">Saludable</option>
                              </select><label id="error" style="color:red"></label>
                              <br>						
						  </div>
					
						
						
					
                        <div class="form-group">
							<label>RESULTADO :  <input type="text" id="txtResultadoScript" value="${condicion.getResultado() }"  name=txtresultado style="border:none;"  readonly></label>
							
							  <select id="IDResultado" onchange="seleccionarResultado();" class="form-control">
							    <option value="" selected>Seleccione ...</option>
							    <option value="0">No Confirmado</option>
                                <option value="1">Confirmado</option>
                                <option value="2">Hospitalizado</option>
                                <option value="3">Fallecido</option>
                                <option value="4">Recuperado</option>
                              </select><label id="error2" style="color:red"></label>
                              <br>	
						</div>
						
						
						
						
						
						
						
						
					
						
						<input type="submit" name="accion" value="Actualizar" onclick="borrar_condicion(); borrar_resultado();" class="btn btn-success">
					</form>
				</div>
			</div>
		
		
		
		
		
		
		
			<div class="col-sm-8">
				<table class="table table-hover">
					<thead>	
						<tr>
			        <th>ID</th>
				    <th>NOMBRES </th>
				    <th>APELLIDOS COMPLETOS</th>
                    <th>TIPO DE DOCUMENTO</th>     
                    <th>DEPARTAMENTO</th>
				    <th>CONDICION</th>
				    <th>RESULTADO</th>
				    <th>ACCION</th>
						</tr>
					</thead>
					<tbody>
					  <c:forEach var="condi" items="${condiciones }">
						<tr> 
	                        <td>${condi.getIdSintom() }</td>		
							<td>${condi.getPaciente().getNomPac() }</td>
							<td>${condi.getPaciente().getApePac() }</td>
							<td>${condi.getPaciente().getTipodoc() }</td>	
							<td>${condi.getDepartamento() }</td>													
						    <td>${condi.getCondicion() }</td>
						    <td>${condi.getResultado() }</td>
								<td>
								<a class="btn btn-warning" href="ControladorCondicion?menu=Condicion&accion=Editar&id=${condi.getIdSintom() }">Editar</a>
								
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