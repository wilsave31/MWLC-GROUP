<%-- 
    Document   : productos
    Created on : 26/10/2021, 06:16:29 PM
    Author     : Manuel
--%>

<%@page import="Clases.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Persona"%>
<%
    //validar
    HttpSession sesion= request.getSession();
    Persona USUARIO=null;
    if(sesion.getAttribute("usuario")==null)response.sendRedirect("../index.jsp?Error=2");//acceso no valido
    else USUARIO=(Persona) sesion.getAttribute("usuario");
    
    String lista="";
    String filtro="identificacionAdministrador='"+USUARIO.getId()+"'";
    
    ArrayList<Producto> datos= Producto.getListaEnObjeto(lista);
    for(int i=0;i< datos.size();i++){
        Producto producto= datos.get(i);
        lista+="<tr>";
        lista+="<td>"+producto.getId()+"</td>";
        lista+="<td>"+producto.getListaEnObjeto()+"</td>";
        lista+="<td>"+producto.getNombre()+"</td>";
        lista+="<td>"+producto.getEtiqueta()+"</td>";
        lista+="<td>"+producto.getValor()+"</td>";
        lista+="<td>"+producto.getCantidad()+"</td>";
        lista+="<td>";
        lista+="<a href='principal.jsp?CONTENIDO=producto/productosFormulario.jsp&accion=Modificar&id="+producto.getId()+"' title='Modificar'>/</a>";
        lista+="<label Onclick='eliminar("+producto.getId()+")'>X</label>";
        lista+="</td>";
        lista+="</tr>";
    }
    

%>

<h3>REGISTRO DE PRODUCTOS</h3>
<table border="1px">
    <tr><th>Id</th><th>Usuario (ingreso)</th><th>Nombre</th><th>Etiqueta</th><th>Valor</th><th>Cantidad</th><th><a href="principal.jsp?CONTENIDO=producto/productosFormulario.jsp">+</a></th></tr>
    <%=lista%>
</table>
<div>
    <img src="imagenes/ventas.jpg"  width="80%">
</div>
<script type="text/javascript">
        function eliminar(id){
            var respuesta=confirm("¿Realmente desea eliminar este registro?");
            if(respuesta)location='principal.jsp?CONTENIDO=producto/productosActualizar.jsp&accion=Eliminar&id='+id;
            
            
        }
</script>
