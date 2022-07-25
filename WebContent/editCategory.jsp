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


    String category_id = (String)session.getAttribute("current-category");

    int id=Integer.parseInt(category_id.trim());
    
    
    
    CategoryDao pdao=new CategoryDao(DBConnection.getConnection());
    
    Category curr=pdao.getCategoryById(id);

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit-Category</title>
 <%@include file="components/common_css_js.jsp" %>

</head>
<body style="background-color: #242B2E;">

        <%@include  file="components/navbar.jsp" %>
        
        <div class="container">
        
        </div>

</body>
</html>