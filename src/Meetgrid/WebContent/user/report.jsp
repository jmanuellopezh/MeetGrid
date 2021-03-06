<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.iesalixar.jmanuellopezh.model.User"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css" type="text/css" media=screen>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <title>MeetGrid - Reportar usuario</title>
    <link rel="icon" type="image/png" href="img/logosmall.png">
</head>
<body>

<%  HttpServletRequest httpRequest = (HttpServletRequest) request;
			String reportURI = httpRequest.getContextPath() + "/Report";%>

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
            <li class="nav-item">
              <a class="nav-link" href="LastMessages">Mensajes recientes</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="UpdateUser">Ajustes de perfil</a>
              </li>
              <li class="nav-item">
              <a class="nav-link" href="Logout">Cerrar sesi�n</a>
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
	  				<textarea class="form-control col-12" rows="10" type="text" name="motive" id="motive"></textarea>
	  				<button type="submit" value="enviar" class="btn btn-danger mb-2 mt-1 col-12 offset-m-4 col-m-4 offset-lg-4 col-lg-4" onclick="confirmaReporte()">Reportar</button>
					
				</form>
	       </div>
	       
	       <div class="row ">
       		<div class="alert alert-danger ml-lg-3 mr-lg-3 mt-5 mg-3 col-12" role="alert">
  				<p class="text-center">El equipo de moderaci�n estudiar� su reporte y tomar� medidas en un plazo de 24-48h laborables.</p>
  				<p class="text-center">Recuerde leer las <strong>pautas para la comunidad</strong> para ver qu� est� permitido y qu� no.</p>
  				<p class="text-center">Gracias por su colaboraci�n, trabajamos juntos por una comunidad mejor.</p>
			</div>
			
			
		</div>
       </div>
       
       <footer class="fixed-bottom navbar-dark bg-danger d-none d-lg-block">
	    	<span class="navbar-text float-right mr-3">�IES Alixar, 2020</span>
    	</footer>

</body>

<script>

function confirmaReporte(){
	motive = document.getElementById("motive").value;
	
	if (motive == ""){
    	confirm("El contenido del reporte no puede estar vac�o.");
    }else{
    	confirm("Reporte registrado. Gracias por su colaboraci�n.");
    }
	
}

</script>
</html>