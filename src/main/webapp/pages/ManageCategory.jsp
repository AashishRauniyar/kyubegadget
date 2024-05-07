<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kyubegadget.controller.dao.CategoryDao" %>
<%@ page import="com.kyubegadget.model.ProductCategoryModel" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category Information</title>
    <link href="<%=request.getContextPath()%>/styles/output.css" rel="stylesheet">
</head>
<style>
input[type="text"] {
    width: 100%;
    padding: 0.5rem;
    font-size: 1rem;
    border: 1px solid #ccc;
    border-radius: 0.25rem;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    margin-bottom: 1rem;
    margin-top: 1rem;
}

/* Style for the input field on focus */
input[type="text"]:focus {
    outline: none;
    border-color: #4a90e2; /* Change border color on focus */
    box-shadow: 0 0 0 0.2rem rgba(74, 144, 226, 0.25); /* Add a box shadow on focus */
}


</style>
<body class="bg-gray-100 flex w-full">
<div id="content" class="relative overflow-x-auto shadow-md sm:rounded-lg ">
    <div class="pb-4 bg-white"></div>
    <table class="w-full text-sm text-left rtl:text-right text-gray-500">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
        <tr>
            <th scope="col" class="p-4">
                <div class="flex items-center">

                </div>
            </th>
            <th scope="col" class="px-6 py-3">Category ID</th>
            <th scope="col" class="px-6 py-3">Category Name</th>
            <th scope="col" class="px-6 py-3">Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            CategoryDao categoryDao = new CategoryDao();
            List<ProductCategoryModel> categories = categoryDao.getAllCategories();
            for (ProductCategoryModel category : categories) {
        %>
        <tr class="bg-white border-b hover:bg-gray-50">
            <td class="w-4 p-4">
                <div class="flex items-center">
                    <!-- Any checkboxes or actions you want to include -->
                </div>
            </td>
            <td class="px-6 py-4"><%= category.getProductCategoryId() %></td>
            <td class="px-6 py-4"><%= category.getCategoryName() %></td>
            <td class="px-6 py-4">
                <!-- Actions like edit or delete -->
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <a href="<%=request.getContextPath()%>/pages/productCategory.jsp" class="fixed right-4 bottom-4 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-full">Add Category</a>

 
 <div id="categoryForm">
    <div class="form-group">
        <input class="border border-red-300" type="text" id="categoryName" name="categoryName" placeholder="Add Category" required>
    </div>
    <button onclick="addCategory()" class="text-white bg-indigo-500 hover:bg-indigo-800 font-medium rounded-lg text-sm px-5 py-2.5 text-center">Add Category</button>
</div>


 
 

 
 
 </div>

</body>
<script>
function addCategory() {
    // Get the category name input value
    var categoryName = document.getElementById("categoryName").value;

    // Send AJAX request to the servlet
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "../AddCategoryServlet", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            // Handle response from servlet
          
            // Optional: Reload page or update UI
            location.reload(); // Reload the page
        }
    };
    xhr.send("categoryName=" + categoryName); // Send category name as POST parameter
}

    </script>
</html> --%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kyubegadget.controller.dao.CategoryDao" %>
<%@ page import="com.kyubegadget.model.ProductCategoryModel" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category Information</title>
    <link href="<%=request.getContextPath()%>/styles/output.css" rel="stylesheet">
    <!-- Tailwind CSS -->
    
</head>
<body class="bg-gray-100 flex w-full">
<%@include file="adminSideBar.jsp"%>
<div id="content" class="relative overflow-x-auto shadow-md sm:rounded-lg mx-auto">
    <div class="pb-4 bg-white"></div>
    <table class="w-full text-sm text-left rtl:text-right text-gray-500">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
        <tr>
            <th scope="col" class="p-4">
                <div class="flex items-center">

                </div>
            </th>
            <th scope="col" class="px-6 py-3">Category ID</th>
            <th scope="col" class="px-6 py-3">Category Name</th>
            <th scope="col" class="px-6 py-3">Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            CategoryDao categoryDao = new CategoryDao();
            List<ProductCategoryModel> categories = categoryDao.getAllCategories();
            for (ProductCategoryModel category : categories) {
        %>
        <tr class="bg-white border-b hover:bg-gray-50">
            <td class="w-4 p-4">
                <div class="flex items-center">
                    <!-- Any checkboxes or actions you want to include -->
                </div>
            </td>
            <td class="px-6 py-4"><%= category.getProductCategoryId() %></td>
            <td class="px-6 py-4"><%= category.getCategoryName() %></td>
            <td class="px-6 py-4">
                <!-- Actions like edit or delete -->
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
 
    <div id="categoryForm" class="mt-6">
        <div class="flex justify-between items-center">
            <input class="border border-gray-300 rounded-lg py-2 px-4 w-full focus:outline-none focus:border-blue-500" type="text" id="categoryName" name="categoryName" placeholder="Add Category" required>
            <button onclick="addCategory()" class="ml-4 px-6 py-2 bg-blue-500 hover:bg-blue-700 text-white font-medium rounded-lg text-sm">Add Category</button>
        </div>
    </div>
</div>

<!-- <script>
function addCategory() {
    // Get the category name input value
    var categoryName = document.getElementById("categoryName").value;

    // Send AJAX request to the servlet
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "../AddCategoryServlet", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            // Handle response from servlet
          
            // Optional: Reload page or update UI
            location.reload(); // Reload the page
        }
    };
    xhr.send("categoryName=" + categoryName); // Send category name as POST parameter
}
</script> -->

<script>
function addCategory() {
    // Get the category name input value
    var categoryName = document.getElementById("categoryName").value.trim(); // Trim any leading or trailing whitespace

    // Check if the category name is empty
    if (categoryName === "") {
        alert("Please enter a category name.");
        return; // Exit the function if the category name is empty
    }

    // Send AJAX request to the servlet
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "../AddCategoryServlet", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            // Handle response from servlet
            location.reload(); // Reload the page
        }
    };
    xhr.send("categoryName=" + encodeURIComponent(categoryName)); // Send category name as POST parameter
}
</script>

</body>
</html>
