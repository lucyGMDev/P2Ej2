<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

    String nextPage= "../../index.jsp";
    String messageNextPage="";

    String email=request.getParameter("email");
    String contraseña=request.getParameter("password");

    if(email!=null){
        messageNextPage="Vengo del controller";
    }else{
        nextPage="../view/loginView.jsp";
    }

%>

<jsp:forward page="<%=nextPage%>">
	<jsp:param value="<%=messageNextPage%>" name="message"/>
</jsp:forward>