function validar_nombre(){
				
    var nombre=document.form1.nomape_admin.value;
    var error=document.getElementById("error");
    var valida=/^[a-zA-Z_ ]*$/;
    
    if(nombre===""){
        error.textContent="* Error: Necesita Ingresar Nombres";
        return false;
        
    }
    else if(nombre.length>20){
        
        error.textContent="* Error: Demasiado caracteres";
        return false;
    
    }
    else if(!valida.test(nombre)){
        
        error.textContent="* Error: Solo se permite letras";
        return false;
        
    }else{
        return true;
    }
        
}

function validar_fono(){
    
    var fono=document.form1.fono_admin.value;
    var error2=document.getElementById("error2");
    var valida1=/^[0-9_]{1,9}$/;
    
    if(fono===""){
        error2.textContent="* Error: Necesita Ingresar Telefono/Celular";
        return false;
        
    }
    else if(fono.length>9){
        
        error2.textContent="* Error: Error: Solo se permite 9 caracteres";
        return false;
    
    }
    else if(!valida1.test(fono)){
        
        error2.textContent="* Error: Solo se permite numeros";
        return false;
        
    }else{
        return true;
    }
        
}

function validar_usuario(){
    
    var usuario=document.form1.usuario_admin.value;
    var error3=document.getElementById("error3");
    var validar=/^[a-z-A-Z0-9_]*$/;
    
    if(usuario===""){
        error3.textContent="* Error: Necesita Ingresar Usuario";
        return false;
        
    }
    else if(usuario.length>20){
        
        error3.textContent="* Error: Demasiado caracteres";
        return false;
    
    }
    else if(!validar.test(usuario)){
        
        error3.textContent="* Error: Solo se permite numeros o letras";
        return false;
        
    }else{
        return true;
    }
        
}

function validar_contra(){
    
    var contra=document.form1.contra_admin.value;
    var error4=document.getElementById("error4");
    var validar1=/^[a-zA-Z0-9_]*$/;
    
    if(contra===""){
        error4.textContent="* Error: Necesita Ingresar Clave";
        return false;
        
    }
    else if(contra.length>20){
        
        error4.textContent="* Error: Demasiado caracteres";
        return false;
    
    }
    else if(!validar1.test(contra)){
        
        error4.textContent="* Error: No se permiten espacios ni simbolos, solo numeros o letras";
        return false;
        
    }else{
        return true;
    }
        
}

function borrar_nombre(){
  var borrar=document.getElementById("error");
  borrar.textContent="";
}

function borrar_fono(){
    var borrar2=document.getElementById("error2");
    borrar2.textContent="";
  }
      
function borrar_usuario(){
  var borrar3=document.getElementById("error3");
  borrar3.textContent="";
}

function borrar_contra(){
  var borrar4=document.getElementById("error4");
  borrar4.textContent="";
}

    
    function validar(){
        
            if(!validar_nombre() || !validar_fono() || !validar_usuario() || !validar_contra()){
                validar_nombre();
                validar_fono();
                validar_usuario();
                validar_contra();
                
                return false;
            }
        
            
    }