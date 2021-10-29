<%-- 
    Document   : principal
    Created on : 25/10/2021, 05:56:24 PM
    Author     : Manuel
--%>

<%@page import="Clases.Persona"%>
<%@page import="Clases.TipoPersona"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    HttpSession sesion= request.getSession();
    Persona USUARIO=null;
    if(sesion.getAttribute("usuario")==null)response.sendRedirect("../index.jsp?Error=2");//acceso no valido
    else USUARIO=(Persona) sesion.getAttribute("usuario");
%>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
        <title> MWLC GROUP </title>
        <link rel="shortcut icon"  href="imagenes/icono.ico"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/principal.css" />
    </head>
    <body>
        <div class= "pagina">
            <div id="banner"><%= USUARIO%> </div>

            <div id="menu" class= "navbar"><%= USUARIO.getTipoEnObjeto().getMenu()%></div>

            <div class="header">
                <div class="logo">
                    <img src="imagenes/lgo3.png" width="10%">
                </div>
                <img src="imagenes/header.jpg" width="100%">
            </div>
            
            <div class="contenido">
                <div class="caja">
                    
                        <div id="contenido"><jsp:include page='<%= request.getParameter("CONTENIDO")%>' flush="true"/></div>
                    
                
                </div>
                <div class="footer">
                    <address align="center">&copy; Todos los Derechos reservados - Desarrollado por el GRUPO MWLC </address>
                </div>
            </div>
        </div>
    </body>
</html>
