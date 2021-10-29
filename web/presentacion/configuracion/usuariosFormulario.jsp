<%-- 
    Document   : usuariosFormulario
    Created on : 7/10/2021, 07:57:47 AM
    Author     : Manuel
--%>

<%@page import="Clases.Persona" %>
<%@page import="Clases.TipoPersona" %>

<%
    //validar
    HttpSession sesion= request.getSession();
    Persona USUARIO=null;
    if(sesion.getAttribute("usuario")==null)response.sendRedirect("../index.jsp?Error=2");//acceso no valido
    else USUARIO=(Persona) sesion.getAttribute("usuario");
    
    String titulo="Adicionar";
    Persona persona=null;
    if(request.getParameter("id")!=null){
        titulo="Modificar";
        persona=new Persona(request.getParameter("id"));
    }else persona=new Persona();
        
 %>
 
 <h3><%=titulo.toUpperCase()%> INTEGRANTE DE LA FINCA</h3>
 <form id="for" name="formulario" method="post" action="principal.jsp?CONTENIDO=configuracion/usuariosActualizar.jsp">
     <table border="1">
         <tr><th>Nombre(*)</th><td><input type="text" name="nombres" value="<%=persona.getNombres()%>" size="50" maxlength="50" required></td></tr>
         <tr><th>Usuario(*)</th><td><input type="text" name="usuario" value="<%=persona.getUsuario()%>" size="50" maxlength="50" required></td></tr>
         <tr><th>Clave(*)</th><td><input type="password" name="clave" value="<%=persona.getClave()%>" size="50" maxlength="32" required></td></tr>
         <tr><th>Tipo(*)</th><td><select name="tipo"><%=TipoPersona.getListaEnOptions()%></select></td></tr>
         
     </table><p>
         
         <input type="hidden" name="id" value="<%=persona.getId()%>">
         <input type="submit" name="accion" value="<%=titulo%>">
     
 </form>
