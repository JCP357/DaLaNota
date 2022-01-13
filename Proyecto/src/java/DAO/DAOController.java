/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Modelo.Producto;
import Modelo.cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author josca
 */
public class DAOController {

    public DAOController() {

    }

    public ArrayList<String[]> llenalistaPedidos(String sql) {
        try {

            ArrayList<String[]> lista = new ArrayList<>();
            dbConnection dbc = new dbConnection();

            Connection conn = dbc.getConnection();

            /*
              int id,descuento;
    String nombre,categoria,descripcion,foto;
    double precio,preciototal;
            id_producto	nombre_producto	nombre_categoria descripcion	precio	descuento foto
             */
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String[] pedido = new String[10];

            }

            return lista;

        } catch (SQLException ex) {

        }
        return null;

    }

    public boolean loginOK(String sql, String user, String pass) {

        try {

            ArrayList<String> lista = new ArrayList<>();
            dbConnection dbc = new dbConnection();

            Connection conn = dbc.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                String a = rs.getString(1);
                lista.add(a);
                a = null;

            }

            if (lista.size() > 0) {
                return true;
            } else {
                return false;
            }

        } catch (SQLException ex) {
            String mensaje = ex.getMessage();
            System.out.println(mensaje);

            return false;
        }

    }

    public ArrayList<cliente> llenalistaClientesID() {
        try {

            ArrayList<cliente> lista = new ArrayList<>();
            dbConnection dbc = new dbConnection();

            Connection conn = dbc.getConnection();
            String sql = "SELECT `id`,`Nombre Usuario` FROM `usuarios` WHERE perfil=0";

            /*
              int id,descuento;
    String nombre,categoria,descripcion,foto;
    double precio,preciototal;
            id_producto	nombre_producto	nombre_categoria descripcion	precio	descuento foto
             */
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                int name = rs.getInt(1);

                String nam = rs.getString(2);

                cliente c = new cliente(name, nam);
                lista.add(c);
                c = null;

            }

            return lista;

        } catch (SQLException ex) {

        }
        return null;

    }

    public ArrayList<Producto> llenalista(int opcion) {
        try {

            ArrayList<Producto> lista = new ArrayList<>();
            dbConnection dbc = new dbConnection();

            Connection conn = dbc.getConnection();
            String sql = "";

            switch (opcion) {

                case 1: {
                    sql = "SELECT * FROM `productos` WHERE descuento>0 ORDER by descuento DESC LIMIT 6 ";

                }

                case 2: {
                    sql = "SELECT * FROM `productos`";

                }

            }

            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                int id = rs.getInt(1);
                String nombre = rs.getString(2);
                String categoria = rs.getString(3);
                String descripcion = rs.getString(4);
                int precio = rs.getInt(5);
                int descuento = rs.getInt(6);
                String foto = rs.getString(7);

                Producto p = new Producto(id, nombre, categoria, descripcion, precio, descuento, foto);
                lista.add(p);

            }

            return lista;

        } catch (SQLException ex) {

        }
        return null;

    }

    public Producto BuscaProducto(int ide) {
        try {

           
            dbConnection dbc = new dbConnection();

            Connection conn = dbc.getConnection();
            String sql = "SELECT * FROM `productos` WHERE id_producto=?;";

          
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, ide);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                int id = rs.getInt(1);
                String nombre = rs.getString(2);
                String categoria = rs.getString(3);
                String descripcion = rs.getString(4);
                int precio = rs.getInt(5);
                int descuento = rs.getInt(6);
                String foto = rs.getString(7);

                Producto p = new Producto(id, nombre, categoria, descripcion, precio, descuento, foto);
             
                    return p;
            }

            

        } catch (SQLException ex) {

        }
        return null;

    }

    public ArrayList<Producto> MuestraProductos(String idp) {
        try {
            int num = Integer.parseInt(idp);
            ArrayList<Producto> lista = new ArrayList<>();
            dbConnection dbc = new dbConnection();

            Connection conn = dbc.getConnection();
            String sql = "SELECT * FROM `productos` WHERE id_categoria=?";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, num);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                int id = rs.getInt(1);
                String nombre = rs.getString(2);
                String categoria = rs.getString(3);
                String descripcion = rs.getString(4);
                int precio = rs.getInt(5);
                int descuento = rs.getInt(6);
                String foto = rs.getString(7);

                Producto p = new Producto(id, nombre, categoria, descripcion, precio, descuento, foto);
                lista.add(p);

            }

            return lista;

        } catch (SQLException ex) {

        }
        return null;

    }

    public Producto DetalleProducto(String idp) {
        try {
            int num = Integer.parseInt(idp);
            ArrayList<Producto> lista = new ArrayList<>();
            dbConnection dbc = new dbConnection();

            Connection conn = dbc.getConnection();
            String sql = "SELECT * FROM `productos` WHERE id_producto=?";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, num);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                int id = rs.getInt(1);
                String nombre = rs.getString(2);
                String categoria = rs.getString(3);
                String descripcion = rs.getString(4);
                int precio = rs.getInt(5);
                int descuento = rs.getInt(6);
                String foto = rs.getString(7);

                Producto p = new Producto(id, nombre, categoria, descripcion, precio, descuento, foto);

                return p;

            }

        } catch (SQLException ex) {

        }
        return null;

    }

}
