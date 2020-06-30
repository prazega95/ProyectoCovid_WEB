function validar_nombre(){
				
    var nombre=document.form1.nomape_admin.value;
    var error=document.getElementById("error");
    var valida=/^[a-zA-ZñÑáéíóúÁÉÍÓÚ_ ]*$/;
    
    if(nombre===""){
        error.textContent="* Ingrese su(s) nombre(s)!";
        return false;
        
    }
    else if(nombre.length>20){
        
        error.textContent="* Demasiado caracteres!";
        return false;
    
    }
    else if(!valida.test(nombre)){
        
        error.textContent="* Caracter(es) no permitido(s), verifique!";
        return false;
        
    }
    else if(/^\s*$/.test(nombre)){
					
        error.textContent="* No digite espacios en blanco2!";
        return false;
 
    }else{
        return true;
    }
        
}

function validar_fono(){
    
    var fono=document.form1.fono_admin.value;
    var error2=document.getElementById("error2");
    var valida=/^[9][0-9]*$/;
    
    if(fono===""){
        error2.textContent="* Ingrese su Telefóno/Celular!";
        return false;
        
    }
    else if(fono.length>9){
        
        error2.textContent="* Existen más de 9 digitos, verifique!";
        return false;
    
    }
    else if(fono.length<9){
        
        error2.textContent="* No escriba menos de 9 digitos!";
        return false;
    
    }
    else if(!valida.test(fono)){
        
        error2.textContent="* El formato de Teléfono es incorrecto, verifique!";
        return false;
        
    }else{
        return true;
    }
        
}

function validar_usuario(){
    
    var usuario=document.form1.usuario_admin.value;
    var error3=document.getElementById("error3");
    var validar=/^[a-z-A-ZñÑáéíóúÁÉÍÓÚ0-9_ ]*$/;
    
    if(usuario===""){
        error3.textContent="* Ingrese su Usuario!";
        return false;
        
    }
    else if(usuario.length>20){
        
        error3.textContent="* Demasiado caracteres!";
        return false;
    
    }
    else if(!validar.test(usuario)){
        
        error3.textContent="* Caracter(es) no permitido(s), verifique!";
        return false;
        
    }
    else if(/^\s*$/.test(usuario)){
					
        error3.textContent="* No digite espacios en blanco!";
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
        error4.textContent="* Ingrese su Clave!";
        return false;
        
    }
    else if(contra.length>20){
        
        error4.textContent="* Demasiado caracteres!";
        return false;
    
    }
    else if(!validar1.test(contra)){
        
        error4.textContent="* Caracter(es) no permitido(s), verifique!";
        return false;
        
    }
    else if(/^\s*$/.test(contra)){
					
        error4.textContent="* No digite espacios en blanco!";
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