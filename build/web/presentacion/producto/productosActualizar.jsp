<%-- 
    Document   : productosActualizar
    Created on : 26/10/2021, 06:29:08 PM
    Author     : Manuel
--%>

<%@page import="Clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Clases.Producto"%>
<!DOCTYPE html>
<%
    HttpSession sesion= request.getSession();
    Persona USUARIO=null;
    if(sesion.getAttribute("usuario")==null)response.sendRedirect("../index.jsp?Error=2");//acceso no valido
    else USUARIO=(Persona) sesion.getAttribute("usuario");
    
    Producto producto=new Producto();
    //TipoProducto tipoProducto=new TipoProducto(null);
    switch(request.getParameter("accion")){
        case "Adicionar":
            producto.setIdPersona(request.getParameter("idPersona"));
            producto.setNombre(request.getParameter("nombre"));
            producto.setEtiqueta(request.getParameter("etiqueta"));
            producto.setValor(request.getParameter("valor"));
            producto.setCantidad(request.getParameter("cantidad"));
            producto.guardar();
            break;
        case "Modificar":
            producto.setId(request.getParameter("id"));
            producto.setIdPersona(request.getParameter("idPersona"));
            producto.setNombre(request.getParameter("nombre"));
            producto.setEtiqueta(request.getParameter("etiqueta"));
            producto.setValor(request.getParameter("valor"));
            producto.setCantidad(request.getParameter("cantidad"));
            producto.modificar();
            break;
        case "Eliminar":
            producto.setId(request.getParameter("id"));
            producto.eliminar();
            break;
    }
    //response.sendRedirect("principal.jsp?CONTENIDO=configuracion/usuarios.jsp");
%>
<script type="text/javascript"> 
    location="principal.jsp?CONTENIDO=producto/productos.jsp"
</script>
