package com.kyubegadget.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class OrderLineDao {
    private Connection connection;

    public OrderLineDao(Connection connection) {
        this.connection = connection;
    }

    public void insertOrderLine(int orderId, int productId, int quantity) throws SQLException {
        String sql = "INSERT INTO orderline (orderId, productId, quantity) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, orderId);
            stmt.setInt(2, productId);
            stmt.setInt(3, quantity);
            stmt.executeUpdate();
        }
    }
}
