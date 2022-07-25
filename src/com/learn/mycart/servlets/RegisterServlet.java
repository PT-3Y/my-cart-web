package com.learn.mycart.servlets;
import com.learn.mycart.dao.UserDao;
import com.learn.mycart.connection.DBConnection;
import com.learn.mycart.entities.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class RegisterServlet extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            try {
                
                String userName = request.getParameter("user_name");
                String userEmail = request.getParameter("user_email");
                String userPassword = request.getParameter("user_password");
                String userPhone = request.getParameter("user_phone");
                String userPic="default.jpg";
                String userAddress = request.getParameter("user_address");
                String userMode="normal";

                // validations
                if (userName.isEmpty()) {
                    out.println("Name is blank ");
                    return;
                }
                
                //check if user already exist or not.........
                
                User user=null;
                UserDao udao= new UserDao(DBConnection.getConnection());
               user= udao.getUserByEmail(userEmail);
               
               HttpSession httpSession = request.getSession();
                
               if(user==null) {
                //creating user object to store data
               
                
                String query=" INSERT INTO public.\"User\"(\r\n" + 
                		"    user_name, user_email, user_password, user_phone, user_address, user_pic, user_mode)\r\n" + 
                		"	VALUES ('" +userName+ "', '" +userEmail+ "', '" +userPassword+ "' , '"+ userPhone +"' , '"+ userAddress +"' , '"+ userPic +"', '"+ userMode+ "')";
                
               int add= DBConnection.insertUpdateFromSqlQuery(query);
                               
                DBConnection.CloseConnection();               
               
                	if(add>0) {
                		httpSession.setAttribute("message", "Registration Successful !!");                
		                response.sendRedirect("register.jsp");
                	}else {
                		httpSession.setAttribute("message", "Registration Un-successful, try again..!!");                
                		response.sendRedirect("register.jsp");
                	}
                	
               }else {
            	   httpSession.setAttribute("message", "User already exist, try with diff email..");                
                   response.sendRedirect("register.jsp");
               }
                
            } catch (Exception e) {
                e.printStackTrace();
                
                
                
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
