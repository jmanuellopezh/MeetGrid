<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.iesalixar.jmanuellopezh.model.User"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <LINK REL=StyleSheet HREF="custom.css" TYPE="text/css" MEDIA=screen>
    <title>MeetGrid - Reportar usuario</title>
    <link rel="icon" type="image/png" href="img/logosmall.png">
</head>
<body>

<%  HttpServletRequest httpRequest = (HttpServletRequest) request;
			String reportURI = httpRequest.getContextPath() + "/Report";%>

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
                <a class="nav-link" href="#">Ajustes de perfil</a>
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
	        <div class="row ">
				<form action=<%=reportURI %> method="post" class="ml-lg-3 mr-lg-3 mt-5 mg-3 rounded border border-dark col-12">
					<label for="Indique el motivo de su reporte a <%=visit.getName() %>">Indique el motivo de su reporte a <%=visit.getName() %>:</label>
	  				<textarea class="form-control col-12" rows="10" type="text" name="motive"></textarea>
	  				<button type="submit" value="enviar" class="btn btn-danger mb-2 mt-1 col-12 offset-m-4 col-m-4 offset-lg-4 col-lg-4">Reportar</button>
					
				</form>
	       </div>
	       
	       <div class="row ">
       		<div class="alert alert-danger ml-lg-3 mr-lg-3 mt-5 mg-3 col-12" role="alert">
  				<p class="text-center">El equipo de moderación estudiará su reporte y tomará medidas en un plazo de 24-48h laborables.</p>
  				<p class="text-center">Recuerde leer las <a href="#" class="alert-link">normas de la aplicación</a> para informarse sobre el procedimiento que tomaremos.</p>
  				<p class="text-center">Gracias por su colaboración, trabajamos juntos por una comunidad mejor.</p>
			</div>
			
			
		</div>
       </div>
       

</body>
</html>