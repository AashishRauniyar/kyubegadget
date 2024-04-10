package com.kyubegadget.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kyubegadget.controller.dbcontroller.DatabaseController;
import com.kyubegadget.model.UserModel;
import com.kyubegadget.utils.QueryUtils;

public class UserDao {
	
	
	// to add user
	public int addUser(UserModel userModel) {
		try (Connection conn = DatabaseController.getConn()) {
            // Insert user data
            String insertUserQuery = QueryUtils.insertUserQuery;
            PreparedStatement userStatement = conn.prepareStatement(insertUserQuery);

            userStatement.setString(1, userModel.getUserName());
            userStatement.setString(2, userModel.getFirstName());
            userStatement.setString(3, userModel.getLastName());
            userStatement.setString(4, userModel.getEmail());
            userStatement.setString(5, userModel.getPhoneNumber());
            userStatement.setString(6, userModel.getPassword());
            userStatement.setDate(7, java.sql.Date.valueOf(userModel.getDob())); 
            userStatement.setString(8, userModel.getGender());
            userStatement.setString(9, userModel.getAddress());
            
            int userInserted = userStatement.executeUpdate();

            // Retrieve the generated userId
            

            
            return userInserted; // Return the generated userId

        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            return -1; // or handle the exception as needed
        }
	}
	
	// for hashed password from database
	public String getHashedPassword(String userName) {
		try (Connection conn = DatabaseController.getConn()) {
			PreparedStatement st = conn.prepareStatement(QueryUtils.GET_HASHED_PASSWORD);
			st.setString(1, userName);
			ResultSet rs = st.executeQuery();
			/*
			 * String password = rs.getString("hashed_password"); System.out.println(
			 * password);
			 */
			if (rs.next()) {
				return rs.getString("password");
			} else {
				// Username not found
				System.out.print("ppppp");
				return null;
				
			}
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	
	//to get login info from database
	public int getUserLoginInfo(String userName, String password) {
  		try (Connection conn = DatabaseController.getConn()) {
  			PreparedStatement ps = conn.prepareStatement(QueryUtils.GET_LOGIN_USER_INFOS);
  			ps.setString(1, userName);
  			ps.setString(2, password);
  			ResultSet rs = ps.executeQuery();

  			if (rs.next()) {
  				// User name and password match in the database
  				return 1;
  			} else {
  				// No matching record found
  				return 0;
  			}
  		} catch (SQLException | ClassNotFoundException ex) {
  			ex.printStackTrace(); // Log the exception for debugging
  			return -1;

  		}
  	}
	
	
	
	//paxi garamla old ho yo
//	public int getAdminLoginInfo(String userName, String password) {
// 		try (Connection conn = DatabaseController.getConn()) {
// 			PreparedStatement ps = conn.prepareStatement(QueryUtils.GET_LOGIN_ADMIN_INFOS);
// 			ps.setString(1, userName);
// 			ps.setString(2, password);
// 			ResultSet rs = ps.executeQuery();
//
// 			if (rs.next()) {
// 				// User name and password match in the database
// 				return 1;
// 			} else {
// 				// No matching record found
// 				return 0;
// 			}
// 		} catch (SQLException | ClassNotFoundException ex) {
// 			ex.printStackTrace(); // Log the exception for debugging
// 			return -1;
//
// 		}
// 	}
	
	//new code
	
	public int getAdminLoginInfo(String userName, String password) {
	    try (Connection conn = DatabaseController.getConn()) {
	        PreparedStatement ps = conn.prepareStatement(QueryUtils.GET_LOGIN_ADMIN_INFOS);
	        ps.setString(1, userName);
	        ps.setString(2, password);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            int userType = rs.getInt("userType");
	            if (userType == 1) {
	                // User is an admin
	                return 1;
	            } else {
	                // User is not an admin
	                return 0;
	            }
	        } else {
	            // No matching record found
	            return -1;
	        }
	    } catch (SQLException | ClassNotFoundException ex) {
	        ex.printStackTrace(); // Log the exception for debugging
	        return -1;
	    }
	}
	
	// username already exists
		public boolean isUsernameExists(String userName) {
		    try (Connection conn = DatabaseController.getConn()) {
				PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE userName = ?");
				ps.setString(1, userName);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					return true; // Username exists
				}
			} catch (SQLException | ClassNotFoundException ex) {
				ex.printStackTrace(); // Handle or log the exception properly
			}
			return false; // Username does not exist
		}

//	        isEmailExists
		public boolean isEmailExists(String email) {
		    try (Connection conn = DatabaseController.getConn()) {
				PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE email = ?");
				ps.setString(1, email);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					return true;
				}
			} catch (SQLException | ClassNotFoundException ex) {
				ex.printStackTrace();
			}
			return false;
		}

		// isPhoneNumberExists
		public boolean isPhoneNumberExists(String phoneNumber) {
		    try (Connection conn = DatabaseController.getConn()) {
				PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE phoneNumber = ?");
				ps.setString(1, phoneNumber);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					return true;
				}
			} catch (SQLException | ClassNotFoundException ex) {
				ex.printStackTrace();
			}
			return false;
		}


	
	

}
