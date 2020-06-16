<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>


<style>
	.modal-header, h4, .close {
		background-color: #286090;
		color: white !important;
		text-align: center;
		font-size: 30px;
	}
</style>     

<title>Proyecto COVID19</title>
</head>
<body>

 <div class="container">
 <h1 class="text-center">Administración de Triaje</h1><br><br><br>
		 <div class="col-md-23" > 
				
		       <form accept-charset="UTF-8"  action="ControladorSintom" class="simple_form" id="defaultForm2"  method="post">
		       		<input type="hidden" name="metodo" value="lista">
		       				
					<div class="row">
						<div class="col-md-3">
							<button type="submit" class="btn btn-primary" id="validateBtnw1" >VISUALIZAR</button><br>&nbsp;<br>
						</div>
						<div class="col-md-3">
							<button type="button" data-toggle='modal' onclick="registrar();"  class='btn btn-success' id="validateBtnw2" >REGISTRAR SINTOMAS</button><br>&nbsp;<br>
						</div>
					</div>
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="tableSintomas" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>NOMBRES</th>
												<th>APELLIDOS</th>
												<th>DEPARTAMENTO</th>
												<th>PROVINCIA</th>
												<th>RESIDENCIA</th>
												<th>PROFESION</th>
												<th>EMAIL</th>
												<th>SINTOMAS</th>
												<th class="text-center">ACCION</th>
												
											</tr>
										</thead>
										<tbody>
												     
												<c:forEach items="${sintomas}" var="x">
													<tr>
														<td class="text-center">${x.idSintom}</td>
														<td class="text-center">${x.paciente.nomPac}</td>
														<td class="text-center">${x.paciente.apePac}</td>
														<td class="text-center">${x.departamento}</td>
														<td class="text-center">${x.provincia}</td>
														
														<td class="text-center">
															<button type="button" onclick="editar2('${x.getPaciente().getNomPac()}','${x.getLatitud() }','${x.getLongitud() }','${x.getDireccion() }')" data-toggle="modal" data-target="#exampleModalCoordenadas" >
									 							<img src='imagenes/vista.jpg' width='20' height='20' />
															</button>			
														</td>
														<td class="text-center">${x.profesion}</td>
														<td class="text-center">${x.email}</td>
														<td class="text-center">
															<button type="button" onclick="editar3('${x.getPaciente().getNomPac()}','${x.getPriSintoma()}','${x.getSegSintoma() }','${x.getTerSintoma() }','${x.getCuartSintoma() }','${x.getQuintSintoma() }','${x.getSextSintoma() }','${x.getCondicion() }')" data-toggle="modal" data-target="#exampleModal">
		 							 							<img src='imagenes/sinto.png' width='20' height='20' />
															</button>
														</td>
														<td class="text-center">
														 <button type='button' data-toggle='modal' onclick="editar('${x.idSintom}','${x.paciente.idPac}','${x.departamento}','${x.provincia}','${x.distrito}','${x.direccion}','${x.latitud}','${x.longitud}','${x.numFamiliar}','${x.profesion}','${x.email}','${x.condicion}','${x.resultado}','${x.priSintoma}','${x.segSintoma}','${x.terSintoma}','${x.cuartSintoma}','${x.quintSintoma}','${x.sextSintoma}','${x.ninguna}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='imagenes/edit.gif' width='auto' height='auto' />
															</button>
														</td>
													</tr>
												</c:forEach>
										</tbody>
										</table>	
									
								</div>	
						</div>
					</div>
		 		</form>
		  </div>
  
  		<!-- Modal Registrar -->
		 <div class="modal fade" id="idModalRegistra" >
			<div class="modal-dialog" style="width: 60%">
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 15px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Sintomas</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="defaultForm" accept-charset="UTF-8" action="ControladorSintom" class="form-horizontal"  method="post">
							<input type="hidden" name="metodo" value="registra" >
							
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos Relevantes</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                	<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_id">ID Paciente</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_id" name="txtIdPac" placeholder="Ingrese Cod Paciente" type="text"/>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_depart">Departamento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_depart" name="txtDepartamento" placeholder="Ingrese Departamento" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_provi">Provincia</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_provi" name="txtProvincia" placeholder="Ingrese Provincia" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_dist">Distrito</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_dist" name="txtDistrito" placeholder="Ingrese Distrito" type="text"/>
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_direc">Direccion</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_direc" name="txtDireccion" placeholder="Ingrese Direccion" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_lat">Latitud</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_lat" name="txtLatitud" placeholder="Ingrese Distrito" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_long">Longitud</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_long" name="txtLongitud" placeholder="Ingrese Distrito" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_fami">Numero Familiar</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_fami" name="txtNumFam" placeholder="Ingrese Num Familiar" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_prof">Profesion</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_prof" name="txtProfesion" placeholder="Ingrese Profesion" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_email">Email</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_email" name="txtEmail" placeholder="Ingrese Correo" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_cond">Condicion</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_cond" name="txtCondicion" placeholder="Ingrese Distrito" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_resu">Resultado</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_resu" name="txtResultado" placeholder="Ingrese Distrito" type="text"/>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        <div class="panel panel-default">
		                        	<div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Sintomas</a></h4>
		                            </div>
		                            <div style="padding:20px 50px;">
		                                 <label class="row" for="id_reg_sint1">¿Tiene fiebre alta?</label>
		                                 <div class="row">
											<select id="id_reg_sint1" name="txtSint1" class='form-control'>
							                	<option value="" >[SELECCIONE]</option>
							                    <option value="Fiebre alta">Si</option>
							                    <option value="No tiene fiebre">No</option>
							                 </select>
		                                  </div>
		                              </div>
		                              <div style="padding:20px 50px;">
		                                 <label class="row" for="id_reg_sint2">¿Tiene tos Constante?</label>
		                                 <div class="row">
											<select id="id_reg_sint2" name="txtSint2" class='form-control'>
							                	<option value="" >[SELECCIONE]</option>
							                    <option value="Tos Constante">Si</option>
							                    <option value="No tiene tos">No</option>
							                 </select>
		                                  </div>
		                              </div>
		                              <div style="padding:20px 50px;">
		                                 <label class="row" for="id_reg_sint3">¿Tiene Dolor de cabeza?</label>
		                                 <div class="row">
											<select id="id_reg_sint3" name="txtSint3" class='form-control'>
							                	<option value="" >[SELECCIONE]</option>
							                    <option value="Dolor de cabeza">Si</option>
							                    <option value="No tiene dolor de cabeza">No</option>
							                 </select>
		                                  </div>
		                              </div>
		                              <div style="padding:20px 50px;">
		                                 <label class="row" for="id_reg_sint4">¿Tiene dolor de garganta?</label>
		                                 <div class="row">
											<select id="id_reg_sint4" name="txtSint4" class='form-control'>
							                	<option value="" >[SELECCIONE]</option>
							                    <option value="Dolor de garganta">Si</option>
							                    <option value="No tiene dolor de garganta">No</option>
							                 </select>
		                                  </div>
		                              </div>
		                              <div style="padding:20px 50px;">
		                                 <label class="row" for="id_reg_sint5">¿Tiene dificultad para respirar?</label>
		                                 <div class="row">
											<select id="id_reg_sint5" name="txtSint5" class='form-control'>
							                	<option value="" >[SELECCIONE]</option>
							                    <option value="Dificultad para respirar">Si</option>
							                    <option value="No tiene dificultad de respiro">No</option>
							                 </select>
		                                  </div>
		                              </div>
		                              <div style="padding:20px 50px;">
		                                 <label class="row" for="id_reg_sint6">¿Tiene dolores musculares?</label>
		                                 <div class="row">
											<select id="id_reg_sint6" name="txtSint6" class='form-control'>
							                	<option value="" >[SELECCIONE]</option>
							                    <option value="Dolores musculares">Si</option>
							                    <option value="No tiene dolores">No</option>
							                 </select>
		                                  </div>
		                              </div>
		                              <div style="padding:20px 50px;">
		                                 <label class="row" for="id_reg_ning">¿No tienes nada?</label>
		                                 <div class="row">
											<select id="id_reg_ning" name="txtNinguna" class='form-control'>
							                	<option value="" >[SELECCIONE]</option>
							                    <option value="No tiene">No</option>
							                    <option value="Si tiene">Si</option>
							                 </select>
		                                  </div>
		                              </div>    
		                          </div>
		                          <div style="padding-left:150px; padding-top:20px;">
		                              <div class="col-lg-9 col-lg-offset-3">
		                                  <button type="submit" class="btn btn-primary">REGISTRAR</button>
		                              </div>
		                          </div>
		                    </div>
		                </form>   
					</div>
				</div>
			</div>			
		</div>
  		
  		<div class="modal fade" id="idModalActualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 15px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualizar Sintomas</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="defaultForm" accept-charset="UTF-8" action="ControladorSintom" class="form-horizontal"  method="post">
							<input type="hidden" name="metodo" value="actualiza" >
							
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos Relevantes</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                	<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_ids">ID Sintomas</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_ids" name="txtIdSinto" placeholder="Ingrese Cod Paciente" type="text"/>
		                                        </div>
		                                    </div>
		                                	<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_id">ID Paciente</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_id" name="txtIdPac" placeholder="Ingrese Cod Paciente" type="text"/>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_depart">Departamento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_depart" name="txtDepartamento" placeholder="Ingrese Departamento" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_provi">Provincia</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_provi" name="txtProvincia" placeholder="Ingrese Provincia" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_dist">Distrito</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_dist" name="txtDistrito" placeholder="Ingrese Distrito" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_direc">Direccion</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_direc" name="txtDireccion" placeholder="Ingrese Direccion" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_lat">Latitud</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_lat" name="txtLatitud" placeholder="Ingrese Distrito" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_long">Longitud</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_long" name="txtLongitud" placeholder="Ingrese Distrito" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_fami">Numero Familiar</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_fami" name="txtNumFam" placeholder="Ingrese Num Familiar" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_prof">Profesion</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_prof" name="txtProfesion" placeholder="Ingrese Profesion" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_email">Email</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_email" name="txtEmail" placeholder="Ingrese Correo" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_cond">Condicion</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_cond" name="txtCondicion" placeholder="Ingrese Distrito" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_resu">Resultado</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_resu" name="txtResultado" placeholder="Ingrese Distrito" type="text"/>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        <div class="panel panel-default">
		                        	<div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Sintomas</a></h4>
		                            </div>
		                            <div style="padding:20px 50px;">
		                                 <label class="row" for="id_reg_sint1">¿Tiene fiebre alta?</label>
		                                 <div class="row">
											<select id="id_reg_sint1" name="txtSint1" class='form-control'>
							                	<option value="" >[SELECCIONE]</option>
							                    <option value="Fiebre alta">Si</option>
							                    <option value="No tiene fiebre">No</option>
							                 </select>
		                                  </div>
		                              </div>
		                              <div style="padding:20px 50px;">
		                                 <label class="row" for="id_reg_sint2">¿Tiene tos Constante?</label>
		                                 <div class="row">
											<select id="id_reg_sint2" name="txtSint2" class='form-control'>
							                	<option value="" >[SELECCIONE]</option>
							                    <option value="Tos Constante">Si</option>
							                    <option value="No tiene tos">No</option>
							                 </select>
		                                  </div>
		                              </div>
		                              <div style="padding:20px 50px;">
		                                 <label class="row" for="id_reg_sint3">¿Tiene Dolor de cabeza?</label>
		                                 <div class="row">
											<select id="id_reg_sint3" name="txtSint3" class='form-control'>
							                	<option value="" >[SELECCIONE]</option>
							                    <option value="Dolor de cabeza">Si</option>
							                    <option value="No tiene dolor de cabeza">No</option>
							                 </select>
		                                  </div>
		                              </div>
		                              <div style="padding:20px 50px;">
		                                 <label class="row" for="id_reg_sint4">¿Tiene dolor de garganta?</label>
		                                 <div class="row">
											<select id="id_reg_sint4" name="txtSint4" class='form-control'>
							                	<option value="" >[SELECCIONE]</option>
							                    <option value="Dolor de garganta">Si</option>
							                    <option value="No tiene dolor de garganta">No</option>
							                 </select>
		                                  </div>
		                              </div>
		                              <div style="padding:20px 50px;">
		                                 <label class="row" for="id_reg_sint5">¿Tiene dificultad para respirar?</label>
		                                 <div class="row">
											<select id="id_reg_sint5" name="txtSint5" class='form-control'>
							                	<option value="" >[SELECCIONE]</option>
							                    <option value="Dificultad para respirar">Si</option>
							                    <option value="No tiene dificultad de respiro">No</option>
							                 </select>
		                                  </div>
		                              </div>
		                              <div style="padding:20px 50px;">
		                                 <label class="row" for="id_reg_sint6">¿Tiene dolores musculares?</label>
		                                 <div class="row">
											<select id="id_reg_sint6" name="txtSint6" class='form-control'>
							                	<option value="" >[SELECCIONE]</option>
							                    <option value="Dolores musculares">Si</option>
							                    <option value="No tiene dolores">No</option>
							                 </select>
		                                  </div>
		                              </div>
		                              <div style="padding:20px 50px;">
		                                 <label class="row" for="id_reg_ning">¿No tienes nada?</label>
		                                 <div class="row">
											<select id="id_reg_ning" name="txtNinguna" class='form-control'>
							                	<option value="" >[SELECCIONE]</option>
							                    <option value="No tiene">No</option>
							                    <option value="Si tiene">Si</option>
							                 </select>
		                                  </div>
		                              </div>    
		                          </div>
		                          <div style="padding-left:150px; padding-top:20px;">
		                              <div class="col-lg-9 col-lg-offset-3">
		                                  <button type="submit" class="btn btn-primary">ACTUALIZAR</button>
		                              </div>
		                          </div>
		                    </div>
		                </form>   
					</div>
			</div>
		</div>
			
		</div>	
		
		<!-- ------------------------------------------------------------------------------------------------------------------------------------------ -->
		<!-- Modal coordenadas-->
		<div class="modal fade" id="exampleModalCoordenadas" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		      
		        <h5 class="modal-title text-center" id="exampleModalLabel">SU DIRECCIÓN : </h5>
		        
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		      
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      
		        	<h6>CIUDADANO :   <input type="text" id="id_nombre" style="border:none;"></h6>
					<h6>----------------------------------------------------------</h6>
		      	<form>		      	
		      	   	<div>
						<h6>Dirección:   <input type="text" id="id_direccion" style="border:none;" size="50"></h6>
					</div>
		        	<div>
						<h6>Latitud:   <input type="text" id="id_latitud" style="border:none;" size="50"></h6>
					</div>
					<div>
						<h6>Longitud:   <input type="text" id="id_longitud" style="border:none;" size="50"></h6>
					</div>
				</form>	
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
		
				<!-- Modal VER SINTOMAS -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		      
		        <h5 class="modal-title text-center" id="exampleModalLabel">SUS SINTOMAS REGISTRADOS : </h5>
		        
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		      
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      
		        	<h6>CIUDADANO :   <input type="text" id="id_nombre" style="border:none;"></h6>
					<h6>---------------------------------------------------------</h6>
		      	<form>
		      	   
		        	<div>
						<h6>1º Sintoma:   <input type="text" id="id_primer" style="border:none;" size="50"></h6>
					</div>
					<div>
						<h6>2º Sintoma:   <input type="text" id="id_segundo" style="border:none;" size="50"></h6>
					</div>
					<div>
						<h6>3º Sintoma:   <input type="text" id="id_tercer" style="border:none;" size="50"></h6>
					</div>
					<div>
						<h6>4º Sintoma:   <input type="text" id="id_cuarto" style="border:none;" size="50"></h6>
					</div>
					<div>
						<h6>5º Sintoma:   <input type="text" id="id_quinto" style="border:none;" size="50"></h6>
					</div>
					<div>
						<h6>6º Sintoma:   <input type="text" id="id_sexto" style="border:none;" size="50"></h6>
					</div>
					
					<h6>---------------------------------------------------------</h6>
					<h6>SU CONDICION ES  : <input type="text" id="id_condicion" style="border:none;"></h6>
					
					
				</form>	
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>

