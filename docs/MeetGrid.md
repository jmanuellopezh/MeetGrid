# MeetGrid

A continuación se detallan los requisitos técnicos para el funcionamiento de esta aplicación de mensajería.


## Base de datos

Aquí detallamos las diferentes tablas de nuestra BD, así como sus campos. Más aclaraciones abajo.

USER (**email**, password, role, age, gender, area)

MESSAGE (**id**, sender, receiver, content, date)

FAVORITE (**id**, owner, user)

BLOCK (**id**, owner, user)

REPORT (**id**, owner, reported, content)

>Las ID están marcadas en negrita.

>Todas las tablas tienen una id long autogenerada menos USER, que es el email que introduce el usuario.

## Mapa del sitio

Aquí se detallan las subpáginas según rol de usuario que se mostrarán, su cometido, las acciones sobre la BD que realizarán y mediante qué trámite en nuestro servlet lo harán.

### GENERAL

**LOGIN**
* Busca coincidencia de usuario registrado en la BD para dejarlo entrar en la aplicación.
* Si es user lleva a PERFILES, si es admin a BIENVENIDO, si no está registrado vuelve a LOGIN.
* READ de USER.
* Guarda en sesión ROLE, ID. (doPost)

**REGISTRO** 
* Crea nuevo usuario en la BD.
* CREATE en USER. (doPost)


### ROL USER

**PERFILES**
* Muestra los perfiles aplicando los filtros que el usuario elija.
* Al pulsar sobre algún perfil permite ir a la pantalla MENSAJE. 
* Tambien permite poner como favoritos, bloquear y reportar. Para ésto cada perfil tendrá 3 enlaces debajo con estas opciones. Se tomará el ID en session (para reportes) al pulsar sobre ellos y se hará favorito/bloqueado o bien se llevará a la página de reportes.
* UPDATE de FAVORITE / BLOCK. (doPost)
* READ de USER. (doGet)

**CONVERSACIONES** 
* Muestra el último mensaje de cada conversación iniciada.
* Al pulsar sobre ella lleva a la pantalla MENSAJE. 
* READ de MESSAGE. (doGet)

**MENSAJE**
* Permite ver mensajes previos con el id del usuario sobre el que hemos pulsado para acceder a ella.
* Permite crear nuevo mensaje para este usuario.
* READ de MESSAGE. (doGet)
* CREATE en MESSAGE. (doPost)

**FAVORITOS**
* Visualiza nuestros usuarios favoritos y lleva a la pantalla MENSAJE al pulsar sobre ellos.
* Permite quitar de lista de favoritos.
* READ de FAVORITE. (doGet)
* DELETE de FAVORITE. (doPost)

**REPORTAR**
* Permite reportar un usuario por conducta indebida con un mensaje a los admin.
* CREATE en REPORT. (doPost)

**AJUSTES**
* Visualizamos todos nuestros datos.
* Permite modificar nuestros datos de perfil, como la edad o la zona geografica.
* READ de USER. (doGet)
* UPDATE de USER. (doPost)

**DARSE DE BAJA**
* Permite borrar el usuario logado de la BD.
* DELETE de USER. (doPost)

### ROL ADMIN

**BIENVENIDO**
* Página simple con datos del admin logado.
* READ de USER. (doGet)

**REPORTES**
* Lee los usuarios reportados por otros, junto con el mensaje del reporte.
* READ de REPORT. (doGet)

**MODIFICAR PERFIL**
* Accede a los perfiles y permite modificarlos.
* READ de USER. (doGet)
* UPDATE en USER. (doPost)

**BANEAR**
* Permite borrar un usuario de nuestra elección de nuestra aplicación (es distinta de DARSE DE BAJA en que no borra nuestro ID, sino uno de nuestra elección)
* READ de USER (doGet)
* DELETE de USER (doPost)

## DISEÑO

El diseño será material, de colores planos, aprovechando convenciones y usando para ello Bootstrap 4.

Se hará adaptativo a pantallas grandes (PC) y móvil.

Cada pantalla de rol user y admin tendrá la misma barra de navegación para moverse por la página.

Los colores de la aplicación serán blanco para los fondos, negro para el contenido y rojo para resaltar.

## EFECTOS JAVASCRIPT
En principio están planeados los siguientes elementos a nivel de cliente:

*Control de formularios con regex, efectos hover y cambios de color según comprobaciones en métodos.

*Animaciones para transmisión entre páginas. (MÍNIMA, casi imperceptible)

*Tema oscuro, que jugará con las clases boostrap para convertir elementos blancos en negros y viceversa.
