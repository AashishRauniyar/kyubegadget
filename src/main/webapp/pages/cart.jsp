<%@page import="com.kyubegadget.controller.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Import the necessary classes -->
<%@ page
	import="com.kyubegadget.controller.dbcontroller.DatabaseController"%>
<%@ page import="com.kyubegadget.model.*"%>
<%@ page import="com.kyubegadget.utils.StringUtils"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<!-- Get the session object -->
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

<%
double taxRate = 0.12; // 12%
double shippingCharge = 0; // Default shipping charge

// Initialize total variable
double total = 0;
if (productList != null && !productList.isEmpty()) {
    // If the cart is not empty, calculate the total and apply shipping charge
    for (Cart item : productList) {
        double totalPrice = item.getPrice() * item.getStock();
        total += totalPrice; // Increment total by adding total price of each item
    }
    shippingCharge = 20; // Set shipping charge to $20 if the cart is not empty
}

// Calculate the total price including tax and shipping
double totalPriceWithTaxAndShipping = total + (total * taxRate) + shippingCharge;
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

body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
}

/* .container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 20px;
} */

h1 {
	text-align: center;
}

table {
	width: 95%;
	border-collapse: collapse;
	margin-bottom: 20px;
	background-color: #fff;
	margin-left: 20px;
}

table th, table td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

table th {
	background-color: #f0f0f0;
}

table td {
	vertical-align: middle;
}

img {
	max-width: 100px;
	height: auto;
}

.btn {
	display: inline-block;
	padding: 8px 20px;
	background-color: #007bff;
	color: #fff;
	text-decoration: none;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.btn:hover {
	background-color: #0056b3;
}

.btn-danger {
	background-color: #dc3545;
}

.btn-danger:hover {
	background-color: #c82333;
}

.cart-total {
	margin-top: 20px;
	padding: 20px;
	background-color: #fff;
	border-radius: 4px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.cart-total h3 {
	margin-bottom: 10px;
}

.cart-total p {
	margin-bottom: 5px;
}

th:nth-child(1), td:nth-child(1) {
	display: none;
}

.cart-summary {
	top: 0;
	right: 0;
	margin-left: 900px;
	margin-right: 60px;
	padding: 20px;
	background-color: #f9f9f9;
	border: 1px solid #ccc;
	border-radius: 5px;
}

/* Style for the select element */
select {
	padding: 8px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 4px;
	background-color: #fff;
	color: #333;
	cursor: pointer;
	width: 100%; /* Adjust width as needed */
}

/* Style for the dropdown arrow */
select::-ms-expand {
	display: none; /* Hide default arrow in IE10 and IE11 */
}

select::-webkit-select {
	appearance: none; /* Remove default arrow in Chrome and Safari */
}

select::-moz-select {
	appearance: none; /* Remove default arrow in Firefox */
}

/* Style for the dropdown options */
select option {
	padding: 8px;
	font-size: 14px;
	background-color: #fff;
	color: #333;
}

/* Style for selected option */
select option:checked {
	background-color: #007bff;
	color: #fff;
}
</style>
</head>
<body>

	<h1>Shopping Cart</h1>
	<table border="1">
		<thead>
			<tr>
				<th>Product ID</th>
				<th>Image</th>
				<th>Name</th>
				<th>Brand</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Total Price</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			if (productList != null) {
				for (Cart item : productList) {
					double totalPrice = item.getPrice() * item.getStock();
			%>
			<tr>
				<td><%=item.getProductId()%></td>
				<td><img
					src="<%=request.getContextPath()%>/images/<%=item.getImageUrl()%>"
					alt="<%=item.getImageUrl()%>" class="w-full"></td>
				<td><%=item.getProductName()%></td>
				<td><%=item.getProductBrand()%></td>
				<td>$<%=item.getPrice()%></td>
				<td><select name="quantity"
					id="quantity_<%=item.getProductId()%>"
					onchange="updateTotal(<%=item.getPrice()%>, <%=item.getProductId()%>)">
						<%-- Add options for quantity selection --%>
						<%
						for (int i = 1; i <= 10; i++) {
						%>
						<option value="<%=i%>"
							<%=(i == item.getStock()) ? "selected" : ""%>><%=i%></option>
						<%
						}
						%>
				</select></td>
				<td id="totalPrice_<%=item.getProductId()%>">$<%=totalPrice%></td>
				<td><a href="<%=request.getContextPath()%>/remove-from-cart?productId=<%=item.getProductId()%>"
					class="btn btn-sm btn-danger">Remove</a></td>
			</tr>
			<%
			}
			} else {
			%>
			<tr>
				<td colspan="6">Your cart is empty</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>

	<div class="cart-summary">
		<h3>
			Total Price (before tax and shipping): $<span id="subtotal"><%=total%></span>
		</h3>
		<p>
			Tax (12%): $<span id="tax"><%=total * taxRate%></span>
		</p>
		<p>
			Shipping Charge:
			<%=shippingCharge%></p>
		<h3>
			Total Price (including tax and shipping): $<span id="totalWithTax"><%=total + (total * taxRate) + shippingCharge%></span>
		</h3>
		<a href="<%=request.getContextPath()+StringUtils.WELCOME_PAGE%>"  class="btn btn-primary">Continue Shopping</a> <a
			href="<%=request.getContextPath()%>/check-out" class="btn btn-primary">Proceed
			to Checkout</a>
	</div>


</body>
<script>
function updateTotal(price, productId) {
    var quantity = document.getElementById("quantity_" + productId).value;
    var totalPrice = price * quantity;
    document.getElementById("totalPrice_" + productId).innerHTML = "$" + totalPrice.toFixed(2);
    recalculateTotal();
}

function recalculateTotal() {
    var total = 0;
    var elements = document.querySelectorAll("[id^=totalPrice_]");
    elements.forEach(function(element) {
        total += parseFloat(element.innerHTML.replace("$", ""));
    });
    var tax = total * <%=taxRate%>;
    var totalWithTax = total + tax + <%=shippingCharge%>;
    document.getElementById("subtotal").innerHTML = "$" + total.toFixed(2);
    document.getElementById("tax").innerHTML = "$" + tax.toFixed(2);
    document.getElementById("totalWithTax").innerHTML = "$" + totalWithTax.toFixed(2);
}
</script>

</html>
