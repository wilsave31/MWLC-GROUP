<%-- 
    Document   : ventas
    Created on : 26/10/2021, 07:12:30 PM
    Author     : Manuel
--%>

<%@page import="Clases.Venta"%>
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
    
    ArrayList<Venta> datos= Venta.getListaEnObjeto(lista);
    for(int i=0;i< datos.size();i++){
        Venta venta= datos.get(i);
        lista+="<tr>";
        lista+="<td>"+venta.getId()+"</td>";
        lista+="<td>"+venta.getListaEnObjeto()+"</td>";
        lista+="<td>"+venta.getFecha()+"</td>";
        lista+="<td>"+venta.getListaEnObjetos()+"</td>";
        lista+="<td>"+venta.getMarca()+"</td>";
        lista+="<td>"+venta.getValor()+"</td>";
        lista+="<td>"+venta.getCantidad()+"</td>";
        lista+="<td>";
        lista+="<a href='principal.jsp?CONTENIDO=venta/ventasFormulario.jsp&accion=Modificar&id="+venta.getId()+"' title='Modificar'>/</a>";
        lista+="<label Onclick='eliminar("+venta.getId()+")'>X</label>";
        lista+="</td>";
        lista+="</tr>";
    }
    

%>

<h3>REGISTRO DE VENTAS</h3>
<table border="1px">
    <tr><th>Id</th><th>Usuario</th><th>Fecha</th><th>Nombre</th><th>Marca</th><th>Valor</th><th>Cantidad</th><th><a href="principal.jsp?CONTENIDO=venta/ventasFormulario.jsp">+</a></th></tr>
    <%=lista%>
</table>
<div>
    <img src="imagenes/productos.jpg"  width="80%">
</div>
<script type="text/javascript">
        function eliminar(id){
            var respuesta=confirm("¿Realmente desea eliminar este registro?");
            if(respuesta)location='principal.jsp?CONTENIDO=venta/ventasActualizar.jsp&accion=Eliminar&id='+id;
            
            
        }
</script>
