<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.iesalixar.jmanuellopezh.model.User"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>

<%  HttpServletRequest httpRequest = (HttpServletRequest) request;
			String updateURI = httpRequest.getContextPath() + "/UpdateAdmin";%>

<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css" type="text/css" media=screen>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <title>MeetGrid - Todos los usuarios</title>
    <link rel="icon" type="image/png" href="img/logosmall.png">
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
          <li class="nav-item">
              <a class="nav-link" href="ReadReports">Gestionar reportes</a>
            </li>
          <li class="nav-item active">
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
      
      
      
      <!-- fin del nav -->
      
      <div class="row ml-3 mr-3 mt-2">
      <div class="alert alert-danger col-12" role="alert"> <p class="text-center">Introduzca el ID del usuario a ver/modificar o seleccionelo de la lista de abajo</p></div>
      </div>
 
      <form class="row ml-3 mr-3 mt-2 " method ="get" action=<%=updateURI %>>
			<input class="form-control offset-lg-4 col-lg-2 col-sm-6 col-m-4" type="text" name="visit" placeholder="Introduzca ID">
			
			<input class="btn btn-danger col-lg-2 col-sm-6 col-m-4 offset-m-2" type="submit" value="Ver/Modificar"/>
	</form>
      
 
      <!--grid de perfiles-->
      <div class="row ml-3 mr-3 pt-4 mb-lg-5">
	<%
    
		List<User> li = (List<User>) session.getAttribute("allprofiles");
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
            <h5 class="card-title">ID: <%=u.getId() %></h5>
            <p class="card-text mb-0">Nombre: <%=u.getName() %></p>
            <p class="card-text mb-0"><small class="text-muted">Email: <%=u.getEmail() %></small></p>
          </div>
          
          <form class="d-flex justify-content-center" method = "get" action=<%=updateURI %>>
			
			<input type="hidden" name="visit" value ="<%=u.getId() %>"/>
			
			<input class="btn btn-danger mb-2 w-100" type="submit" value="Ver/Modificar"/>
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
    	<span class="navbar-text float-right mr-3">®IES Alixar, 2020</span>
    </footer>

</body>
</html>