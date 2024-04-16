<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kyubegadget.controller.dao.ProductDao" %>
<%@ page import="com.kyubegadget.model.ProductModel" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
    <link href="<%=request.getContextPath()%>/styles/output.css" rel="stylesheet">
</head>
<body>
    <h2>Edit Product</h2>
    <form action="EditProductServlet" method="post">
        <%-- Retrieve product ID from request parameter --%>
        <% String productId = request.getParameter("productId"); %>
        <%-- Retrieve product details using product ID --%>
        <% ProductDao productDao = new ProductDao(null); %>
        <% ProductModel product = productDao.getProductById(productId); %>
        <%-- Display form fields pre-filled with product details --%>
        <input type="hidden" name="productId" value="<%= product.getProductId() %>">
        <label for="productName">Product Name:</label><br>
        <input type="text" id="productName" name="productName" value="<%= product.getProductName() %>"><br>
        <label for="price">Price:</label><br>
        <input type="text" id="price" name="price" value="<%= product.getPrice() %>"><br>
        <label for="productBrand">Brand:</label><br>
        <input type="text" id="productBrand" name="productBrand" value="<%= product.getProductBrand() %>"><br>
        <label for="productDescription">Description:</label><br>
        <textarea id="productDescription" name="productDescription"><%= product.getProductDescription() %></textarea><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
