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
        	<label for="email">Email</label>
            <input type="text" name="email" size="30" required>
            <label for="password">Contraseña</label>
            <input type="password" name="password" size="30" required>
            <label for="again_password">Repita la contraseña</label>
            <input type="password" name="again_password" size="30" required>
            <label for="nombre">Nombre</label>
            <input type="text" name="nombre" size="30" required>
            <label for="apellidos">Apellidos</label>
            <input type="text" name="apellidos" size="30" required>
            <label for="birthdate">Fecha de nacimiento</label>
            <input type="date" name="birthdate" required>
            <p> Intereses </p>
     		    <label><input type="checkbox" name="interes" value="first_checkbox"> Lectura</label>
     		    <label><input type="checkbox" name="interes" value="first_checkbox"> Cine</label>
     		    <label><input type="checkbox" name="interes" value="first_checkbox"> Deportes</label>
     		    <label><input type="checkbox" name="interes" value="first_checkbox"> Videojuegos</label>
     		    <label><input type="checkbox" name="interes" value="first_checkbox"> Música</label>
     		    <label><input type="checkbox" name="interes" value="first_checkbox"> Series</label>
     		    <label><input type="checkbox" name="interes" value="first_checkbox"> Programación</label>
     		    <label><input type="checkbox" name="interes" value="first_checkbox"> Fotografía</label>
     		    <label><input type="checkbox" name="interes" value="first_checkbox"> Pintura</label>
     		    <label><input type="checkbox" name="interes" value="first_checkbox"> Baile</label>
            
     		<br> <br>
            <input type="submit" value="Registrarse">   
          
        </form>
          
    </body>


</html>
