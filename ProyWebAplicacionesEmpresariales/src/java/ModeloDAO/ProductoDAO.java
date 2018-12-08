package ModeloDAO;

import Config.Conexion;
import Interfaces.CRUD;
import Modelo.Cliente;
import Modelo.Producto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAO implements CRUD<Producto> {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public List listar() {
        ArrayList<Producto> list = new ArrayList<>();
        String sql = "select * from producto";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto cli = new Producto();
                cli.setId_producto(rs.getInt("id_producto"));
                cli.setDescripcion(rs.getString("descripcion"));
                cli.setPrecio(rs.getDouble("precio"));
                cli.setStock(rs.getInt("stock"));
                cli.setId_categoria(rs.getInt("id_categoria"));
                cli.setFoto(rs.getString("foto"));

                list.add(cli);
            }
        } catch (SQLException e) {
        }

        return list;

    }

    @Override
    public Producto list(int id_cliente) {

        Producto cli = new Producto();
        String sql = "select * from producto where id_producto=" + id_cliente;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                cli.setId_producto(rs.getInt("id_producto"));
                cli.setDescripcion(rs.getString("descripcion"));
                cli.setPrecio(rs.getDouble("precio"));
                cli.setStock(rs.getInt("stock"));
                cli.setId_categoria(rs.getInt("id_categoria"));
                cli.setFoto(rs.getString("foto"));

            }
        } catch (Exception e) {
        }

        return cli;

    }

    @Override
    public boolean add(Producto cli) {
        String sql = "insert into producto(descripcion,precio,stock,id_categoria,foto )values('" + cli.getDescripcion()+ "','" + cli.getPrecio()+ "', '" + cli.getStock()+ "','" + cli.getId_categoria()+ "', '"+ cli.getFoto() +"')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean edit(Producto cli) {
        String sql = "update producto set descripcion='" + cli.getDescripcion()+ "', precio='" + cli.getPrecio()+ "', stock='" + cli.getStock()+ "',id_categoria='" + cli.getId_categoria()+ "',foto='" + cli.getFoto() +  "' where id_producto=" + cli.getId_producto();

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
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
