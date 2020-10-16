<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.iesalixar.jmanuellopezh.model.Message"%>
<%@ page import="org.iesalixar.jmanuellopezh.model.User"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <LINK REL=StyleSheet HREF="custom.css" TYPE="text/css" MEDIA=screen>
    <title>MeetGrid</title>
    <link rel="icon" type="image/png" href="img/logosmall.png">
</head>
<body>

<%  HttpServletRequest httpRequest = (HttpServletRequest) request;
			String messagesURI = httpRequest.getContextPath() + "/Messages";%>

<!--header y barra de navegacion-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-danger">
        <img src="img/logosmall.png" width="40" height="40" class="d-inline-block align-top" alt="MeetGrid">
        <a class="navbar-brand" href="#">MeetGrid</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="#">Perfiles <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Mensajes</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Favoritos</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Ajustes de perfil</a>
              </li>
          </ul>
          <span class="navbar-text">
            Usuario: <%=session.getAttribute("username") %>
          </span>
        </div>
      </nav>
      
      <% User visit = (User) session.getAttribute("visit"); %>
      <h1>Mensajes previos:</h1>
      <ul>
	<%
		List<Message> li = (List<Message>) session.getAttribute("messages");
		for (Message m : li) {
	%>
	<li>
		<%
		if (m.getReceiver().equals(session.getAttribute("Id"))){
			out.println("Recibido, "+m.getDate()+": "+m.getContent());
		}else{
			out.println("Enviado, "+m.getDate()+": "+m.getContent());
		}
		%>
	</li>
	<%
		}
	%>
	</ul>
	
	<h1>Enviar mensaje:</h1>
	<form action=<%=messagesURI %> method="post">
			<input type="text" name="content">
			<button type="submit" value="enviar">Enviar</button>
		</form>

</body>
</html>