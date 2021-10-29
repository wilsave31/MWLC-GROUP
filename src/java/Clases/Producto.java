/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import ClasesGenericas.ConectorBD;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Manuel
 */
public class Producto {
    private String id;
    private String idPersona;
    private String nombre;
    private String etiqueta;
    private String valor;
    private String cantidad;

    public Producto() {
    }

    public Producto(String id, String idPersona, String nombre, String etiqueta, String valor, String cantidad) {
        this.id = id;
        this.idPersona = idPersona;
        this.nombre = nombre;
        this.etiqueta = etiqueta;
        this.valor = valor;
        this.cantidad = cantidad;
    }

    public Producto(String id) {
        String cadenaSQL="select id, idPersona, nombre, etiqueta, valor, cantidad from producto where id='"
                    +id+"'";
        try {
            
            ResultSet resultado=ConectorBD.consultar(cadenaSQL);
            if (resultado.next()){
                this.id=id;
                this.idPersona=resultado.getString("idPersona");
                this.nombre=resultado.getString("nombre");
                this.etiqueta=resultado.getString("etiqueta");
                this.valor=resultado.getString("valor");
                this.cantidad=resultado.getString("cantidad");
            }
        } catch (SQLException ex) {
            //Logger.getLogger(Persona.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error al consultar producto "+cadenaSQL+"\n"+ex.getMessage());
        }
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIdPersona() {
        return idPersona;
    }
    
    public Persona getListaEnObjeto(){
        return new Persona(idPersona);
    }

    public void setIdPersona(String idPersona) {
        this.idPersona = idPersona;
    }

    public String getNombre() {
        if(nombre==null) return "";
        else return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEtiqueta() {
        if(etiqueta==null) return "";
        else return etiqueta;
    }

    public void setEtiqueta(String etiqueta) {
        this.etiqueta = etiqueta;
    }

    public String getValor() {
        if(valor==null) return "";
        else return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }

    public String getCantidad() {
        if(cantidad==null) return "";
        else return cantidad;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    @Override
    public String toString() {
        return nombre;
    }
    
    
    
    public void guardar(){
        //String cadena = tipo.substring(0,0);
        String cadenaSQL="insert into producto (idPersona, nombre, etiqueta, valor, cantidad) values ('"+ idPersona +"','"+ nombre +"', '"
                + etiqueta +"','"+ valor +"','"+cantidad+"')";
        ConectorBD.ejecutarQuery(cadenaSQL);
    }
    public void modificar(){
        String cadenaSQL="update producto set idPersona='"+idPersona+"', nombre='"+nombre+"', etiqueta='"+etiqueta
                +"', valor="+valor+", cantidad='"+cantidad+"' where id="+id;
        ConectorBD.ejecutarQuery(cadenaSQL);
    }
    
    public void eliminar(){
        String cadenaSQL="delete from producto where id="+id;
        ConectorBD.ejecutarQuery(cadenaSQL);
    }
                  
    public static ResultSet getLista(String filtro){
        if(filtro==null) filtro="";
        else filtro="order"+filtro;
        String cadenaSQL="select id, idPersona, nombre, etiqueta, valor, cantidad from producto "+filtro+"  by id desc";
        return ConectorBD.consultar(cadenaSQL);
    }
    
    public static ArrayList<Producto> getListaEnObjeto(String filtro){
        ArrayList<Producto> lista=new ArrayList<Producto>();
        ResultSet resultado=Producto.getLista(filtro);
        try {
            while(resultado.next()){
                Producto producto=new Producto();
                producto.setId(resultado.getString("id"));
                producto.setIdPersona(resultado.getString("idPersona"));
                producto.setNombre(resultado.getString("nombre"));
                producto.setEtiqueta(resultado.getString("etiqueta"));
                producto.setValor(resultado.getString("valor"));
                producto.setCantidad(resultado.getString("cantidad"));
                lista.add(producto);
            }
        } catch (SQLException ex) {
            //Logger.getLogger(Producto.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("No es posible obtener la lista de producto. Error: "+ex.getMessage());
        }
        return lista;
    }
    
    public static String getListaEnOptions(String predeterminado){
        String lista="";
        String filtro="";
        ArrayList<Producto> resultado=Producto.getListaEnObjeto(filtro);
        for (int i = 0; i < resultado.size(); i++) {
            Producto producto = resultado.get(i);
            String auxiliar="";
            if(producto.getId().equals(predeterminado))auxiliar="selected";
            lista+="<option value='"+producto.getId()+"'"+auxiliar+">"+producto.getNombre()+"</option>";
                
        }
        return lista;
    }

}
