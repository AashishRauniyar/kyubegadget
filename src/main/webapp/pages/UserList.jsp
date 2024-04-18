 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.kyubegadget.model.UserModel, com.kyubegadget.controller.dao.UserDao"%>
<%@ page import="java.sql.*, com.kyubegadget.controller.dbcontroller.DatabaseController"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Information</title>
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
                    <th scope="col" class="px-6 py-3">User ID</th>
                    <th scope="col" class="px-6 py-3">User Name</th>
                    <th scope="col" class="px-6 py-3">Full Name</th>
                    <th scope="col" class="px-6 py-3">DOB</th>
                    <th scope="col" class="px-6 py-3">Email</th>
                    <th scope="col" class="px-6 py-3">Address</th>
                    <th scope="col" class="px-6 py-3">Phone Number</th>
                    <th scope="col" class="px-6 py-3">Gender</th>
                    <th scope="col" class="px-6 py-3">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    UserDao userDao = new UserDao();
                    List<UserModel> users = userDao.getAllUsers();
                    for (UserModel user : users) {
                %>
                <tr class="bg-white border-b hover:bg-gray-50">
                    <td class="w-4 p-4">
                        <div class="flex items-center">
                            <input id="checkbox-table-search-1" type="checkbox"
                                class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500">
                            <label for="checkbox-table-search-1" class="sr-only">checkbox</label>
                        </div>
                    </td>
                    <td class="px-6 py-4"><%= user.getUserId() %></td>
                    <td class="px-6 py-4"><%= user.getUserName() %></td>
                    <td class="px-6 py-4"><%= user.getFirstName() %> <%= user.getLastName() %></td>
                    <td class="px-6 py-4"><%= user.getDob() %></td>
                    <td class="px-6 py-4"><%= user.getEmail() %></td>
                    <td class="px-6 py-4"><%= user.getAddress() %></td>
                    <td class="px-6 py-4"><%= user.getPhoneNumber() %></td>
                    <td class="px-6 py-4"><%= user.getGender() %></td>
<%--                     <td class="px-6 py-4"><a href="../DeleteUserServlet?userName=<%= user.getUserName() %>" class="font-medium text-red-600 hover:underline">Delete</a></td>
 --%>                
 					</tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>

</html>