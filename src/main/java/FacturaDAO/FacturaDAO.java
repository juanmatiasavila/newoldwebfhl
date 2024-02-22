package FacturaDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class
FacturaDAO {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;
    String p = "";

    public int agregar1(String Dni, String Periodo, String Ruta) {
        Conexion cn = new Conexion();
        String sql = "insert into facturas(Dni, Periodo, Ruta)values(?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, Dni);
            ps.setString(2, Periodo);
            ps.setString(3, Ruta);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }

    public List<String> listar1(String Dni) {
        String sql;
        String sql1 = null;
        Conexion cn = new Conexion();
        if (Dni.equals("0")) {
            sql = "SELECT * FROM `facturas` ORDER BY `Id` DESC LIMIT 20";
            sql1 = "SELECT movimiento_id, cliente_numero_documento, numero, urlpdf  FROM `factura_response` ORDER BY `movimiento_id` DESC LIMIT 20";
        } else {
            sql = "SELECT * FROM `facturas` WHERE `Dni`='" + Dni + "'";
            sql1 = "SELECT movimiento_id, cliente_numero_documento, numero, urlpdf  FROM `factura_response` WHERE `cliente_numero_documento`='" + Dni + "'";
        }
        List<String> lista = new ArrayList<String>();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                lista.add(rs.getString(1));
                lista.add(rs.getString(2));
                lista.add(rs.getString(3));
                lista.add("/Controlador?accion=Cargar&path=" + rs.getString(4));
            }
            // <td><a href="/Controlador?accion=Cargar&path=<%=productos.get(i + 3)%>" class="btn btn-primary">Descargar</a></td>
        } catch (Exception e) {
        }
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql1);
            rs = ps.executeQuery();
            while (rs.next()) {
                lista.add(rs.getString(1));
                lista.add(rs.getString(2));
                lista.add(rs.getString(3));
                lista.add(rs.getString(4));
            }
        } catch (Exception e) {
        }
        return lista;
    }

    public int eliminar(int Id) {
        Conexion cn = new Conexion();
        String sql = "DELETE FROM `facturas` WHERE Id = " + Id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }

    public String path(int guardar) {
        String sql;
        Conexion cn = new Conexion();
        if (guardar == 1) {
             sql = "SELECT `Ruta` FROM `facturas` WHERE Id=1";
        } else {
             sql = "SELECT `Ruta` FROM `facturas` WHERE Id=2";
        }
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {                
                p = rs.getString("Ruta");
            }            
        } catch (Exception e) {
        }
        return p;
    }
}
