<%-- 
    Document   : ventasActualizar
    Created on : 26/10/2021, 07:13:54 PM
    Author     : Manuel
--%>

<%@page import="Clases.Venta"%>
<%@page import="Clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion= request.getSession();
    Persona USUARIO=null;
    if(sesion.getAttribute("usuario")==null)response.sendRedirect("../index.jsp?Error=2");//acceso no valido
    else USUARIO=(Persona) sesion.getAttribute("usuario");
    
    Venta venta=new Venta();
    //TipoVenta tipoVenta=new TipoVenta(null);
    switch(request.getParameter("accion")){
        case "Adicionar":
            venta.setIdPersona(request.getParameter("idPersona"));
            venta.setFecha(request.getParameter("fecha"));
            venta.setIdNombre(request.getParameter("idNombre"));
            venta.setMarca(request.getParameter("marca"));
            venta.setValor(request.getParameter("valor"));
            venta.setCantidad(request.getParameter("cantidad"));
            venta.guardar();
            break;
        case "Modificar":
            venta.setId(request.getParameter("id"));
            venta.setIdPersona(request.getParameter("idPersona"));
            venta.setFecha(request.getParameter("fecha"));
            venta.setIdNombre(request.getParameter("idNombre"));
            venta.setMarca(request.getParameter("marca"));
            venta.setValor(request.getParameter("valor"));
            venta.setCantidad(request.getParameter("cantidad"));
            venta.modificar();
            break;
        case "Eliminar":
            venta.setId(request.getParameter("id"));
            venta.eliminar();
            break;
    }
    //response.sendRedirect("principal.jsp?CONTENIDO=configuracion/usuarios.jsp");
%>
<script type="text/javascript"> 
    location="principal.jsp?CONTENIDO=venta/ventas.jsp"
</script>
