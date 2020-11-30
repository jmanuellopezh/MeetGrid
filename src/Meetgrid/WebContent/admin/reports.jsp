<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.iesalixar.jmanuellopezh.model.Report"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>

<%  HttpServletRequest httpRequest = (HttpServletRequest) request;
			String deleteURI = httpRequest.getContextPath() + "/DeleteUserAdmin";
			String deleteReportURI = httpRequest.getContextPath() + "/DeleteReport";
			String updateURI = httpRequest.getContextPath() + "/UpdateAdmin";%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css" type="text/css" media=screen>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <title>MeetGrid - Gestionar reportes</title>
    <link rel="icon" type="image/png" href="img/logosmall.png">
</head>
<body>
<a name="top"></a>

<!--header y barra de navegacion-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-danger sticky-top">
        <img src="img/logo.png" width="40" height="40" class="d-inline-block align-top" alt="MeetGrid" id="icon">
        <a class="navbar-brand" href="ReadReports">MeetGrid</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
          <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
              <a class="nav-link" href="ReadReports">Gestionar reportes</a>
            </li>
          <li class="nav-item">
              <a class="nav-link" href="ReadAll">Todos los usuarios</a>
           </li>
           <li class="nav-item">
              <a class="nav-link" href="CreateUser">Crear usuario</a>
           </li>
           <li class="nav-item">
              <a class="nav-link" href="CreateAdmin">Crear administrador</a>
           </li>
           <li class="nav-item">
              <a class="nav-link" href="Logout">Cerrar sesión</a>
           </li>
           </ul>
          <span class="navbar-text">
            Administrador: <%=session.getAttribute("username") %>
          </span>
        </div>
      </nav>
      
	<!-- reportes -->
	<div class="container mb-lg-5">

		<%
		List<Report> li = (List<Report>) session.getAttribute("reports");
		for (Report r : li) {
		%>
		<div id="widecard" class="col-12">
		<div class="row">
			<div class="ml-lg-3 mr-lg-3 mt-5 p-lg-3 p-2 col-12  rounded border border-dark">
				
					<img src="img/alert.png"/>
					<%out.println("<strong>El usuario "+r.getOwnerName()+" ha reportado al usuario "+r.getReportedName()+" el "+r.getDate()+" por el motivo:</strong>");%>
					<hr>
					<%out.println(r.getContent());%>
			</div>
			
		</div>
		<div class="row d-flex justify-content-center mb-3">
				<div class="mt-1 col-12 col-m-4 col-lg-3">
						<form method = "post" action=<%=deleteURI %>>
					
							<input type="hidden" name="id" value ="<%=r.getReportedId() %>"/>
					
							<input class="btn btn-danger col-12" type="submit" onclick="return confirm('¿Desea continuar con el borrado del perfil de éste usuario? Esta acción es irreversible.');" value="Borrar usuario reportado"/>
						</form>
				</div>
						
				<div class="mt-1 col-12 col-m-4 col-lg-3">
						<form method = "get" action=<%=updateURI %>>
					
							<input type="hidden" name="visit" value ="<%=r.getReportedId() %>"/>
					
							<input class="btn btn-danger col-12" type="submit" value="Modificar usuario reportado"/>
						</form>
				</div>
				<div class="mt-1 col-12 col-m-4 col-lg-3">
			
						<form method = "post" action=<%=deleteReportURI %>>
					
							<input type="hidden" name="idreport" value ="<%=r.getId() %>"/>
					
							<input class="btn btn-danger col-12" type="submit" value="Borrar reporte"/>
						</form>
				</div>
			</div>
			</div>

			
			<%}%>
		</div>
		
		<footer class="fixed-bottom navbar-dark bg-danger d-none d-lg-block">
			<a href="#top" class="ml-3" >
				<img border="0" alt="Volver arriba." src="img/up.png" width="40" height="40">
			</a>
	    	<span class="navbar-text float-right mr-3">®IES Alixar, 2020</span>
    	</footer>
</body>
</html>