<%@page import="ClasesGenericas.ConectorBD"%>
<%@page import="Clases.Persona"%>


        <%
        String usuario=request.getParameter("usuario");
        String clave=request.getParameter("clave");
        Persona persona= Persona.validar(usuario,clave);
        if (persona==null) response.sendRedirect("../index.jsp");
        else {
            HttpSession sesion=request.getSession();
            sesion.setAttribute("usuario", persona);
            response.sendRedirect("../presentacion/principal.jsp?CONTENIDO=inicio.jsp");
        }
        
        %>
        El usuario es:  <%=usuario%><br>
        La clave es: <%=clave%><br>
       
    </body>
</html>


