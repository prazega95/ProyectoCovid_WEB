function validar_provincia(){
				
    var provincia=document.form1.Provincia.value;
    var error=document.getElementById("error");
    var valida=/^[a-zA-Z_ ]*$/;
				
				if(provincia===""){
					error.textContent="* Error: Necesita Ingresar la provincia";
					return false;
					
				}
				else if(provincia.length>100){
					
					error.textContent="* Error: Demasiados caracteres";
					return false;
				
				}
				else if(!valida.test(provincia)){
					
					error.textContent="* Error: Sólo se permite letras";
					return false;
					
				}else{
					return true;
				}
					
			}

function validar_distrito(){
    
    var distrito=document.form1.Distrito.value;
    var error2=document.getElementById("error2");
    var valida=/^[a-zA-Z_ ]*$/;
				
				if(distrito===""){
					error2.textContent="* Error: Necesita Ingresar el distrito";
					return false;
					
				}
				else if(distrito.length>100){
					
					error2.textContent="* Error: Demasiados caracteres";
					return false;
				
				}
				else if(!valida.test(distrito)){
					
					error2.textContent="* Error: Sólo se permite letras";
					return false;
					
				}else{
					return true;
				}
					
			}
    

function validar_latitud(){
				
    var latitud=document.form1.Latitud.value;
    var error3=document.getElementById("error3");
    
    if(latitud===""){
        error3.textContent="* Error: Necesita Ingresar la latitud formato (0.0, -0.0)";
        return false;
          
    }else{
        return true;
    }
        
}


function validar_longitud(){
				
    var longitud=document.form1.Longitud.value;
    var error4=document.getElementById("error4");
    
    if(longitud===""){
        error4.textContent="* Error: Necesita Ingresar la longitud: formato (0.0, -0.0)";
        return false;
          
    }else{
        return true;
    }
        
}



function validar_direccion(){
				
    var direccion=document.form1.Direccion.value;
    var error5=document.getElementById("error5");
    var valida=/^[a-zA-Z0-9_ ]*$/;
    
    if(direccion===""){
        error5.textContent="* Error: Necesita Ingresar la direccion";
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