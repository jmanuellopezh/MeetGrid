<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<button><a href="<%=session.getServletContext().getContextPath()%>/login.jsp">Volver al login.</a></button>
</head>
<body>
	<div>
		<h1>Crear nuevo Usuario</h1>
		<form action="./Register" method="post">
			
			<label>Email</label>
			<input type="text" name="email" required>
			<label>Password</label>
			<input type="password" name="password" required >
			<label>Repeat password</label>
			<input type="password" name="repeatpassword" required >
			<label>Name</label>
			<input type="text" name="name">
			<label>Age</label>
			<input type="text" name="age">
			<label>Gender</label>
			<input type="text" name="gender">
			<label>Area</label>
			<input type="text" name="area">
			<label>Pic</label>
			<input type="text" name="pic">
			<label>Description</label>
			<input type="text" name="description">
			<button type="submit" value="publicar">Registrarse</button>
		</form>
</div>
</body>
</html>