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
<meta charset="ISO-8859-1">
<title><fmt:message key="login.login" /></title>
</head>
<body>
	

	<div>
		<h1 class="offset-5 col-2 "><fmt:message key="login.welcome" /></h1>
		<img class ="offset-5 col-2"  src="https://www.dlf.pt/png/big/14/142941_login-icons-png.jpg"/>
		
		<%  HttpServletRequest httpRequest = (HttpServletRequest) request;
			String loginURI = httpRequest.getContextPath() + "/Login"; %>
		<form class= "offset-4 col-4  border border-success rounded d-flex justify-content-center" action="<%=loginURI %>"  method="post">
			<fieldset>
				<legend><fmt:message key="login.login" /></legend>
				<label><fmt:message key="login.user" />:</label><br> 
				<input type="text" name="email"
				placeholder=<fmt:message key="login.user" /> required autofocus> <br> 
				<label><fmt:message key="login.password" />:</label><br> 
				<input type="password" name="password"
				placeholder=<fmt:message key="login.password" /> required><br>
				<input class="btn btn-success" type="submit" value="<fmt:message key="login.login" />">
			</fieldset>
			
		</form>

	<div>
	<p class="d-flex justify-content-center" >MeetGrid.</p>
	</div>
	</div>
	<div class="buttons d-flex justify-content-center">
		<button class="btn btn-warning ">
		<a href="register.jsp"><fmt:message key="login.signin" /></a>
	</button>
	

	</div>
	
	<!--  -->
	<%
    if(null!=request.getAttribute("errorMessage"))
    {%>
        <div class="alert alert-danger" role="alert"><fmt:message key="login.error" /></div>
    <%}
    %>
    
</body>
</html>