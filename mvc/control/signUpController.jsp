<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="customerBean" scope="session" class="es.uco.pw.display.useBean.CustomerBean"></jsp:useBean>
<%@ page import="es.uco.pw.data.dao.Usuario.ContactoDAO"%>
<%@ page import="es.uco.pw.business.Usuario.Contacto,es.uco.pw.business.DTO.DTOUsuario.ContactoDTO"%>

<% 
    String nextPage="../../index.jsp";
    String messageNextPage="";
    String dataBasePath=application.getInitParameter("AbsolutePath")+application.getInitParameter("sqlProperties");
    if(customerBean==null || customerBean.getEmail()==""){
        String email =request.getParameter("Email");
        if(email!=null){
            ContactoDAO contactoDAO=new ContactoDAO(dataBasePath);
            Contacto contact = contactoDAO.ObtenerContactoById(email);
            if(contact==null){
                String password=request.getParameter("password");
                String again_password=request.getParameter("again_password");
                if(again_password.equals(password)){
                    String nombre=request.getParameter("Nombre");
                    String apellidos=request.getParameter("Apellidos");
                    String fechaString = request.getParameter("Fecha_Nacimiento");
                    java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");
                    java.util.Date fecha=format.parse(fechaString);
                    String[] intereses = request.getParameterValues("interes");
                    java.util.ArrayList<String> listaIntereses=new java.util.ArrayList<String>();
                    if(intereses!=null){
                        for(int i=0;i<intereses.length;i++){
                            listaIntereses.add(intereses[i]);
                        }
                    }
                    ContactoDTO contactoDTO = new ContactoDTO(email,nombre,apellidos,fecha,listaIntereses);
                    contactoDAO.InsertarContacto(contactoDTO,password);
                    
                                        
%>                  
                    <jsp:setProperty property="email" value="<%=email%>" name="customerBean"/>
                    <jsp:setProperty property="contraseña" value="<%=password%>" name="customerBean"/>
                    <jsp:setProperty property="nombre" value="<%=contactoDTO.getName()%>" name="customerBean"/>
                    <jsp:setProperty property="apellidos" value="<%=contactoDTO.getLastName()%>" name="customerBean"/>
                    <jsp:setProperty property="fechaNacimiento" value="<%=contactoDTO.getBirthDate()%>" name="customerBean"/>
                    <jsp:setProperty property="intereses" value="<%=contactoDTO.getTagsLists()%>" name="customerBean"/>
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