<%-- 
    Document   : ventasFormulario
    Created on : 26/10/2021, 07:15:37 PM
    Author     : Manuel
--%>

<%@page import="Clases.Producto"%>
<%@page import="ClasesGenericas.Fechas"%>
<%@page import="Clases.TipoPersona"%>
<%@page import="Clases.Persona"%>
<%@page import="Clases.Venta"%>
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
    //Tipoventa tipoventa=Tipoventa.getListaEnObjetos(filtro).get(0);
    String titulo="Adicionar";
    Venta venta=null;
    if(request.getParameter("id")!=null){
        titulo="Modificar";
        venta=new Venta(request.getParameter("id"));
    }else venta=new Venta();
        
 %>
 
 <h3><%=titulo.toUpperCase()%> VENTAS</h3>
 <form id="for" class="form-agregar" name="formulario" method="post" action="principal.jsp?CONTENIDO=venta/ventasActualizar.jsp">
     <table border="1">
         <tr><th>Id Usuario(*)</th><td><select name="idPersona"><%=Persona.getListaEnOptions("")%></select></td></tr>
         <tr><th>Fecha(*)</th><td><input class="formu" type="text" name="fecha" value="<%=Fechas.obtenerFechaActual()%>"></td></tr>
         <tr><th>Nombre(*)</th><td><select name="idNombre"><%=Producto.getListaEnOptions("")%></select></td></tr>
         <tr><th>Marca(*)</th><td ><input class="formu" type="text" name="marca" value="<%=venta.getMarca()%>"></td></tr>
         <tr><th>Valor(*)</th><td><input class="formu" type="text" name="valor" value="<%=venta.getValor()%>" size="50" maxlength="80" required></td></tr>
         <tr><th>Cantidad(*)</th><td><input class="formu" type="text" name="cantidad" value="<%=venta.getCantidad()%>" size="50" maxlength="80" required></td></tr>
     </table><p>
         
         <input type="hidden" name="id" value="<%=venta.getId()%>">
         <input type="submit" name="accion" value="<%=titulo%>">
     
 </form>
