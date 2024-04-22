<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.*, com.kyubegadget.controller.dbcontroller.DatabaseController"%>
<%@ page import="com.kyubegadget.controller.dao.ProductDao"%>
<%@ page import="com.kyubegadget.model.ProductModel"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product Information</title>
<link href="<%=request.getContextPath()%>/styles/output.css"
	rel="stylesheet">

</head>

<body class="bg-gray-100">
    <div id="content"
        class="relative overflow-x-auto shadow-md sm:rounded-lg ml-64">
        <div class="pb-4 bg-white">

        </div>
        <table class="w-full text-sm text-left rtl:text-right text-gray-500">
            <thead
                class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                <tr>
                    <th scope="col" class="p-4">
                        <div class="flex items-center">
                            <input id="checkbox-all-search" type="checkbox"
                                class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500">
                            <label for="checkbox-all-search" class="sr-only">checkbox</label>
                        </div>
                    </th>
                    <th scope="col" class="px-6 py-3">Product ID</th>
                    <th scope="col" class="px-6 py-3">Product Name</th>
                    <th scope="col" class="px-6 py-3">Price</th>
                    <th scope="col" class="px-6 py-3">Brand</th>
                    <th scope="col" class="px-6 py-3">Description</th>
                    <th scope="col" class="px-6 py-3">Category</th>
                    <th scope="col" class="px-6 py-3">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ProductDao productDao = new ProductDao(null);
                    List<ProductModel> products = productDao.getAllProducts();
                    for (ProductModel product : products) {
                %>
                <tr class="bg-white border-b hover:bg-gray-50">
                    <td class="w-4 p-4">
                        <div class="flex items-center">
                            <input id="checkbox-table-search-1" type="checkbox"
                                class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500">
                            <label for="checkbox-table-search-1" class="sr-only">checkbox</label>
                        </div>
                    </td>
                    <td class="px-6 py-4"><%= product.getProductId() %></td>
                    <td class="px-6 py-4"><%= product.getProductName() %></td>
                    <td class="px-6 py-4"><%= product.getPrice() %></td>
                    <td class="px-6 py-4"><%= product.getProductBrand() %></td>
                    <td class="px-6 py-4"><%= product.getProductDescription() %></td>
                    <td class="px-6 py-4"><%= product.getProductCategoryId() %></td>
                    <td class="px-6 py-4"><a href="../DeleteProductServlet?productId=<%= product.getProductId() %>" class="font-medium text-red-600 hover:underline">Delete</a></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>

</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kyubegadget.controller.dao.ProductDao" %>
<%@ page import="com.kyubegadget.controller.dao.CategoryDao" %>
<%@ page import="com.kyubegadget.model.ProductModel" %>
<%@ page import="com.kyubegadget.model.ProductCategoryModel" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product Information</title>
<link href="<%=request.getContextPath()%>/styles/output.css" rel="stylesheet">
</head>


<body class="bg-gray-100 flex">
<%@include file="adminSideBar.jsp"%>
    <div id="content" class="relative overflow-x-auto shadow-md sm:rounded-lg ">
        <div class="pb-4 bg-white"></div>
        <table class="w-full text-sm text-left rtl:text-right text-gray-500">
            <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                <tr>
                    <th scope="col" class="p-4">
                        <div class="flex items-center">
          
                        </div>
                    </th>
                    <th scope="col" class="px-6 py-3">Product ID</th>
                    <th scope="col" class="px-6 py-3">Product Name</th>
                    <th scope="col" class="px-6 py-3">Price</th>
                    <th scope="col" class="px-6 py-3">Brand</th>
                    <th scope="col" class="px-6 py-3">Description</th>
                    <th scope="col" class="px-6 py-3">Category</th>
                    <th scope="col" class="px-6 py-3">Action</th>
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
                    <td class="w-4 p-4">
                        <div class="flex items-center">
                            
                        </div>
                    </td>
                    <td class="px-6 py-4"><%= product.getProductId() %></td>
                    <td class="px-6 py-4"><%= product.getProductName() %></td>
                    <td class="px-6 py-4"><%= product.getPrice() %></td>
                    <td class="px-6 py-4"><%= product.getProductBrand() %></td>
                    <td class="px-6 py-4"><%= product.getProductDescription() %></td>
                    <td class="px-6 py-4"><%= cD.getCategoryNameById(product.getProductCategoryId()) %></td> <!-- Call getCategoryNameById method -->
                    <td class="px-6 py-4"><a href="../DeleteProductServlet?productId=<%= product.getProductId() %>" class="font-medium text-red-600 hover:underline">Delete</a></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        
    </div>

 <%@include file="ManageCategory.jsp"%>
 
 </body>
</html>
