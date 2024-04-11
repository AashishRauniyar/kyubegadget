<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<h2>Shopping Cart</h2>

<%
    // Initialize cart array
    String[] cartItems = (String[]) session.getAttribute("cartItems");
    if (cartItems == null) {
        cartItems = new String[0];
    }

    // Add item to cart
    String itemToAdd = request.getParameter("item");
    if (itemToAdd != null && !itemToAdd.isEmpty()) {
        String[] newCartItems = new String[cartItems.length + 1];
        System.arraycopy(cartItems, 0, newCartItems, 0, cartItems.length);
        newCartItems[cartItems.length] = itemToAdd;
        session.setAttribute("cartItems", newCartItems);
        cartItems = newCartItems;
    }

    // Display cart items
    if (cartItems.length > 0) {
        for (String item : cartItems) {
%>
            <div class="cart-item">
                <p><%= item %></p>
            </div>
<%
        }
    } else {
%>
        <p>Your cart is empty.</p>
<%
    }
%>

</body>
</html>
