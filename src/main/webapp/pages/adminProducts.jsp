<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/styles/output.css" rel="stylesheet">
</head>
<%
    // Retrieve the existing session variable
    javax.servlet.http.HttpSession existingSession = request.getSession(false);

    // Check if session exists and if the role is "admin"
    if (existingSession == null || existingSession.getAttribute("role") == null || !existingSession.getAttribute("role").equals("admin")) {
        // If not admin, redirect to index page
        response.sendRedirect(request.getContextPath() +"/pages/home.jsp");
    } else {
        // Admin is authenticated, allow access to admin panel

        // Your HTML content for admin panel goes here

        %>

<body class="bg-gray-100 flex">
<%@include file="adminSideBar.jsp"%>
<div class="ml-5">
<div class="mt-10  grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
    <!-- View Product Card -->
    <div class="bg-white rounded-lg shadow-md p-6">
        <h2 class="text-lg font-semibold mb-4">View Product</h2>
        <a href="<%=request.getContextPath()%>/pages/testManageProduct.jsp" class="text-4xl font-bold text-blue-500">
            View Product
        </a>
    </div>

    <!-- Manage Product Card -->
    <div class="bg-white rounded-lg shadow-md p-6">
        <h2 class="text-lg font-semibold mb-4">Add Product</h2>
        <a href="<%=request.getContextPath()%>/pages/addProduct.jsp" class="text-4xl font-bold text-green-500">
            Add Product
        </a>
    </div>

    <!-- Add Category Card -->
    <div class="bg-white rounded-lg shadow-md p-6">
        <h2 class="text-lg font-semibold mb-4">Add Category</h2>
        <a href="<%=request.getContextPath()%>/pages/ManageCategory.jsp" class="text-4xl font-bold text-yellow-500">
            Add Category
        </a>
    </div>

    <!-- View Category Card -->
    
</div>
</div>

</body>
</html>
 <%
    }
%>