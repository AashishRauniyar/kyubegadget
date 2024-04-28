package com.kyubegadget.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.kyubegadget.controller.dbcontroller.DatabaseController;
import com.kyubegadget.model.OrderLineModel;

public class OrderLineDao {
	
	
	public void saveOrderLineToDatabase(OrderLineModel orderLine) {
        try (Connection conn = DatabaseController.getConn()) {
            String query = "INSERT INTO OrderLine (orderId, productId, quantity) VALUES (?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setInt(1, orderLine.getOrderId());
            statement.setInt(2, orderLine.getProductId());
            statement.setInt(3, orderLine.getQuantity());

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted <= 0) {
            	
                // Handle the case when order line insertion fails
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            // Handle the exception
        }
    }

}
