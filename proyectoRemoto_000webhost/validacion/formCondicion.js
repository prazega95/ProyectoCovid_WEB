function validar_condicion(){
		  		
    var lista=document.getElementById("Condicion").selectedIndex;
    var error=document.getElementById("error");
    
    if(lista==0 || lista==null || lista==""){
        
        error.textContent="* Seleccione en qué Condición se encuentra!";
        
        return false;
    }else{
        
        return true;
    }
}

function validar_resultado(){
		  		
    var lista=document.getElementById("Resultado").selectedIndex;
    var error2=document.getElementById("error2");
    
    if(lista==0 || lista==null || lista==""){
        
        error2.textContent="* Seleccione en qué Situación Actual se encuentra!";
        
        return false;
    }else{
        
        return true;
    }
}
    
function borrar_condicion1(){
  var borrar=document.getElementById("error");
  borrar.textContent="";
}

function borrar_resultado1(){
  var borrar2=document.getElementById("error2");
  borrar2.textContent="";
}

function validar(){
    
    if(!validar_condicion() || !validar_resultado()){
        validar_condicion();
        validar_resultado();
        
        return false;
    }
}