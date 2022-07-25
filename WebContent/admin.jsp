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

    } else {

        if (user.getUserType().equals("normal")) {

            session.setAttribute("message", "You are not admin ! Do not access this page");
            response.sendRedirect("login.jsp");
            return;

        }

    }


%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <script>

        function goToEditProduct() {

            window.location = "editProduct.jsp";

        }
        </script>
        <%@include file="components/common_css_js.jsp" %>


    </head>
    <body>

        <%@include  file="components/navbar.jsp" %>

        <div class="container admin">


            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>




            <div class="row mt-3">

                <!--first col-->
                <div class="col-sm-4">

                    <!--first box-->
                    <div class="card" data-toggle="modal" data-target="#view-edit-user-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/seo-and-web.png" alt="user_icon">

                            </div> 
                            <h1><%
                            UserDao usr= new UserDao(DBConnection.getConnection());
                            out.println(usr.getAllUser().size());
                            %></h1>
                            <h1 class="text-uppercase text-muted">Users</h1>

                        </div>

                    </div>



                </div>

                <!--second col-->

                <div class="col-sm-4">


                    <div class="card" data-toggle="modal" data-target="#view-edit-category-modal">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/list.png" alt="user_icon">

                            </div> 

                            <h1><%
                            CategoryDao cat= new CategoryDao(DBConnection.getConnection());
                            out.println(cat.getCategories().size()); 
                            %></h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>

                        </div>

                    </div>


                </div>


                <!--third col-->
                <div class="col-sm-4">


                    <div class="card" data-toggle="modal" data-target="#view-edit-product-modal">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/product.png" alt="user_icon">

                            </div> 

                            <h1><%
                            ProductDao pro= new ProductDao(DBConnection.getConnection());
                            out.println(pro.getAllProducts().size());
                            %></h1>
                            <h1 class="text-uppercase text-muted">Products</h1>

                        </div>

                    </div>


                </div>





            </div>

            <!--second row-->

            <div class="row mt-3">

                <!--second :row first col-->
                <div class="col-md-6">


                    <div class="card" data-toggle="modal" data-target="#add-category-modal">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/keys.png" alt="user_icon">

                            </div> 

                            <p class="mt-2">Click here to add new category</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>

                        </div>

                    </div>
                </div>

                <!--second row : second col-->

                <div class="col-md-6">

                    <div class="card" data-toggle="modal" data-target="#add-product-modal">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/plus.png" alt="user_icon">

                            </div> 

                            <p class="mt-2">Click here to add new Product</p>
                            <h1 class="text-uppercase text-muted">Add Product</h1>

                        </div>

                    </div>

                </div>




            </div>



        </div>



        <!--add category modal-->



        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">

                            <input type="hidden" name="operation" value="addcategory">


                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required />

                            </div>


                            <div class="form-group">
                                <textarea style="height: 300px;" class="form-control" placeholder="Enter category description" name="catDescription" required></textarea>

                            </div>

                            <div class="cotnainer text-center">

                                <button class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                            </div>



                        </form>




                    </div>

                </div>
            </div>
        </div>




        <!--End add category modal-->

        <!--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

        <!--product modal-->

        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Product details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!--form-->

                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">

                            <input type="hidden" name="operation" value="addproduct"/>

                            <!--product title-->

                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Enter title of product" name="pName" required />
                            </div>

                            <!--product description-->

                            <div class="form-group">
                                <textarea style="height: 150px;" class="form-control" placeholder="Enter product description" name="pDesc"></textarea>

                            </div>

                            <!--product price-->

                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter price of product" name="pPrice" required />
                            </div>

                            <!--product discount-->

                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter product discount" name="pDiscount" required />
                            </div>


                            <!--product quantity-->

                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter product Quantity" name="pQuantity" required />
                            </div>


                            <!--product category-->

                            <%  CategoryDao cdao = new CategoryDao(DBConnection.getConnection());
                                List<Category> list = cdao.getCategories();

                            %>


                            <div class="form-group">
                                <select name="catId" class="form-control" id="">
                                    <%                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCategoryId()%>"> <%= c.getCategoryTitle()%> </option>
                                    <%}%>
                                </select>

                            </div>



                            <!--product file-->

                            <div class="form-group">
                                <label for="pPic">Select Picture of product</label>  
                                <br>
                                <input type="file" id="pPic" name="pPic" required />

                            </div>


                            <!--submit button-->
                            <div class="container text-center">

                                <button class="btn btn-outline-success">Add product</button>

                            </div>



                        </form>
                        <!--end form-->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        
        
        <!-- View and edit users-data -->
        
        
        <div class="modal fade" id="view-edit-user-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content" >
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">User details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!--form-->

                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">

                            <input type="hidden" name="operation" value="view_edit_user"/>

                         

                            <!--all users-->

                            <%  UserDao udao = new UserDao(DBConnection.getConnection());
                                List<User> ulist = udao.getAllUser();

                            %>

							<table class="table table-dark">
  								 <thead>
   									 <tr>
     								   <th scope="col">Id</th>
     								   <th scope="col"> Name</th>
      								   <th scope="col"> Email</th>
      								   <th scope="col"> Phone</th>
      								   <th scope="col"> Address</th>
      								   <th scope="col"> Mode</th>
      								   <th scope="col"> edit </th>
      								
      							  
   									 </tr>
 								 </thead>
 							 <tbody>
 							 
 							  <%     for (User c : ulist) {
                                %>
                                   <tr>
                                      <td><%out.println(c.getUserId()); %></td>
                                      <td><%out.println(c.getUserName()); %></td>
                                      <td><%out.println(c.getUserEmail()); %></td>
                                      <td><%out.println(c.getUserPhone()); %></td>
                                      <td><%out.println(c.getUserAddress()); %></td>
                                      <td><%out.println(c.getUserType()); %></td>
                                      <td><button type="button" class="btn btn-warning">Edit</button></td>
                                      
                                     </tr>
                                <%}%>
 							 
 							 </tbody>
						</table>

                        </form>
                        <!--end form-->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        
         <div class="modal fade" id="view-edit-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content" >
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Category details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                       

							<table class="table table-dark">
  								 <thead>
   									 <tr>
     								   <th scope="col">Id</th>
     								   <th scope="col"> Title</th>
      								   <th scope="col"> Description</th>
      								   <th scope="col"> edit </th>
      								 
   									 </tr>
 								 </thead>
 							 <tbody>
 							 
 							  <%     for (Category c : list) {
                                %>
                                   <tr>
                                      <td><%out.println(c.getCategoryId()); %></td>
                                      <td><%out.println(c.getCategoryTitle()); %></td>
                                      <td><%out.println(c.getCategoryDescription()); %></td>
                                      
                                      <td>
                                       <form action="EditServlet" method="post">
                                        <input type="hidden" name="edit-type" value="category"/>
                                        <input type="hidden" name="category_id" value="<%out.println(c.getCategoryId()); %>"  />
                                         <button type="submit" class="btn btn-warning" >Edit</button>
                                       </form>
                                      </td>
                                      
                                     </tr>
                                <%}%>
 							 
 							 </tbody>
						</table>

                        
                        <!--end form-->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        
        
        <!-- view-edit-product data -->
        
        <div class="modal fade" id="view-edit-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content" >
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Product details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                       

							<table class="table table-dark">
  								 <thead>
   									 <tr>
     								   <th scope="col">Id</th>
     								   <th scope="col"> Name</th>
      								   <th scope="col"> Description</th>
      								   <th scope="col"> Price</th>
      								   <th scope="col"> Discount</th>
      								   <th scope="col"> Quantity</th>
      								   <th scope="col"> edit </th>
   									 </tr>
 								 </thead>
 							 <tbody>
 							 
 							 <%  ProductDao pdao = new ProductDao(DBConnection.getConnection());
                                List<Product> plist = pdao.getAllProducts();

                            %>
 							 
 							  <%     for (Product c : plist) {
                                %>
                                   <tr>
                                      <td><%out.println(c.getpId()); %></td>
                                      <td><%out.println(c.getpName()); %></td>
                                      <td><%out.println(c.getpDesc()); %></td>
                                      <td><%out.println(c.getpPrice()); %></td>
                                      <td><%out.println(c.getpDiscount()); %></td>
                                      <td><%out.println(c.getpQuantity()); %></td>
                                      <td>
                                       <form action="EditServlet" method="post">
                                       <input type="hidden" name="edit-type" value="product"/>
                                       <input type="hidden" name="product_id" value="<%out.println(c.getpId()); %>"  />
                                         <button type="submit" class="btn btn-warning" >Edit</button>
                                      </form>
                                      </td>
                                     
                                     </tr>
                                <%}%>
 							 
 							 </tbody>
						</table>

                   
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>





       
        
       
        <%@include  file="components/common_modals.jsp" %>

    </body>
</html>
