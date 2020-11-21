<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.iesalixar.jmanuellopezh.model.Message"%>
<%@ page import="org.iesalixar.jmanuellopezh.model.User"%>
<%@ page import="org.iesalixar.jmanuellopezh.model.MessageDAOImpl"%>
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
    <title>MeetGrid - Mensajes Recientes</title>
    <link rel="icon" type="image/png" href="img/logosmall.png">
    
    <style>
    
			   
    </style>
</head>
<body>
<a name="top"></a>

<%  HttpServletRequest httpRequest = (HttpServletRequest) request;
			String profileURI = httpRequest.getContextPath() + "/ReadUserById";%>

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
            <li class="nav-item active">
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
      
      
      
      <div class="container">
      
     <div class="row mb-lg-5">
	     <div class="alert alert-danger ml-lg-3 mr-lg-3 mt-2 mg-3 col-12" role="alert">
	  		<p class="text-center">Mensajes recibidos en las últimas 48h.</p>
		 </div>
	<%
		List<Message> li = (List<Message>) session.getAttribute("lastmessages");
		for (Message m : li) {
	%>
		<div class="ml-lg-3 mr-lg-3 mt-1 p-lg-3 p-2 rounded-bottom border border-dark col-12" id="widecard">
			
				<img src="img/recibir.png"/>
				<%out.println("<strong>Enviado por "+MessageDAOImpl.readSenderName(m.getSender())+", "+m.getDate()+":</strong> "+m.getContent());
					
			
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
						<hr>
						<form class="d-flex justify-content-center" method = "get" action=<%=profileURI %>>
			
								<input type="hidden" name="id" value ="<%=m.getSender() %>"/>
								
								<input class="btn btn-danger col-12 col-m-6 col-lg-4 mt-1 mb-1" type="submit" value="Ir al perfil del usuario remitente"/>
						</form>
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

<script>

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