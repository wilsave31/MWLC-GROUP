<%-- 
    Document   : compras
    Created on : 26/10/2021, 06:48:57 PM
    Author     : Manuel
--%>

<%@page import="Clases.Compra"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //validar
    HttpSession sesion= request.getSession();
    Persona USUARIO=null;
    if(sesion.getAttribute("usuario")==null)response.sendRedirect("../index.jsp?Error=2");//acceso no valido
    else USUARIO=(Persona) sesion.getAttribute("usuario");
    
    String lista="";
    String filtro="identificacionAdministrador='"+USUARIO.getId()+"'";
    
    ArrayList<Compra> datos= Compra.getListaEnObjeto(lista);
    for(int i=0;i< datos.size();i++){
        Compra compra= datos.get(i);
        lista+="<tr>";
        lista+="<td>"+compra.getId()+"</td>";
        lista+="<td>"+compra.getListaEnObjeto()+"</td>";
        lista+="<td>"+compra.getFecha()+"</td>";
        lista+="<td>"+compra.getNombre()+"</td>";
        lista+="<td>"+compra.getMarca()+"</td>";
        lista+="<td>"+compra.getValor()+"</td>";
        lista+="<td>"+compra.getCantidad()+"</td>";
        lista+="<td>";
        lista+="<a href='principal.jsp?CONTENIDO=compra/comprasFormulario.jsp&accion=Modificar&id="+compra.getId()+"' title='Modificar'>/</a>";
        lista+="<label Onclick='eliminar("+compra.getId()+")'>X</label>";
        lista+="</td>";
        lista+="</tr>";
    }
    

%>

<h3>REGISTRO DE COMPRAS</h3>
<table border="1px">
    <tr><th>Id</th><th>Usuario</th><th>Fecha</th><th>Nombre</th><th>Marca</th><th>Valor</th><th>Cantidad</th><th><a href="principal.jsp?CONTENIDO=compra/comprasFormulario.jsp">+</a></th></tr>
    <%=lista%>
</table>
<div>
    <img src="imagenes/compras.jpg"  width="80%">
</div>
<script type="text/javascript">
        function eliminar(id){
            var respuesta=confirm("¿Realmente desea eliminar este registro?");
            if(respuesta)location='principal.jsp?CONTENIDO=compra/comprasActualizar.jsp&accion=Eliminar&id='+id;
            
            
        }
</script>
