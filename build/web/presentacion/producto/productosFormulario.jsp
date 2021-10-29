<%-- 
    Document   : productosFormulario
    Created on : 26/10/2021, 06:34:19 PM
    Author     : Manuel
--%>

<%@page import="Clases.TipoPersona"%>
<%@page import="Clases.Producto"%>
<%@page import="Clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //validar
    HttpSession sesion= request.getSession();
    Persona USUARIO=null;
    if(sesion.getAttribute("usuario")==null)response.sendRedirect("../index.jsp?Error=2");//acceso no valido
    else USUARIO=(Persona) sesion.getAttribute("usuario");
    
    //String lista="";
    //String filtro="identificacionAdministrador='"+USUARIO.getIdentificacion()+"'";
    //TipoProducto tipoProducto=TipoProducto.getListaEnObjetos(filtro).get(0);
    String titulo="Adicionar";
    Producto producto=null;
    if(request.getParameter("id")!=null){
        titulo="Modificar";
        producto=new Producto(request.getParameter("id"));
    }else producto=new Producto();
        
 %>

 <h3><%=titulo.toUpperCase()%> PRODUCTOS</h3>
 <div class="caja2">
    <form id="for" class="form-agregar" name="formulario" method="post" action="principal.jsp?CONTENIDO=producto/productosActualizar.jsp">
        <table border="1">
            <tr><th>Id Usuario(*)</th><td><select name="idPersona"><%=Persona.getListaEnOptions("")%></select></td></tr>
            <tr><th>Nombre(*)</th><td><input class="formu" type="text" name="nombre" value="<%=producto.getNombre()%>"></td></tr>
            <tr><th>Etiqueta(*)</th><td ><input class="formu" type="text" name="etiqueta" value="<%=producto.getEtiqueta()%>"></td></tr>
            <tr><th>Valor(*)</th><td><input class="formu" type="text" name="valor" value="<%=producto.getValor()%>" size="50" maxlength="80" required></td></tr>
            <tr><th>Cantidad(*)</th><td><input class="formu" type="text" name="cantidad" value="<%=producto.getCantidad()%>" size="50" maxlength="80" required></td></tr>
        </table><p>
            <div class="botones">
               <input type="hidden" name="id" value="<%=producto.getId()%>">
               <input type="submit" name="accion" value="<%=titulo%>">
            </div>
    </form>
    
</div>
<div>
    <img src="imagenes/productos.jpg"  width="80%">
</div>