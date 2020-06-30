function validar_nombre(){
				
    var nombre=document.form1.nom_usuario.value;
    var error=document.getElementById("error");
    var valida=/^[a-zA-ZñÑáéíóúÁÉÍÓÚ_ ]*$/;
				
				if(nombre===""){
					error.textContent="* Ingrese su(s) nombre(s)!";
					return false;
					
				}
				else if(nombre.length>80){
					
					error.textContent="* Demasiado caracteres!";
					return false;
				
				}
				else if(!valida.test(nombre)){
					
					error.textContent="* Caracter(es) no permitido(s), verifique!";
					return false;
             
                }
                else if(/^\s*$/.test(nombre)){
					
                    error.textContent="* No digite espacios en blanco!";
                    return false;
                }
                else{
					return true;
                }
              
					
			}

function validar_apellido(){
    
    var apellido=document.form1.ape_usuario.value;
    var error2=document.getElementById("error2");
    var valida=/^[a-zA-ZñÑáéíóúÁÉÍÓÚ_ ]*$/;
				
				if(apellido===""){
					error2.textContent="* Ingrese su(s) apellidos(s)!";
					return false;
					
				}
				else if(apellido.length>80){
					
					error2.textContent="* Demasiado caracteres!";
					return false;
				
				}
				else if(!valida.test(apellido)){
					
					error2.textContent="* Caracter(es) no permitido(s), verifique!";
					return false;
					
                }
                else if(/^\s*$/.test(apellido)){
					
					error2.textContent="* No digite espacios en blanco!";
					return false;
             
				}else{
					return true;
				}
					
            }
            

function validar_TipoDoc(){
		  		
                var lista=document.getElementById("IDCondicion").selectedIndex;
                var error3=document.getElementById("error3");
                
           
                if(lista==0 || lista==null || lista==""){
                    
                    error3.textContent="* Seleccione Un Tipo de Documento!";
                    
                    return false;

                }
                else{
                    
                    return true;
                }
            }
    


 function validar_CajaTipoDoc(){
    var cajatipo=document.form1.txtCondicionScript.value;
    var errorCajaTipo=document.getElementById("errorCajaTipo");
    
    if(cajatipo===""){
        errorCajaTipo.textContent=" Esto quedó vacío!, elija tipo de Doc. nuevamente!";
        return false;
        
    }else{
                    
        return true;
    }
 }




         
function validar_documento() {

   
          if (document.form1.IDCondicion.value == "1") {
                    
                    var documento=document.form1.doc_usuario.value;
                    var error4=document.getElementById("error4");
                    var valida=/^[0-9]*$/;

                    if(documento===""){
                        error4.textContent="* Ingrese su Nº de Documento!";
                        return false;   
                    }
                    else if(/^\s*$/.test(documento)){
					
                        error4.textContent="* No digite espacios en blanco!";
                        return false;
                 
                    }
                    else if(documento.length>8){
                        
                        error4.textContent="* Existen más de 8 digitos, verifique!";
                        return false;
                    }
                    else if(documento.length<8){

                        error4.textContent="* No escriba menos de 8 digitos!";
                        return false;
                    }
                    else if(!valida.test(documento)){
                        
                        error4.textContent="* El formato de DNI es incorrecto, verifique!";
                        return false; 
                    } 
                    else{
                        return true;
                    }
                    


         }if (document.form1.IDCondicion.value == "2" ) {

                    var documento=document.form1.doc_usuario.value;
                    var error4=document.getElementById("error4");
                    var valida=/^(10|20|15|17)[0-9]{9}$/;
                    if(documento===""){
                        error4.textContent="* Ingrese su Nº de Documento!";
                        return false;
                    }
                    else if(/^\s*$/.test(documento)){
					
                        error4.textContent="* No digite espacios en blanco!";
                        return false;
                 
                    }
                    else if(documento.length>11){
                        
                        error4.textContent="* Existen más de 11 digitos, verifique!";
                        return false;
                    }
                    else if(documento.length<11){
                        
                        error4.textContent="* No escriba menos de 11 digitos!";
                        return false;
                    }
                    else if(!valida.test(documento)){
                        
                        error4.textContent="* El formato de RUC es incorrecto, recuerde empezar con 10,15,17,20!";
                        return false;
                    }
                    else{
                        return true;
                    }

           }
           else{
            return true;
        }

  }


function validar_telefono(){
				
    var telefono=document.form1.tel_usuario.value;
    var error5=document.getElementById("error5");
    var valida=/^[9][0-9]*$/;
    
    if(telefono===""){
        error5.textContent="* Ingrese su N° de Teléfono/Celular!";
        return false;
        
    }
    else if(telefono.length>9){
        
        error5.textContent="* Existen más de 9 digitos, verifique!";
        return false;
    
    }
    else if(telefono.length<9){
        
        error5.textContent="* No escriba menos de 9 digitos!";
        return false;
    
    }
    else if(!valida.test(telefono)){
        
        error5.textContent="* El formato de Teléfono es incorrecto, verifique!";
        return false;
        
    }else{
        return true;
    }
        
}





function validar_usuario(){
				
    var usuario=document.form1.login_usuario.value;
    var error6=document.getElementById("error6");
    var valida=/^[a-z]*$/;
    
    if(usuario===""){
        error6.textContent="* Ingrese su Usuario!";
        return false;
        
    }else if(/^\s*$/.test(usuario)){
					
        error6.textContent="* No digite espacios en blanco!";
        return false;
 
    }
    else if(!valida.test(usuario)){
        
        error6.textContent="* Solo ingrese letras minúsculas sin espacios!";
        return false;
        
    }
    else{
        return true;
    }
        
}

function validar_clave(){
				
    var clave=document.form1.pass_usuario.value;
    var error7=document.getElementById("error7");
    var valida=/^[a-z0-9]*$/;
    
    if(clave===""){
        error7.textContent="* Ingrese su Clave!";
        return false;
        
    }
    else if(/^\s*$/.test(clave)){
					
        error7.textContent="* No digite espacios en blanco!";
        return false;
 
    }
    else if(!valida.test(clave)){
        
        error7.textContent="* Solo ingrese letras minúsculas y/o números sin espacios!";
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

function borrar_cajaTipo(){
    var errorCajaTipo=document.getElementById("errorCajaTipo");
    errorCajaTipo.textContent="";
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
    
    if(!validar_nombre() || !validar_apellido() || !validar_TipoDoc() || !validar_CajaTipoDoc() || !validar_documento() || !validar_telefono() || !validar_usuario() || !validar_clave()){
        validar_nombre();
        validar_apellido();
        validar_TipoDoc();
        validar_CajaTipoDoc();
        validar_documento();
        validar_telefono();
        validar_usuario();
        validar_clave();
        
        return false;
    }
}