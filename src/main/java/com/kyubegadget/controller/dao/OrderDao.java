package com.kyubegadget.controller.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.kyubegadget.model.OrderModel;

public class OrderDao {
    private Connection connection;

    public OrderDao(Connection connection) {
        this.connection = connection;
    }

    // Method to insert a new order into the orders table
    public int insertOrder(OrderModel order) throws SQLException {
        String sql = "INSERT INTO orders (orderDate, userId, totalAmount, orderStatus) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setDate(1, new java.sql.Date(order.getOrderDate().getTime()));
            stmt.setString(2, order.getUserId());
            stmt.setDouble(3, order.getTotalAmount());
            stmt.setString(4, order.getOrderStatus());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1); // Return the generated orderId
            }
        }
        return -1;
    }

    // Method to retrieve an order by orderId
    public OrderModel getOrderById(int orderId) throws SQLException {
        String sql = "SELECT * FROM orders WHERE orderId = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, orderId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return extractOrderFromResultSet(rs);
            }
        }
        return null;
    }

    // Helper method to extract an Order object from the result set
    private OrderModel extractOrderFromResultSet(ResultSet rs) throws SQLException {
    	OrderModel order = new OrderModel(0, null, null, 0, null);
        order.setOrderId(rs.getInt("orderId"));
        order.setOrderDate(rs.getDate("orderDate"));
        order.setUserId(rs.getString("userId"));
        order.setTotalAmount(rs.getDouble("totalAmount"));
        order.setOrderStatus(rs.getString("orderStatus"));
        return order;
    }

    // Additional methods for updating, deleting, or retrieving orders
}