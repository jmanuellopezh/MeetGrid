<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <LINK REL=StyleSheet HREF="custom.css" TYPE="text/css" MEDIA=screen>
    <title>MeetGrid</title>
    <link rel="icon" type="image/png" href="img/logosmall.png">
</head>
<body>
    <!--header y barra de navegacion-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-danger">
        <img src="img/logosmall.png" width="40" height="40" class="d-inline-block align-top" alt="MeetGrid">
        <a class="navbar-brand" href="#">MeetGrid</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="#">Perfiles <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Mensajes</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Favoritos</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Ajustes de perfil</a>
              </li>
          </ul>
          <span class="navbar-text">
            Usuario: 
          </span>
        </div>
      </nav>

      <!--barra con los filtros-->
      <nav class="navbar navbar-expand-lg navbar-light bg-light ">
        <a class="navbar-brand">Filtros:</a>
        
          
          <form class="form-inline mx-auto">
            
            
            
                <li class="input-group mr-1">
                    <div class="input-group-prepend">
                      <label class="input-group-text" for="inputGroupSelect01">Género</label>
                    </div>
                    <select class="custom-select" id="inputGroupSelect01">
                      <option selected>Selecciona...</option>
                      <option value="mujer">Mujer</option>
                      <option value="hombre">Hombre</option>
                      <option value="nobin">No binario</option>
                    </select>
                </li>
    
                <li class="input-group mr-1">
                    <div class="input-group-prepend">
                      <label class="input-group-text" for="inputGroupSelect01">Provincia</label>
                    </div>
                    <select class="custom-select" id="inputGroupSelect01">
                      <option selected>Selecciona...</option>
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
                </li>
            <input class="form-control mr-1" type="search" placeholder="Edad mínima" aria-label="Search">
            <input class="form-control mr-1" type="search" placeholder="Edad máxima" aria-label="Search">
            <button class="btn btn-outline-danger my-2" type="submit">Aplicar filtros</button>
          </form>
      </nav>

      <!--grid de perfiles-->
      <div class="row ml-3 mr-3 pt-4">
        <div class="card col-lg-2 col-sm-6">

          <div class="image">
            <img src="img/fake/cloud.jpg" class="img img-responsive full-width mt-2" />
          </div>

          <div class="card-body">
            <h5 class="card-title">Cloud</h5>
            <p class="card-text">Edad:</p>
            <p class="card-text"><small class="text-muted">Provincia:</small></p>
          </div>
        </div>

        <div class="card col-lg-2 col-sm-6">

          <div class="image">
            <img src="img/fake/tifa.jpg" class="img img-responsive full-width mt-2" />
          </div>

          <div class="card-body">
            <h5 class="card-title">Tifa</h5>
            <p class="card-text">Edad:</p>
            <p class="card-text"><small class="text-muted">Provincia:</small></p>
          </div>
        </div>

        <div class="card col-lg-2 col-sm-6">

          <div class="image">
            <img src="img/fake/barret.jpg" class="img img-responsive full-width mt-2" />
          </div>

          <div class="card-body">
            <h5 class="card-title">Barret</h5>
            <p class="card-text">Edad:</p>
            <p class="card-text"><small class="text-muted">Provincia:</small></p>
          </div>
        </div>

        <div class="card col-lg-2 col-sm-6">

          <div class="image">
            <img src="img/fake/aeris.jpg" class="img img-responsive full-width mt-2" />
          </div>

          <div class="card-body">
            <h5 class="card-title">Aeris</h5>
            <p class="card-text">Edad:</p>
            <p class="card-text"><small class="text-muted">Provincia:</small></p>
          </div>
        </div>

        <div class="card col-lg-2 col-sm-6">

          <div class="image">
            <img src="img/fake/nathan.png" class="img img-responsive full-width mt-2" />
          </div>

          <div class="card-body">
            <h5 class="card-title">Nathan</h5>
            <p class="card-text">Edad:</p>
            <p class="card-text"><small class="text-muted">Provincia:</small></p>
          </div>
        </div>

        <div class="card col-lg-2 col-sm-6">

          <div class="image">
            <img src="img/fake/lara.png" class="img img-responsive full-width mt-2" />
          </div>

          <div class="card-body">
            <h5 class="card-title">Lara</h5>
            <p class="card-text">Edad:</p>
            <p class="card-text"><small class="text-muted">Provincia:</small></p>
          </div>
        </div>

        <div class="card col-lg-2 col-sm-6">

          <div class="image">
            <img src="img/fake/johnny.jpg" class="img img-responsive full-width mt-2" />
          </div>

          <div class="card-body">
            <h5 class="card-title">Johhny</h5>
            <p class="card-text">Edad:</p>
            <p class="card-text"><small class="text-muted">Provincia:</small></p>
          </div>
        </div>

      </div>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>