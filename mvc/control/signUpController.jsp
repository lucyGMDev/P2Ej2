<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="customerBean" scope="session" class="es.uco.pw.display.useBean.CustomerBean"></jsp:useBean>
<%@ page import="es.uco.pw.data.dao.Usuario.ContactoDAO"%>
<%@ page import="es.uco.pw.business.Usuario.Contacto"%>

<% 
    String nextPage="../../index.jsp";
    String messageNextPage="";
    if(customerBean==null || customerBean.getEmail()==""){
        String email =request.getParameter("Email");
        if(email!=null){
            String dataBasePath="/opt/tomcat/latest/webapps/ControlContactos/WEB-INF/sql.properties";
            ContactoDAO contactoDAO=new ContactoDAO(dataBasePath);
            Contacto contact = contactoDAO.ObtenerContactoById(email);
            if(contact==null){
                String password=request.getParameter("password");
                String again_password=request.getParameter("again_password");
                if(again_password.equals(password)){
                    String nombre=request.getParameter("Nombre");
                    String fechaString = request.getParameter("Fecha_Nacimiento");
                    java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");
                    java.util.Date fecha=format.parse(fechaString);
%>
                    
<%
                }else{
                    messageNextPage="Las contraseñas no coinciden";
                    nextPage="../view/signUpView.jsp";
                }
            }else{
                messageNextPage="Ya hay un usuario con el email introducido";
                nextPage="../view/signUpView.jsp";   
            }
        }else{
            nextPage="../view/signUpView.jsp";
        }
    }
%>

<jsp:forward page="<%=nextPage%>">
	<jsp:param value="<%=messageNextPage%>" name="message"/>
</jsp:forward>