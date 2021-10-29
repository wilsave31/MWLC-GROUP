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
public class Venta {
    private String id;
    private String idPersona;
    private String fecha;
    private String idNombre;
    private String marca;
    private String valor;
    private String cantidad;

    public Venta() {
    }

    public Venta(String id, String idPersona, String fecha, String idNombre, String marca, String valor, String cantidad) {
        this.id = id;
        this.idPersona = idPersona;
        this.fecha = fecha;
        this.idNombre = idNombre;
        this.marca = marca;
        this.valor = valor;
        this.cantidad = cantidad;
    }

    public Venta(String id) {
        String cadenaSQL="select id, idPersona, fecha, idNombre, marca, valor, cantidad from venta where id='"+id+"'";
        try {
            
            ResultSet resultado=ConectorBD.consultar(cadenaSQL);
            if (resultado.next()){
                this.id=id;
                this.idPersona=resultado.getString("idPersona");
                this.fecha=resultado.getString("fecha");
                this.idNombre=resultado.getString("idNombre");
                this.marca=resultado.getString("marca");
                this.valor=resultado.getString("valor");
                this.cantidad=resultado.getString("cantidad");
            }
        } catch (SQLException ex) {
            //Logger.getLogger(Persona.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error al consultar venta "+cadenaSQL+"\n"+ex.getMessage());
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

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getIdNombre() {
        if(idNombre==null) return "";
        else return idNombre;
    }
    
    public Producto getListaEnObjetos(){
        return new Producto(idNombre);
    }

    public void setIdNombre(String idNombre) {
        this.idNombre = idNombre;
    }

    public String getMarca() {
        if(marca==null) return "";
        else return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
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
        return idNombre;
    }
    
    public void guardar(){
        //String cadena = tipo.substring(0,0);
        String cadenaSQL="insert into venta (idPersona, fecha, idNombre, marca, valor, cantidad) values ('"+ idPersona +"','"
                + fecha +"','"+ idNombre +"','"+ marca +"','"+ valor +"','"+cantidad+"')";
        ConectorBD.ejecutarQuery(cadenaSQL);
    }
    public void modificar(){
        String cadenaSQL="update venta set idPersona='"+idPersona+"', fecha='"+fecha+"', idNombre='"+idNombre+"', marca='"+marca
                +"', valor="+valor+", cantidad='"+cantidad+"' where id="+id;
        ConectorBD.ejecutarQuery(cadenaSQL);
    }
    
    public void eliminar(){
        String cadenaSQL="delete from venta where id="+id;
        ConectorBD.ejecutarQuery(cadenaSQL);
    }
                  
    public static ResultSet getLista(String filtro){
        if(filtro==null) filtro="";
        else filtro="order"+filtro;
        String cadenaSQL="select id, idPersona, fecha, idNombre, marca, valor, cantidad from venta "+filtro+"  by idNombre desc";
        return ConectorBD.consultar(cadenaSQL);
    }
    
    public static ArrayList<Venta> getListaEnObjeto(String filtro){
        ArrayList<Venta> lista=new ArrayList<Venta>();
        ResultSet resultado=Venta.getLista(filtro);
        try {
            while(resultado.next()){
                Venta venta=new Venta();
                venta.setId(resultado.getString("id"));
                venta.setIdPersona(resultado.getString("idPersona"));
                venta.setFecha(resultado.getString("fecha"));
                venta.setIdNombre(resultado.getString("idNombre"));
                venta.setMarca(resultado.getString("marca"));
                venta.setValor(resultado.getString("valor"));
                venta.setCantidad(resultado.getString("cantidad"));
                lista.add(venta);
            }
        } catch (SQLException ex) {
            //Logger.getLogger(Venta.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("No es posible obtener la lista de venta. Error: "+ex.getMessage());
        }
        return lista;
    }
}
