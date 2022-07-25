<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body style="background-color: #242B2E;">
        <%@include  file="components/navbar.jsp" %>
        
        <div class="container-fluid register">
            <div class="row mt-3">
                <div class="col-md-4 offset-md-4">                  

                    <div class="card" style="background-color:#CAD5E2; color:black;">                        
                        <%@include  file="components/message.jsp" %>                        
                        <div class="card-body px-5">
                            <div class="container text-center">
                                <img src="img/add-friend.png"  style="max-width: 70px;" class="img-fluid" alt="">
                            </div>


                            <h4 class="text-center my-3">Sign up here !!</h4>

                            <form action="RegisterServlet" method="post">

                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" autocomplete="off" id="name" placeholder="Enter name" aria-describedby="emailHelp">
                                </div>

                                <div class="form-group">
                                    <label for="email">User Email</label>
                                    <input name="user_email" type="email" class="form-control" id="email" autocomplete="off" placeholder="Enter email" aria-describedby="emailHelp">
                                </div>

                                <div class="form-group">
                                    <label for="password">User password</label>
                                    <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter password" aria-describedby="emailHelp">
                                </div>

                                <div class="form-group">
                                    <label for="phone">User phone</label>
                                    <input name="user_phone" type="number" class="form-control" id="phone" autocomplete="off" placeholder="Enter phone" aria-describedby="emailHelp">
                                </div>

                                <div class="form-group">
                                    <label for="phone">User Address</label>
                                    <textarea name="user_address" style="height: 100px;" class="form-control" autocomplete="off" placeholder="Enter your address"></textarea>


                                </div>

                                <div class="container text-center"> 
                                    <button class="btn btn-success">Register</button>
                                    <button type="reset" class="btn btn-warning">Reset</button>

                                </div>


                            </form>


                        </div>

                    </div>

                </div>
            </div>



        </div>
    </body>
</html>
