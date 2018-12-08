/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kento
 */
public abstract class BaseController extends HttpServlet {
    
    private String acceso;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
    protected String getModuleName() {
        return null;
    }
    
    private String getEditarViewName() {
        return "vistas/" + getModuleName() + "/edit.jsp"; //To change body of generated methods, choose Tools | Templates.
    }
    
    private String getAgregarViewName() {
       return "vistas/" + getModuleName() + "/add.jsp"; //To change body of generated methods, choose Tools | Templates.
    }
    
    private String getListarViewName() {
        return "vistas/" + getModuleName()  + "/listar.jsp"; //To change body of generated methods, choose Tools | Templates.
    }
    
    protected void getListar(HttpServletRequest request) {
        acceso = getListarViewName();
    }
    
    protected void getAgregar(HttpServletRequest request) {
        acceso = getAgregarViewName();
    }

    protected void getEditar(HttpServletRequest request) {
        acceso = getEditarViewName();
    }
    
    protected void postAgregar(HttpServletRequest request) {
        acceso = getListarViewName();
    }
    
    protected void postEditar(HttpServletRequest request) {
        acceso = getListarViewName();
    }
    
    protected void getBuscar(HttpServletRequest request, HttpServletResponse response) {
    
    }
    
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String action =request.getParameter("accion");
        
        if(action.equalsIgnoreCase("listar")){
            getListar(request);
        }else if(action.equalsIgnoreCase("add")){
            getAgregar(request);
        }
        else if(action.equalsIgnoreCase("Agregar")){
            postAgregar(request);     
        }
        else if(action.equalsIgnoreCase("editar")){
            getEditar(request);
        }
        else if(action.equalsIgnoreCase("Actualizar")){
            postEditar(request);
        }
        else if(action.equalsIgnoreCase("buscar")) {
            getBuscar(request, response);
            return;
        }
        RequestDispatcher vista=request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
