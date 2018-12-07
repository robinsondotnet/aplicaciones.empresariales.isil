

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1> clientes</h1>
        <a href="ClientesController?accion=add">Agregar Nuevo</a>
    
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Razonsocial</th>
                <th>Tipo Documento</th>
                <th>numero Documento</th>
                <th>Email</th>
            </tr>
        </thead>
        <%
            ClienteDAO dao=new ClienteDAO();
            List<Cliente>list=dao.listar();
            Iterator<Cliente>iter=list.iterator();
            Cliente cli = null;
            while(iter.hasNext()){
                cli=iter.next();
            
            %>
        <tbody>
            <tr>
                <td><%=cli.getId_cliene()%></td>
                <td><%=cli.getRazon_social()%></td>
                <td><%=cli.getTip_doc()%></td>
                <td><%=cli.getNum_doc()%></td>
                <td><%=cli.getEmail()%></td>
                <td>
                    <a href="ClientesController?accion=editar&id=<%=cli.getId_cliene()%>">Edit</a>
                    <a>Remove</a>
                </td>
            </tr>
            <%}%>
        </tbody>
    </table>
    
    </body>
</html>
