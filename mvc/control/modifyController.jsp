<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="customerBean" scope="session" class="es.uco.pw.display.useBean.CustomerBean"></jsp:useBean>

<% 
    String nextPage="../../index.jsp";
    string
    if(customerBean!=null && customerBean.getEmail()!=""){

    }else{
        nextPage="../view/loginView.jsp";
    }
%>