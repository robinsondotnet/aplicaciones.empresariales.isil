
package Interfaces;

import Modelo.Cliente;
import java.util.List;


public interface CRUD<T> {
    public List listar();
    public T list(int id_cliente);
    public  boolean add(T cli);
    public  boolean edit(T cli);
    public  boolean eliminar(int id_cliente);
}
