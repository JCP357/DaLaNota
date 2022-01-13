<%-- 
    Document   : detalle
    Created on : 10-ene-2022, 8:38:46
    Author     : josca
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Producto"%>
<%@page import="DAO.DAOController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <!DOCTYPE html>
<html lang="en">
<head>
  <title>Detalle producto</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  <style>
.glowtext {
color: #FFFFFF;

text-shadow: 0 0 5px #FFF, 0 0 10px #FFF, 0 0 15px #FFF, 0 0 20px #49ff18, 0 0 30px #49FF18, 0 0 40px #49FF18, 0 0 55px #49FF18, 0 0 75px #49ff18;
color: #FFFFFF;

}
    /* Remove the navbar's default rounded borders and increase the bottom margin */ 
    .navbar {
      margin-bottom: 50px;
      border-radius: 0;
    }
    
    /* Remove the jumbotron's default bottom margin */ 
     .jumbotron {
      margin-bottom: 0;
        background-image: url("imagenes/fondo.jpg");
      
    }
   
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
  </style>
</head>
<body>

<div class="jumbotron"  >
  <div class="container text-center text-primary">
    <div class="glowtext">
    <h1>Da La Nota</h1>      
    <p>La mejor calidad,a Los mejores precios</p>
  </div>
  </div>
</div>

 <nav class="navbar navbar-inverse">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>                        
          </button>
          <a class="navbar-brand" href="#">&#127925;</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
          <ul class="nav navbar-nav">
            <li ><a href="#">Inicio</a></li>
            <li><a href="Mostrar.jsp">Productos</a></li>
            <li><a href="#">Ofertas</a></li>
            <li><a href="#">Tiendas</a></li>
            <li><a href="#">Contacte con nosotros</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
          </ul>
        </div>
      </div>
    </nav>
<%
   String id= request.getParameter("id");
   if (id==null|id=="") {
           id="37";
       }

DAOController dao=new DAOController();
Producto producto=dao.DetalleProducto(id);



        
    %>

<div class="container">
<div class="row">

<div class="col-lg-6" >
  <div class="panel panel-primary">
    <div class="panel-heading"></div>
    <div class="panel-body"><img src="imagenes/<%=producto.getFoto()%>" class="img-responsive" style="width:100%" alt="Image"></div>
    <div class="panel-footer text-center"><a class="btn btn-dark" style="color: green;" href="AddCart?id=<%=producto.getId()%>"> Añadir al carrito </a></div>
  </div>
</div>



<div class="col-lg-4"> 

  <div class="form-group">

<div class=" form-control" style="margin-bottom: 5%" > <p>Precio</p> </div>
<div class=""> <h6 style="text-decoration: line-through;"><%=producto.getPrecio()%></h6> </div>
<div class=""> <h2 style="text-decoration: underline overline;"><%=producto.getPreciototal()%></h6> </div>
<div class=""> <h2>Ahorras un <%=producto.getDescuento()%> %</h6> </div>
<div class="form-control" style="margin-bottom: 5%"> <p>Descripcion del producto</p> </div>
<div class=""> <p><%=producto.getDescripcion()%></p> </div>


</div>
</div>
</div>
</div>

<footer class="container-fluid text-center">
    <p>Online Store Copyright</p>  
    <form class="form-inline">Get deals:
      <input type="email" class="form-control" size="50" placeholder="Email Address">
      <button type="button" class="btn btn-danger">Sign Up</button>
    </form>
  </footer>


</body>
</html>