/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tabla;

import FacturaDAO.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CargaTabla {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public CargaTabla() {

    }

    public String Nombre(String dni) {
        String nombre = "";
        Conexion cn = new Conexion();
        List lista = new ArrayList();
        String sql = "SELECT NOMBRE FROM `deuda` WHERE DNI = '" + dni + "'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                nombre = rs.getString(1);
            }
        } catch (Exception e) {
        }
        return nombre;
    }

    public List<String> CuentaCorriente(String dni) {
        Conexion cn = new Conexion();
        List lista = new ArrayList();
        String sql = "SELECT deuda.DETALLE, deuda.PESOS - SUM(ifnull(ingresos.PESOS,0)) + (calculo(TIMESTAMPDIFF(MONTH, deuda.DETALLE, CURDATE()), (deuda.PESOS - SUM(ifnull(ingresos.PESOS,0))))) AS DIFERENCIA FROM deuda LEFT OUTER JOIN ingresos on deuda.DNI = ingresos.DNI AND deuda.DETALLE = ingresos.DETALLE WHERE deuda.DNI = '" + dni + "' GROUP BY deuda.DETALLE";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                lista.add(rs.getString(1));
                if (rs.getString(2).contains("-")) {//ELIMINA LOS RESULTADOS CON "MENOS"
                    lista.add("0.00");
                } else {
                    lista.add(rs.getString(2));
                }
            }
        } catch (Exception e) {
        }
        return lista;
    }

    public List<String> EliminacionMp(List listacc, String dni) {

        Conexion cn = new Conexion();
        List listamp = new ArrayList();
        String sql = "SELECT DETALLE, DEUDA, OP FROM `pagosrealizados` WHERE DNI = '" + dni + "'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                listamp.add(rs.getString(1));
                listamp.add(rs.getString(2));
                listamp.add(rs.getString(3));
            }
        } catch (Exception e) {
        }
        for (int i = 0; i < listacc.size(); i = i + 2) {
            for (int j = 0; j < listamp.size(); j = j + 3) {
                if (listamp.get(j + 2).toString().contains("P")) {

                } else {
                    if (listacc.get(i).equals(listamp.get(j))) {
                        listacc.set(i + 1, "0.00");
                    }
                }
            }
        }
        return listacc;
    }

}
