<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.kyubegadget.model.ProductCategoryModel" %>
<%@ page import="com.kyubegadget.controller.dao.CategoryDao" %>
<%@ page import="com.kyubegadget.utils.StringUtils" %>


<%
// Fetch categories from the database or wherever they are stored
CategoryDao categoryDao = new CategoryDao();
List<ProductCategoryModel> categories = categoryDao.getAllCategories();
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Categories</title>
</head>
<body>
    <h1>Product Categories</h1>
    <ul>
        <c:forEach var="category" items="${categories}">
            <li>${category.categoryName}</li>
        </c:forEach>
    </ul>
</body>
</html>
