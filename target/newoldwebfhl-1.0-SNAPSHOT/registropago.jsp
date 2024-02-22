
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>DATOS</title>
    </head>
    <body>
        <%  String operacion = "";
            String estado = "";
            //OBTENER DATOS
            if (request.getParameter("payment_id") == null) {
                operacion = request.getParameter("collection_id");
            } else {
                operacion = request.getParameter("payment_id");
            }
            if (request.getParameter("payment_status") == null) {
                estado = request.getParameter("collection_status");
            } else {
                estado = request.getParameter("payment_status");
            }
            String detalle = request.getParameter("detalle");
            String nombre = request.getParameter("nombre");
            String dni = request.getParameter("dni");
            int deuda = Integer.parseInt(request.getParameter("deuda"));
            Date myDate = new Date();
            String fecha = new SimpleDateFormat("dd-MM-yyyy").format(myDate);
            //ARMADO DE STRING PARA ENVIAR EMAIL
            String mensaje = dni + " - " + nombre + " - MERCADOPAGO OP N " + operacion + " - PERIODO " + detalle + " - FECHA " + fecha + " - $" + Integer.toString(deuda);
            String asunto = "Pago de " + nombre + " periodo " + detalle;
            String asunto1 = "Pago PENDIENTE de" + nombre + " periodo " + detalle;
        %>
        <div class="container mt-5">
            <div class ="row">
                <div class ="col-3">
                </div>
                <div class ="col-6">   
                    <img class="img-fluid" src="imagenes/grande.jpg" alt=""/>
                </div>
                <div class ="col-3">
                </div>
            </div>
        </div>
        <div class="jumbotron">
            <div class="container">
                <h1 class="display-4 text-center"><%
                    //REGISTRO DE OPERACION EXITOSA
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn = DriverManager.getConnection("jdbc:mysql://p11-eu106.activaserver.com:3306/cuentasfhl?serverTimezone=UTC", "fhombrelibre", "Sk7bdr77!");
                        Statement st = cn.createStatement();
                        if (estado.equals("approved")) {
                            st.executeUpdate("insert into pagosrealizados (DNI, NOMBRE, DETALLE, DEUDA, FECHA, OP) values ('" + dni + "', '" + nombre + "', '" + detalle + "', '" + deuda + "', '" + fecha + "', '" + operacion + "');");
                            //st.executeUpdate("UPDATE cuentascorrientes SET `" + detalle + "`= '0' WHERE DNI = " + dni + "");
                            out.println("¡RECIBIMOS TU PAGO!");

                    %>  </h1>                   
                <p class="lead col text-center">Guarda el Numero de OP de Mercado Pago por si te lo llegamos a solicitar.</p><br>
                <p class="lead col text-center">Tu Numero de OP es <%=operacion%></p><br>
                <p class="col text-center">Recorda que el pago se actualizará en nuestras bases de datos en 48/72 Hs</p><br>
                <%
                    //REGISTRO OPERACION 'PENDIENTE'
                } else if (estado.equals("pending")) {
                    st.executeUpdate("insert into pagosrealizados (DNI, NOMBRE, DETALLE, DEUDA, FECHA, OP) values ('" + dni + "', '" + nombre + "', '" + detalle + "', '" + deuda + "', '" + fecha + "', '" + "P" + operacion + "');");
                    out.println("TU PAGO ESTA PENDIENTE");;
                %>                   
                <p class="lead col text-center">Guarda el Numero de OP de Mercado Pago por si te lo llegamos a solicitar.</p><br>
                <p class="lead col text-center">Tu Numero de OP es <%=operacion%></p><br>
                <p class="col text-center">Recorda que el pago se actualizará en nuestras bases de datos en 48/72 Hs</p><br>
                <%
                    //OPERACION FALLIDA
                        } else {
                            out.print("TRANSACCION NO REALIZADA");
                        }
                    } catch (Exception e) {
                        out.print(e);
                    }%>                  
            </div>
        </div>
        <div class="d-flex justify-content-around"> 
            <a href="tabla.jsp?dni=<%=dni%>"><button type="submit" class="btn btn-primary">Pagar Otro Periodo</button></a>
            <a href="index.jsp"><button type="submit" class="btn btn-primary">Voler al Incio</button></a>
        </div>     

    </body>
</html>
