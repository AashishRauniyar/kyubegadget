<%@page import="com.kyubegadget.controller.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--     //Import the necessary classes -->
<%@ page
	import="com.kyubegadget.controller.dbcontroller.DatabaseController"%>
<%@ page import="com.kyubegadget.model.*"%>
<%@ page import="com.kyubegadget.utils.StringUtils"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<!--     //Get the session object -->
<%
String username = (String) session.getAttribute("userName");
if (username == null) {
	response.sendRedirect(request.getContextPath() + StringUtils.LOGIN_PAGE);
}

ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList");
List<Cart> productList = null;

if (cartList != null) {

	ProductDao productDao = new ProductDao(DatabaseController.getConn());

	productList = productDao.getCartProduct(cartList);
	request.setAttribute("cartList", cartList);
	session.setAttribute("cartList", cartList);
}
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping Cart</title>
<style>
.cart-item {
	border: 1px solid #ccc;
	padding: 10px;
	margin-bottom: 10px;
}
</style>
</head>
<body>

<h1>Shopping Cart</h1>
    <table border="1">
        <thead>
            <tr>
                <th>Product ID</th>
                <th>Name</th>
                <th>Brand</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total Price</th>
            </tr>
        </thead>
        <tbody>
            <% 
                if (productList != null) {;
                double total = 0;
                for (Cart item : productList) { 
                    double totalPrice = item.getPrice() * item.getStock();
                    total += totalPrice;
            %>
            <tr>
                <td><%= item.getProductId() %></td>
                <td><%= item.getProductName() %></td>
                <td><%= item.getProductBrand() %></td>
                <td>$<%= item.getPrice() %></td>
                <td><%= item.getStock() %></td>
                <td>$<%= totalPrice %></td>
            </tr>
            <% 
                }
            } else {
            %>
            <tr>
                <td colspan="6">Your cart is empty</td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <div>
<%--         <h3>Total Price: $ <%= pr %></h3>
 --%>        <a href="<%= StringUtils.WELCOME_PAGE %>">Continue Shopping</a>
        <!-- Add checkout button here -->
    </div>



</body>
</html>
