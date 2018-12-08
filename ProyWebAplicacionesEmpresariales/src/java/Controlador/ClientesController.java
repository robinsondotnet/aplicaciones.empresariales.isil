/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Cliente;
import ModeloDAO.ClienteDAO;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Karen
 */
public class ClientesController extends BaseController {

    @Override
    protected String getModuleName() {
        return "clientes"; //To change body of generated methods, choose Tools | Templates.
    }

    ClienteDAO clienteDAO=new ClienteDAO();
   
    @Override
    protected void postEditar(HttpServletRequest request) {
        super.postEditar(request); //To change body of generated methods, choose Tools | Templates.
        Integer id_cliente =Integer.parseInt(request.getParameter("id_cliente"));
        String razSoc = request.getParameter("txtRazSocail");
        String doc = request.getParameter("txtTipoDoc");
        String numDoc = request.getParameter("txtNumDoc");
        String email = request.getParameter("txtMail");
        //c.setId_cliene(id_cliente);
        Cliente c=new Cliente();
        c.setId_cliene(id_cliente);
        c.setRazon_social(razSoc);
        c.setTip_doc(doc);
        c.setNum_doc(numDoc);
        c.setEmail(email);
        clienteDAO.edit(c);
    }

    @Override
    protected void postAgregar(HttpServletRequest request) {
        super.postAgregar(request); //To change body of generated methods, choose Tools | Templates.
        String razSoc = request.getParameter("txtRazSocail");
        String doc = request.getParameter("txtTipoDoc");
        String numDoc = request.getParameter("txtNumDoc");
        String email = request.getParameter("txtMail");
        
        Cliente c=new Cliente();
        c.setRazon_social(razSoc);
        c.setTip_doc(doc);
        c.setNum_doc(numDoc);
        c.setEmail(email);
        clienteDAO.add(c);
    }

    @Override
    protected void getEditar(HttpServletRequest request) {
        super.getEditar(request); //To change body of generated methods, choose Tools | Templates.
        request.setAttribute("idcli", request.getParameter("id_cliente"));
        request.getSession().setAttribute("id_cliente", request.getParameter("id_cliente"));
    }

}
