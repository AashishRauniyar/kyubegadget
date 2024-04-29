<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kyubegadget.model.OrderModel" %>
<%@ page import="com.kyubegadget.controller.dao.ProfileDao" %>
<%@ page import="com.kyubegadget.model.UserModel" %>
<%@ page import="com.kyubegadget.utils.StringUtils" %>
<%@ page import="java.util.List" %>
<%
    String username = (String) session.getAttribute("userName");
    if (username == null) {
        response.sendRedirect(request.getContextPath() + StringUtils.LOGIN_PAGE);
    } else {
        ProfileDao profileDao = new ProfileDao();
        UserModel userModel = profileDao.getUserByUsername(username);
        if (userModel != null) {
            session.setAttribute("userModel", userModel);
        }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Order History</title>
<style>
    /* CSS styles for the order history page */
</style>
</head>
<body>
<%@ include file="./navigationbar.jsp"%>
<div class="container">
    <h2>User Order History</h2>
    <table class="order-history-table">
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Order Date</th>
                <th>Total Amount</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <% 
                // Fetch user's order history from the database
                List<OrderModel> orderHistory = profileDao.getUserOrderHistory(userModel.getUserId());

                // Iterate through the order history and display each order
                for (OrderModel order : orderHistory) {
            %>
            <tr>
                <td><%= order.getOrderId() %></td>
                <td><%= order.getOrderDate() %></td>
                <td>$<%= order.getTotalAmount() %></td>
                <td><%= order.getOrderStatus() %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>
<%@ include file="./footer.jsp"%>
</body>
</html>

<%
    }
%>
