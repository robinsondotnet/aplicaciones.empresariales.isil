/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Cliente;
import ModeloDAO.ClienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Karen
 */
public class ClientesController extends BaseController {
    
    String listar="vistas/listar.jsp";
    String add="vistas/add.jsp";
    String edit="vistas/adit.jsp";
    Cliente c=new Cliente();
    ClienteDAO dao=new ClienteDAO();

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
          
            
        
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String acceso ="";
        String action =request.getParameter("accion");
        if(action.equalsIgnoreCase("listar")){
            
            acceso=listar;
        }else if(action.equalsIgnoreCase("add")){
            acceso=add;
            
            
        }
        else if(action.equalsIgnoreCase("Agregar")){
            String razSoc = request.getParameter("txtRazSocail");
            String doc = request.getParameter("txtTipoDoc");
            String numDoc = request.getParameter("txtNumDoc");
            String email = request.getParameter("txtMail");
            c.setRazon_social(razSoc);
            c.setTip_doc(doc);
            c.setNum_doc(numDoc);
            c.setEmail(email);
            dao.add(c);
            acceso=listar;
            
        }
        else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("idcli", request.getParameter("id_cliente"));
            acceso=edit;
        }
        else if(action.equalsIgnoreCase("Actualizar ")){
            //id_cliente=Integer.parseInt(request.getParameter("txtid_cliente"));
            String razSoc = request.getParameter("txtRazSocail");
            String doc = request.getParameter("txtTipoDoc");
            String numDoc = request.getParameter("txtNumDoc");
            String email = request.getParameter("txtMail");
            //c.setId_cliene(id_cliente);
            c.setRazon_social(razSoc);
            c.setTip_doc(doc);
            c.setNum_doc(numDoc);
            c.setEmail(email);
            dao.edit(c);
            acceso=listar;
        }
        RequestDispatcher vista=request.getRequestDispatcher(acceso);
        vista.forward(request, response);
        
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
