<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.iesalixar.jmanuellopezh.model.Message"%>
<%@ page import="org.iesalixar.jmanuellopezh.model.User"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css" type="text/css" media=screen>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <title>MeetGrid - Mensajes</title>
    <link rel="icon" type="image/png" href="img/logosmall.png">
   
</head>
<body>
<a name="top"></a>

<%  HttpServletRequest httpRequest = (HttpServletRequest) request;
			String messagesURI = httpRequest.getContextPath() + "/Messages";%>

<!--header y barra de navegacion-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-danger sticky-top">
        <img src="img/logo.png" width="40" height="40" class="d-inline-block align-top" alt="MeetGrid" id="icon">
        <a class="navbar-brand" href="ReadUsersByFilter">MeetGrid</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <a class="nav-link" href="ReadUsersByFilter">Perfiles</a>
            </li>
            
            <li class="nav-item">
              <a class="nav-link" href="Favorite">Favoritos</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Block">Bloqueados</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="LastMessages">Mensajes recientes</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="UpdateUser">Ajustes de perfil</a>
              </li>
              <li class="nav-item">
              <a class="nav-link" href="Logout">Cerrar sesión</a>
            </li>
          </ul>
          <span class="navbar-text">
            Usuario: <%=session.getAttribute("username") %>
          </span>
        </div>
      </nav>
      
      <% User visit = (User) session.getAttribute("visit"); %>
      
      
      
      <div class="container">
      
      <!-- NUEVO MENSAJE -->
        <div class="row ">
        
			<form action=<%=messagesURI %> method="post" class="ml-lg-3 mr-lg-3 mt-3 mb-3 rounded border border-dark col-12">
				<label for="Enviar nuevo mensaje">Enviar nuevo mensaje:</label>
  				<textarea class="form-control col-12" rows="5" type="text" name="content" required></textarea>
  				<!-- barrita de animacion de subida de archivo -->
	                  	<progress class="col-12" value="0" id="uploader" max="100">0%</progress><br>
						<!-- aqui cojo la imagen para guardarla en google -->
						<input id="photo"class="file"type="file" name="mainimage" value="" onchange="getfile()">
						<!-- aqui guardo la ruta en un div hidden para pasarla al servlet y guardarla en mysql -->
						<input class="form-control" type="hidden" type="text" name="pic" id="pic">
						<br> 
  				<button type="submit" value="enviar" class="btn btn-danger mb-2 mt-1 col-12 offset-m-4 col-m-4 offset-lg-4 col-lg-4">Enviar</button>
				
			</form>
       </div> 

<hr>
	<h5>Mensajes anteriores:</h5>
     <div class="row mb-lg-5">
	<%
		List<Message> li = (List<Message>) session.getAttribute("messages");
		for (Message m : li) {
	%>
		<div class="ml-lg-3 mr-lg-3 mt-1 p-lg-3 p-2 rounded-bottom border border-dark col-12">
			<%
			if (m.getReceiver().equals(session.getAttribute("Id"))){%>
			
				<img src="img/recibir.png"/>
				<%out.println("<strong>Recibido, "+m.getDate()+":</strong> "+m.getContent());%>
					
			<%}else{%>
				<img src="img/enviado.png"/>
				<%out.println("<strong>Enviado, "+m.getDate()+":</strong> "+m.getContent());%>
			<%}
			
			if (m.getPic()!=null & !m.getPic().equals("")){%>
						<hr>
						
						<!-- Trigger the Modal -->
						<img id="myImg" src="<%=m.getPic() %>" alt="Foto enviada por el usuario." style="width:100%;max-width:300px" onclick="modal(this)">
						
						<!-- The Modal -->
						<div id="myModal" class="modal">
						
						  <!-- The Close Button -->
						  <span class="close mt-5">X</span>
						
						  <!-- Modal Content (The Image) -->
						  <img class="modal-content" id="img01">
						
						  <!-- Modal Caption (Image Text) -->
						  <div id="caption"></div>
						</div>
						<%} %>
		</div>
		<%}
	%>
	</div>
	
	<footer class="fixed-bottom navbar-dark bg-danger d-none d-lg-block">
		<a href="#top" class="ml-3" >
			<img border="0" alt="Volver arriba." src="img/up.png" width="40" height="40">
		</a>
    	<span class="navbar-text float-right mr-3">®IES Alixar, 2020</span>
    </footer>
	

</body>

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
  
          // referencio el DIRECTORIO DENTRO DE MI ALMACENAMIENTO FIREBASE (directorio diferente para mensajes)
          var storageRef = firebase.storage().ref('/messagepics/'+ name); 
  
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
      
      
      
   // FUNCIONES DEL MODAL
   function modal(e){
      var modal = document.getElementById("myModal");

      // cojo los id del modal que voy a rellenar con el elemento pasado por la funcion
      var modalImg = document.getElementById("img01");
      var captionText = document.getElementById("caption");
      
        modal.style.display = "block";
        
        //meto los valores del elemento pasado en el modal
        modalImg.src = e.src;
        captionText.innerHTML = e.alt;
     // cojo el span de cierre
        var span = document.getElementsByClassName("close")[0];

        // Cuando pulse en la x, que se oculte
        span.onclick = function() {
          modal.style.display = "none";
        }
      }

      
 </script>
</html>