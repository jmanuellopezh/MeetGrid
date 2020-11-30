<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.iesalixar.jmanuellopezh.model.User"%>
<%@ page import="java.util.List"%>

	<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@page import="javax.servlet.http.HttpServletRequest" %>
	<%@page import="javax.servlet.ServletRequest" %>
	
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css" type="text/css" media=screen>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    <!-- importo el richtext compatible con Bootstrap para el apartado "Sobre mí" -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    
    <title>MeetGrid - Mi perfil</title>
    <link rel="icon" type="image/png" href="img/logosmall.png">
</head>
<body>
<a name="top"></a>

		<%  HttpServletRequest httpRequest = (HttpServletRequest) request;
		String deleteURI = httpRequest.getContextPath() + "/DeleteUserAdmin";
		String updateURI = httpRequest.getContextPath() + "/UpdateAdmin";%>

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
           <li class="nav-item">
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

<% User u = (User) session.getAttribute("visit"); %>


      <!--parte del perfil-->

      <div class="container mb-lg-5">
      <h3 class="mt-3">Datos actuales:</h3>
        <div class="row mt-3 rounded border border-dark">

                <%if (u.getPic()!=null & !u.getPic().equals("")){ %>
        		<img src="<%=u.getPic() %>" alt="<%=u.getName() %>" class="img img-responsive full-width mh-100 mt-2 ml-2 mb-2 rounded col-lg-5 col-m-4 col-sm-12" />
        		

                <%}else{ %>
                <img src="img/userplaceholder.png" alt="Sin foto" class="img img-responsive full-width mh-100 mt-2 ml-2 mb-2 rounded col-lg-5 col-m-4 col-sm-12" />


				<%} %>

                <div class="col-lg-6 col-m-5 col-sm-12">
                    <h1><%=u.getName() %></h1>
                    <cite><%=u.getArea() %></cite>
                    <p><%=u.getGenderFull() %>, <%=u.getAge() %> años</p>
                    <h5>Sobre mí:</h5>
                    <hr>
						<!-- No encapsulo este atributo ya que carga un richtext con marcado propio -->
                        <%=u.getDescription() %>
                </div>

        </div>
        <!--MODIFICAR PERFIL-->
        	<h3 class="mt-3">Modificar datos:</h3>
			
				<form class= "mt-3 rounded border border-dark form-row" action=<%=updateURI %> method="post" id="form">
					<fieldset class="col-12">
						
						<label class="mt-3">Contraseña</label>
						<input class="form-control" type="password" name="password" id="pass" onblur="compruebaPass()" placeholder="Puede contener numeros y letras, min 6 max 10 caracteres. Una vez introduzca uno valido se generara el campo para repetir contraseña.">
						<div id="otravez"></div>
						
						<label class="mt-3">Nombre de usuario</label>
						<input class="form-control" type="text" name="name" id="usuario" onblur="compruebaUsuario()" placeholder="Letras mayusculas, minusculas y numeros entre 1 y 15 caracteres">
						<label class="mt-3">Edad</label>
						<input class="form-control" type="text" name="age" id="edad" onblur="compruebaEdad()" placeholder="La edad debe ser mínimo 18 años, sólo se admiten números">
						
						<div class="input-group mt-3">
			                    <div class="input-group-prepend">
			                      <label class="input-group-text" for="inputGroupSelect01">Género</label>
			                    </div>
			                    <select class="custom-select" id="inputGroupSelect01" name="gender">
			                      <option selected disabled>Selecciona...</option>
			                      <option value="M">Mujer</option>
			                      <option value="H">Hombre</option>
			                      <option value="N">No binario</option>
			                    </select>
			                </div>
						
						
						<div class="input-group mt-3">
			                    <div class="input-group-prepend">
			                      <label class="input-group-text" for="inputGroupSelect02">Provincia</label>
			                    </div>
			                    <select class="custom-select" id="inputGroupSelect02" name="area">
			                      <option selected disabled>Selecciona...</option>
			                      <option value="Álava (Araba)">Álava (Araba)</option>
			                      <option value="Albacete">Albacete</option>
			                      <option value="Alicante">Alicante</option>
			                      <option value="Almería">Almería</option>
			                      <option value="Asturias">Asturias</option>
			                      <option value="Ávila">Ávila</option>
			                      <option value="Badajoz">Badajoz</option>
			                      <option value="Barcelona">Barcelona</option>
			                      <option value="Burgos">Burgos</option>
			                      <option value="Cáceres">Cáceres</option>
			                      <option value="Cádiz">Cádiz</option>
			                      <option value="Cantabria">Cantabria</option>
			                      <option value="Castellón">Castellón</option>
			                      <option value="Ciudad Real">Ciudad Real</option>
			                      <option value="Córdoba">Córdoba</option>
			                      <option value="Cuenca">Cuenca</option>
			                      <option value="Gerona (Girona)">Gerona (Girona)</option>
			                      <option value="Granada">Granada</option>
			                      <option value="Guadalajara">Guadalajara</option>
			                      <option value="Guipúzcoa (Gipuzkoa)">Guipúzcoa (Gipuzkoa)</option>
			                      <option value="Huelva">Huelva </option>
			                      <option value="Huesca">Huesca</option>
			                      <option value="Islas Baleares">Islas Baleares</option>
			                      <option value="Jaén">Jaén</option>
			                      <option value="La Coruña (A Coruña)">La Coruña (A Coruña)</option>
			                      <option value="La Rioja">La Rioja</option>
			                      <option value="Las Palmas">Las Palmas</option>
			                      <option value="León">León</option>
			                      <option value="Lérida (Lleida)">Lérida (Lleida)</option>
			                      <option value="Lugo">Lugo</option>
			                      <option value="Madrid">Madrid</option>
			                      <option value="Málaga">Málaga</option>
			                      <option value="Murcia">Murcia</option>
			                      <option value="Navarra">Navarra</option>
			                      <option value="Orense (Ourense)">Orense (Ourense)</option>
			                      <option value="Palencia">Palencia</option>
			                      <option value="Pontevedra">Pontevedra</option>
			                      <option value="Salamanca">Salamanca</option>
			                      <option value="Santa Cruz de Tenerife">Santa Cruz de Tenerife</option>
			                      <option value="Segovia">Segovia</option>
			                      <option value="Sevilla">Sevilla</option>
			                      <option value="Soria">Soria</option>
			                      <option value="Tarragona">Tarragona</option>
			                      <option value="Teruel">Teruel</option>
			                      <option value="Toledo">Toledo</option>
			                      <option value="Valencia">Valencia</option>
			                      <option value="Valladolid">Valladolid</option>
			                      <option value="Vizcaya (Bizkaia)">Vizcaya (Bizkaia)</option>
			                      <option value="Zamora">Zamora</option>
			                      <option value="Zaragoza">Zaragoza</option>
			                    </select>
			                </div>
						
						
						<label class="mt-3">Foto de perfil</label>
						
                   		<!-- barrita de animacion de subida de archivo -->
	                  	<progress class="col-12" value="0" id="uploader" max="100">0%</progress><br>
						<!-- aqui cojo la imagen para guardarla en google -->
						<input id="photo"class="file"type="file" name="mainimage" value="" onchange="getfile()">
						<!-- aqui guardo la ruta en un div hidden para pasarla al servlet y guardarla en mysql -->
						<input class="form-control" type="hidden" type="text" name="pic" id="pic">
						<br> 
						
						<label class="mt-3">Sobre mi:</label>
						<textarea class="form-control" type="text" name="description" id="summernote"></textarea>
						
						<input type="hidden" name="id"  value="<%=u.getId() %>"/>
						<button class="btn btn-danger col-12 col-m-6 col-lg-6 offset-m-3 offset-lg-3 mt-2 mb-2" onclick="compruebaTodo()" type="submit" value="update">Modificar perfil</button>
						
					</fieldset>
					
					
					
				</form>
				
				<form method="post" action=<%=deleteURI %> >
	
							<input type="hidden" name="id" value ="<%=u.getId() %>"/>
							<input class="btn btn-outline-danger col-12 col-m-6 col-lg-6 offset-m-3 offset-lg-3 mt-2 mb-2 " type="submit" onclick="return confirm('¿Desea continuar el borrado de su perfil? Esta acción es irreversible.');" value="Borrar perfil"/>
				</form>
				
	</div>
	
	<footer class="fixed-bottom navbar-dark bg-danger d-none d-lg-block">
		<a href="#top" class="ml-3" >
			<img border="0" alt="Volver arriba." src="img/up.png" width="40" height="40">
		</a>
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
    
    function compruebaEdad() {
        expr = /^(1[89]|[2-9][0-9]|1([0-3][0-9]|40))$/;
        email = document.getElementById("edad").value;
        if (!expr.test(email) && email != "") {

            document.getElementById("edad").style.backgroundColor = "red";


        } 
        else if (expr.test(email)) {
            document.getElementById("edad").style.backgroundColor = "lightgreen";
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

function compruebaEdadFin() {
    expr = /^(1[89]|[2-9][0-9]|1([0-3][0-9]|40))$/;
    usuario = document.getElementById("edad").value;
    if (!expr.test(usuario) && usuario != "") {
        document.getElementById("edad").value=("");

        alert("Error: La edad debe ser mínimo 18 años, sólo se admiten números");
        if (primerError==''){
            primerError="edad";
        }
    }
    
}

function compruebaTodo(){
    compruebaUsuarioFin();
    compruebaEdadFin();

    if (compruebaPassFin()){
        compruebaPassOtraFin();
    }
   
    
    //con esta línea volvemos al primer error
    document.getElementById(primerError).scrollIntoView({block: 'start', behavior: 'smooth'});
}

//funciones para el richtext
$(document).ready(function() {
	  $('#summernote').summernote();
});
	
$('#summernote').summernote({
    placeholder: 'Máximo 200 caracteres.',
    tabsize: 2,
    height: 200,
    toolbar: [
      ['font', ['bold', 'underline', 'clear']],
      ['para', ['ul', 'ol', 'paragraph']],
    ]
 });


</script>

<!-- AQUI COMIENZAN LOS SCRIPTS DE FIREBASE, EL SERVICIO DE SUBIDA DE IMAGENES -->

<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/8.0.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.0.1/firebase-storage.js"></script>

<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->

<script>
  // Configuracion de mi proyecto de Google Firebase
  var firebaseConfig = {
    apiKey: "AIzaSyDVKGWXnCel_7B5Cpp5ge4XObTZE7uJ4aU",
    authDomain: "meetgridalixar.firebaseapp.com",
    databaseURL: "https://meetgridalixar.firebaseio.com",
    projectId: "meetgridalixar",
    storageBucket: "meetgridalixar.appspot.com",
    messagingSenderId: "339055057610",
    appId: "1:339055057610:web:4d1de48ba347f242207233"
  };
  // Inicializo Firebase
  firebase.initializeApp(firebaseConfig);

</script>

<script type="text/javascript"> 

	//funciones para subir la imagen
       var selectedFile; 
	
      function getfile() 
      { 
          var pic = document.getElementById("photo");  
          selectedFile = pic.files[0]; 
			myfunction(); 
      } 
      
      function myfunction() 
      { 
          // current timestamp, necesario para la subida
          var name="123"+Date.now(); 
  
          // referencio el DIRECTORIO DENTRO DE MI ALMACENAMIENTO FIREBASE
          var storageRef = firebase.storage().ref('/images/'+ name); 
  
          // hago put a firebase  
          var uploadTask = storageRef.put(selectedFile); 
  
          // animacion de la barra de subida 
          uploadTask.on('state_changed', function(snapshot){ 
            var progress =  
             (snapshot.bytesTransferred / snapshot.totalBytes) * 100; 
              var uploader = document.getElementById('uploader'); 
              uploader.value=progress; 
              switch (snapshot.state) { 
                case firebase.storage.TaskState.PAUSED: 
                  console.log('Upload is paused'); 
                  break; 
                case firebase.storage.TaskState.RUNNING: 
                  console.log('Upload is running'); 
                  break; 
              } 
          }, function(error) {console.log(error); 
          }, function() { 
  
               // recojo la url de la imagen subida 
               uploadTask.snapshot.ref.getDownloadURL().then( 
                function(downloadURL) { 
  
               // la muestro en consola 
                console.log('File available at', downloadURL); 
  
              // IMPORTANTE: GUARDO LA URL EN EL DIV HIDDEN QUE USARE PARA PASAR EL VALUE AL SERVLET 
               document.getElementById("pic").value=(downloadURL);
            }); 
          }); 
      }; 
 </script>

</html>