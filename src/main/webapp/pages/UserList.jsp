<%@ page language="java" contentType="text/html; charset=UTF-8"
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
            <td><%= rs.getInt("usertype") == 1 ? "Admin" : "User" %></td> <!-- Display user type as Admin or User -->
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
