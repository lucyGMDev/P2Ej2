<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Página de registro</title>
        <meta charset="UTF-8"/>
        <style>
            label
            {
                display: inline-block;
                width: 80em;
            }
        </style>
    </head>
    <body>

        <form action="../control/signUpController.jsp" method="post">
        	<label for="Email">Email</label>
            <input type="text" name="Email" size="50" required>
            <label for="password">Contraseña</label>
            <input type="password" name="password" size="50" required>
            <label for="again_password">Repita la contraseña</label>
            <input type="password" name="again_password" size="50" required>
            <label for="Nombre">Nombre</label>
            <input type="text" name="Nombre" size="30" required>
            <label for="Apellidos">Apellidos</label>
            <input type="text" name="Apellidos" size="100" required>
            <label for="Fecha_Nacimiento">Fecha de nacimiento</label>
            <input type="date" name="Fecha_Nacimiento" required>
            <p> Intereses </p>
     		    <label><input type="checkbox" name="interes" value="1"> Lectura</label>
     		    <label><input type="checkbox" name="interes" value="2"> Cine</label>
     		    <label><input type="checkbox" name="interes" value="3"> Deportes</label>
     		    <label><input type="checkbox" name="interes" value="4"> Videojuegos</label>
     		    <label><input type="checkbox" name="interes" value="5"> Música</label>
     		    <label><input type="checkbox" name="interes" value="6"> Series</label>
     		    <label><input type="checkbox" name="interes" value="7"> Programación</label>
     		    <label><input type="checkbox" name="interes" value="8"> Fotografía</label>
     		    <label><input type="checkbox" name="interes" value="9"> Pintura</label>
     		    <label><input type="checkbox" name="interes" value="10"> Baile</label>
            
     		<br> <br>
            <input type="submit" value="Registrarse">   
          
        </form>
          
    </body>


</html>
