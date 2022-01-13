/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import DAO.DAOController;
import Modelo.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author josca
 */
public class AddCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddCart</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCart at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        HttpSession sesion=request.getSession();
        
        if (1==0) {//sesion.getAttribute("name")==""|sesion.getAttribute("name")==null

            RequestDispatcher rd=request.getRequestDispatcher("login.html");
            
            rd.forward(request, response);
            
        }else{
        
        String ide=request.getParameter("id");
        
        int producto=Integer.parseInt(ide);
        
        
        
        if (sesion.getAttribute("lista")==""|sesion.getAttribute("lista")==null) {

           
            ArrayList<Producto> lista=new ArrayList<>();
            
            sesion.setAttribute("lista", lista);
            
            }
        
         ArrayList<Producto> lista= (ArrayList) sesion.getAttribute("lista");
         
            DAOController dao=new DAOController();
            
            Producto p=dao.BuscaProducto(Integer.parseInt(ide));
            
            boolean repetido=false;
            
            for (Producto producto1 : lista) {
                
                if (producto1.getId()==p.getId()) {
                    producto1.setCantidad(producto1.getCantidad()+1);
                    repetido=true;
                }
                
            }
            if (!repetido) {
                
            lista.add(p);
            }
            
            sesion.setAttribute("lista", lista);
            
            RequestDispatcher rd1=request.getRequestDispatcher("ShoppingCart.jsp");
            
            rd1.forward(request, response);
        
        }
        
        
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
