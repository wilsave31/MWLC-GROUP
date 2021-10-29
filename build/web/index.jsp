<%-- 
    Document   : index
    Created on : 25/10/2021, 05:35:13 PM
    Author     : Manuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
        <title> MWLC GROUP </title>
        <link rel="shortcut icon"  href="presentacion/imagenes/icono.ico"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="presentacion/css/principal.css" />
    </head>
    <body>
        <div class= "pagina">
                        
            <div class="header">
                <div class="logo">
                    <img src="presentacion/imagenes/lgo3.png" width="10%">
                </div>
                <img src="presentacion/imagenes/header.jpg" width="100%">
            </div>
            
            <div class="login-box">
                <h1>Inicio de sesión</h1>
                <form method="post" name="formulario" action="control/validar.jsp">
                    <table>
                        <tr><th>Usuario</th><th><input type="text" name="usuario" required></th></tr>
                        <tr><th>clave</th><th><input type="password" name="clave" required></th></tr>
                        <tr><th><input type="submit" value="Ingresar"></th><th><input type="submit" value="Cancelar"></th></tr>
                    </table> 
                </form>
            </div>

            <div class="contenido">
                <h1>BIENVENIDO</h1>
                <p>  Si lo que estás buscando es un pagina web potente y de fácil manejo  en el sector de la administración de fincas,
                     entonces nos has encontrado.Podemos ayudarte en la gestión de la contabilidad para su finca.
                </p>
                
                <p align="center">
                    <img src="presentacion/imagenes/mwlc.jpg" width="50%">
                </p>
                <p> En Colombia, el sector agro es uno de los principales ejes que mueve el país, es por eso que en MWLC GROUP pensamos en ti y lo mejor para administrar tu finca. 
                    Y es que nuestro país, según la FAO (Organización de las Naciones Unidas para la Alimentación y la Agricultura), puede convertirse en una de las grandes despensas del mundo, 
                    pues es uno de los siete países en Latinoamérica con mayor potencial para el desarrollo de áreas cultivables: “Entre 223 países en los que se evaluó el potencial de expansión 
                    del área agrícola –sin afectar el área del bosque natural– esta nación ocupó el puesto 25, ya que de las 22 millones de hectáreas cultivables, solo están sembradas 4,8, sin 
                    incluir el potencial de la Altillanura, estimado en 3,5 millones de hectáreas” 
                </p>
            </div>
            
            <div class="footer">
                <address align="center">&copy; Todos los Derechos reservados - Desarrollado por el GRUPO MWLC </address>
            </div>
        </div>
    </body>
</html>
