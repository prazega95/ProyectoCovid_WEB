function validar_titulo(){
				
    var titulo=document.form1.titulo_noticia.value;
    var error=document.getElementById("error");
    var valida=/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ_ ]*$/;
    
    if(titulo===""){
        error.textContent="* Ingrese un Título!";
        return false;
        
    }
    else if(/^\s*$/.test(titulo)){
					
        error.textContent="* No digite espacios en blanco!";
        return false;
 
    }
    else if(!valida.test(titulo)){
                        
        error.textContent="* El formato es incorrecto, solo letras y/o números!";
        return false; 
    } 
    else{
        return true;
    }
        
}

function validar_descripcion(){
    
    var descripcion=document.form1.contenido_noticia.value;
    var error2=document.getElementById("error2");
    var valida=/^[a-zA-Z0-9ñÑáéíóúÁÉÍÓÚ_ ]*$/;
    
    if(descripcion===""){
        error2.textContent="* Ingrese una Descripción!";
        return false;
        
    }
    else if(/^\s*$/.test(descripcion)){
					
        error2.textContent="* No digite espacios en blanco!";
        return false;
 
    }
    else if(!valida.test(descripcion)){
                        
        error2.textContent="* El formato es incorrecto, solo letras y/o números!";
        return false; 
    } 
    else{
        return true;
    }
        
}
    
function borrar_titulo(){
  var borrar=document.getElementById("error");
  borrar.textContent="";
}

function borrar_descripcion(){
  var borrar2=document.getElementById("error2");
  borrar2.textContent="";
}

function validar(){
    
    if(!validar_titulo() || !validar_descripcion()){
        validar_titulo();
        validar_descripcion();
        
        return false;
    }
}