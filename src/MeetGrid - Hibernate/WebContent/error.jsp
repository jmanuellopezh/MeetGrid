<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@page import="javax.servlet.http.HttpServletRequest" %>
	<%@page import="javax.servlet.ServletRequest" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Error</title>
</head>
<body>
	<div>
		<h1 class="offset-5 col-2 ">Error.</h1>
		<img class ="offset-5 col-2"  src="https://bikes4life.es/wp-content/uploads/error.png"/>
	<p class="d-flex justify-content-center" >Cumpla los requisitos indicados en la página de registro para introducir usuario y contraseña.</p>
	</div>
	
	<button class="btn btn-danger offset-5 col-2"><a href="<%=session.getServletContext().getContextPath()%>/login.jsp">Volver al login.</a></button>

</body>
</html>