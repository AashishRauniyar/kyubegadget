<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.kyubegadget.controller.dbcontroller.DatabaseController" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Products</title>
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
        .edit-link, .delete-link {
            text-decoration: none;
            color: blue;
            margin-right: 10px;
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

    // Prepare and execute query to get product information
    String sql = "SELECT * FROM product";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
%>

    <h2>Manage Products</h2>
    <table>
        <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Brand</th>
            <th>Image</th>
            <th>Action</th>
        </tr>
<%
    // Iterate through the result set and display data
    while (rs.next()) {
%>
        <tr>
            <td><%= rs.getInt("productid") %></td>
            <td><%= rs.getString("productname") %></td>
            <td><%= rs.getString("productdescription") %></td>
            <td>$<%= rs.getDouble("price") %></td>
            <td><%= rs.getInt("stock") %></td>
            <td><%= rs.getInt("productbrand") %></td>
            <td><%= rs.getString("imageurl") %></td>
            <td>
                <!-- Update Form -->
                <form action="updateProduct.jsp" method="post">
                    <input type="hidden" name="id" value="<%= rs.getInt("productid") %>">
                    <input type="number" name="quantity" value="<%= rs.getInt("stock") %>">
                    <input type="submit" value="Update Quantity">
                </form>
                
                <!-- Delete Form -->
                <form action="deleteProduct.jsp" method="post">
                    <input type="hidden" name="id" value="<%= rs.getInt("productid") %>">
                    <button><input type="submit" value="Delete"></button>
                </form>
            </td>
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
