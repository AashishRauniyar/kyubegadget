<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kyubegadget.controller.dao.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link href="<%=request.getContextPath()%>/styles/output.css" rel="stylesheet">
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 flex">
   <%@include file="adminSideBar.jsp"%> 

    <div class="container mx-auto mt-10 px-4">
        <h1 class="text-2xl font-semibold mb-4">Admin Dashboard</h1>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
            <!-- Total Users Card -->
            <div class="bg-white rounded-lg shadow-md p-6">
                <h2 class="text-lg font-semibold mb-4">Total Users</h2>
                <p class="text-4xl font-bold text-blue-500">
                    <%= UserDao.getTotalUsers() %>
                </p>
            </div>
            
            <!-- Total Products Card -->
            <div class="bg-white rounded-lg shadow-md p-6">
                <h2 class="text-lg font-semibold mb-4">Total Products</h2>
                <p class="text-4xl font-bold text-green-500">
                    <%= ProductDao.getTotalProducts() %>
                </p>
            </div>
            
            
            <!-- Total Categories Card -->
            <div class="bg-white rounded-lg shadow-md p-6">
                <h2 class="text-lg font-semibold mb-4">Total Categories</h2>
                <p class="text-4xl font-bold text-yellow-500">
                    <%= CategoryDao.getTotalCategories() %>
                </p>
            </div>
            
            <!-- Other Dashboard Cards -->
            <!-- Add more cards for other stats like total products, orders, etc. -->
        </div>
    </div>
</body>
</html>
