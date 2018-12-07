
package Interfaces;

import Modelo.Cliente;
import java.util.List;


public interface CRUD {
    public List listar();
    public Cliente list(int id_cliente);
    public  boolean add(Cliente cli);
    public  boolean edit(Cliente cli);
    public  boolean eliminar(int id_cliente);
}
