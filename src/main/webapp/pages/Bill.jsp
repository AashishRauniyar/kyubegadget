<%-- <%@page import="com.kyubegadget.controller.dao.ProfileDao"%>
<%@page import="com.kyubegadget.model.UserModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page
    import="com.kyubegadget.controller.dbcontroller.DatabaseController"%>
<%@ page import="com.kyubegadget.model.*"%>
<%@ page import="com.kyubegadget.utils.StringUtils"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="com.kyubegadget.controller.dao.ProductDao"%>

<%
// Check if the user is logged in
String username = (String) session.getAttribute("userName");
if (username == null) {
    // Redirect to the login page if not logged in
    response.sendRedirect(request.getContextPath() + StringUtils.LOGIN_PAGE);
}

// Retrieve the user's information from the session
ProfileDao profileDao = new ProfileDao();
UserModel user = profileDao.getUserByUsername(username);
if (user != null) {
    session.setAttribute("userModel", user);
}

// Retrieve the cart items from the session
ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList");
List<Cart> productList = null;

if (cartList != null) {
    ProductDao productDao = new ProductDao();
    productList = productDao.getCartProduct(cartList);
    request.setAttribute("cartList", cartList);
    session.setAttribute("cartList", cartList);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bill</title>
<style>
/* Add your CSS styles here */
/* Begin bill-container styles */
.bill-container body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

.bill-container .container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.bill-container h1 {
    text-align: center;
    color: #333;
}

.bill-container h2 {
    color: #333;
}

.bill-container .user-info, .bill-container .bill-details, .bill-container .total, .bill-container .thank-you {
    margin-bottom: 30px;
}

.bill-container .user-info p, .bill-container .bill-details p, .bill-container .total p, .bill-container .thank-you p {
    margin: 5px 0;
    color: #666;
}

.bill-container table {
    width: 100%;
    border-collapse: collapse;
}

.bill-container table th, .bill-container table td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
}

.bill-container table th {
    background-color: #f0f0f0;
}

.bill-container table td {
    text-align: center;
}

.bill-container .total p {
    font-weight: bold;
}

.bill-container .thank-you {
    text-align: center;
    font-style: italic;
}

.bill-container .button-container {
    text-align: center;
}

.bill-container button {
    padding: 10px 20px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-right: 10px;
}

.bill-container button:hover {
    background-color: #45a049;
}
/* End bill-container styles */
</style>
</head>
<body class="bill-container">

    <h1>Bill</h1>

    <div class="user-info">
        <h2>User Information</h2>
        <p>Name: <%= user.getFirstName() + " " + user.getLastName() %></p>
        <p>Address: <%= user.getAddress() %></p>
        <p>Phone Number: <%= user.getPhoneNumber() %></p>
        <p>Email: <%= user.getEmail() %></p>
        <p>Order Date: <%= java.time.LocalDate.now() %> <%= java.time.LocalTime.now() %></p>
    </div>

    <div class="bill-details">
        <h2>Bill Details</h2>
        <table border="1">
            <thead>
                <tr>
                    <!-- Remove the Product ID column -->
                    <th>Name</th>
                    <th>Brand</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                </tr>
            </thead>
            <tbody>
                Iterate over the cart items and display details
                <%
                if (productList != null) {
                    for (Cart item : productList) {
                        double totalPrice = item.getPrice() * item.getStock();
                %>
                <tr>
                    <!-- Remove the Product ID column -->
                    <td><%=item.getProductName()%></td>
                    <td><%=item.getProductBrand()%></td>
                    <td>$<%=item.getPrice()%></td>
                    <td><%=item.getStock()%></td>
                    <td>$<%=totalPrice%></td>
                </tr>
                <%
                    }
                }
                %>
            </tbody>
        </table>
    </div>

    <div class="total">
        <h2>Total</h2>
        Calculate and display total price
        <%
        double total = 0;
        if (productList != null) {
            for (Cart item : productList) {
                double totalPrice = item.getPrice() * item.getStock();
                total += totalPrice;
            }
        }
        %>
        <p>Total Price: $<%=total%></p>
        Add any additional charges here
    </div>

    <div class="button-container">
        <button onclick="cancel()">Cancel</button>
        <button onclick="saveBill()">Save Bill</button>
    </div>

    <div class="thank-you">
        <h2>Thank you!</h2>
        <p>Thank you for shopping with us. We hope to see you again soon. Have a good day!</p>
    </div>

    <script>
        function cancel() {
            // Add functionality to cancel button (e.g., redirect to home page)
            window.location.href = "<%=request.getContextPath()%>/home.jsp";
        }

        function saveBill() {
            // Generate bill content
            var billContent = "Bill\n\n";
            billContent += "User Information\n";
            billContent += "Name: <%= user.getFirstName() + ' ' + user.getLastName() %>\n";
            billContent += "Address: <%= user.getAddress() %>\n";
            billContent += "Phone Number: <%= user.getPhoneNumber() %>\n";
            billContent += "Email: <%= user.getEmail() %>\n";
            billContent += "Order Date: <%= java.time.LocalDate.now() %> <%= java.time.LocalTime.now() %>\n\n";

            billContent += "Bill Details\n";
            billContent += "Name\tBrand\tPrice\tQuantity\tTotal Price\n";
            Iterate over the cart items and add details to the bill content
            <% if (productList != null) { %>
                <% for (Cart item : productList) { %>
                    var totalPrice_<%=item.getProductId()%> = <%=item.getPrice()%> * <%=item.getStock()%>;
                    billContent += "<%=item.getProductName()%>\t<%=item.getProductBrand()%>\t$" + <%=item.getPrice()%> + "\t" + <%=item.getStock()%> + "\t$" + totalPrice_<%=item.getProductId()%> + "\n";
                <% } %>
            <% } %>

            // Create a new Blob object containing the bill content
            var blob = new Blob([billContent], { type: "text/plain;charset=utf-8" });

            // Create a link element to download the text file
            var link = document.createElement("a");
            link.href = window.URL.createObjectURL(blob);

            // Set the filename for the text file
            var fileName = "bill.txt";
            link.download = fileName;

            // Append the link to the document body and trigger the click event to initiate download
            document.body.appendChild(link);
            link.click();

            // Remove the link element from the document body
            document.body.removeChild(link);
        }

    </script>

