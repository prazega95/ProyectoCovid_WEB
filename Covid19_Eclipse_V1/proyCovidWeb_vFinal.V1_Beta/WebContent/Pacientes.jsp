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

<title>Listado de Pacientes</title>
</head>
<body>

 <div class="container">
 <h1 class="text-center">Registro de Pacientes</h1><br><br><br>
		 <div class="col-md-23" > 
				
		       <form accept-charset="UTF-8"  action="ControladorPaciente" class="simple_form" id="defaultForm2"  method="post">
		       		<input type="hidden" name="metodo" value="lista">
		       				
					<div class="row">
						<div class="col-md-3">
							<button type="submit" class="btn btn-primary" id="validateBtnw1" >VISUALIZAR</button><br>&nbsp;<br>
						</div>
						<div class="col-md-3">
							<button type="button" data-toggle='modal' onclick="registrar();"  class='btn btn-success' id="validateBtnw2" >REGISTRAR PACIENTE</button><br>&nbsp;<br>
						</div>
					</div>
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="tablePaciente" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th class="text-center">ID</th>
												<th class="text-center">NOMBRES</th>
												<th class="text-center">APELLIDOS</th>
												<th class="text-center">TIPO DE DOCUMENTO</th>
												<th class="text-center">DNI</th>
												<th class="text-center">TELEFONO</th>
												<th class="text-center">USER</th>
												<th class="text-center">CONTRASEÑA</th>
												<th class="text-center">ACCION</th>
												
											</tr>
										</thead>
										<tbody>
												     
												<c:forEach items="${pacientes}" var="x">
													<tr>
														<td class="text-center">${x.idPac}</td>
														<td class="text-center">${x.nomPac}</td>
														<td class="text-center">${x.apePac}</td>
														<td class="text-center">${x.tipodoc}</td>
														<td class="text-center">${x.dniPac}</td>
														<td class="text-center">${x.fonoPac}</td>
														<td class="text-center">${x.userPac}</td>
														<td class="text-center">${x.passPac}</td>
														<td class="text-center">
															<button type='button' data-toggle='modal' onclick="editar('${x.idPac}','${x.nomPac}','${x.apePac}','${x.tipodoc}','${x.dniPac}','${x.fonoPac}','${x.userPac}','${x.passPac}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
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
  
  	 <div class="modal fade" id="idModalRegistra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 15px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Nuevo Paciente</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="defaultForm" accept-charset="UTF-8" action="ControladorPaciente" class="form-horizontal"  method="post">
							<input type="hidden" name="metodo" value="registra">
							
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Paciente</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_nombre">Nombres</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_nombre" name="txtNombre" placeholder="Ingrese sus Nombres" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_apellido">Apellidos</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_apellido" name="txtApellido" placeholder="Ingrese sus Apellidos" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_rg_tipo">Tipo Documento</label>
		                                        <div class="col-lg-5">
		                                        	<select id="id_rg_tipo" name="txtTipo" class='form-control'>
							                                 <option value="" >[SELECCIONE]</option>
							                                 <option value="DNI">DNI</option>
							                                 <option value="Pasaporte">PASAPORTE</option>
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_dni">DNI</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_dni" name="txtDni" placeholder="Ingrese su DNI" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_fono">Teléfono</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_fono" name="txtFono" placeholder="Ingrese su Teléfono" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_direccion">Usuario</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_direccion" name="txtUser" placeholder="Ingrese su Usuario" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_rg_pass">Contraseña</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_rg_pass" name="txtPass" placeholder="Ingrese su Contraseña" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">REGISTRAR</button>
		                                        </div>
		                                    </div>
		                                </div>
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
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualizar Paciente</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="defaultForm" accept-charset="UTF-8"  action="ControladorPaciente" class="form-horizontal"     method="post">
							<input type="hidden" name="metodo" value="actualiza" >
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Paciente</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="id" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_nombre" name="txtNombre" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_apellido">Apellidos</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_apellido" name="txtApellido"  type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_rg_tipo">Tipo Documento</label>
		                                        <div class="col-lg-5">
		                                        	<select id="id_rg_tipo" name="txtTipo" class='form-control'>
							                                 <option value="" >[SELECCIONE]</option>
							                                 <option value="DNI">DNI</option>
							                                 <option value="Pasaporte">PASSAPORTE</option>
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_dni">DNI</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_dni" readonly="readonly" name="txtDni" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_fono">Teléfono</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_fono" name="txtFono" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_user">Usuario</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_user" name="txtUser" type="text"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_pass">Contraseña</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_pass" name="txtPass" type="text"/>
		                                        </div>
		                                    </div>  
		                                    
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">ACTUALIZAR</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>

</div>

<script type="text/javascript">

function registrar(){	
	$('#idModalRegistra').modal("show");
}

function editar(id,nombre,apellido,tipo,dni,tel,user,pass){	
	//document.getElementById("id_nombre").value ="ELBITA"
	
	$('input[id=id_ID]').val(id);
	$('input[id=id_nombre]').val(nombre);
	$('input[id=id_apellido]').val(apellido);
	$('input[id=id_rg_tipo]').val(tipo);
	$('input[id=id_dni]').val(dni);
	$('input[id=id_fono]').val(tel);
	$('input[id=id_user]').val(user);
	$('input[id=id_pass]').val(pass);
	$('#idModalActualiza').modal("show");
}

$(document).ready(function() {
    $('#tablePaciente').DataTable();
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
        	txtNombre:{
        		validators:{
        			notEmpty:{
        				message:'Campo obligatorio'
        			},
        			stringLength :{
        				message:'El campo es de 5 hasta 45 caracteres',
        				min:5,
        				max:45
        			}
        		}
        	},
        	txtApellido:{
        		validators:{
        			notEmpty:{
        				message:'Campo obligatorio'
        			},
        			stringLength :{
        				message:'El campo es de 5 hasta 45 caracteres',
        				min:5,
        				max:45
        			}
        		}
        	},
        	txtTipo:{
        		validators:{
        			notEmpty:{
        				message:'Seleccione tipo'
        			}
        		}
        	},
        	txtDni:{
        		validators:{
        			notEmpty:{
        				message:'Campo obligatorio'
        			},
        			regexp:{
        				regexp:/[0-9]{8}/,
        				message:'Debe ser 8 numeros'	
        			}
        		}
        	},
        	txtFono:{
        		validators:{
        			notEmpty:{
        				message:'Campo obligatorio'
        			},
        			digits:{
        				message:'Solo numeros',
        				max:9
        			},
        		}
        	},
        	txtUser:{
        		validators:{
        			notEmpty:{
        				message:'Campo Obligatorio'
        			},
        			stringLength:{
        				message:'Solo letras',
        				min:5,
        				max:20
        			}
        		}
        	},
        	txtPass:{
        		validators:{
        			notEmpty:{
        				message:'Campo Obligatorio'
        			},
        			stringLength:{
        				message:'Solo letras',
        				min:5,
        				max:20
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