/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author josca
 */
public class Producto {
    int id,descuento,cantidad;
    String nombre,categoria,descripcion,foto;
    double precio,preciototal;

    public Producto(int id, String nombre, String categoria, String descripcion, double precio,int descuento,String foto) {
        this.id = id;
        this.nombre = nombre;
        this.categoria = categoria;
        this.descripcion = descripcion;
        this.foto = foto;
        this.setDescuento(descuento);
        this.setPrecio(precio);
         this.setPreciototal(preciototal);
           this.cantidad = 1;
    }

    public int getId() {
        return id;
    }
     public int getCantidad() {
        return cantidad;
    }
        public void setCantidad(int cantidad) {
        this.cantidad=cantidad;
    }
   public int getDescuento() {
        return descuento;
    }
    public void setId(int id) {
        this.id = id;
    }
     public void setDescuento(int descuento) {
         if (descuento==0) {
             descuento=2;
         }
        this.descuento= descuento;
    }


    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
      
        this.precio = precio;
    }

    public double getPreciototal() {
        return preciototal;
    }

    public void setPreciototal(double preciototal) {
        String pe=Integer.toString(this.getDescuento());
         Double desc=Double.parseDouble(pe);
        double decimal=desc/100;
        double descuento=this.getPrecio()*decimal;
        this.preciototal = this.getPrecio()-descuento;
    }




}
