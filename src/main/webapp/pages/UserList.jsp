<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.kyubegadget.controller.dbcontroller.DatabaseController" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Information</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        .total-users {
            text-align: right;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    // Get connection
    conn = DatabaseController.getConn();

    // Prepare and execute query to get total number of users
    String countSql = "SELECT COUNT(*) AS total FROM users";
    pstmt = conn.prepareStatement(countSql);
    rs = pstmt.executeQuery();
    int totalUsers = 0;
    if (rs.next()) {
        totalUsers = rs.getInt("total");
    }

    // Prepare and execute query to get user information
    String sql = "SELECT * FROM users";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
%>

    <h2>User Information</h2>
    <div class="total-users">Total Users: <%= totalUsers %></div>
    <table>
        <tr>
            <th>User ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Date of Birth</th>
            <th>Email</th>
            <th>Phone Number</th>
            <th>Username</th>
            <th>Address</th>
            <th>Gender</th>
            <th>User Type</th> <!-- New column for user type -->
        </tr>
<%
    // Iterate through the result set and display data
    while (rs.next()) {
%>
        <tr>
            <td><%= rs.getInt("userid") %></td>
            <td><%= rs.getString("firstname") %></td>
            <td><%= rs.getString("lastname") %></td>
            <td><%= rs.getString("dob") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("phonenumber") %></td>
            <td><%= rs.getString("username") %></td>
            <td><%= rs.getString("address") %></td>
            <td><%= rs.getString("gender") %></td>
            <td><%= rs.getInt("usertype") == 1 ? "Admin" : "User" %></td> 
        </tr>
<%
    }
%>
    </table>

<%
} catch (SQLException se) {
    se.printStackTrace();
} catch (ClassNotFoundException cnfe) {
    cnfe.printStackTrace();
} finally {
    // Close resources
    try {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    } catch (SQLException se) {
        se.printStackTrace();
    }
}
%>

</body>
</html>
 --%>






<!-- yo chali raxa -->

 
 
<%--  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                    <td class="px-6 py-4"><a href="#" class="font-medium text-red-600 hover:underline">Delete</a></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>

</html>
  --%>
  
  
  
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
                    <td class="px-6 py-4"><a href="../DeleteUserServlet?userName=<%= user.getUserName() %>" class="font-medium text-red-600 hover:underline">Delete</a></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>

</html>
  