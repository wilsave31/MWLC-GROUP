/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.71
 * Generated at: 2021-10-25 19:07:18 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.presentacion.configuracion;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import clasesGenericas.Fecha;
import java.util.ArrayList;
import clases.Parqueadero;
import clases.Persona;
import clases.Horario;

public final class horario_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("clases.Horario");
    _jspx_imports_classes.add("clases.Persona");
    _jspx_imports_classes.add("clasesGenericas.Fecha");
    _jspx_imports_classes.add("clases.Parqueadero");
    _jspx_imports_classes.add("java.util.ArrayList");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    HttpSession sesion = request.getSession();
    Persona USUARIO = null;
    if(sesion.getAttribute("usuario")==null) response.sendRedirect("../index.jsp?error=2");
    else USUARIO = (Persona) sesion.getAttribute("usuario");
    String lista="";
    String filtro="identificacionAdministrador='"+USUARIO.getIdentificacion()+"'";
    Parqueadero parqueadero = Parqueadero.getListaEnObjetos(filtro).get(0); 
    ArrayList<Horario> datos = Horario.getListaEnObjetos("idparqueadero="+parqueadero.getId());
    for (int i = 0; i < datos.size(); i++) {
            Horario horario = datos.get(i);
            lista+="<tr>";
            lista+="<td>"+ Fecha.dias[Integer.parseInt(horario.getDia())] +"</td>";
            lista+="<td>"+ horario.getHoraInicio()+"</td>";
            lista+="<td>"+ horario.getHoraFinalizacion() +"</td>";
            lista+="<td>";
            lista+="<a href=principal.jsp?CONTENIDO=configuracion/horarioFormulario.jsp&id="+ horario.getId() +"&idParqueadero="+ parqueadero.getId() +">/</a>";
            lista+="<label onClick='eliminar("+horario.getId()+");'>X</label>";
            lista+="</td>";
            lista+="</tr>";
        }

      out.write("\n");
      out.write("<h3>HORARIOS DEL PARQUEADERO ");
      out.print( parqueadero.getNombre().toUpperCase() );
      out.write("</h3>\n");
      out.write("<table border=\"1\">\n");
      out.write("    <tr><th>Dia</th><th>Hora de inicio</th><th>Hora de finalizacion</th><th><a href=\"principal.jsp?CONTENIDO=configuracion/horarioFormulario.jsp&idParqueadero=");
      out.print( parqueadero.getId() );
      out.write("\">+</a></th></tr>\n");
      out.write("    ");
      out.print(lista);
      out.write("\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("    function eliminar(id) {\n");
      out.write("        var respuesta = confirm('¿Realmente deseas eliminar este registro?');\n");
      out.write("        if(respuesta) location='principal.jsp?CONTENIDO=configuracion/horarioActualizar.jsp&accion=Eliminar&id='+id+\"&idParqueadero=");
      out.print( parqueadero.getId() );
      out.write("\";\n");
      out.write("    }\n");
      out.write("</script>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
