package com.kyubegadget.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.kyubegadget.controller.dbcontroller.DatabaseController;
import com.kyubegadget.model.SalesModel;

public class SalesDao {

    public static void insertSaletoDatabase(int productId, int userId, LocalDate saleDate, int quantity, double unitPrice, double totalPrice) throws ClassNotFoundException {
        try (Connection conn = DatabaseController.getConn()) {
            String query = "INSERT INTO Sales (productId, userId, saleDate, quantity, unitPrice, totalPrice) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setInt(1, productId);
                statement.setInt(2, userId);
                statement.setDate(3, java.sql.Date.valueOf(saleDate));
                statement.setInt(4, quantity);
                statement.setDouble(5, unitPrice);
                statement.setDouble(6, totalPrice);

                statement.executeUpdate();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public List<SalesModel> getAllSales() {
        List<SalesModel> salesList = new ArrayList<>();
        try (Connection conn = DatabaseController.getConn()) {
            String query = "SELECT * FROM Sales";
            try (PreparedStatement statement = conn.prepareStatement(query);
                 ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int saleId = resultSet.getInt("saleId");
                    int productId = resultSet.getInt("productId");
                    int userId = resultSet.getInt("userId");
                    LocalDate saleDate = resultSet.getDate("saleDate").toLocalDate();
                    int quantity = resultSet.getInt("quantity");
                    double unitPrice = resultSet.getDouble("unitPrice");
                    double totalPrice = resultSet.getDouble("totalPrice");

                    SalesModel sale = new SalesModel(saleId, productId, userId, saleDate, quantity, unitPrice, totalPrice);
                    salesList.add(sale);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return salesList;
    }
}
