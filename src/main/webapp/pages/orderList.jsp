<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kyubegadget.controller.dao.OrderDao"%>
<%@ page import="com.kyubegadget.model.OrderModel"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order List</title>

</head>
<body>
    <h1>Order List</h1>
    <table border="1">
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Date</th>
                <th>User ID</th>
                <th>Total Amount</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <% 
            OrderDao od = new OrderDao();
            List<OrderModel> orderList = od.getAllOrders(); // Get the list of orders from the database
            if (!orderList.isEmpty()) {
                for (OrderModel order : orderList) {
            %>
            <tr>
                <td><%= order.getOrderId() %></td>
                <td><%= order.getOrderDate() %></td>
                <td><%= order.getUserId() %></td>
                <td><%= order.getTotalAmount() %></td>
                <td><%= order.getOrderStatus() %></td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="5">No orders found.</td>
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
 --%>
 
 

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List, com.kyubegadget.model.OrderModel, com.kyubegadget.controller.dao.OrderDao"%>
<%@ page
	import="java.sql.*, com.kyubegadget.controller.dbcontroller.DatabaseController"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order List</title>
<!-- Add the CSS reference here -->

<!-- OR -->
<link href="<%=request.getContextPath()%>/styles/output.css" rel="stylesheet">
</head>


<body class="bg-gray-100 flex">
<%@include file="adminSideBar.jsp"%>
	<div id="flex-1 content"
		class="relative overflow-x-auto shadow-md sm:rounded-lg h-[100vh] ">
		<div class="pb-4 bg-white"></div>
		<table class="w-full text-sm text-left rtl:text-right text-gray-500">
			<thead
				class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
				<tr>
					<th scope="col" class="p-4">
						<div class="flex items-center">

							<label for="checkbox-all-search" class="sr-only">checkbox</label>
						</div>
					</th>
					<th scope="col" class="px-6 py-3">Order ID</th>
					<th scope="col" class="px-6 py-3">Date</th>
					<th scope="col" class="px-6 py-3">User ID</th>
					<th scope="col" class="px-6 py-3">Total Amount</th>
					<th scope="col" class="px-6 py-3">Status</th>
					<th scope="col" class="px-6 py-3">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				OrderDao orderDao = new OrderDao();
				List<OrderModel> orders = orderDao.getAllOrders();
				for (OrderModel order : orders) {
				%>
				<tr class="bg-white border-b hover:bg-gray-50">
					<td class="w-4 p-4">
						<div class="flex items-center">
							<input id="checkbox-table-search-1" type="checkbox"
								class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500">
							<label for="checkbox-table-search-1" class="sr-only">checkbox</label>
						</div>
					</td>
					<td class="px-6 py-4"><%=order.getOrderId()%></td>
					<td class="px-6 py-4"><%=order.getOrderDate()%></td>
					<td class="px-6 py-4"><%=order.getUserId()%></td>
					<td class="px-6 py-4">$<%=order.getTotalAmount()%></td>
					<td class="px-6 py-4"><%=order.getOrderStatus()%></td>
					<%-- <td class="px-6 py-4">
						<form action="../ChangeOrderStatusServlet" method="post">
							<input type="hidden" name="orderId"
								value="<%=order.getOrderId()%>">
							<div class="relative inline-block text-left">
								<select name="status"
									class="px-4 py-2 bg-white border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500">
									<option value="Delivered">Delivered</option>
									<option value="Shipping">Shipping</option>
									<option value="OnTheWay">On the Way</option>
								</select>
							</div>
							<button type="submit"
								class="px-4 py-2 bg-green-500 text-white rounded hover:bg-green-600">Change
								Status</button>
						</form>
					</td> --%>

					<td class="px-6 py-4">
						<form id="changeOrderForm_<%=order.getOrderId()%>"
							action="../ChangeOrderStatusServlet" method="post">
							<input type="hidden" name="orderId"
								value="<%=order.getOrderId()%>">
							<div class="relative inline-block text-left">
								<select name="status"
									onchange="changeOrderStatus(<%=order.getOrderId()%>)"
									class="px-4 py-2 bg-white border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500">
									<option selected>Change Status</option>
									<option value="Pending">Pending</option>
									<option value="Processing">Processing</option>
									<option value="Shipping">Shipping</option>
									<option value="Delivered">Delivered</option>
								</select>
							</div>
						</form>
					</td>








				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>

<script>
    function changeOrderStatus(orderId) {
        var formId = 'changeOrderForm_' + orderId;
        document.getElementById(formId).submit();
    }
</script>

</html>
