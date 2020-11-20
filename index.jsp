<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="customerBean" scope="session" class="es.uco.pw.display.useBean.CustomerBean"></jsp:useBean>


<!DOCTYPE html>
<html>
    <head>

    </head>
    <body>
        <h1>Bienvenido</h1>
        <%
            String message = request.getParameter("message");
            if(message!=null){
        %>
            <p><%= message %></p>
            
        <%




            }
            if(customerBean!=null && !customerBean.getEmail().equals("")){
        %>
                Desde el CustomerBean: </br>
                Email: <%=customerBean.getEmail()%></br>
                Contraseña: <%=customerBean.getContraseña()%></br>
                Nombre: <%=customerBean.getNombre()%></br>
                Apellidos: <%=customerBean.getApellidos()%></br>
                Fecha: <%=customerBean.getFechaNacimiento()%></br>
                Lista Intereses: <%=customerBean.getIntereses()%></br>
        <%
            }
        %>

          <input type="button" onclick="location.href='mvc/view/loginView.jsp';" value="Iniciar sesión" />
          <input type="button" onclick="location.href='mvc/view/signUpView.jsp';" value="Registrarse" />
        
    </body>
</html>
