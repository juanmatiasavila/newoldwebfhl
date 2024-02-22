
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <title>Login</title>
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

        <form action="verificar" method="GET">
            <div class="container mt-5">
                <div class="row">
                    <div class="col-3">
                    </div>
                    <div class="col-6">

                        <div class="form-group">
                            <label for="DNI">CONSULTA DE CUOTAS</label>
                            <input type="text" name= "dni" class="form-control" placeholder="Ingresá tu DNI" >
                            <small class="font-weight-light">Solamente se mostrara el detalle de cuotas del Año 2020 - 2021 - 2022.</small><br>
                            <small class="font-weight-light">Para pagar periodos anteriores o diferencias en el detalle de deuda, contactactate con administracion@fundacionhombrelibre.org</small>
                        </div>
                        <button type="submit" name="consultar" class="btn btn-dark">Consultar</button>
                    </div>
                    <div class="col-3">
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
