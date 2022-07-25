<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="com.learn.mycart.connection.DBConnection"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.UserDao"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>



<%

User user = (User) session.getAttribute("current-user");
if (user == null) {

    session.setAttribute("message", "You are not logged in !! Login first");
    response.sendRedirect("login.jsp");
    return;

} 




    String order_id = (String)session.getAttribute("current-order_id");
    String order_am = (String)session.getAttribute("current-order_am");
    
    if(order_id==null || order_id.equals("")) return;
    

   

%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Confirmation</title>

      <%@include file="components/common_css_js.jsp" %>

</head>
<body >


     <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">

                    <div class="card mt-3" style="background-color:#CAD5E2; color:black;">   
                      
                         <div class="card-body px-5">
                        
                            <h4 class="text-center my-3">Payment Confirmation</h4>        
                            

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Amount</label>
                                    <input type="text" class="form-control" id="exampleInputPassword1" value="<%out.println(order_am); %>" disabled  >
                                </div>
             
                                <div class="container text-center"> 

                                    <button  class="btn btn-success" id="rzp-button1">Pay</button>
                                    
                                </div>

                            

                        </div>


                    </div>




                </div>
            </div>
        </div>





<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
  	  <script>
    
  			 var options = {
    			key: "rzp_test_bLYdbJAXTO4nuF", 
    			amount: "<%=order_am%>", // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
    			currency: "INR",
    			name: "My Cart",
    			description: "Test Transaction",
    			image: "https://avatars.githubusercontent.com/u/69155638?v=4",
    			order_id: "<%=order_id%>", //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
    			handler: function (response){
       				 alert(response.razorpay_payment_id);
      				 alert(response.razorpay_order_id);
       				 alert(response.razorpay_signature)
    				},
    			prefill: {
        			name: "Om Prakash",
        			email: "om@gmail.com",
        			contact: "9999999999"
    			},
    			theme: {
       			 	color: "#3399cc"
   				}
			};

		var rzp1 = new Razorpay(options);

		console.log(rzp1);
		
		rzp1.on('payment.failed', function (response){
			
        		alert(response.error.code);
        		alert(response.error.description);
		        alert(response.error.source);
        		alert(response.error.step);
        		alert(response.error.reason);
        		alert(response.error.metadata.order_id);
        		alert(response.error.metadata.payment_id);
		});
		document.getElementById('rzp-button1').onclick = function(e){
		    rzp1.open();
		    e.preventDefault();
		}
</script>


</body >
</html>