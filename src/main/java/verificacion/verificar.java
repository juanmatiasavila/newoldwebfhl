package verificacion;

import FacturaDAO.Conexion;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "verificar", urlPatterns = {"/verificar"})
public class verificar extends HttpServlet {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Conexion cn = new Conexion();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        String dni = request.getParameter("dni");
        String sql = "SELECT * FROM `alumnas` where DNI = '" + dni + "'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                response.sendRedirect("tabla.jsp?dni=" + dni);
            }
            response.sendRedirect("novalido.jsp?dni=" + dni);

        } catch (Exception a) {
            System.out.print("NO ANDA" + a);
        }
    }
}
