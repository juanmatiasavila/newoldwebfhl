
<%@page import="Tabla.CargaTabla"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Consulta Deuda</title>
    </head>
    <body>
        <%
            String dni = request.getParameter("dni");
            Connection cn = null;
            Statement st = null;
            ResultSet rs = null;
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

        <div class="container mt-3">
            <div class="row">
                <div class="col justify-content-center">
                    <table class="table table-striped" aling="center">
                        <thead class="thead-dark">
                            <tr>
                                <th colspan="3" scope="row">
                                    <% //BUSQUEDA DE NOMBRE Y DNI                                        
                                        CargaTabla cargatabla = new CargaTabla();
                                        String nombre = cargatabla.Nombre(dni);
                                    %>NOMBRE: <%=nombre%> DNI: <%=dni%>
                                </th>
                            </tr>
                            <tr>
                                <th scope="row">PERIODO</th>
                                <th scope="row">SALDO</th>
                                <th scope="row">PAGAR</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% //LLENADO DE TABLA
                                List lista = cargatabla.CuentaCorriente(dni);//CARGA LA CUENTA CORRIENTE
                                List listamp = cargatabla.EliminacionMp(lista, dni);//ELIMINA LOS PAGOS YA REALIZADOS POR MP QUE NO TIENEN FACTURA TODAVIA

                                for (int i = 0; i < listamp.size(); i = i + 2) {
                                String deuda = listamp.get(i + 1).toString();
                                deuda = deuda.substring(0, deuda.length()-3);//ELIMINO LOS DECIMALES PARA QUE PASE UN INT
                                String detalle = listamp.get(i).toString();
                            %> 
                            <tr>
                                <td><% out.print(listamp.get(i));%></td>
                                <td><% out.print(listamp.get(i + 1));%></td>
                                <td > <a href="mercadopago.jsp?deuda=<%=deuda %>&detalle=<%=detalle%>&nombre=<%=nombre%>&dni=<%=dni%>">
                                        <i class="fa fa-credit-card-alt" aria-hidden="true"></i></a></td>   
                            </tr>   
                            <%}%>
                        </tbody>
                    </table>            
                </div>
            </div>
        </div>
        <div class ="d-grid gap-2 col-6 mx-auto text-center">   
            <h1 class="fw-lighter" style="text-align:center">Descarga tus facturas Aca</h1>
            <a href="/factura/cliente.jsp?dni=<%=dni%>" class="btn btn-primary">FACTURAS</a>
        </div>
        <div class="container mt-5">
            <div class ="row">
                <div class ="col-3">
                </div>
                <div class ="col-6">   
                    <p class="lead col text-center">Si tenes alguna duda respecto a los importes que figuran en la tabla contactate con:</p> 
                    <p class="lead col text-center">administracion@fundacionhombrelibre.org</p>  
                </div>
                <div class ="col-3">
                </div>
            </div>
        </div>
    </body>
</html>
