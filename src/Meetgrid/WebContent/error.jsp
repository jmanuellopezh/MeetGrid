<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	
	<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@page import="javax.servlet.http.HttpServletRequest" %>
	<%@page import="javax.servlet.ServletRequest" %>
	<fmt:setBundle basename="interface" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<LINK REL=StyleSheet HREF="custom.css" TYPE="text/css" MEDIA=screen>
<meta charset="ISO-8859-1">
<title>Meetgrid - <fmt:message key="login.login" /></title>
<link rel="icon" type="image/png" href="img/logosmall.png">
</head>
<body>
	
	 <!--header y barra de navegacion-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-danger">
        <img src="img/logosmall.png" width="40" height="40" class="d-inline-block align-top" alt="MeetGrid">
        <a class="navbar-brand" href="ReadUsersByFilter">MeetGrid</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link"><fmt:message key="login.welcome" /></a>
            </li>

          </ul>
          <span class="navbar-text">
            <a href="register.jsp"><fmt:message key="login.signin" /></a>
          </span>
        </div>
      </nav>

	<div>
		<h1 class="offset-5 col-2 ">Error.</h1>
		<img class ="offset-5 col-2"  src="https://bikes4life.es/wp-content/uploads/error.png"/>
	<p class="d-flex justify-content-center" >Cumpla los requisitos indicados en la página de registro para introducir usuario y contraseña.</p>
	</div>
	
	<button class="btn btn-danger offset-5 col-2"><a href="<%=session.getServletContext().getContextPath()%>/login.jsp">Volver al login.</a></button>

</body>
</html>