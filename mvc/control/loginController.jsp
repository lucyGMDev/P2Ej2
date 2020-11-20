<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="customerBean" scope="session" class="es.uco.pw.display.useBean.CustomerBean"></jsp:useBean>
<%@ page import="es.uco.pw.data.dao.Usuario.ContactoDAO"%>
<%@ page import="es.uco.pw.business.Usuario.Contacto"%>
<%

    String nextPage= "../../index.jsp";
    String messageNextPage="mensaje inicial";

    String email=request.getParameter("email");
    String contraseña=request.getParameter("password");

    if(customerBean== null || customerBean.getEmail().equals("")){
        if(email!=null){
            String dataBasePath="/opt/tomcat/latest/webapps/ControlContactos/WEB-INF/sql.properties";
            ContactoDAO contactoDAO = new ContactoDAO(dataBasePath);
            Contacto contact = contactoDAO.ObtenerContactoById(email);
            if(contact!=null){//El contacto existe
                String contraseña_usuario=contactoDAO.ObtenerPasswordUsuario(email);
                if(contraseña_usuario.equals(contraseña)){
%> 
                    <jsp:setProperty property="email" value="<%=email%>" name="customerBean"/>
                    <jsp:setProperty property="contraseña" value="<%=contraseña%>" name="customerBean"/>
                    messageNextPage="El usuario con email "+email+" existe";
<%
                }else{
                    //nextPage="../view/loginView.jsp";
                    messageNextPage="La contraseña es incorrecta";
                }                
            }else{
                nextPage="../../index.jsp";
                messageNextPage="No existe ningun contacto con email "+email;
            }
        }else{
            nextPage="../view/loginView.jsp";
        }
    }

%>

<jsp:forward page="<%=nextPage%>">
	<jsp:param value="<%=messageNextPage%>" name="message"/>
</jsp:forward>