<%-- 
    Document   : comprasFormulario
    Created on : 26/10/2021, 06:59:23 PM
    Author     : Manuel
--%>

<%@page import="ClasesGenericas.Fechas"%>
<%@page import="Clases.TipoPersona"%>
<%@page import="Clases.Compra"%>
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
    //TipoCompra tipoCompra=TipoCompra.getListaEnObjetos(filtro).get(0);
    String titulo="Adicionar";
    Compra compra=null;
    if(request.getParameter("id")!=null){
        titulo="Modificar";
        compra=new Compra(request.getParameter("id"));
    }else compra=new Compra();
        
 %>
 
 <h3><%=titulo.toUpperCase()%> COMPRAS</h3>
 <form id="for" class="form-agregar" name="formulario" method="post" action="principal.jsp?CONTENIDO=compra/comprasActualizar.jsp">
     <table border="1">
         <tr><th>Id Usuario(*)</th><td><select name="idPersona"><%=Persona.getListaEnOptions("")%></select></td></tr>
         <tr><th>Fecha(*)</th><td><input class="formu" type="text" name="fecha" value="<%=Fechas.obtenerFechaActual()%>"></td></tr>
         <tr><th>Nombre(*)</th><td><input class="formu" type="text" name="nombre" value="<%=compra.getNombre()%>"></td></tr>
         <tr><th>Marca(*)</th><td ><input class="formu" type="text" name="marca" value="<%=compra.getMarca()%>"></td></tr>
         <tr><th>Valor(*)</th><td><input class="formu" type="text" name="valor" value="<%=compra.getValor()%>" size="50" maxlength="80" required></td></tr>
         <tr><th>Cantidad(*)</th><td><input class="formu" type="text" name="cantidad" value="<%=compra.getCantidad()%>" size="50" maxlength="80" required></td></tr>
     </table><p>
         
         <input type="hidden" name="id" value="<%=compra.getId()%>">
         <input type="submit" name="accion" value="<%=titulo%>">
     
 </form>
 
