<!DOCTYPE html>



<html lang="es">
    <head>
        <title>Inicio de sesión</title>
        <meta charset="UTF-8"/>
        <style>
        label{
            display: inline-block;
            width: 80em;
        }
        </style>
    </head>
    <body>

        <form action="../control/loginController.jsp" method="post">
        	<label for="email">Email</label>
            <input type="text" name="email" size="30" required>
            <br>
            <label for="password">Contraseña</label>
            <input type="password" name="password" size="30" required>
     		<br> <br>
            <input type="submit" value="Iniciar sesión">   
          
        </form>
          
    </body>


</html>