</div>

		<script type="text/javascript">
			function editar3(Nombre,PrimerSintoma,SegundoSintoma,TercerSintoma,CuartoSintoma,QuintoSintoma,SextoSintoma,Condicion){
				$('input[id=id_nombre]').val(Nombre);
				$('input[id=id_primer]').val(PrimerSintoma);
				$('input[id=id_segundo]').val(SegundoSintoma);
				$('input[id=id_tercer]').val(TercerSintoma);
				$('input[id=id_cuarto]').val(CuartoSintoma);
				$('input[id=id_quinto]').val(QuintoSintoma);
				$('input[id=id_sexto]').val(SextoSintoma);
				$('input[id=id_condicion]').val(Condicion);
			}

		</script>

<script type="text/javascript">
			function editar2(Nombre,Latitud,Longitud,Direccion){
				$('input[id=id_nombre]').val(Nombre);
				$('input[id=id_latitud]').val(Latitud);
				$('input[id=id_longitud]').val(Longitud);
				$('input[id=id_direccion]').val(Direccion);
			}

		</script>
<script type="text/javascript">

function registrar(){	
	$('#idModalRegistra').modal("show");
}

function editar(idSi,idPac,depa,prov,dist,direc,lat,longi,nFam,prof,email,cond,resul,sint1,sint2,sint3,sint4,sint5,sint6,ning){	
	//document.getElementById("id_nombre").value ="ELBITA"
	
	$('input[id=id_rg_ids]').val(idSi);
	$('input[id=id_rg_id]').val(idPac);
	$('input[id=id_rg_depart]').val(depa);
	$('input[id=id_rg_provi]').val(prov);
	$('input[id=id_rg_dist]').val(dist);
	$('input[id=id_rg_direc]').val(direc);
	$('input[id=id_rg_lat]').val(lat);
	$('input[id=id_rg_long]').val(longi);
	$('input[id=id_rg_fami]').val(nFam);
	$('input[id=id_rg_prof]').val(prof);
	$('input[id=id_rg_email]').val(email);
	$('input[id=id_rg_cond]').val(cond);
	$('input[id=id_rg_resu]').val(resul);
	$('input[id=id_reg_sint1]').val(sint1);
	$('input[id=id_reg_sint2]').val(sint2);
	$('input[id=id_reg_sint3]').val(sint3);
	$('input[id=id_reg_sint4]').val(sint4);
	$('input[id=id_reg_sint5]').val(sint5);
	$('input[id=id_reg_sint6]').val(sint6);
	$('input[id=id_reg_ning]').val(ning);
	$('#idModalActualiza').modal("show");
}

