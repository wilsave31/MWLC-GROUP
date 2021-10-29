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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Manuel
 */
public class Persona {
    private String id;
    private String nombres;
    private String usuario;
    private String clave;
    private String tipo;

    public Persona() {
        
    }

    public Persona(String id, String nombres, String usuario, String clave, String tipo) {
        this.id = id;
        this.nombres = nombres;
        this.usuario = usuario;
        this.clave = clave;
        this.tipo=tipo;
    }

    public Persona(String id) {
        String cadenaSQL="select id, nombres, usuario, clave, tipo from persona where id='"
                    +id+"'";
        try {
            
            ResultSet resultado=ConectorBD.consultar(cadenaSQL);
            if (resultado.next()){
                this.id=id;
                this.nombres=resultado.getString("nombres");
                this.usuario=resultado.getString("usuario");
                this.clave=resultado.getString("clave");
                this.tipo=resultado.getString("tipo");
            }
        } catch (SQLException ex) {
            //Logger.getLogger(Persona.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error al consultar persona"+cadenaSQL+"\n"+ex.getMessage());
        }
    }

    public String getTipo() {
        return tipo;
    }
    
    public TipoPersona getTipoEnObjeto(){
        return new TipoPersona(tipo.charAt(0));
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getId() {
        if(id==null) return "";
        else return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombres() {
        if(nombres==null) return "";
        else return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getUsuario() {
        if(usuario==null) return "";
        else return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        if(clave==null) return "";
        else return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    @Override
    public String toString() {
        return nombres;
    }
    
    public void guardar(){
        //String cadena = tipo.substring(0,0);
        String cadenaSQL="insert into persona (nombres, usuario, clave,tipo) values ('"+ nombres +"','"+ usuario +"',"
                + "md5('"+ clave +"'),'"+tipo+"')";
        ConectorBD.ejecutarQuery(cadenaSQL);
    }
    public void modificar(/*String idAnterior*/){
        if(clave.length()==32)clave="'"+clave+"'";
        else clave="md5 ('"+clave+"')";
        String cadenaSQL="update persona set id='"+id+"', nombres='"+nombres+"',"
                + " usuario='"+usuario+"', clave="+clave+", tipo='"+tipo+"' where id='"+id+"'";
        ConectorBD.ejecutarQuery(cadenaSQL);
    }
    public void eliminar(){
        String cadenaSQL="delete from persona where id='"+ id +"'";
        ConectorBD.ejecutarQuery(cadenaSQL);
    }
    public static ResultSet getLista(String filtro){
        if(filtro==null) filtro="";
        else filtro=" where " + filtro;
        String cadenaSQL=" select id, nombres, usuario, clave, tipo from persona  order by id";
        return ConectorBD.consultar(cadenaSQL);
    }
   
    public static ArrayList<Persona> getListaEnObjetos(String filtro){
        ArrayList<Persona> lista=new ArrayList<Persona>();
        ResultSet resultado=Persona.getLista(filtro);
        try {
            while(resultado.next()){
                Persona persona=new Persona();
                persona.setId(resultado.getString("id"));
                persona.setNombres(resultado.getString("nombres"));
                persona.setUsuario(resultado.getString("usuario"));
                persona.setClave(resultado.getString("clave"));
                persona.setTipo(resultado.getString("tipo"));
                lista.add(persona);
            }
        } catch (SQLException ex) {
            //Logger.getLogger(Persona.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("No es posibleontener la lista de persona Error: "+ex.getMessage());
        }
        return lista;
    }
        
    public static Persona validar(String usuario, String clave){
        Persona persona=null;
        String cadenaSQL="select id, nombres, usuario, clave, tipo from persona where usuario='"+ usuario + "' and clave=md5('"+ clave +"')";
        try {
            ResultSet resultado=ConectorBD.consultar(cadenaSQL);
            if(resultado.next()){
                persona=new Persona();
                persona.usuario=usuario;
                persona.nombres=resultado.getString("nombres");
                persona.id=resultado.getString("id");
                persona.clave=resultado.getString("clave");
                persona.tipo=resultado.getString("tipo");
                
            }
        } catch (Exception e) {
            System.out.println("Error al validar id"+cadenaSQL+"\n"+e.getMessage());
        }
        return persona;
    }
    
     public static String getListaEnOptions(String predeterminado) {
        String lista="";
        ArrayList<Persona> resultado = Persona.getListaEnObjetos(null);
        for (int i = 0; i < resultado.size(); i++) {
            Persona persona = resultado.get(i);
            String auxiliar="";
            if(persona.getId().equals(predeterminado)) auxiliar=" selected";
            lista+="<option value='"+ persona.getId()+"'"+ auxiliar + ">"+ persona.getNombres() +"</option>";
        }
        return lista;
    }
}
