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
</head>
<body class="bg-gray-100 flex">
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
</div>
</body>
</html>
