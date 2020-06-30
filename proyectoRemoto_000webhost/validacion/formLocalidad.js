function validar_provincia(){
				
    var provincia=document.form1.Provincia.value;
    var error=document.getElementById("error");
    var valida=/^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]*$/;
				
				if(provincia===""){
					error.textContent="* Ingrese su Provincia!";
					return false;
					
				}
				else if(provincia.length>100){
					
					error.textContent="* Demasiados caracteres!";
					return false;
				
				}
				else if(!valida.test(provincia)){
					
					error.textContent="* Sólo se permite letras!";
					return false;
					
                }
                else if(/^\s*$/.test(provincia)){
					
					error.textContent="* Error: No digites espacios en blanco";
					return false;
             
				}else{
					return true;
				}
					
			}

function validar_distrito(){
    
    var distrito=document.form1.Distrito.value;
    var error2=document.getElementById("error2");
    var valida=/^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]*$/;
				
				if(distrito===""){
					error2.textContent="* Ingrese su Distrito!";
					return false;
					
				}
				else if(distrito.length>100){
					
					error2.textContent="* Demasiados caracteres!";
					return false;
				
				}
				else if(!valida.test(distrito)){
					
					error2.textContent="* Sólo se permite letras!";
					return false;
					
                }
                else if(/^\s*$/.test(distrito)){
					
					error2.textContent="* No digite espacios en blanco!";
					return false;
             
				}else{
					return true;
				}
					
			}
    

function validar_latitud(){
				
    var latitud=document.form1.Latitud.value;
    var error3=document.getElementById("error3");
    var valida=/^[0-9]{1,2}[.][0-9]*$/;
    
    if(latitud===""){
        error3.textContent="* Ingrese la Latitud!";
        return false;
          
    }
    else if(!valida.test(latitud)){
					
        error3.textContent="* Formato no valido!, Solo se permite 00.00+ / 0.00+";
        return false;
        
    }
    else{
        return true;
    }
        
}


function validar_longitud(){
				
    var longitud=document.form1.Longitud.value;
    var error4=document.getElementById("error4");
    var valida=/^[0-9]{1,2}[.][0-9]*$/;
    
    if(longitud===""){
        error4.textContent="* Ingrese la Longitud!";
        return false;
          
    }
    else if(!valida.test(longitud)){
					
        error4.textContent="* Formato no valido!, Solo se permite 00.00+ / 0.00+";
        return false;
        
    }
    else{
        return true;
    }
        
}



function validar_direccion(){
				
    var direccion=document.form1.Direccion.value;
    var error5=document.getElementById("error5");
    var valida=/^[a-zA-ZñÑáéíóúÁÉÍÓÚ]+([a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ.,# ]+)*$/;
    
    if(direccion===""){
        error5.textContent="* Ingrese su Dirección!";
        return false;
        
    }
    else if(/^\s*$/.test(direccion)){
					
        error5.textContent="* No digite espacios en blanco!";
        return false;
 
    }
    else if(!valida.test(direccion)){
					
        error5.textContent="* No cumples con el formato adecuado!";
        return false;
 
    }
    else{
        return true;
    }
        
}






function borrar_provincia(){
  var borrar=document.getElementById("error");
  borrar.textContent="";
}

function borrar_distrito(){
  var borrar2=document.getElementById("error2");
  borrar2.textContent="";
}

function borrar_latitud(){
    var borrar3=document.getElementById("error3");
    borrar3.textContent="";
  }

  function borrar_longitud(){
    var borrar4=document.getElementById("error4");
    borrar4.textContent="";
  }

  function borrar_direccion(){
    var borrar5=document.getElementById("error5");
    borrar5.textContent="";
  }




function validar(){
    
    if(!validar_provincia() || !validar_distrito() || !validar_latitud() || !validar_longitud() || !validar_direccion()){
        validar_provincia();
        validar_distrito();
        validar_latitud();
        validar_longitud();
        validar_direccion();
        
        return false;
    }
}