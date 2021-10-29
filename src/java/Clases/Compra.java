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
public class Compra {
    private String id;
    private String idPersona;
    private String fecha;
    private String nombre;
    private String marca;
    private String valor;
    private String cantidad;

    public Compra() {
    }

    public Compra(String id, String idPersona, String fecha, String nombre, String marca, String valor, String cantidad) {
        this.id = id;
        this.idPersona = idPersona;
        this.fecha = fecha;
        this.nombre = nombre;
        this.marca = marca;
        this.valor = valor;
        this.cantidad = cantidad;
    }

    public Compra(String id) {
        String cadenaSQL="select id, idPersona, fecha, nombre, marca, valor, cantidad from compra where id='"+id+"'";
        try {
            
            ResultSet resultado=ConectorBD.consultar(cadenaSQL);
            if (resultado.next()){
                this.id=id;
                this.idPersona=resultado.getString("idPersona");
                this.fecha=resultado.getString("fecha");
                this.nombre=resultado.getString("nombre");
                this.marca=resultado.getString("marca");
                this.valor=resultado.getString("valor");
                this.cantidad=resultado.getString("cantidad");
            }
        } catch (SQLException ex) {
            //Logger.getLogger(Persona.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error al consultar compra "+cadenaSQL+"\n"+ex.getMessage());
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

    public String getNombre() {
        if(nombre==null) return "";
        else return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
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
        return nombre;
    }
    
    public void guardar(){
        //String cadena = tipo.substring(0,0);
        String cadenaSQL="insert into compra (idPersona, fecha, nombre, marca, valor, cantidad) values ('"+ idPersona +"','"
                + fecha +"','"+ nombre +"','"+ marca +"','"+ valor +"','"+cantidad+"')";
        ConectorBD.ejecutarQuery(cadenaSQL);
    }
    public void modificar(){
        String cadenaSQL="update compra set idPersona='"+idPersona+"', fecha='"+fecha+"', nombre='"+nombre+"', marca='"+marca
                +"', valor="+valor+", cantidad='"+cantidad+"' where id="+id;
        ConectorBD.ejecutarQuery(cadenaSQL);
    }
    
    public void eliminar(){
        String cadenaSQL="delete from compra where id="+id;
        ConectorBD.ejecutarQuery(cadenaSQL);
    }
                  
    public static ResultSet getLista(String filtro){
        if(filtro==null) filtro="";
        else filtro="order"+filtro;
        String cadenaSQL="select id, idPersona, fecha, nombre, marca, valor, cantidad from compra "+filtro+"  by nombre desc";
        return ConectorBD.consultar(cadenaSQL);
    }
    
    public static ArrayList<Compra> getListaEnObjeto(String filtro){
        ArrayList<Compra> lista=new ArrayList<Compra>();
        ResultSet resultado=Compra.getLista(filtro);
        try {
            while(resultado.next()){
                Compra compra=new Compra();
                compra.setId(resultado.getString("id"));
                compra.setIdPersona(resultado.getString("idPersona"));
                compra.setFecha(resultado.getString("fecha"));
                compra.setNombre(resultado.getString("nombre"));
                compra.setMarca(resultado.getString("marca"));
                compra.setValor(resultado.getString("valor"));
                compra.setCantidad(resultado.getString("cantidad"));
                lista.add(compra);
            }
        } catch (SQLException ex) {
            //Logger.getLogger(Compra.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("No es posible obtener la lista de compra. Error: "+ex.getMessage());
        }
        return lista;
    }
}
