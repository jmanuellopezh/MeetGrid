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
    <LINK REL=StyleSheet HREF="custom.css" TYPE="text/css" MEDIA=screen>
    <title>MeetGrid - Mensajes</title>
    <link rel="icon" type="image/png" href="img/logosmall.png">
</head>
<body>

<%  HttpServletRequest httpRequest = (HttpServletRequest) request;
			String messagesURI = httpRequest.getContextPath() + "/Messages";%>

<!--header y barra de navegacion-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-danger">
        <img src="img/logosmall.png" width="40" height="40" class="d-inline-block align-top" alt="MeetGrid">
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
  				<textarea class="form-control col-12" rows="5" type="text" name="content"></textarea>
  				<button type="submit" value="enviar" class="btn btn-danger mb-2 mt-1 col-12 offset-m-4 col-m-4 offset-lg-4 col-lg-4">Enviar</button>
				
			</form>
       </div> 

<hr>
	<h5>Mensajes anteriores:</h5>
     <div class="row ">
	<%
		List<Message> li = (List<Message>) session.getAttribute("messages");
		for (Message m : li) {
	%>
		<div class="ml-lg-3 mr-lg-3 mt-1 p-lg-3 p-2 rounded-bottom border border-dark col-12">
			<%
			if (m.getReceiver().equals(session.getAttribute("Id"))){%>
			
				<img src="img/recibir.png"/>
				<%out.println("<strong>Recibido, "+m.getDate()+":</strong> "+m.getContent());
			}else{%>
				
				<img src="img/enviado.png"/>
				<%out.println("<strong>Enviado, "+m.getDate()+":</strong> "+m.getContent());
			}%>
		</div>
		<%}
	%>
	</div>
	
	

</body>
</html>