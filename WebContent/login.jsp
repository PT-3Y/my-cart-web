<%@page import="com.learn.mycart.connection.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login - MyCart</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body style="background-color: #242B2E;">
        <%@include  file="components/navbar.jsp" %>
        <div class="container login">
            <div class="row">
                <div class="col-md-6 offset-md-3">

                    <div class="card mt-3" style="background-color:#CAD5E2; color:black;">
                        
                        
                         <div class="card-body px-5">
                         <%@include file="components/message.jsp" %>
                            <div class="container text-center">
                                <img src="img/add-friend.png"  style="max-width: 70px;" class="img-fluid" alt="">
                            </div>


                            <h4 class="text-center my-3">Log in here !!</h4>        
                            
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input  name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" autocomplete="off" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input  name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <a href="register.jsp" class="text-center d-block mb-2"> if not registered click here </a>
                                <div class="container text-center"> 

                                    <button class="btn btn-success">Log in</button>
                                    <button class="btn btn-warning">Reset</button>
                                </div>

                            </form>

                        </div>


                    </div>




                </div>
            </div>
        </div>





    </body>
</html>
