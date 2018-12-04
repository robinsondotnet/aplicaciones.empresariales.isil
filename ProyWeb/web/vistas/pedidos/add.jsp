<%-- 
    Document   : add
    Created on : Nov 29, 2018, 2:16:05 AM
    Author     : Karen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Agregar Cliente</h1>
        <form action="ControladorClientes">
            Razon Social: <br>
            <input type="text" name="txtRazSocail"><br>
            Documento: <br>
            <input type="text" name="txtTipoDoc"><br>
            Numero documento: <br>
            <input type="text" name="txtNumDoc"><br>
            Email: <br>
            <input type="text" name="txtMail"><br>
            
            <button type="sumit" name="accion" value="Agregar">Agregar</button><br>
            <a href="ControladorClientes?accion=listar">Regresar</a>
        </form>
    </body>
</html>
