
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <% String dni = request.getParameter("dni");%>
        <div class="jumbotron">
            <div class="container">
                <h1 class="display-4 text-center"> TU DNI Nº <%=dni%>  NO FIGURA EN NUESTRA BASE DE DATOS </h1>                   
                <p class="lead col text-center">Si sos alumna/o y queres realizar un pago comunicate con</p><br>
                <p class="lead col text-center">administracion@fundacionhombrelibre.org</p><br>
                <p class="col text-center"></p><br>
            </div>
        </div>
        <div class="d-flex justify-content-around"> 
            <a href="index.jsp"><button type="submit" class="btn btn-primary">Voler al Incio</button></a>
        </div>     
    </body>
</html>
