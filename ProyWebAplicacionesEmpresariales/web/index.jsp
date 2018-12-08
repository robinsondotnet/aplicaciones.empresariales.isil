

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include  file="vistas/jspf/estilos.jspf"%>
        <title>Proyecto Final de Aplicaciones empresariales</title>
    </head>
    
    <body>
        <div id="container-fluid">
            <%@include  file="vistas/jspf/header.jspf"%>
        <a href="ClientesController?accion=listar">Listar clientes</a>
        <a href="PagosController?accion=listar">Listar pagos</a>
        <a href="PedidosController?accion=listar">Listar pedidos</a>
        
        <%@include  file="vistas/jspf/footer.jspf"%>
        </div>
        <%@include  file="vistas/jspf/js.jspf"%>
    </body>
</html>
