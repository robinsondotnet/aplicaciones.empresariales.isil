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
        <%@include  file="../jspf/estilos.jspf"%>
        <title>JSP Page</title>
    </head>
    <body>
        <div id="container-fluid">
        <%@include  file="../jspf/header.jspf"%>
        <%@include  file="../jspf/nav.jspf"%>
        
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
            
            <input type="text" id="txtSearch" onblur="" name="txtSearch"><br>
             <input type="hidden" name="id_producto" value="">
            
            
            <button type="sumit" name="accion" value="Agregar">Agregar</button><br>
            <a href="ControladorClientes?accion=listar">Regresar</a>
        </form>
        </div>
        <%@include  file="../jspf/js.jspf"%>
        <script>
            function onTextChanged(){
                let queryString = $("#txtSearch")
                $.getJSON("ProductosController?accion=buscar&text="+ queryString, function (data) {
                    
                });
            }
            
            
        </script>
    </body>
</html>
