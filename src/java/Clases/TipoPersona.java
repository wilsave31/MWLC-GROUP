
package Clases;

import java.util.ArrayList;

public class TipoPersona {
    private char codigo;

    public TipoPersona(char codigo) {
        this.codigo = codigo;
    }

    public char getCodigo() {
        return codigo;
    }
    
    public String getNombre(){
       String nombre="Desconocido" ;
       switch(codigo){
           case 'A': nombre="Administrador"; break;
           case 'I': nombre="Integrante"; break;
       }
       return nombre;
    }

    @Override
    public String toString() {
        return this.getNombre();
    }

    public String getMenu(){
        String menu="<ul>";
        menu+="<a href='principal.jsp?CONTENIDO=configuracion/usuarios.jsp'><td>  USUARIOS   ||</td></a>";
        menu+="<a href='principal.jsp?CONTENIDO=producto/productos.jsp'><td>  PRODUCTOS  ||</td></a>";
        menu+="<a href='principal.jsp?CONTENIDO=venta/ventas.jsp'><td>  REGISTRO DE VENTAS   ||</td></a>";
        menu+="<a href='principal.jsp?CONTENIDO=compra/compras.jsp'><td>  REGISTRO DE COMPRAS   ||</td></a>";
        menu+="<a href='../index.jsp'>   Salir</a>";
        menu+="</ul>";
        return menu;
    }
    
    public static String getListaEnOptions(){
        String lista= "";
        lista+="<option value='A'> Administrador</option>";
        lista+="<option value='I'> Integrante</option>";
        return lista;
    } 
    
}
