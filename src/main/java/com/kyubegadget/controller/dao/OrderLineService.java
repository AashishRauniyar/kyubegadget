package com.kyubegadget.controller.dao;

import com.kyubegadget.controller.dao.OrderLineDao;
import java.sql.Connection;
import java.sql.SQLException;

public class OrderLineService {
    private OrderLineDao orderLineDao;

    public OrderLineService(Connection connection) {
        this.orderLineDao = new OrderLineDao(connection);
    }

    public void createOrderLine(int orderId, int productId, int quantity) throws SQLException {
        orderLineDao.insertOrderLine(orderId, productId, quantity);
    }
}
