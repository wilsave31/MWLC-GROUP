<%-- 
    Document   : comprasActualizar
    Created on : 26/10/2021, 06:56:12 PM
    Author     : Manuel
--%>

<%@page import="Clases.Compra"%>
<%@page import="Clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion= request.getSession();
    Persona USUARIO=null;
    if(sesion.getAttribute("usuario")==null)response.sendRedirect("../index.jsp?Error=2");//acceso no valido
    else USUARIO=(Persona) sesion.getAttribute("usuario");
    
    Compra compra=new Compra();
    //TipoCompra tipoCompra=new TipoCompra(null);
    switch(request.getParameter("accion")){
        case "Adicionar":
            compra.setIdPersona(request.getParameter("idPersona"));
            compra.setFecha(request.getParameter("fecha"));
            compra.setNombre(request.getParameter("nombre"));
            compra.setMarca(request.getParameter("marca"));
            compra.setValor(request.getParameter("valor"));
            compra.setCantidad(request.getParameter("cantidad"));
            compra.guardar();
            break;
        case "Modificar":
            compra.setId(request.getParameter("id"));
            compra.setIdPersona(request.getParameter("idPersona"));
            compra.setFecha(request.getParameter("fecha"));
            compra.setNombre(request.getParameter("nombre"));
            compra.setMarca(request.getParameter("marca"));
            compra.setValor(request.getParameter("valor"));
            compra.setCantidad(request.getParameter("cantidad"));
            compra.modificar();
            break;
        case "Eliminar":
            compra.setId(request.getParameter("id"));
            compra.eliminar();
            break;
    }
    //response.sendRedirect("principal.jsp?CONTENIDO=configuracion/usuarios.jsp");
%>
<script type="text/javascript"> 
    location="principal.jsp?CONTENIDO=compra/compras.jsp"
</script>