$(document).ready(function() {
    $('#tableSintomas').DataTable();
} );


</script>

<script type="text/javascript">
$(document).ready(function() {
    $('#defaultForm').bootstrapValidator({
        message: 'This value is not valid',
        excluded: ':disabled',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	txtIdPac:{
        		validators:{
        			notEmpty:{
        				message:'Campo obligatorio'
        			}
        		}
        	},
        	txtDepartamento:{
        		validators:{
        			notEmpty:{
        				message:'Campo obligatorio'
        			},
        			regexp:{
        				regexp:/[a-zA-Z]{3,20}/,
        				message:'solo carateres'
        			}
        		}
        	},
        	txtProvincia:{
        		validators:{
        			notEmpty:{
        				message:'Campo obligatorio'
        			},
        			regexp:{
        				regexp:/[a-zA-Z]{3,20}/,
        				message:'solo carateres'
        			}
        		}
        	},
        	txtDistrito:{
        		validators:{
        			notEmpty:{
        				message:'Campo obligatorio'
        			},
        			regexp:{
        				regexp:/[a-zA-Z]{3,20}/,
        				message:'solo carateres'
        			}
        		}
        	},
        	txtDireccion:{
        		validators:{
        			notEmpty:{
        				message:'Campo obligatorio'
        			},
        			regexp:{
        				regexp:/[a-zA-Z0-9.]/,
        				message:'Caracteres y numeros max 45 caracteres'
        			}
        		}
        	},
        	txtNumFam:{
        		validators:{
        			notEmpty:{
        				message:'Campo obligatorio'
        			},
        			regexp:{
        				regexp:/[0-9]{1,2}/,
        				message:'El numero familiar no excede a 2 digitos'
        			}
        		}
        	},
        	txtProfesion:{
        		validators:{
        			notEmpty:{
        				messsage:'Campo obligatorio'
        			},
        			regexp:{
        				regexp:/[a-zA-Z]{3,20}/,
        				message:'solo carateres'
        			}
        		}
        	},
        	txtEmail:{
        		validators:{
        			notEmpty:{
        				message:'Campo Obligatorio'
        			},
        			regexp:{
        				regexp:'^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$',
        				message:'De esta manera example@example.com'
        			}
        		}
        	},
        	txtSint1:{
        		validators:{
        			notEmpty:{
        				message:'Debe Seleccionar opcion'
        			}
        		}
        	},
        	txtSint2:{
        		validators:{
        			notEmpty:{
        				message:'Debe Seleccionar opcion'
        			}
        		}
        	},
        	txtSint3:{
        		validators:{
        			notEmpty:{
        				message:'Debe Seleccionar opcion'
        			}
        		}
        	},
        	txtSint4:{
        		validators:{
        			notEmpty:{
        				message:'Debe Seleccionar opcion'
        			}
        		}
        	},
        	txtSint5:{
        		validators:{
        			notEmpty:{
        				message:'Debe Seleccionar opcion'
        			}
        		}
        	},
        	txtSint6:{
        		validators:{
        			notEmpty:{
        				message:'Debe Seleccionar opcion'
        			}
        		}
        	},
        	txtNinguna:{
        		validators:{
        			notEmpty:{
        				message:'Debe Seleccionar opcion'
        			}
        		}
        	},
           
       	}    
     }).on('error.form.bv', function(e) {
            console.log('error');

            // Active the panel element containing the first invalid element
            var $form         = $(e.target),
                validator     = $form.data('bootstrapValidator'),
                $invalidField = validator.getInvalidFields().eq(0),
                $collapse     = $invalidField.parents('.collapse');

            $collapse.collapse('show');
    });
});
</script>
    
</body>
</html>