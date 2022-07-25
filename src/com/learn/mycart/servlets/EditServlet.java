package com.learn.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.learn.mycart.connection.DBConnection;
import com.learn.mycart.dao.UserDao;
import com.learn.mycart.entities.User;

/**
 * Servlet implementation class EditProductServlet
 */
public class EditServlet extends HttpServlet {
  
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            //coding area
        	
        	
        	HttpSession httpSession = request.getSession();
            String type= request.getParameter("edit-type");
        	
        	if(type.equals("product")) {
            String product_id = request.getParameter("product_id");

        
                httpSession.setAttribute("current-product", product_id);
                
                    response.sendRedirect("editProduct.jsp");  
                    
        	}else if(type.equals("category")) {
        		String category_id = request.getParameter("category_id");
                
                httpSession.setAttribute("current-category", category_id);
                
                    response.sendRedirect("editCategory.jsp");  
        	}
        	
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
        processRequest(request, response);
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
