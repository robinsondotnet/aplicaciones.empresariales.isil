
package ModeloDAO;

import Config.Conexion;
import Interfaces.CRUD;
import Modelo.Pago;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class PagoDAO implements CRUD<Pago>{
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public List listar() {
        ArrayList<Pago>list= new ArrayList<>();
        String sql="select * from consumo";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Pago pago = new Pago();
                pago.setId_consumo(rs.getInt("id_consumo"));
                pago.setId_producto(rs.getInt("id_producto"));
                pago.setMesa(rs.getString("mesa"));
                pago.setPrecio(rs.getDouble("precio"));
                
                list.add(pago);
            }
        } catch (SQLException e) {
        }
        
        
        return list;
        
    }

    @Override
    public Pago list(int id_consumo) {
        Pago pago = new Pago();
        String sql="select * from consumo where id_consumo="+ id_consumo;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                
                pago.setId_consumo(rs.getInt("id_consumo"));
                pago.setId_producto(rs.getInt("id_producto"));
                pago.setMesa(rs.getString("mesa"));
                pago.setPrecio(rs.getDouble("precio"));
                
                return pago;
            }
        } catch (SQLException e) {
            
        }
        
        return pago;
    }

    @Override
    public boolean add(Pago cli) {
        String sql="insert into consumo(id_producto,mesa,precio )values('"+cli.getId_producto()+"','"+cli.getMesa()+"', '"+cli.getPrecio()+"')";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean edit(Pago cli) {
        String sql="update consumo set id_producto='"+cli.getId_producto()+"', mesa='"+cli.getMesa()+"', precio='"+cli.getPrecio()+"' where id_consumo="+cli.getId_consumo();

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
