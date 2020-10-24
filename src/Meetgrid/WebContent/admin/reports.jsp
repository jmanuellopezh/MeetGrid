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
    <LINK REL=StyleSheet HREF="custom.css" TYPE="text/css" MEDIA=screen>
    <title>MeetGrid - Administración del sitio</title>
    <link rel="icon" type="image/png" href="img/logosmall.png">
</head>
<body>

<!--header y barra de navegacion-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-danger">
        <img src="img/logosmall.png" width="40" height="40" class="d-inline-block align-top" alt="MeetGrid">
        <a class="navbar-brand" href="ReadReports">MeetGrid</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
          <ul class="navbar-nav mr-auto">
          <li class="nav-item">
              <a class="nav-link" href="Logout">Cerrar sesión</a>
           </li>
           </ul>
          <span class="navbar-text">
            Administrador: <%=session.getAttribute("username") %>
          </span>
        </div>
      </nav>
      

	
	
	<!-- nuevo -->
	<div class="container">

		<%
		List<Report> li = (List<Report>) session.getAttribute("reports");
		for (Report r : li) {
		%>
		<div class="row">
			<div class="ml-lg-3 mr-lg-3 mt-5 p-lg-3 p-2 col-12  rounded border border-dark">
				
					<img src="img/alert.png"/>
					<%out.println("<strong>El usuario "+r.getOwnerName()+" ha reportado al usuario "+r.getReportedName()+" el "+r.getDate()+" por el motivo:</strong>");%>
					<hr>
					<%out.println(r.getContent());%>
			</div>
			
		</div>
		<div class="row d-flex justify-content-center">
				<div class="mt-1 col-12 col-m-4 col-lg-3">
						<form method = "post" action=<%=deleteURI %>>
					
							<input type="hidden" name="id" value ="<%=r.getReportedId() %>"/>
					
							<input class="btn btn-danger col-12" type="submit" value="Borrar usuario reportado"/>
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

			
			<%}%>
		</div>
</body>
</html>