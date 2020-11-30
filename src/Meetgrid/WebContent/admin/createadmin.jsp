<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@page import="javax.servlet.http.HttpServletRequest" %>
	<%@page import="javax.servlet.ServletRequest" %>
	<fmt:setBundle basename="interface" />
	
	<%  HttpServletRequest httpRequest = (HttpServletRequest) request;
			String createURI = httpRequest.getContextPath() + "/CreateAdmin";%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css" media=screen>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<meta charset="ISO-8859-1">
<title>Meetgrid - Crear administrador</title>
<link rel="icon" type="image/png" href="img/logosmall.png">
</head>
<body>
	
	 <!--header y barra de navegacion-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-danger sticky-top">
        <img src="img/logo.png" width="40" height="40" class="d-inline-block align-top" alt="MeetGrid" id="icon">
        <a class="navbar-brand" href="ReadReports">MeetGrid</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
          <ul class="navbar-nav mr-auto">
          <li class="nav-item">
              <a class="nav-link" href="ReadReports">Gestionar reportes</a>
            </li>
          <li class="nav-item">
              <a class="nav-link" href="ReadAll">Todos los usuarios</a>
           </li>
           <li class="nav-item">
              <a class="nav-link" href="CreateUser">Crear usuario</a>
           </li>
           <li class="nav-item active">
              <a class="nav-link" href="CreateAdmin">Crear administrador</a>
           </li>
           <li class="nav-item">
              <a class="nav-link" href="Logout">Cerrar sesión</a>
           </li>
           </ul>
          <span class="navbar-text">
            Administrador: <%=session.getAttribute("username") %>
          </span>
        </div>
      </nav>
      
      
      
      <!-- fin del nav -->
      <div class="container">
      
      <div class="row mt-2">
      <div class="alert alert-danger col-12" role="alert"> <p class="text-center">Recuerde anotar el password para el nuevo administrador: los passwords están encriptados en nuestra base de datos.</p></div>
      </div>


		<!-- register -->
	
		<form class= "mt-1 mb-2 rounded border border-dark form-row" action=<%=createURI %> method="post" id="form">
			<fieldset class="col-12">
			<strong class="float-right">*Campos requeridos.</strong>
				<label>Email*</label>
				<input class="form-control" type="text" name="email" id="email" required onblur="compruebaEmail()" placeholder="Formato email: usuario@dominio.com/es.org...">
				
				<label>Nombre de usuario*</label>
				<input class="form-control" type="text" name="name" id="usuario" required onblur="compruebaUsuario()" placeholder="Letras mayusculas, minusculas y numeros entre 1 y 15 caracteres, sin espacios.">
	
				<label>Contraseña*</label>
				<input class="form-control" type="password" name="password" id="pass" required onblur="compruebaPass()" placeholder="Puede contener numeros y letras, min 6 max 10 caracteres. Una vez introduzca uno valido se generara el campo para repetir contraseña.">
				<div id="otravez"></div>
				
				<button class="btn btn-danger col-12 mt-2 mb-2" onclick="compruebaTodo()" type="submit" value="register">Crear administrador</button>
			</fieldset>
			
		</form>
		 <ul class="list-group mt-2 mb-2">
			  <li class="list-group-item list-group-item-dark"><strong>¡Recuerda!</strong> Normas para crear perfil de nuevo administrador.</li>
			  <li class="list-group-item ">Solo se permite crear perfiles de administrador para personas acreditadas para ello.</li>
			  <li class="list-group-item ">Ante cualquier error en el creado del perfil, contacte con el gestor de la base de datos.</li>
		</ul>
	
	</div>
	
	

	<footer class="fixed-bottom navbar-dark bg-danger d-none d-lg-block">
    	<span class="navbar-text float-right mr-3">®IES Alixar, 2020</span>
    </footer>
</body>

<script type="text/javascript">

