<%-- 
    Document   : Mostrar.jsp
    Created on : 11-ene-2022, 12:13:21
    Author     : josca
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Producto"%>
<%@page import="DAO.DAOController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <!DOCTYPE html>
    <html lang="en">
    <head>
      <title>Bootstrap Example</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
      <style>


.cont div{

  margin-right: 10px;
}
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
        
    <div class="container text-center" style=" margin-bottom:  10%;">
<p>Categorias</p>

<div class="cont">
<div class="text-center">
    <a class="btn btn-primary " href="Mostrar.jsp?num=4">Percusion </a>
    <a href="Mostrar.jsp?num=5" class="btn btn-primary"  >Cuerda </a>
    <a  class="btn btn-primary" href="Mostrar.jsp?num=6">Teclado </a>
    <a class="btn btn-primary" href="Mostrar.jsp?num=7">Viento </a>
     <a class="btn btn-primary" href="Mostrar.jsp?num=8">Produccion </a>
     </div>
    </div>
</div>
    <div class="container" style="margin-bottom:10%;">    
      <div class="row">
<%
   String op= request.getParameter("num");
   if (op==null|op=="") {
           op="4";
       }

DAOController dao=new DAOController();
ArrayList<Producto> list=dao.MuestraProductos(op);


for (Producto producto : list) {
        
    %>
    

        <div class=" row row-cols-1 row-cols-sm-2 row-cols-md-3  g-3" style="margin-right: 150px; margin-left: 150px;">
          
          <div class="panel panel-primary">
              <div class="panel-heading"><a style="color:white;" href="detalle.jsp?id=<%=producto.getId()%>"><%=producto.getNombre()%></a></div>
            <div class="panel-body"><img src="imagenes/<%=producto.getFoto()%>" class="img-responsive"  alt="Image"></div>
            <div class="panel-footer"><%=producto.getDescripcion()%></div>
          </div>
        </div>
    
    
    <%
    }


%>


   
        
      </div>
        </div>
     
<br><br>
    
    <footer class="container-fluid text-center" style=" margin-top:  10%;">
      <p>Online Store Copyright</p>  
      <form class="form-inline">Get deals:
        <input type="email" class="form-control" size="50" placeholder="Email Address">
        <button type="button" class="btn btn-danger">Sign Up</button>
      </form>
    </footer>
    
    </body>
    </html> 