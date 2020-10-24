<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.iesalixar.jmanuellopezh.model.User"%>
<%@ page import="java.util.List"%>

	<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@page import="javax.servlet.http.HttpServletRequest" %>
	<%@page import="javax.servlet.ServletRequest" %>
	
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <LINK REL=StyleSheet HREF="custom.css" TYPE="text/css" MEDIA=screen>
    <title>MeetGrid - Mi perfil</title>
    <link rel="icon" type="image/png" href="img/logosmall.png">
</head>
<body>

		<%  HttpServletRequest httpRequest = (HttpServletRequest) request;
		String updateURI = httpRequest.getContextPath() + "/UpdateAdmin";%>

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
              <a class="nav-link" href="ReadReports">Gestionar reportes</a>
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

<% User u = (User) session.getAttribute("visit"); %>


      <!--parte del perfil-->

      <div class="container">
      <h3 class="mt-3">Datos actuales:</h3>
        <div class="row mt-3 rounded border border-dark">

                <img src="<%=u.getPic() %>" alt="<%=u.getName() %>" class="img img-responsive full-width mh-100 mt-2 ml-2 mb-2 rounded col-lg-5 col-m-4 col-sm-12" />

                <div class="col-lg-6 col-m-5 col-sm-12">
                    <h1><%=u.getName() %></h1>
                    <cite><%=u.getArea() %></cite>
                    <p><%=u.getGenderFull() %>, <%=u.getAge() %> años</p>
                    <h5>Sobre mí:</h5>
                    <p class="rounded border border-dark row ml-1 mr-1 mt-4 p-2 col-12">

                        <%=u.getDescription() %>

                    </p>


                </div>

        </div>
        <!--MODIFICAR PERFIL-->
        	<h3 class="mt-3">Modificar datos:</h3>
			
				<form class= "mt-3 mb-3 rounded border border-dark form-row" action=<%=updateURI %> method="post" id="form">
					<fieldset class="col-12">
						
						<label>Contraseña</label>
						<input class="form-control" type="password" name="password" id="pass" onblur="compruebaPass()" placeholder="Puede contener numeros y letras, min 6 max 10 caracteres. Una vez introduzca uno valido se generara el campo para repetir contraseña.">
						<div id="otravez"></div>
						
						<label>Nombre de usuario</label>
						<input class="form-control" type="text" name="name" id="usuario" onblur="compruebaUsuario()" placeholder="Letras mayusculas, minusculas y numeros entre 1 y 15 caracteres">
						<label>Edad</label>
						<input class="form-control" type="text" name="age" id="edad" onblur="compruebaEdad()" placeholder="La edad debe ser mínimo 18 años, sólo se admiten números">
						
						<div class="input-group mt-3">
			                    <div class="input-group-prepend">
			                      <label class="input-group-text" for="inputGroupSelect01">Género</label>
			                    </div>
			                    <select class="custom-select" id="inputGroupSelect01" name="gender">
			                      <option selected disabled>Selecciona...</option>
			                      <option value="M">Mujer</option>
			                      <option value="H">Hombre</option>
			                      <option value="N">No binario</option>
			                    </select>
			                </div>
						
						
						<div class="input-group mt-3">
			                    <div class="input-group-prepend">
			                      <label class="input-group-text" for="inputGroupSelect01">Provincia</label>
			                    </div>
			                    <select class="custom-select" id="inputGroupSelect01" name="area">
			                      <option selected disabled>Selecciona...</option>
			                      <option value="Álava (Araba)">Álava (Araba)</option>
			                      <option value="Albacete">Albacete</option>
			                      <option value="Alicante">Alicante</option>
			                      <option value="Almería">Almería</option>
			                      <option value="Asturias">Asturias</option>
			                      <option value="Ávila">Ávila</option>
			                      <option value="Badajoz">Badajoz</option>
			                      <option value="Barcelona">Barcelona</option>
			                      <option value="Burgos">Burgos</option>
			                      <option value="Cáceres">Cáceres</option>
			                      <option value="Cádiz">Cádiz</option>
			                      <option value="Cantabria">Cantabria</option>
			                      <option value="Castellón">Castellón</option>
			                      <option value="Ciudad Real">Ciudad Real</option>
			                      <option value="Córdoba">Córdoba</option>
			                      <option value="Cuenca">Cuenca</option>
			                      <option value="Gerona (Girona)">Gerona (Girona)</option>
			                      <option value="Granada">Granada</option>
			                      <option value="Guadalajara">Guadalajara</option>
			                      <option value="Guipúzcoa (Gipuzkoa)">Guipúzcoa (Gipuzkoa)</option>
			                      <option value="Huelva">Huelva </option>
			                      <option value="Huesca">Huesca</option>
			                      <option value="Islas Baleares">Islas Baleares</option>
			                      <option value="Jaén">Jaén</option>
			                      <option value="La Coruña (A Coruña)">La Coruña (A Coruña)</option>
			                      <option value="La Rioja">La Rioja</option>
			                      <option value="Las Palmas">Las Palmas</option>
			                      <option value="León">León</option>
			                      <option value="Lérida (Lleida)">Lérida (Lleida)</option>
			                      <option value="Lugo">Lugo</option>
			                      <option value="Madrid">Madrid</option>
			                      <option value="Málaga">Málaga</option>
			                      <option value="Murcia">Murcia</option>
			                      <option value="Navarra">Navarra</option>
			                      <option value="Orense (Ourense)">Orense (Ourense)</option>
			                      <option value="Palencia">Palencia</option>
			                      <option value="Pontevedra">Pontevedra</option>
			                      <option value="Salamanca">Salamanca</option>
			                      <option value="Santa Cruz de Tenerife">Santa Cruz de Tenerife</option>
			                      <option value="Segovia">Segovia</option>
			                      <option value="Sevilla">Sevilla</option>
			                      <option value="Soria">Soria</option>
			                      <option value="Tarragona">Tarragona</option>
			                      <option value="Teruel">Teruel</option>
			                      <option value="Toledo">Toledo</option>
			                      <option value="Valencia">Valencia</option>
			                      <option value="Valladolid">Valladolid</option>
			                      <option value="Vizcaya (Bizkaia)">Vizcaya (Bizkaia)</option>
			                      <option value="Zamora">Zamora</option>
			                      <option value="Zaragoza">Zaragoza</option>
			                    </select>
			                </div>
						
						
						<label>Foto de perfil</label>
						<input class="form-control" type="text" name="pic">
						
						<label>Sobre mi:</label>
						<textarea class="form-control" rows="10" type="text" name="description"></textarea>
						<input type="hidden" name="id"  value="<%=u.getId() %>"/>
						<button class="btn btn-danger col-12 col-m-6 col-lg-6 offset-m-3 offset-lg-3 mt-2 mb-2" type="submit" value="update">Modificar perfil</button>
						
					</fieldset>
					
					
					
				</form>
				
	</div>
