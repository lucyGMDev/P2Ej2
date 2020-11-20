<!DOCTYPE html>



<html lang="es">
    <head>
        <title>Inicio de sesi&oacute;n</title>
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
        	<label for="Email">Email</label>
            <input type="text" name="Email" size="50" required>
            <br>
            <label for="password">Contrase&ntilde;a</label>
            <input type="password" name="password" size="50" required>
     		<br> <br>
            <input type="submit" value="Iniciar sesi&oacute;n">   
          
        </form>
          
    </body>


</html>
