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


    String product_id = (String)session.getAttribute("current-product");

    int id=Integer.parseInt(product_id.trim());
    
    
    
    ProductDao pdao=new ProductDao(DBConnection.getConnection());
    
    Product curr=pdao.getProductById(id);

%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product</title>
        
        <%@include file="components/common_css_js.jsp" %>

</head>
<body style="background-color: #242B2E;">

        <%@include  file="components/navbar.jsp" %>
        
        <div class="container">
           
          <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
        
           <div class="card mt-4" style="background-color:#CAD5E2; color:black;">
            
            
               <%@include  file="components/message.jsp" %>
           
              <div class="row mt-3">
                     <div class="col-md-4 offset-md-4" >
                              <!--submit button-->
                         <div class="container text-center">
                             <img style="height:50px; border-radius:35px;" src="https://png.pngtree.com/png-clipart/20190630/original/pngtree-vector-edit-icon-png-image_4164125.jpg"/>
                         </div>
                      </div>
               </div>
        
            <div class="row mt-3 row justify-content-center">
            
                    
                   
                   
                   <div class="col-md-5 ">   
                                   
                           
                            <input type="hidden" name="operation" value="updateProduct"/>

                            <!--product title-->

                            <div class="form-group ">
                                  <label class="col p-0">Product Title :-</label>
                                 
                                <input type="text" class="form-control" placeholder="Enter title of product" name="pName" value=<%out.println(curr.getpName()); %> />
                            </div>

                            <!--product description-->

                            <div class="form-group">
                                <label class="col p-0">Product Description :-</label>
                                <textarea style="height: 100px;" class="form-control" placeholder="Enter product description" name="pDesc" ><%out.println(curr.getpDesc().trim()); %></textarea>

                            </div>

                            <!--product price-->

                            <div class="form-group">
                                <label class="col p-0">Product Price :-</label>
                                <input type="text" class="form-control" placeholder="Enter price of product" name="pPrice" value=<%out.println(curr.getpPrice()); %>  />
                            </div>

                           
                            
                            
                     </div>
                           

                     <div class="col-md-5"> 
                     
                             <!--product discount-->

                            <div class="form-group">
                                <label class="col p-0">Product Discount (%) :-</label>
                                <input type="text" class="form-control" placeholder="Enter product discount" name="pDiscount" value=<%out.println(curr.getpDiscount()); %>  />
                            </div>
                            
                             <!--product quantity-->

                            <div class="form-group">
                                <label class="col p-0">Product Quantity :-</label>
                                <input type="text" class="form-control" placeholder="Enter product Quantity" name="pQuantity"  value=<%out.println(curr.getpQuantity()); %> />
                            </div>

                            <!--product category-->

                            <%  CategoryDao cdao = new CategoryDao(DBConnection.getConnection());
                                List<Category> list = cdao.getCategories();

                            %>


                            <div class="form-group">
                                <label class="col p-0">Product Category :-</label>
                                
                                <select name="catId" class="form-control" id="">
                                     <option value=<%out.println(curr.getCategory().getCategoryId());%>><%out.println(curr.getCategory().getCategoryTitle()); %></option>
                                   
                                    <%                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCategoryId()%>"> <%= c.getCategoryTitle()%> </option>
                                    <%}%>
                                </select>

                            </div>



                            <!--product file-->

                            <div class="form-group">
                                <label for="pPic">Picture of product</label>  
                                <img style="height: 38px;" src="img/products/<%= curr.getpPhoto()%>"/>
                                <br>
                                <input type="file" id="pPic" name="pPic"  />

                            </div>
                       
                        </div>

                       </div>
                       
                       
                       <div class="row mt-3 mb-3">
                          <div class="col-md-4 offset-md-4" >
                              <!--submit button-->
                            <div class="container text-center">
                                <button class="btn btn-success">Update product</button>
                            </div>
                          </div>
                       </div>
                       
                       </div>
                     </form>

                </div>
           

</body>
</html>