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
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <title>MeetGrid - Ver perfil</title>
    <link rel="icon" type="image/png" href="img/logosmall.png">
</head>
<body>

		<%  HttpServletRequest httpRequest = (HttpServletRequest) request;
			String messagesURI = httpRequest.getContextPath() + "/Messages";
			String favoriteURI = httpRequest.getContextPath() + "/Favorite";
			String reportURI = httpRequest.getContextPath() + "/Report";
			String blockURI = httpRequest.getContextPath() + "/Block";%>

<!--header y barra de navegacion-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-danger sticky-top">
        <img src="img/logosmall.png" width="40" height="40" class="d-inline-block align-top" alt="MeetGrid">
        <a class="navbar-brand" href="ReadUsersByFilter">MeetGrid</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <a class="nav-link" href="ReadUsersByFilter">Perfiles </a>
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

<% User u = (User) session.getAttribute("visit"); %>


      <!--parte del perfil-->

      <div class="container">
        <div class="row ml-3 mr-3 mt-3 rounded border border-dark">

                <img src="<%=u.getPic() %>" alt="<%=u.getName() %>" class="img img-responsive full-width mh-100 mt-2 ml-2 mb-2 rounded col-lg-5 col-m-4 col-sm-12" />

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
        <!--botones-->

        <div class="row ml-3 mr-3 mt-1">
            <form class="col-lg-3 col-m-3 col-sm-12 mt-1" method = "get" action=<%=messagesURI %>>
                
                <input type="hidden" name="id" value ="<%=u.getId() %>"/>
                
                <input class="btn btn-danger w-100" type="submit" value="Mensajes"/>
                
            </form>
        
            <form class="col-lg-3 col-m-3 col-sm-12 mt-1" action="<%=favoriteURI %>" method="post">

                <button class="btn btn-danger w-100" type="submit" value="enviar">Hacer favorito</button>
                
            </form>
            
            <form class="col-lg-3 col-m-3 col-sm-12 mt-1" method = "get" action=<%=reportURI %>>
                
                <input class="btn btn-danger w-100" type="submit" value="Reportar"/>
                
            </form>
            <form class="col-lg-3 col-m-3 col-sm-12 mt-1" action="<%=blockURI %>" method="post">

                <button class="btn btn-danger w-100" type="submit" value="enviar">Bloquear</button>
                
            </form>
        </div>
    </div>
    <footer class="fixed-bottom navbar-dark bg-danger d-none d-lg-block ">
    	<span class="navbar-text float-right mr-3">®IES Alixar, 2020</span>
    </footer>
    </body>
    </html>