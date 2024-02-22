
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Proceso de Pago</title>
        <script>
            function mensaje() {
                window.alert("¡Por Favor! Cuando finalice la carga del pago PRESIONA 'VOLVER AL SITIO'. Asi podemos procesar correctamente el mismo :)");
            }
        </script>
    </head>
    <body>
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
        <% int deuda = Integer.parseInt(request.getParameter("deuda"));
            String detalle = request.getParameter("detalle");
            String nombre = request.getParameter("nombre");
            String dni = request.getParameter("dni");
        %>
        <div class="jumbotron jumbotron-default">
            <h1 class="display-4 col text-center"><%=nombre.toUpperCase()%></h1>
            <p class="lead col text-center">VAS A PAGAR EL PERIODO <%=detalle%> POR $ <%=deuda%>.</p>
            <hr class="my-4 col text-center">
            <div class="alert alert-danger text-center col-md-auto" role="alert"> IMPORTANTE </div>
            <h5 class="col text-center">Una ves que realices el pago, presioná "volver al sitio" para que cargue correctamente el pago.</h5>
            <% 



            %>
            <div class="container-mt5">
                <div class ="row">
                    <div class ="col text-center">
                        <form action="registropago.jsp" method="POST" onclick="mensaje()">
                            <script
                                src="https://www.mercadopago.com.ar/integrations/v1/web-payment-checkout.js"                               
                                data-preference-id="">
                            </script>
                            <input type="hidden" value="<%=detalle%>" name="detalle" >
                            <input type="hidden" value="<%=dni%>" name="dni" >
                            <input type="hidden" value="<%=nombre%>" name="nombre" >
                            <input type="hidden" value="<%=deuda%>" name="deuda" >
                        </form>
                    </div>
                </div>
            </div>
    </body>
</html>
