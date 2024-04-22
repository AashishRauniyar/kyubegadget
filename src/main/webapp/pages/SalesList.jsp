<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.kyubegadget.model.SalesModel, com.kyubegadget.controller.dao.SalesDao"%>
<%@ page import="java.sql.*, com.kyubegadget.controller.dbcontroller.DatabaseController"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sales List</title>
    <!-- Add the CSS reference here -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- OR -->
    <!-- <link href="<%=request.getContextPath()%>/styles/output.css" rel="stylesheet"> -->
</head>
<%@include file="adminSideBar.jsp"%>

<body class="bg-gray-100 flex">
    <div id="content" class="relative overflow-x-auto shadow-md sm:rounded-lg w-full h-[100vh] ">
        <div class="pb-4 bg-white"></div>
        <table class="w-full text-sm text-left rtl:text-right text-gray-500">
            <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                <tr>
                    <th scope="col" class="p-4">
                        <div class="flex items-center">
                            <label for="checkbox-all-search" class="sr-only">checkbox</label>
                        </div>
                    </th>
                    <th scope="col" class="px-6 py-3">Sale ID</th>
                    <th scope="col" class="px-6 py-3">Product ID</th>
                    <th scope="col" class="px-6 py-3">User ID</th>
                    <th scope="col" class="px-6 py-3">Sale Date</th>
                    <th scope="col" class="px-6 py-3">Quantity</th>
                    <th scope="col" class="px-6 py-3">Unit Price</th>
                    <th scope="col" class="px-6 py-3">Total Price</th>
                </tr>
            </thead>
            <tbody>
                <%
                    SalesDao salesDao = new SalesDao();
                    List<SalesModel> sales = salesDao.getAllSales();
                    for (SalesModel sale : sales) {
                %>
                <tr class="bg-white border-b hover:bg-gray-50">
                    <td class="w-4 p-4">
                        <div class="flex items-center">
                            <!-- <input id="checkbox-table-search-1" type="checkbox"
                                class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500">
                            <label for="checkbox-table-search-1" class="sr-only">checkbox</label> -->
                        </div>
                    </td>
                    <td class="px-6 py-4"><%= sale.getSaleId() %></td>
                    <td class="px-6 py-4"><%= sale.getProductId() %></td>
                    <td class="px-6 py-4"><%= sale.getUserId() %></td>
                    <td class="px-6 py-4"><%= sale.getSaleDate() %></td>
                    <td class="px-6 py-4"><%= sale.getQuantity() %></td>
                    <td class="px-6 py-4">$<%= sale.getUnitPrice() %></td>
                    <td class="px-6 py-4">$<%= sale.getTotalPrice() %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>

</html>