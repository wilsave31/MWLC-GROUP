<%-- 
    Document   : usuarios
    Created on : 7/10/2021, 07:56:58 AM
    Author     : Manuel
--%>
<%@page import="Clases.Persona" %>
<%@page import="Clases.TipoPersona" %>
<%@page import="java.util.ArrayList" %>

<%
    //validar
    HttpSession sesion= request.getSession();
    Persona USUARIO=null;
    if(sesion.getAttribute("usuario")==null)response.sendRedirect("../index.jsp?Error=2");//acceso no valido
    else USUARIO=(Persona) sesion.getAttribute("usuario");
    
    String lista="";
    String filtro="id='"+USUARIO.getId()+"'";
    
    ArrayList<Persona> datos= Persona.getListaEnObjetos(filtro);
    
    for(int i=0;i< datos.size();i++){
        Persona persona= datos.get(i);
        lista+="<tr>";
        lista+="<td>"+persona.getId()+"</td>";
        lista+="<td>"+persona.getNombres()+"</td>";
        lista+="<td>"+persona.getUsuario()+"</td>";
        lista+="<td>"+persona.getTipo()+"</td>";
        lista+="<td>";
        lista+="<a href='principal.jsp?CONTENIDO=configuracion/usuariosFormulario.jsp&accion=Modificar&id="+persona.getId()+"' title='Modificar'>/</a>";
        lista+="<label Onclick='eliminar("+persona.getId()+")'>X</label>";
        lista+="</td>";
        lista+="</tr>";
    }
    

%>

<h3>USUARIOS</h3>
<table border="1px">
    <tr><th>Id</th><th>Nombre</th><th>Usuario</th><th>Tipo</th><th><a href="principal.jsp?CONTENIDO=configuracion/usuariosFormulario.jsp">+</a></th></tr>
    <%=lista%>
</table>

<script type="text/javascript">
        function eliminar(id){
            var respuesta=confirm("¿Realmente desea eliminar este registro?");
            if(respuesta)location='principal.jsp?CONTENIDO=configuracion/usuariosActualizar.jsp&accion=Eliminar&identificacion='+id;
            
            
        }
</script>
