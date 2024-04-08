<%@ page import="com.kyubegadget.controller.dao.ProductDao" %>
<%@ page import="com.kyubegadget.model.ProductModel" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Inside Product</title>
    <link href="../styles/output.css" rel="stylesheet">
</head>
<body>
    <div class="container mx-auto py-8">
        <div class="max-w-xl mx-auto bg-white rounded-lg shadow-md overflow-hidden">
            <% 
                // Retrieve the product ID from the request parameter
                String productId = request.getParameter("id");
                // Fetch the product details using the ID
                ProductDao productDao = new ProductDao();
                ProductModel product = productDao.getProductById(productId);
                if (product != null) { // Check if product exists
            %>
            <div class="flex">
                <div class="w-1/2">
                    <img src="../<%= product.getImageUrl() %>" alt="<%= product.getImageUrl() %>" class="w-full">
                </div>
                <div class="w-1/2 p-8">
                    <h2 class="text-gray-700 font-bold uppercase"><%= product.getProductBrand() %></h2>
                    <h1 class="text-3xl font-bold text-gray-900 mb-4"><%= product.getProductName() %></h1>
                    <p class="text-2xl font-semibold text-gray-900">$<%= product.getPrice() %> <span class="text-gray-500 line-through"></span></p>
                    <p class="text-gray-700 mt-4"><%= product.getProductDescription() %></p>
                    <div class="flex items-center mt-6">
                        <label for="quantity" class="mr-2">Quantity:</label>
                        <input type="number" id="quantity" name="quantity" value="1" min="1" max="10" class="appearance-none w-20 py-1 px-2 border border-gray-300 text-gray-700 leading-tight rounded-md focus:outline-none focus:border-gray-500">
                    </div>
                    <div class="flex justify-between mt-8">
                        <button class="bg-gray-900 text-white font-semibold py-2 px-4 rounded-full shadow-md hover:bg-gray-800 focus:outline-none focus:bg-gray-800">Add to Cart</button>
                        <button class="bg-blue-500 text-white font-semibold py-2 px-4 rounded-full shadow-md hover:bg-blue-600 focus:outline-none focus:bg-blue-600">Buy Now</button>
                    </div>
                </div>
            </div>
            <% 
                } else { // Product not found
            %>
            <div>
                <p>Product not found</p>
            </div>
            <% } %>
        </div>
    </div>
</body>
</html>