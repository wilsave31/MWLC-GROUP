<%-- 
    Document   : usuariosActualizar
    Created on : 7/10/2021, 07:57:25 AM
    Author     : Manuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Clases.Persona" %>
<%@page import="Clases.TipoPersona" %>
<!DOCTYPE html>
<%
    HttpSession sesion= request.getSession();
    Persona USUARIO=null;
    if(sesion.getAttribute("usuario")==null)response.sendRedirect("../index.jsp?Error=2");//acceso no valido
    else USUARIO=(Persona) sesion.getAttribute("usuario");

    Persona persona=new Persona();
    //TipoPersona tipoPersona=new TipoPersona(null);
    switch(request.getParameter("accion")){
        case "Adicionar":
            persona.setNombres(request.getParameter("nombres"));
            persona.setUsuario(request.getParameter("usuario"));
            persona.setClave(request.getParameter("clave"));
            persona.setTipo(request.getParameter("tipo"));
            persona.guardar();
            break;
        case "Modificar":
            persona.setId(request.getParameter("id"));
            persona.setNombres(request.getParameter("nombres"));
            persona.setUsuario(request.getParameter("usuario"));
            persona.setClave(request.getParameter("clave"));
            persona.setTipo(request.getParameter("tipo"));
            persona.modificar();
            break;
        case "Eliminar":
            persona.setId(request.getParameter("id"));
            persona.eliminar();
            break;
    }
    //response.sendRedirect("principal.jsp?CONTENIDO=configuracion/usuarios.jsp");
%>
<script type="text/javascript"> 
    location="principal.jsp?CONTENIDO=configuracion/usuarios.jsp"
</script>
