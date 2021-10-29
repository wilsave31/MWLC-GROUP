/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesGenericas;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author claudia
 */
public class Fechas {
     public static SimpleDateFormat formatoFecha=new SimpleDateFormat("yyyy-MM-dd H:mm:ss");
    
     public static int calcularDiferenciaFechas(String fecha1, String fecha2){
       
        int diferencia=0;
        if(!fecha2.equals("")){
            try {
            Date fechaInicial=formatoFecha.parse(fecha1);
            Date fechaFinal=formatoFecha.parse(fecha2);
            diferencia=(int)((fechaFinal.getTime()-fechaInicial.getTime())/1000);
            } catch (ParseException ex) {
            System.out.println("Error al convertir cadena fecha date. "+ex.getMessage());
            }
        }
        return diferencia;
    }
    public static String obtenerFechaActual(){
       Date fecha=new Date();
       return formatoFecha.format(fecha);//
    }
   
}
