package com.kyubegadget.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.kyubegadget.controller.dbcontroller.DatabaseController;
import com.kyubegadget.model.UserModel;



public class ProfileDao {

	 public int updateUserProfile(UserModel userModel) {
	        try (Connection conn = DatabaseController.getConn()) {
	            // Update data in the users table
	            String updateUserQuery = "UPDATE users SET firstName=?, lastName=?, email=?, phoneNumber=?, gender= address=? WHERE userName=?";
	            PreparedStatement userStatement = conn.prepareStatement(updateUserQuery, Statement.RETURN_GENERATED_KEYS);

	            userStatement.setString(1, userModel.getFirstName());
	            userStatement.setString(2, userModel.getLastName());
	            userStatement.setString(3, userModel.getEmail());
	            userStatement.setString(4, userModel.getPhoneNumber());
	            userStatement.setString(5, userModel.getGender());
	            userStatement.setString(6, userModel.getUserName());
	            userStatement.setString(7, userModel.getAddress());

	            int userUpdated = userStatement.executeUpdate();
	            return userUpdated;
	            
	            
	        } catch (SQLException | ClassNotFoundException ex) {
	            ex.printStackTrace();
	            return -1;
	        }
	    }
}
