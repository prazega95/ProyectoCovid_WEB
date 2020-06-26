function validar_nombre(){
				
    var nombre=document.form1.nom_usuario.value;
    var error=document.getElementById("error");
    var valida=/^[a-zA-Z_ ]*$/;
				
				if(nombre===""){
					error.textContent="* Error: Necesita Ingresar Su Nombre";
					return false;
					
				}
				else if(nombre.length>80){
					
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

function validar_apellido(){
    
    var apellido=document.form1.ape_usuario.value;
    var error2=document.getElementById("error2");
    var valida=/^[a-zA-Z_ ]*$/;
				
				if(apellido===""){
					error2.textContent="* Error: Necesita Ingresar Su Apellido";
					return false;
					
				}
				else if(apellido.length>80){
					
					error2.textContent="* Error: Demasiado caracteres";
					return false;
				
				}
				else if(!valida.test(apellido)){
					
					error2.textContent="* Error: Sólo se permite letras";
					return false;
					
				}else{
					return true;
				}
					
            }
            

function validar_TipoDoc(){
		  		
                var lista=document.getElementById("IDCondicion").selectedIndex;
                var error3=document.getElementById("error3");
                
                if(lista==0 || lista==null || lista==""){
                    
                    error3.textContent="* Error: Debe Seleccionar Un Tipo de Documento";
                    
                    return false;
                }else{
                    
                    return true;
                }
            }
    

function validar_documento(){
				
    var documento=document.form1.doc_usuario.value;
    var error4=document.getElementById("error4");
    var valida=/^[0-9_ ]*$/;
    
    if(documento===""){
        error4.textContent="* Error: Necesita Ingresar Su Documento";
        return false;
        
    }
    else if(documento.length>11){
        
        error4.textContent="* Error: Demasiados Números";
        return false;
    
    }
    else if(!valida.test(documento)){
        
        error4.textContent="* Error: Sólo se permite números";
        return false;
        
    }else{
        return true;
    }
        
}


function validar_telefono(){
				
    var telefono=document.form1.tel_usuario.value;
    var error5=document.getElementById("error5");
    var valida=/^[0-9_ ]*$/;
    
    if(telefono===""){
        error5.textContent="* Error: Necesita Ingresar Su número telefonico";
        return false;
        
    }
    else if(telefono.length>9){
        
        error5.textContent="* Error: Solo Ingresar 9 Digitos";
        return false;
    
    }
    else if(!valida.test(telefono)){
        
        error5.textContent="* Error: Sólo se permite números";
        return false;
        
    }else{
        return true;
    }
        
}



function validar_usuario(){
				
    var usuario=document.form1.login_usuario.value;
    var error6=document.getElementById("error6");
    var valida=/^[a-zA-Z0-9_ ]*$/;
    
    if(usuario===""){
        error6.textContent="* Error: Necesita Ingresar su Usuario";
        return false;
        
    }
    else{
        return true;
    }
        
}


function validar_clave(){
				
    var clave=document.form1.pass_usuario.value;
    var error7=document.getElementById("error7");
    var valida=/^[a-zA-Z0-9_ ]*$/;
    
    if(clave===""){
        error7.textContent="* Error: Necesita Ingresar una Clave";
        return false;
        
    }
    else{
        return true;
    }
        
}






function borrar_nombre(){
  var borrar=document.getElementById("error");
  borrar.textContent="";
}

function borrar_apellido(){
  var borrar2=document.getElementById("error2");
  borrar2.textContent="";
}

function borrar_TipoDoc(){
    error3=document.getElementById("error3");
    error3.textContent="";
}

function borrar_documento(){
    var borrar4=document.getElementById("error4");
    borrar4.textContent="";
  }

  function borrar_telefono(){
    var borrar5=document.getElementById("error5");
    borrar5.textContent="";
  }

  function borrar_usuario(){
    var borrar6=document.getElementById("error6");
    borrar6.textContent="";
  }

  function borrar_clave(){
    var borrar7=document.getElementById("error7");
    borrar7.textContent="";
  }



function validar(){
    
    if(!validar_nombre() || !validar_apellido() || !validar_TipoDoc() || !validar_documento() || !validar_telefono() || !validar_usuario() || !validar_clave()){
        validar_nombre();
        validar_apellido();
        validar_TipoDoc();
        validar_documento();
        validar_telefono();
        validar_usuario();
        validar_clave();
        
        return false;
    }
}