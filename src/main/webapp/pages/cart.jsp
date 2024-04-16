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
double taxRate = 0.10; // 10%
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


//Calculate the total price including tax and shipping
double totalPriceWithTaxAndShipping = total + (total * taxRate) + shippingCharge;
String formattedTotalPrice = String.format("%.2f", totalPriceWithTaxAndShipping);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping Cart</title>
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">

    <h1 class="mb-10 text-center text-2xl font-bold">Shopping Cart</h1>
    <div class="mx-auto max-w-6xl justify-center px-6 md:flex md:space-x-6 xl:px-0">
        <div class="rounded-lg md:w-2/3">
            <table class="w-full mb-6 bg-white rounded-lg shadow-md">
                <thead class="bg-gray-200">
                    <tr>
                        <th class="px-4 py-2">Product ID</th>
                        <th class="px-4 py-2">Image</th>
                        <th class="px-4 py-2">Name</th>
                        <th class="px-4 py-2">Brand</th>
                        <th class="px-4 py-2">Price</th>
                        <th class="px-4 py-2">Quantity</th>
                        <th class="px-4 py-2">Total Price</th>
                        <th class="px-4 py-2">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (productList != null) {
                        for (Cart item : productList) {
                            double totalPrice = item.getPrice() * item.getStock();
                    %>
                            <tr>
                                <td class="px-4 py-2"><%= item.getProductId() %></td>
                                <td class="px-4 py-2"><img src="<%= request.getContextPath() %>/images/<%= item.getImageUrl() %>" alt="<%= item.getImageUrl() %>" class="w-24"></td>
                                <td class="px-4 py-2"><%= item.getProductName() %></td>
                                <td class="px-4 py-2"><%= item.getProductBrand() %></td>
                                <td class="px-4 py-2">$<%= item.getPrice() %></td>
                                <td class="px-4 py-2">
                                    <div class="flex items-center border-gray-100">
                                        <span class="cursor-pointer rounded-l bg-gray-100 py-1 px-3.5 duration-100 hover:bg-blue-500 hover:text-blue-50"> - </span>
                                        <input class="h-8 w-8 border bg-white text-center text-xs outline-none" type="number" value="<%= item.getStock() %>" min="1" />
                                        <span class="cursor-pointer rounded-r bg-gray-100 py-1 px-3 duration-100 hover:bg-blue-500 hover:text-blue-50"> + </span>
                                    </div>
                                </td>
                                <td class="px-4 py-2">$<%= totalPrice %></td>
                                <td class="px-4 py-2"><a href="<%= request.getContextPath() %>/remove-from-cart?productId=<%= item.getProductId() %>" class="px-4 py-2 bg-red-500 text-white rounded hover:bg-red-600">Remove</a></td>
                            </tr>
                    <% }
                    } else { %>
                        <tr>
                            <td colspan="8" class="px-4 py-2 text-center">Your cart is empty</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <div class="mt-6 h-full rounded-lg border bg-white p-6 shadow-md md:mt-0 md:w-1/3">
            <div class="mb-2 flex justify-between">
                <p class="text-gray-700">Subtotal</p>
                <p class="text-gray-700">$<%= total %></p>
            </div>
            <div class="flex justify-between">
                <p class="text-gray-700">Tax (12%)</p>
                <p class="text-gray-700">$<%= total * taxRate %></p>
            </div>
            <hr class="my-4">
            <div class="flex justify-between">
                <p class="text-lg font-bold">Total</p>
                <div>
                    <p class="mb-1 text-lg font-bold">$<%= formattedTotalPrice %></p>

                    <p class="text-sm text-gray-700">including shipping</p>
                </div>
            </div>
            <a href="<%= request.getContextPath() + StringUtils.WELCOME_PAGE %>" class="mt-6 w-full rounded-md bg-blue-500 py-2 font-medium text-blue-50 hover:bg-blue-600 block text-center">Continue Shopping</a>
            <a href="<%= request.getContextPath() %>/check-out" class="mt-2 w-full rounded-md bg-green-500 py-2 font-medium text-green-50 hover:bg-green-600 block text-center">Proceed to Checkout</a>
        </div>
    </div>

</body>
</html>