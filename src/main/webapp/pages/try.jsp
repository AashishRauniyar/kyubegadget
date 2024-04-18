<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kyubegadget.controller.dao.ProductDao"%>
<%@ page import="com.kyubegadget.model.ProductModel"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.kyubegadget.controller.*"%>
<%@ page import="com.kyubegadget.controller.dao.ProductDao"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.kyubegadget.model.ProductModel"%>
<%@ page import="com.kyubegadget.controller.*"%>
<%@ page import="com.kyubegadget.controller.dao.ProductDao"%>

<%
// Check if the user is logged in
if (session.getAttribute("userName") != null && session.getAttribute("userName") != "") {
    // Get the product ID from the request parameter
    String productIdParam = request.getParameter("productid");
    int productId = 0; // Default value if parameter is null

    if (productIdParam != null && !productIdParam.isEmpty()) {
        productId = Integer.parseInt(productIdParam);
    }
    ProductModel product = null;

 
        // Instantiate ProductDao with the required parameters
        Connection conn = null; // Initialize the connection object
        // You need to implement DatabaseController to get the connection
        ProductDao productDao = new ProductDao();
        
        // Retrieve the product by ID
        product = productDao.getProductById(String.valueOf(productId)); // Convert int to String

%>




<!DOCTYPE html>
<html>
<head>
    <title>Edit Product</title>
    <!-- Include your CSS and JS files here -->
</head>
<body>
    <%-- Include your header here --%>
    <%-- <jsp:include page="header.jsp"></jsp:include> --%>
    <div class="content-wrapper">
        <div class="container">
            <div class="row pad-botm">
                <div class="col-md-12">
                    <h4 class="header-line">Edit Product</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">Edit Product</div>
                        <div class="panel-body">
                            <form role="form" action="update-product.jsp" method="post">
                                <div class="form-group">
                                    <label>Product Id</label>
                                    <input class="form-control" type="text" name="productId" value="<%= product.getProductId() %>" readonly />
                                </div>
                                <div class="form-group">
                                    <label>Enter Name</label>
                                    <input class="form-control" type="text" name="productName" value="<%= product.getProductName() %>" />
                                </div>
                                <div class="form-group">
                                    <label>Price</label>
                                    <input class="form-control" type="text" name="price" value="<%= product.getPrice() %>" />
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <input class="form-control" type="text" style="min-height: 100px;" name="description" value="<%= product.getProductDescription() %>" />
                                </div>
                                <div class="form-group">
                                    <label>MRP Price</label>
                                   <!-- <input class="form-control" type="text" name="price" value="<%= product.getPrice() %>" /> -->
                                </div>
                                <div class="form-group">
                                    <label>Status</label>
                                    <select class="form-control" name="status">
                                       <%--  <option <%= product.getStatus().equals("Active") ? "selected" : "" %>>Active</option>
                                        <option <%= product.getStatus().equals("In-Active") ? "selected" : "" %>>In-Active</option> --%>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-success">Update Product</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- Include your footer here --%>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
<%
} else {
    response.sendRedirect("admin-login.jsp");
}
%>
