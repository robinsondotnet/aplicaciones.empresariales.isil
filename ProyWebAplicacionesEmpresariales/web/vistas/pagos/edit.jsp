<%-- 
    Document   : edit
    Created on : Nov 29, 2018, 2:16:29 AM
    Author     : Karen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include  file="../jspf/estilos.jspf"%>
        <title>JSP Page</title>
    </head>
    <body>
        <div id="container-fluid">
        
        
        <h1>Modificar Cliente</h1>
        <form action="ControladorClientes">
            Razon Social: <br>
            <input type="text" name="txtRazSocail" value=""><br>
            Documento: <br>
            <input type="text" name="txtTipoDoc" value=""><br>
            Numero documento: <br>
            <input type="text" name="txtNumDoc" value=""><br>
            Email: <br>
            <input type="text" name="txtMail" value=""><br>
            <input type="hidden" name="txtid_cliente" value="">
            
            <button type="sumit" name="accion" value="Agregar">Actualizar</button><br>
            
            <a href="ControladorClientes?accion=listar">Regresar</a>
        </form>
        </div>
        <%@include  file="../jspf/js.jspf"%>
    </body>
</html>
