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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

function cookies() {
	  alert("<fmt:message key="login.cookies" />");
	}
	
$(document).ready(function(){
	cookies();
	$('body').css('display', 'none');
	$('body').fadeIn(400);
});



</script>
<meta charset="ISO-8859-1">
<title>Meetgrid - <fmt:message key="login.login" /></title>
<link rel="icon" type="image/png" href="img/logosmall.png">
</head>
<body>
	
	 <!--header y barra de navegacion-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-danger sticky-top">
        <img src="img/logosmall.png" width="40" height="40" class="d-inline-block align-top" alt="MeetGrid">
        <a class="navbar-brand">MeetGrid</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
          <ul class="navbar-nav mr-auto">
            

          </ul>
          <span class="navbar-text">
            <a href="register.jsp"><fmt:message key="login.signin" /></a>
          </span>
        </div>
      </nav>
      
      <!-- fin del nav -->
      <div class="container">
	       <div class="row">
	       
      <!-- carrusel bootstrap -->
    			<div class="bd-example mt-5 h-75 col-lg-6 col-m-6 col-12 rounded order-lg-1 order-m-1 order-sm-2">
  					<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
						    <ol class="carousel-indicators">
						      <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
						      <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
						      <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
						    </ol>
							    <div class="carousel-inner">
							      <div class="carousel-item active">
							        <img src="img/carr1.jpg" class="d-block w-100"  alt="...">
							        <div class="carousel-caption d-none d-md-block">
							          <h5>Conoce personas nuevas</h5>
							          <p>Una simple cita, amigos o incluso tu nueva pareja.</p>
							        </div>
							      </div>
							      <div class="carousel-item">
							        <img src="img/carr2.png" class="d-block w-100" alt="...">
							        <div class="carousel-caption d-none d-md-block">
							          <h5>Seas quien seas</h5>
							          <p>Todas las sexualidades e identidades de género son bienvenidas.</p>
							        </div>
							      </div>
							      <div class="carousel-item">
							        <img src="img/carr3.jpg" class="d-block w-100" alt="...">
							        <div class="carousel-caption d-none d-md-block">
							          <h5>Comparte tus intereses</h5>
							          <p>Aficiones, deportes, aspiraciones... compártelo con los demás.</p>
							        </div>
							      </div>
   				 				</div>
   				 				
							    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
							      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							      <span class="sr-only">Previous</span>
							    </a>
							    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
							      <span class="carousel-control-next-icon" aria-hidden="true"></span>
							      <span class="sr-only">Next</span>
							    </a>
							    
  					</div>
				</div>

<!-- login -->
	
				<%  HttpServletRequest httpRequest = (HttpServletRequest) request;
					String loginURI = httpRequest.getContextPath() + "/Login"; %>
				<form class= "h-75 mt-5 rounded border border-dark col-lg-6 col-m-6 col-12 d-flex justify-content-center order-lg-2 order-m-2 order-sm-1" action="<%=loginURI %>"  method="post">
					<fieldset>
						<label class="mt-5"><fmt:message key="login.user" />:</label><br> 
						<input type="text" name="email"
						placeholder=<fmt:message key="login.user" /> required autofocus> <br> 
						<label class="mt-3"><fmt:message key="login.password" />:</label><br> 
						<input type="password" name="password"
						placeholder=<fmt:message key="login.password" /> required><br>
						<input class="btn btn-danger mb-5 mt-4 col-12" type="submit" value="<fmt:message key="login.login" />">
					</fieldset>
					
				</form>
				
				<!-- div oculto con error de logado -->
				<%
			    if(null!=request.getAttribute("errorMessage"))
			    {%>
			        <div class="alert alert-danger ml-lg-3 mr-lg-3 mt-5 mg-3 col-12 order-3" role="alert"> <p class="text-center"><fmt:message key="login.error" /></p></div>
			    <%}%>
			    
			    <ul class="list-group ml-lg-3 mr-lg-3 mt-5 mg-3 mb-2 col-12 order-4">
					  <li class="list-group-item list-group-item-dark"><strong>Pautas para la comunidad:</strong> lo siguiente queda prohibido y puede ser motivo de no ingreso, modificación de su perfil o expulsión.</li>
					  <li class="list-group-item ">Actividades Ilegales (como vender drogas o solicitación sexual)</li>
					  <li class="list-group-item ">Spam o publicidad</li>
					  <li class="list-group-item ">Acoso o abuso de cualquier tipo</li>
					  <li class="list-group-item ">Discriminación o contenido que incite al odio de cualquier tipo</li>
					  <li class="list-group-item ">Desnudez o Pornografia</li>
					  <li class="list-group-item ">Menor(es) de edad</li>
					  <li class="list-group-item ">Usurpación de identidad(es)</li>
				</ul>

		</div>
	</div>
</body>
</html>

