<%-- 
    Document   : edit
    Created on : Nov 29, 2018, 2:16:29 AM
    Author     : Karen
--%>
<%@page import="Modelo.Cliente"%>
<%@page import="ModeloDAO.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include  file="../jspf/estilos.jspf"%>
        <title>JSP Page</title>
    </head>
    <body>
        
       <div class="container-fluid">
          
       
        
       
    
        <% 
            String id_cliente = (String) request.getParameter("id");
            ClienteDAO dao = new ClienteDAO();
            Cliente cli = dao.list(Integer.parseInt(id_cliente));
        %>

        
        
        
        <%@include  file="../jspf/header.jspf"%>
        
        <h1>Modificar Cliente</h1>
        <form action="ClientesController">
            Razon Social: <br>
            <input type="text" name="txtRazSocail" value="<%= cli.getRazon_social() %>"><br>
            Documento: <br>
            <input type="text" name="txtTipoDoc" value="<%= cli.getTip_doc() %>"><br>
            Numero documento: <br>
            <input type="text" name="txtNumDoc" value="<%= cli.getNum_doc() %>"><br>
            Email: <br>
            <input type="text" name="txtMail" value="<%= cli.getEmail() %>"><br>
            <input type="hidden" name="id_cliente" value="<%= cli.getId_cliene() %>">
            
            <button type="sumit" name="accion" value="Actualizar">Actualizar</button><br>
            
            <a href="ClientesController?accion=listar">Regresar</a>
            
        </form>
        </div>
        <%@include  file="../jspf/js.jspf"%>
        
         
    </body>
</html>
