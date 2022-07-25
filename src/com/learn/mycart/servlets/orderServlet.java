package com.learn.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.razorpay.*;

/**
 * Servlet implementation class orderServlet
 */

public class orderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, RazorpayException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            //coding area
        	int amount=1;
        	
        	RazorpayClient client= new RazorpayClient("rzp_test_bLYdbJAXTO4nuF","CXKVZ5snXymNfLfiZqtMm1sN");
        	
        	JSONObject ob = new JSONObject();
        	ob.put("amount",amount*100);
        	ob.put("currency","INR");
        	ob.put("receipt", "txn_235425");
        	
        	//create order..
        	
        	Order order=client.Orders.create(ob);
        	
        	
        	
        	//save order to databse.....
        	
        	
        	//
        	
        	HttpSession httpSession = request.getSession();
        	
        	JsonObject convertedObject = new Gson().fromJson(order.toString(), JsonObject.class);
        	
        	  httpSession.setAttribute("current-order_id", convertedObject.get("id").getAsString());
        	  httpSession.setAttribute("current-order_am", convertedObject.get("amount").getAsString());
        	  
        	  response.sendRedirect("payment.jsp"); 
        	
          	
        	
          }

        }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		        try {
					processRequest(request, response);
				} catch (RazorpayException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        try {
			processRequest(request, response);
		} catch (RazorpayException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
