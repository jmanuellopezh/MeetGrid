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
    <LINK REL=StyleSheet HREF="custom.css" TYPE="text/css" MEDIA=screen>
    <title>MeetGrid</title>
    <link rel="icon" type="image/png" href="img/logosmall.png">
</head>
<body>

		<%  HttpServletRequest httpRequest = (HttpServletRequest) request;
			String messagesURI = httpRequest.getContextPath() + "/Messages";
			String favoriteURI = httpRequest.getContextPath() + "/Favorite";
			String reportURI = httpRequest.getContextPath() + "/Report";
			String blockURI = httpRequest.getContextPath() + "/Block";%>

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

<% User u = (User) session.getAttribute("visit"); %>


<img src="<%=u.getPic() %>" alt="<%=u.getName() %>">

<h1> <%=u.getName() %> </h1>

<p> Edad: <%=u.getAge() %> </p>
<p> Género: <%=u.getGenderFull() %> </p>
<p> Provincia: <%=u.getArea() %> </p>
<p> Sobre mí: <%=u.getDescription() %>

<form class="d-flex justify-content-center" method = "get" action=<%=messagesURI %>>
			
			<input type="hidden" name="id" value ="<%=u.getId() %>"/>
			
			<input class="btn btn-danger mb-2 mx-auto" type="submit" value="Mensajes"/>
	</form>
	
	<form class="d-flex justify-content-center" action="<%=favoriteURI %>" method="post">

			<button class="btn btn-danger mb-2 mx-auto" type="submit" value="enviar">Hacer favorito</button>
		</form>
		
		<form class="d-flex justify-content-center" method = "get" action=<%=reportURI %>>
			
			<input class="btn btn-danger mb-2 mx-auto" type="submit" value="Report"/>
	</form>
	<form class="d-flex justify-content-center" action="<%=blockURI %>" method="post">

			<button class="btn btn-danger mb-2 mx-auto" type="submit" value="enviar">Bloquear</button>
		</form>
		
</body>