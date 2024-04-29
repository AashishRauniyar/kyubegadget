package com.kyubegadget.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.kyubegadget.controller.dbcontroller.DatabaseController;
import com.kyubegadget.model.OrderModel;
import com.kyubegadget.model.UserModel;
import com.kyubegadget.utils.QueryUtils;



public class ProfileDao {

	 public int updateUserProfile(UserModel userModel) {
	        try (Connection conn = DatabaseController.getConn()) {
	            // Update data in the users table
	            String updateUserQuery = "UPDATE users SET firstName=?, lastName=?, email=?, phoneNumber=?,  address=? WHERE userName=?";
	            PreparedStatement userStatement = conn.prepareStatement(updateUserQuery, Statement.RETURN_GENERATED_KEYS);

	            userStatement.setString(1, userModel.getFirstName());
	            userStatement.setString(2, userModel.getLastName());
	            userStatement.setString(3, userModel.getEmail());
	            userStatement.setString(4, userModel.getPhoneNumber());
	            userStatement.setString(5, userModel.getAddress());
	            userStatement.setString(6, userModel.getUserName());
	            
	            

	            int userUpdated = userStatement.executeUpdate();
	            return userUpdated;
	            
	            
	        } catch (SQLException | ClassNotFoundException ex) {
	            ex.printStackTrace();
	            return -1;
	        }
	    }
	 
	 
	  
	 
	// Get user by username from the database
	    public UserModel getUserByUsername(String userName) {
	        try (Connection conn = DatabaseController.getConn()) {
	            PreparedStatement ps = conn.prepareStatement(QueryUtils.GET_DETAILS_BYUSERNAME);
	            ps.setString(1, userName);
	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {
	                UserModel userModel = new UserModel();
	                userModel.setUserName(rs.getString("userName"));
	                userModel.setFirstName(rs.getString("firstName"));
	                userModel.setLastName(rs.getString("lastName"));
	                userModel.setEmail(rs.getString("email"));
	                userModel.setPhoneNumber(rs.getString("phoneNumber"));
	                userModel.setGender(rs.getString("gender"));
	                userModel.setAddress(rs.getString("address"));
	                

	                return userModel;
	            } else {
	                // No matching record found
	                return null;
	            }
	        } catch (SQLException | ClassNotFoundException ex) {
	            ex.printStackTrace(); // Log the exception for debugging
	            return null;
	        }
	    }
	    
	    
	    
	 // Get user's order history from the database
	    public List<OrderModel> getUserOrderHistory(int userId) {
	        List<OrderModel> orderHistory = new ArrayList<>();
	        try (Connection conn = DatabaseController.getConn()) {
	            PreparedStatement ps = conn.prepareStatement("SELECT orderId, orderDate, totalAmount, orderStatus\r\n"
	            		+ "FROM Orders\r\n"
	            		+ "WHERE userId = ?\r\n"
	            		+ "ORDER BY orderDate DESC;");
	            ps.setInt(1, userId);
	            ResultSet rs = ps.executeQuery();

	            while (rs.next()) {
	                OrderModel order = new OrderModel(
	                        rs.getInt("orderId"),
	                        rs.getDate("orderDate"),
	                        rs.getInt("userId"),
	                        rs.getDouble("totalAmount"),
	                        rs.getString("orderStatus")
	                );

	                // Add the order to the order history list
	                orderHistory.add(order);
	            }
	        } catch (SQLException | ClassNotFoundException ex) {
	            ex.printStackTrace(); // Log the exception for debugging
	        }
	        return orderHistory;
	    }
	    
	    
	    
}
