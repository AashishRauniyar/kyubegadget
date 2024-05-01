<%-- 
<!--  //use this -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page
	import="java.sql.*, com.kyubegadget.controller.dbcontroller.DatabaseController"%>
<%@ page import="com.kyubegadget.controller.dao.ProductDao"%>
<%@ page import="com.kyubegadget.controller.dao.CategoryDao"%>
<%@ page import="com.kyubegadget.model.ProductModel"%>
<!DOCTYPE html>
<html lang="en">

<%
// Retrieve the existing session variable
javax.servlet.http.HttpSession existingSession = request.getSession(false);

// Check if session exists and if the role is "admin"
if (existingSession == null || existingSession.getAttribute("role") == null
		|| !existingSession.getAttribute("role").equals("admin")) {
	// If not admin, redirect to index page
	response.sendRedirect(request.getContextPath() + "/pages/shop.jsp");
} else {
	// Admin is authenticated, allow access to admin panel

	// Your HTML content for admin panel goes here
%>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product Information</title>
<link href="<%=request.getContextPath()%>/styles/output.css"
	rel="stylesheet">
</head>

<%@include file="adminSideBar.jsp"%>

<body class="bg-gray-100 flex ">



	<div id="content"
		class="relative overflow-x-auto shadow-md  ">
		<div class="pb-4 bg-white">

			<div
				class="flex items-center justify-between w-full px-4 py-2 bg-gray-800 ">
				<div class="flex items-center">
					<span class="mr-2 text-sm font-medium text-white">All
						Products</span>
					<form action="">
						<div class="flex items-center">
							<input type="text" id="search"
								class="w-full px-3 py-2 rounded-md focus:outline-none focus:ring-1 focus:ring-indigo-500 border border-transparent"
								placeholder="Search for products...">
							<button>
								<div class="pl-2">

									<svg xmlns="http://www.w3.org/2000/svg" fill="none"
										viewBox="0 0 24 24" stroke-width="1.5" stroke="white"
										class="w-6 h-6">
  <path stroke-linecap="round" stroke-linejoin="round"
											d="m21 21-5.197-5.197m0 0A7.5 7.5 0 1 0 5.196 5.196a7.5 7.5 0 0 0 10.607 10.607Z" />
</svg>

								</div>

							</button>
						</div>

					</form>


				</div>
				<div class="flex space-x-2">
				<a href="<%=request.getContextPath()%>/pages/addProduct.jsp"
			>
					<button type="button"
					
						class="px-3 py-2 mr-2 text-sm font-medium text-center text-white bg-blue-500 hover:bg-blue-700 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
						Add New Product</button>
			</a>
					<button type="button"
						class="px-3 py-2 text-sm font-medium text-center text-white bg-blue-500 hover:bg-blue-700 rounded-md  focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
						Export</button>
				</div>
			</div>
		</div>

		<table class="w-full text-sm text-left rtl:text-right text-gray-500">
			<thead
				class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
				<tr>
					<!-- <th scope="col" class="p-4">
                        <div class="flex items-center">
                            <input id="checkbox-all-search" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500">
                            <label for="checkbox-all-search" class="sr-only">checkbox</label>
                        </div>
                    </th> -->
					<th scope="col" class="px-6 py-3">Product ID</th>
					<th scope="col" class="px-6 py-3">Product Name</th>
					<th scope="col" class="px-6 py-3">Price</th>
					<th scope="col" class="px-6 py-3">Brand</th>
					<th scope="col" class="px-6 py-3">Description</th>
					<th scope="col" class="px-6 py-3">Category</th>
					<th scope="col" class="px-6 py-3">Image</th>
					<th scope="col" class="px-6 py-3">Actions</th>
				</tr>
			</thead>
			<tbody>
				<%
				ProductDao productDao = new ProductDao();
				CategoryDao cD = new CategoryDao();
				List<ProductModel> products = productDao.getAllProducts();
				for (ProductModel product : products) {
				%>
				<tr class="bg-white border-b hover:bg-gray-50">

					<td class="px-6 py-4"><%=product.getProductId()%></td>
					<td class="px-6 py-4"><%=product.getProductName()%></td>
					<td class="px-6 py-4"><%=product.getPrice()%></td>
					<td class="px-6 py-4"><%=product.getProductBrand()%></td>
					<td class="px-6 py-4"><%=product.getProductDescription()%></td>
					<td class="px-6 py-4"><%=cD.getCategoryNameById(product.getProductCategoryId())%></td>
					<td class="px-6 py-4"><img
						src="<%=request.getContextPath()%>/images/<%=product.getImageUrl()%>"
						alt="Product Image" class="h-16 w-16 object-cover rounded"></td>
					<!-- Assuming getImageUrl() returns the image URL from the database -->
					<td class="px-6 py-4"><a
						href="../EditProductServlet?productId=<%=product.getProductId()%>"
						class="font-medium text-blue-600 hover:underline">Edit</a> | <a
						href="../DeleteProductServlet?productId=<%=product.getProductId()%>"
						class="font-medium text-red-600 hover:underline">Delete</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<a href="<%=request.getContextPath()%>/pages/addProduct.jsp"
			class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Add
			Product</a>
	</div>

</body>

</html>

<%
}
%>
 --%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kyubegadget.model.ProductModel" %>
<%@ page import="com.kyubegadget.controller.dao.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Information</title>
    <link href="<%=request.getContextPath()%>/styles/output.css" rel="stylesheet">
</head>

<%
    // Retrieve the existing session variable
    javax.servlet.http.HttpSession existingSession = request.getSession(false);

    // Check if session exists and if the role is "admin"
    if (existingSession == null || existingSession.getAttribute("role") == null
        || !existingSession.getAttribute("role").equals("admin")) {
        // If not admin, redirect to index page
        response.sendRedirect(request.getContextPath() + "/pages/shop.jsp");
    } else {
        // Admin is authenticated, allow access to admin panel
        List<ProductModel> products;
        if (request.getAttribute("searchResults") != null) {
            products = (List<ProductModel>) request.getAttribute("searchResults");
        } else {
            ProductDao productDao = new ProductDao();
            
            products = productDao.getAllProducts();
        }
%>
<%@include file="adminSideBar.jsp"%>
<body class="bg-gray-100 flex  h-[100vh] ">
    <div id="content" class="relative overflow-x-auto shadow-md w-full ">
        <div class="pb-4 bg-white">
            <div class="flex items-center justify-between w-full px-4 py-2 bg-gray-800 ">
                <div class="flex items-center">
                    <span class="mr-2 text-sm font-medium text-white">All Products</span>
                    <form action="<%=request.getContextPath()%>/AdminPageSearchProductServlet" method="GET">
                        <div class="flex items-center">
                            <input type="text" name="query" id="search"
                                class="w-full px-3 py-2 rounded-md focus:outline-none focus:ring-1 focus:ring-indigo-500 border border-transparent"
                                placeholder="Search for products...">
                            <button type="submit">
                                <div class="pl-2">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                        stroke-width="1.5" stroke="white" class="w-6 h-6">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="m21 21-5.197-5.197m0 0A7.5 7.5 0 1 0 5.196 5.196a7.5 7.5 0 0 0 10.607 10.607Z" />
                                    </svg>
                                </div>
                            </button>
                        </div>
                    </form>
                </div>
                <div class="flex space-x-2">
                    <a href="<%=request.getContextPath()%>/pages/addProduct.jsp">
                        <button type="button"
                            class="px-3 py-2 mr-2 text-sm font-medium text-center text-white bg-blue-500 hover:bg-blue-700 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                            Add New Product
                        </button>
                    </a>
                    
                </div>
            </div>
        </div>

        <table class="w-full text-sm text-left rtl:text-right text-gray-500">
            <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                <tr>
                    <th scope="col" class="px-6 py-3">Product ID</th>
                    <th scope="col" class="px-6 py-3">Product Name</th>
                    <th scope="col" class="px-6 py-3">Price</th>
                    <th scope="col" class="px-6 py-3">Brand</th>
                    <th scope="col" class="px-6 py-3">Description</th>
                    <th scope="col" class="px-6 py-3">Category</th>
                    <th scope="col" class="px-6 py-3">Image</th>
                    <th scope="col" class="px-6 py-3">Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (ProductModel product : products) {
                %>
                <% CategoryDao cD = new CategoryDao();%>
                <tr class="bg-white border-b hover:bg-gray-50">
                    <td class="px-6 py-4"><%=product.getProductId()%></td>
                    <td class="px-6 py-4"><%=product.getProductName()%></td>
                    <td class="px-6 py-4"><%=product.getPrice()%></td>
                    <td class="px-6 py-4"><%=product.getProductBrand()%></td>
                    <td class="px-6 py-4"><%=product.getProductDescription()%></td>
                    <td class="px-6 py-4"><%=cD.getCategoryNameById(product.getProductCategoryId())%></td>
                    <td class="px-6 py-4"><img
                            src="<%=request.getContextPath()%>/images/<%=product.getImageUrl()%>"
                            alt="Product Image" class="h-16 w-16 object-cover rounded"></td>
                    <td class="px-6 py-4"><a
                            href="../EditProductServlet?productId=<%=product.getProductId()%>"
                            class="font-medium text-blue-600 hover:underline">Edit</a> | <a
                            href="../DeleteProductServlet?productId=<%=product.getProductId()%>"
                            class="font-medium text-red-600 hover:underline">Delete</a></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        
    </div>
</body>

</html>
<%
}
%>
 