</body>
</html>
 --%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kyubegadget.controller.dao.ProfileDao"%>
<%@ page import="com.kyubegadget.model.UserModel"%>
<%@ page import="com.kyubegadget.model.Cart"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="com.kyubegadget.controller.dao.ProductDao"%>
<%@page import="com.kyubegadget.model.UserModel"%>
<%@ page
	import="com.kyubegadget.controller.dbcontroller.DatabaseController"%>
<%@ page import="com.kyubegadget.model.*"%>
<%@ page import="com.kyubegadget.utils.StringUtils"%>

<%@ page import="com.kyubegadget.controller.dao.ProductDao"%>

<%
// Check if the user is logged in
String username = (String) session.getAttribute("userName");
if (username == null) {
	// Redirect to the login page if not logged in
	response.sendRedirect(request.getContextPath() + StringUtils.LOGIN_PAGE);
}

// Retrieve the user's information from the session
ProfileDao profileDao = new ProfileDao();
UserModel user = profileDao.getUserByUsername(username);
if (user != null) {
	session.setAttribute("userModel", user);
}

// Retrieve the cart items from the session
ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList");
List<Cart> productList = null;

if (cartList != null) {
	ProductDao productDao = new ProductDao();
	productList = productDao.getCartProduct(cartList);
	request.setAttribute("cartList", cartList);
	session.setAttribute("cartList", cartList);
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bill</title>
<!-- Tailwind CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet">
</head>
<body class="bg-gray-100">
	<div class="bg-white rounded-lg shadow-lg px-8 py-10 max-w-xl mx-auto">
		<div class="flex items-center justify-between mb-8">
			<div class="flex items-center">
				<img class="h-8 w-8 mr-2"
					src="https://tailwindflex.com/public/images/logos/favicon-32x32.png"
					alt="Logo" />
				<div class="text-gray-700 font-semibold text-lg">Kyube</div>
			</div>
			<div class="text-gray-700">
				<div class="font-bold text-xl mb-2">INVOICE</div>
				<div class="text-sm">
					Date:
					<%=java.time.LocalDate.now()%></div>
				<div class="text-sm">
					Invoice no: KG<%=Math.round(Math.random() * 1000000)%></div>

			</div>
		</div>
		<div class="border-b-2 border-gray-300 pb-8 mb-8">
			<h2 class="text-2xl font-bold mb-4">
				Bill To:
				<%=user.getUserName()%></h2>
			<div class="text-gray-700 mb-2"><%=user.getFirstName() + " " + user.getLastName()%></div>
			<div class="text-gray-700 mb-2"><%=user.getAddress()%></div>
			<div class="text-gray-700 mb-2">NEPAL</div>
			<div class="text-gray-700"><%=user.getEmail()%></div>
		</div>
		<table class="w-full text-left mb-8">
			<thead>
				<tr>
					<th class="text-gray-700 font-bold uppercase py-2">Name</th>
					<th class="text-gray-700 font-bold uppercase py-2">Quantity</th>
					<th class="text-gray-700 font-bold uppercase py-2">Price</th>
					<th class="text-gray-700 font-bold uppercase py-2">Total</th>
				</tr>
			</thead>
			<tbody>
				<!-- Iterate over the cart items and display details -->
				<%
				if (productList != null) {
				%>
				<%
				for (Cart item : productList) {
				%>
				<tr>
					<td class="py-4 text-gray-700"><%=item.getProductName()%></td>
					<td class="py-4 text-gray-700"><%=item.getStock()%></td>
					<td class="py-4 text-gray-700">$<%=item.getPrice()%></td>
					<td class="py-4 text-gray-700">$<%=item.getPrice() * item.getStock()%></td>
				</tr>
				<%
				}
				%>
				<%
				}
				%>
			</tbody>
		</table>
		<div class="flex justify-end mb-8">
			<div class="text-gray-700 mr-2">Subtotal:</div>
			<!-- Calculate and display total price -->
			<%
			double total = 0;
			%>
			<%
			if (productList != null) {
			%>
			<%
			for (Cart item : productList) {
			%>
			<%
			total += item.getPrice() * item.getStock();
			%>
			<%
			}
			%>
			<%
			}
			%>
			<div class="text-gray-700">
				$<%=total%></div>
		</div>
		<div class="text-right mb-8">
			<div class="text-gray-700 mr-2">Tax:</div>
			<div class="text-gray-700">$25.50</div>
		</div>
		<div class="flex justify-end mb-8">
			<div class="text-gray-700 mr-2">Total:</div>
			<div class="text-gray-700 font-bold text-xl">
				$<%=total + 25.50%></div>
		</div>
		<div class="button-container">


			<button onclick="cancel()"
				class="bg-red-500 hover:bg-red-600 text-white font-bold py-2 px-4 rounded">
				Cancel</button>

			<button onclick="saveBill()"
				class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded">
				Save Bill</button>

		</div>
		<div class="border-t-2 border-gray-300 pt-8 mb-8">
			<div class="text-gray-700 mb-2">Payment is due within 30 days.
				Late payments are subject to fees.</div>
			<div class="text-gray-700 mb-2">Please make checks payable to
				Your Company Name and mail to:</div>
			<div class="text-gray-700">123 Main St., Anytown, USA 12345</div>
		</div>
	</div>
</body>
<script>
    function cancel() {
        // Redirect to the home page
        window.location.href = "<%=request.getContextPath()%>/index.jsp";
        // Add functionality clear cart items
        // Clear the cart items from the session
        session.removeAttribute("cartList");
    }

    function saveBill() {
        // Generate bill content
// Generate bill content
var billContent = "<pre>Bill\n\n";
billContent += "User Information\n";
billContent += "Name: <%=user.getFirstName() + ' ' + user.getLastName()%>\n";
billContent += "Address: <%=user.getAddress()%>\n";
billContent += "Phone Number: <%=user.getPhoneNumber()%>\n";
billContent += "Email: <%=user.getEmail()%>\n";
billContent += "Order Date: <%=java.time.LocalDate.now()%> <%=java.time.LocalTime.now()%>\n\n";

billContent += "Bill Details\n";
billContent += "Name\tBrand\tPrice\tQuantity\tTotal Price\n";
<%if (productList != null) {%>
    <%for (Cart item : productList) {%>
        var totalPrice_<%=item.getProductId()%> = <%=item.getPrice()%> * <%=item.getStock()%>;
        billContent += "<%=item.getProductName()%>\t<%=item.getProductBrand()%>
	\t$"
				+
<%=item.getPrice()%>
	+ "\t"
				+
<%=item.getStock()%>
	+ "\t$"
				+ totalPrice_
<%=item.getProductId()%>
	+ "\n";
<%}%>
	
<%}%>
	billContent += "</pre>";

		// Create a new Blob object containing the bill content
		var blob = new Blob([ billContent ], {
			type : "text/plain;charset=utf-8"
		});

		// Create a link element to download the text file
		var link = document.createElement("a");
		link.href = window.URL.createObjectURL(blob);

		// Set the filename for the text file
		var fileName = "bill.txt";
		link.download = fileName;

		// Append the link to the document body and trigger the click event to initiate download
		document.body.appendChild(link);
		link.click();

		// Remove the link element from the document body
		document.body.removeChild(link);
		
        // Clear the cart items from the session
        session.removeAttribute("cartList");
	}
</script>
</html>