</body>

<script type="text/javascript">

//funciones de verificacion de datos

    function compruebaEmail() {
        expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        email = document.getElementById("email").value;
        if (!expr.test(email) && email != "") {

            document.getElementById("email").style.backgroundColor = "red";


        } 
        else if (expr.test(email)) {
            document.getElementById("email").style.backgroundColor = "lightgreen";
        }
    }

    function compruebaPass() {
        expr = /^([a-zA-Z0-9]{6,10})+$/;
        pass = document.getElementById("pass").value;
        if (!expr.test(pass) && pass != "") {

            document.getElementById("pass").style.backgroundColor = "red";
 
            
        } else if  (expr.test(pass)){
            document.getElementById("pass").style.backgroundColor = "lightgreen";

            //CREACION DE NODO SI SE INTRODUCE CORRECTO EL PRIMER PASSWORD PARA REPETIRLO
            
            //<label>Repita la contraseña</label>
			//<input class="form-control" type="password" name="repeatpassword" required onblur="compruebaPass()" placeholder="Puede contener numeros y letras, min 6 max 10 caracteres. Una vez introduzca uno valido se generara el campo para repetir contraseña." >
						
            var node = document.createElement('input');
            node.id=("passotra");//podemos añadir attr al nodo ya predefinidos
            node.className=("form-control");
            node.setAttribute('onblur', "compruebaPassOtra()");//o crearlos nosotros
            node.placeholder=("Repita su contraseña");
            node.type=("password");
            node.name=("repeatpassword");

            var texto = ('');
            var textnode = document.createTextNode(texto); 
            node.appendChild(textnode);
            document.getElementById("otravez").appendChild(node);
        }
    }

    function compruebaPassOtra() {
        expr = /^([a-zA-Z0-9]{6,10})+$/;
        passotra = document.getElementById("passotra").value;
        pass = document.getElementById("pass").value;
        if (!expr.test(passotra) && passotra != "") {

            document.getElementById("passotra").style.backgroundColor = "red";

            
        } 
        else if(expr.test(passotra) && (pass==passotra)){
            document.getElementById("passotra").style.backgroundColor = "lightgreen";
        }

    }
    
    function compruebaEdad() {
        expr = /^(1[89]|[2-9][0-9]|1([0-3][0-9]|40))$/;
        email = document.getElementById("edad").value;
        if (!expr.test(email) && email != "") {

            document.getElementById("edad").style.backgroundColor = "red";


        } 
        else if (expr.test(email)) {
            document.getElementById("edad").style.backgroundColor = "lightgreen";
        }
    }

</script>

</html>