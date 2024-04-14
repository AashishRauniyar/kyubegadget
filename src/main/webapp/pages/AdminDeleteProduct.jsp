<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kyubegadget.controller.dao.ProductDao"%>
<%@ page import="com.kyubegadget.controller.dbcontroller.DatabaseController"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Connection"%>
<%
    int id = Integer.parseInt(request.getParameter("Productid"));
    int deleteProduct = 0;
    try {
        // Get a database connection
        Connection conn = DatabaseController.getConn();
        // Instantiate ProductDao with the connection
        ProductDao productDao = new ProductDao(conn);
        // Call the insertOrUpdate method
        deleteProduct = productDao.insertOrUpdate("DELETE FROM product WHERE Productid=?", id);
        if (deleteProduct > 0) {
            response.sendRedirect("admin-view-product.jsp");
        } else {
            response.sendRedirect("admin-view-product.jsp");
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        // Handle the exception as needed
        response.sendRedirect("error.jsp");
    }
%>
