

    
    <%@page import="Modelo.cliente"%>
<%@page import="Modelo.Producto"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
    <html lang="en">
    <head>
      <title>Bootstrap Example</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
      
      <%
      
      ServletContext sc=request.getServletContext();
      
ArrayList<Producto> lista=(ArrayList)sc.getAttribute("listaprod");

ArrayList<cliente> lista2=(ArrayList)sc.getAttribute("listaclientes");
      
      %>
      
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
            <li><a href="#">Producots</a></li>
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
    <div class="container text-center" style=" margin-bottom:  10%;">
<p>Administracion</p>

        
       
      </div>
<br>
    
<div class="container text-center" style=" margin-bottom:  10%;">
<div class="row">
<div class="col-md-4">
  <hr>
  <label>Lista de productos entre dos fechas</label>
  <hr>
<form class="form-horizontal" method="" action="" >
<label>Introduzca la primera fecha</label>
<input type="date" class="form-control" name="primera" >
<br>

<label>Introduzca la segunda fecha</label>
<input type="date" class="form-control" name="segunda">
<br>
<input type="submit">

</form>

</div>

    <div class="col-md-4"><form class="form-horizontal" method="" action="" >
  <hr>
  <label>Lista de pedidos de un producto</label>
  <hr>
  <label>Seleccione un producto</label>
  <select class="form-control" class="form-control" name="producto"> <%
      for (Producto producto : lista) {
      %>
      <option><%=producto.getNombre()%></option>
      
          <% } %>
      </select>
  <br>
  <input type="submit">
  
  </form></div>
<div class="col-md-4"><form class="form-horizontal" method="post" action="ConsultarPedidosCliente" >
  <hr>
  <label>Ver pedidos de un cliente</label>
  <hr>
  <label>Seleccione un cliente</label>
  <select class="form-control" class="form-control" name="cliente">
     <%
      for (cliente p : lista2) {
      %>
      <option value="<%=p.getId()%>"><%=p.getNick()%></option>
      
          <% } %>
      
  </select>
  <br>
  <input type="submit">
  
  </form></div>



</div>
    
  
          </div>
    <br><br>


    <footer class="container-fluid text-center">
      <p>Online Store Copyright</p>  
      <form class="form-inline">Get deals:
        <input type="email" class="form-control" size="50" placeholder="Email Address">
        <button type="button" class="btn btn-danger">Sign Up</button>
      </form>
    </footer>
    
    </body>
    </html> 