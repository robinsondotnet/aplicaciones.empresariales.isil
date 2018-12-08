
package ModeloDAO;

import Config.Conexion;
import Interfaces.CRUD;
import Modelo.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ClienteDAO implements CRUD<Cliente>{
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Cliente c=new Cliente();

    @Override
    public List listar() {
        ArrayList<Cliente>list= new ArrayList<>();
        String sql="select * from cliente";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Cliente cli=new Cliente();
                cli.setId_cliene(rs.getInt("id_cliente"));
                cli.setRazon_social(rs.getString("razon_social"));
                cli.setTip_doc(rs.getString("tipo_doc"));
                cli.setNum_doc(rs.getString("num_doc"));
                cli.setEmail(rs.getString("email"));
                list.add(cli);
            }
        } catch (SQLException e) {
        }
        
        
        return list;
        
    }

    @Override
    public Cliente list(int id_cliente) {
        
        String sql="select * from cliente where id_cliente="+id_cliente;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                c.setId_cliene(rs.getInt("id_cliente"));
                c.setRazon_social(rs.getString("razon_social"));
                c.setTip_doc(rs.getString("tipo_doc"));
                c.setNum_doc(rs.getString("num_doc"));
                c.setEmail(rs.getString("email"));
                
            }
        } catch (Exception e) {
        }
        
        
        return c;

    }

    @Override
    public boolean add(Cliente cli) {
        String sql="insert into cliente(razon_social,tipo_doc,num_doc,email )values('"+cli.getRazon_social()+"','"+cli.getTip_doc()+"', '"+cli.getNum_doc()+"','"+cli.getEmail()+"')";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean edit(Cliente cli) {
        String sql="update cliente set razon_social='"+cli.getRazon_social()+"', tipo_doc='"+cli.getTip_doc()+"', num_doc='"+cli.getNum_doc()+"',email='"+cli.getEmail()+"' where id_cliente="+cli.getId_cliene();

        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
            
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean eliminar(int id_cliente) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
