<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.iesalixar.jmanuellopezh.model.User"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css" type="text/css" media=screen>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <title>MeetGrid - Bloqueados</title>
    <link rel="icon" type="image/png" href="img/logosmall.png">

</head>
<body>
<a name="top"></a>

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
              <a class="nav-link " href="Favorite">Favoritos</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="Block">Bloqueados</a>
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

<%  HttpServletRequest httpRequest = (HttpServletRequest) request;
			String profileURI = httpRequest.getContextPath() + "/ReadUserById";
String deleteBlockURI = httpRequest.getContextPath() + "/DeleteBlock";%>
      <div class="row  ml-lg-3 mr-lg-3 mt-2">
      <div class="alert alert-danger col-12" role="alert"> <p class="text-center">El usuario bloqueado no podr� enviarte mensajes, si lo desbloqueas podr� hacerlo de nuevo. El sistema no notificar� a estos usuarios de los bloqueos ni desbloqueos.</p></div>
      </div>
      
      <!--grid de perfiles-->
      <div class="row ml-3 mr-3 pt-2 mb-lg-5">
	<%
    
		List<User> li = (List<User>) session.getAttribute("blocks");
        if(null!=li){
		for (User u : li) {%>
		
		
        <div class="card col-lg-2 col-sm-6">

          <div class="image">
          	<%if (u.getPic()!=null & !u.getPic().equals("")){ %>
        		<img src="<%=u.getPic() %>" class="img img-responsive full-width mt-2" />
        		
			<%}else{ %>
                <img src="img/userplaceholder.png" class="img img-responsive full-width mt-2"/>

			<%} %>
          </div>

          <div class="card-body">
            <h5 class="card-title"><%=u.getName() %></h5>
            <p class="card-text mb-0">Edad: <%=u.getAge() %></p>
            <p class="card-text mb-0"><small class="text-muted">G�nero: <%=u.getGenderFull() %></small></p>
            <p class="card-text"><small class="text-muted">Provincia: <%=u.getArea() %></small></p>
          </div>
          
          <form class="d-flex justify-content-center" method = "get" action=<%=profileURI %>>
			
			<input type="hidden" name="id" value ="<%=u.getId() %>"/>
			
			<input class="btn btn-danger mb-2 w-100" type="submit" value="Ver Perfil"/>
	</form>
	
	<form method="post" action=<%=deleteBlockURI %>>
	
	<input type="hidden" name="deleted"  value="<%=u.getId() %>"/>
	<input class="btn btn-outline-danger mb-2 w-100" type="submit" value="Desbloquear"/>
	</form>
        </div>
        
        <%
		}
    }
		%>

	</div>	

	<footer class="fixed-bottom navbar-dark bg-danger d-none d-lg-block">
		<a href="#top" class="ml-3" >
			<img border="0" alt="Volver arriba." src="img/up.png" width="40" height="40">
		</a>
    	<span class="navbar-text float-right mr-3">�IES Alixar, 2020</span>
    </footer>
</body>
</html>