/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Cliente;
import ModeloDAO.ClienteDAO;
import ModeloDAO.ProductoDAO;
import com.google.gson.Gson;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Karen
 */
public class ProductosController extends BaseController {

    ProductoDAO productoDAO = new ProductoDAO();
    
    @Override
    protected void getBuscar(HttpServletRequest request, HttpServletResponse response) {
        String textSearch = request.getParameter("text");
        List productos = productoDAO.buscar(textSearch);
        
        String json = new Gson().toJson(productos);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        try {
            response.getWriter().write(json);
        } catch (IOException ex) {
            Logger.getLogger(ProductosController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
       @Override
    protected String getModuleName() {
        return "productos"; //To change body of generated methods, choose Tools | Templates.
    }

    ClienteDAO dao=new ClienteDAO();
   
    @Override
    protected void postEditar(HttpServletRequest request) {
        super.postEditar(request); //To change body of generated methods, choose Tools | Templates.
        //id_cliente=Integer.parseInt(request.getParameter("txtid_cliente"));
        String razSoc = request.getParameter("txtRazSocail");
        String doc = request.getParameter("txtTipoDoc");
        String numDoc = request.getParameter("txtNumDoc");
        String email = request.getParameter("txtMail");
        //c.setId_cliene(id_cliente);
        Cliente c=new Cliente();
        c.setRazon_social(razSoc);
        c.setTip_doc(doc);
        c.setNum_doc(numDoc);
        c.setEmail(email);
        dao.edit(c);
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
        dao.add(c);
    }

    @Override
    protected void getEditar(HttpServletRequest request) {
        super.getEditar(request); //To change body of generated methods, choose Tools | Templates.
        request.setAttribute("idcli", request.getParameter("id_cliente"));
    }
}