//funciones de verificacion de datos

    function compruebaUsuario() {
        expr = /^([A-Za-z0-9_]{1,15})$/;//si pide una longitud de usuario diferente recuerda cambiarla aqui
        usuario = document.getElementById("usuario").value;
        if (!expr.test(usuario) && usuario != "") {

            document.getElementById("usuario").style.backgroundColor = "red";

        }        
        else if (expr.test(usuario)){
            document.getElementById("usuario").style.backgroundColor = "lightgreen";
        }
    }

    function compruebaEmail() {
        expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        email = document.getElementById("email").value;
        if (!expr.test(email) && email != "") {

            document.getElementById("email").style.backgroundColor = "red";


        } 
        else if (expr.test(email)) {
            document.getElementById("email").style.backgroundColor = "lightgreen";
        }
    }

    function compruebaPass() {
        expr = /^([a-zA-Z0-9]{6,10})+$/;
        pass = document.getElementById("pass").value;
        if (!expr.test(pass) && pass != "") {

            document.getElementById("pass").style.backgroundColor = "red";
 
            
        } else if  (expr.test(pass)){
            document.getElementById("pass").style.backgroundColor = "lightgreen";

            //CREACION DE NODO SI SE INTRODUCE CORRECTO EL PRIMER PASSWORD PARA REPETIRLO
            
            //<label>Repita la contraseña</label>
			//<input class="form-control" type="password" name="repeatpassword" required onblur="compruebaPass()" placeholder="Puede contener numeros y letras, min 6 max 10 caracteres. Una vez introduzca uno valido se generara el campo para repetir contraseña." >
						
            var node = document.createElement('input');
            node.id=("passotra");//podemos añadir attr al nodo ya predefinidos
            node.className=("form-control");
            node.setAttribute('onblur', "compruebaPassOtra()");//o crearlos nosotros
            node.placeholder=("Repita su contraseña");
            node.type=("password");
            node.name=("repeatpassword");

            var texto = ('');
            var textnode = document.createTextNode(texto); 
            node.appendChild(textnode);
            document.getElementById("otravez").appendChild(node);
        }
    }

    function compruebaPassOtra() {
        expr = /^([a-zA-Z0-9]{6,10})+$/;
        passotra = document.getElementById("passotra").value;
        pass = document.getElementById("pass").value;
        if (!expr.test(passotra) && passotra != "") {

            document.getElementById("passotra").style.backgroundColor = "red";

            
        } 
        else if(expr.test(passotra) && (pass==passotra)){
            document.getElementById("passotra").style.backgroundColor = "lightgreen";
        }

    }
    
   

    //FUNCIONES DE COMPROBACION DE REGEX CON MENSAJES AL DARLE AL BOTON

    
        //variable global que usare para guardar el primer error y hacer la animacion (TODO ESTO AL ENVIAR AL FINAL, NO EN ONBLUR)
        var primerError='';
    

    function compruebaUsuarioFin() {
        expr = /^([A-Za-z0-9_]{1,15})$/;//si pide una longitud de usuario diferente recuerda cambiarla aqui
        usuario = document.getElementById("usuario").value;
        if (!expr.test(usuario) && usuario != "") {
            document.getElementById("usuario").value=("");

            alert("Error: Nombre de usuario incorrecto. Son letras mayusculas, minusculas y numeros entre 1 y 15 caracteres");
            if (primerError==''){
                primerError="usuario";//GUARDO EL NOMBRE DE LA ETIQUETA
            }
        }
        
    }

    function compruebaEmailFin() {
        expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        email = document.getElementById("email").value;
        if (!expr.test(email) && email != "") {
            document.getElementById("email").value=("");

            alert("Error: La dirección de correo " + email + " es incorrecta.");
            if (primerError==''){
                primerError="email";//GUARDO EL NOMBRE DE LA ETIQUETA
            }

        } 
        
    }

    function compruebaPassFin() {
        expr = /^([a-zA-Z0-9]{6,10})+$/;
        pass = document.getElementById("pass").value;
        var existe = false;
        if (!expr.test(pass) && pass != "") {
            document.getElementById("pass").value=("");
            alert("Error: El password " + pass + " es incorrecto. Puede contener numeros y letras, min 6 max 10 caracteres.");
            existe =true;

            if (primerError==''){
                primerError="pass";//GUARDO EL NOMBRE DE LA ETIQUETA
            }
        }else if (expr.test(pass)){
            existe =true;
        }

        return existe;
    }

    function compruebaPassOtraFin() {
        expr = /^([a-zA-Z0-9]{6,10})+$/;
        passotra = document.getElementById("passotra").value;
        pass = document.getElementById("pass").value;
        if (!expr.test(passotra) && passotra != "") {
            document.getElementById("passotra").value=("");

            alert("Error: El password " + passotra + " es incorrecto. Puede contener numeros y letras, min 6 max 10 caracteres y debe ser igual al indicado arriba.");
            if (primerError==''){
                primerError="passotra";//GUARDO EL NOMBRE DE LA ETIQUETA
            }
        } 
        
    }
    
    function compruebaTodo(){
    	
    	
        compruebaUsuarioFin();
        compruebaEmailFin();

        if (compruebaPassFin()){
            compruebaPassOtraFin();
        }

        if (primerError==''){
        	alert("Administrador registrado. Puede suministrarle las credenciales creadas.");
        }else{
        	//con esta línea volvemos al primer error
            document.getElementById(primerError).scrollIntoView({block: 'start', behavior: 'smooth'});
        }
    }
    
</script>

</html>