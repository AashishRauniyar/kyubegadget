<%@page import="com.kyubegadget.model.UserModel"%>
<%@page import="com.kyubegadget.model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="com.kyubegadget.controller.dao.ProfileDao"%>
<%@page import="com.kyubegadget.controller.dao.ProductDao"%>
<%@page import="com.kyubegadget.controller.dbcontroller.DatabaseController"%>
<%@page import="com.kyubegadget.utils.StringUtils"%>

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
<title>Payment</title>
<!-- Include necessary CSS and JavaScript libraries for payment processing -->
<link rel="stylesheet" href="path/to/payment.css">
<script src="path/to/payment.js"></script>
<style>
/* Style for Payment Page */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f2f2f2;
}

.payment-container {
    max-width: 800px;
    margin: 50px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.payment-container h1 {
    color: #333;
    margin-bottom: 20px;
}

.order-summary {
    margin-bottom: 20px;
}

.order-summary p {
    margin: 0;
}

.order-summary ul {
    list-style-type: none;
    padding: 0;
}

.order-summary ul li {
    margin-bottom: 5px;
}

.payment-form button {
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
}

.payment-form button:hover {
    background-color: #0056b3;
}
</style>
</head>
<body>
    <h1>Payment</h1>
    <div class="payment-container">
        <!-- Display order summary with user's username, product list, and total amount -->
        <%
        UserModel userModel = (UserModel) session.getAttribute("userModel");
        
        double totalAmount = 0;
        if (cartList != null) {
            for (Cart item : cartList) {
                totalAmount += (item.getPrice() * item.getStock());
            }
        }
        %>
        <p>Username: <%= userModel != null ? userModel.getUserName() : "" %></p>
        <div class="order-summary">
            <p>Product List:</p>
            <ul>
                <% for (Cart item : cartList) { %>
                    <li><%= item.getProductName() %>: $<%= item.getPrice() %></li>
                <% } %>
            </ul>
            <p>Total Amount: $<%= totalAmount %></p>
        </div>
        
        <!-- Payment form for payment gateway integration -->
        <form class="payment-form" action="/processPayment" method="post">
            <!-- Include payment form fields -->
            <!-- For example, credit card details, billing address, etc. -->
            <button type="submit">Pay Now</button>
        </form>
    </div>
</body>
</html>
