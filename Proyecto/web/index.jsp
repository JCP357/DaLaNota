<%-- 
    Document   : index
    Created on : 26-dic-2021, 22:23:28
    Author     : josca
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <!DOCTYPE html>
    <html lang="en">
    <head>
      <title>Da La Nota</title>
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
        <p>La mejor calidad,A los mejores precios</p>
      </div>
      </div>
    </div>
    
    <%
       
    HttpSession sesion=request.getSession();

      String nombreUser=(String)sesion.getAttribute("nombre");
    if (sesion.getAttribute("nombre")==null|sesion.getAttribute("nombre")=="") {
                nombreUser="Invitado ";
        }
    
    
    %>
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
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> <%=nombreUser%> </a></li>
            <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
          </ul>
        </div>
      </div>
    </nav>
    
   <div class="container">

<div class="row">

    <div class="col"></div>
<div class="col-lg-5">
<div class="tarj">
    <div id="form-group">
      <!-- Tabs Titles -->
      <div class="card" style="width: 100%;">
        <div  class="rounded-circle">
        <img class="card-img-top" src="http://www.epayment.com.ng/images/blog-wp-login-1200x400.png" alt="Card image cap" >
        </div>
        <div class="card-body">
          <h5 class="card-title">Introduzca sus datos</h5>
          <form action="logincontroller" method="post">
            <input  class="form-control"  type="text" id="user"  name="user" placeholder="Usuario">
            <input class="form-control"  type="text" id="pass"  name="pass" placeholder="Contraseña">
            <input  type="submit" style="  margin-top:10px;" class="btn btn-primary" value="Entrar">
          </form>
        </div>
        </div>
      </div>
  
      <!-- Login Form -->
      
      <!-- Remind Passowrd -->
      <div id="formFooter">
        <a class="underlineHover" href="#">¿Olvidaste tu contraseña ?</a>
        ¿Aún no tienes una cuenta? <a class="underlineHover" href="#">Registrate</a>

      </div>
  
    </div>
  </div>
</div>
</div>
<div class="col"></div>

<footer class="container-fluid text-center" style=" margin-top:10%;"> 
    <p>Dev Copyright</p>  
    <form class="form-inline">Consige ofertas exclusivas:
      <input type="email" class="form-control" size="50" placeholder="Email">
      <button type="button" class="btn btn-danger">Suscribirse al boletín  </button>
    </form>
  </footer>
  