package com.kyubegadget.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

	// to get login info from database
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


	// new code

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
	
	 public boolean isUsernameExists(String userName) {
	        try (Connection conn = DatabaseController.getConn()) {
	            PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE userName = ?");
	            ps.setString(1, userName);
	            ResultSet rs = ps.executeQuery();
	            return rs.next(); // true if username exists, false otherwise
	        } catch (SQLException | ClassNotFoundException ex) {
	            ex.printStackTrace(); // Handle or log the exception properly
	            return false;
	        }
	    }

	    public boolean isEmailExists(String email) {
	        try (Connection conn = DatabaseController.getConn()) {
	            PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE email = ?");
	            ps.setString(1, email);
	            ResultSet rs = ps.executeQuery();
	            return rs.next(); // true if email exists, false otherwise
	        } catch (SQLException | ClassNotFoundException ex) {
	            ex.printStackTrace();
	            return false;
	        }
	    }

	    public boolean isPhoneNumberExists(String phoneNumber) {
	        try (Connection conn = DatabaseController.getConn()) {
	            PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE phoneNumber = ?");
	            ps.setString(1, phoneNumber);
	            ResultSet rs = ps.executeQuery();
	            return rs.next(); // true if phone number exists, false otherwise
	        } catch (SQLException | ClassNotFoundException ex) {
	            ex.printStackTrace();
	            return false;
	        }
	    }
		
		// delect user
//		public static boolean deleteUser(String userName) {
//			boolean success = false;
//			try (Connection conn = DatabaseController.getConn()) {
//				PreparedStatement ps = conn.prepareStatement(QueryUtils.DELETE_USER);
//				ps.setString(1, userName);
//				int rowsDeleted = ps.executeUpdate();
//				success = rowsDeleted > 0;
//			} catch (SQLException | ClassNotFoundException ex) {
//				ex.printStackTrace();
//			}
//			return success;
//		}

		
	    public boolean deleteUserByUserName(String userName) {
		    try (Connection conn = DatabaseController.getConn()) {
		        String deleteQuery = QueryUtils.DELETE_USER;
		        PreparedStatement pstmt = conn.prepareStatement(deleteQuery);
		        pstmt.setString(1, userName);

		        int rowsAffected = pstmt.executeUpdate();

		        // If rowsAffected > 0, it means a user was deleted successfully
		        return rowsAffected > 0;
		    } catch (SQLException | ClassNotFoundException ex) {
		        ex.printStackTrace();
		        return false;
		    }
		}




	    public List<UserModel> getAllUsers() {
		    List<UserModel> users = new ArrayList<>();
		    try (Connection conn = DatabaseController.getConn()) {
		        String getAllUsersQuery = QueryUtils.GET_USER;
		        PreparedStatement statement = conn.prepareStatement(getAllUsersQuery);
		        ResultSet resultSet = statement.executeQuery();

		        while (resultSet.next()) {
		            UserModel user = new UserModel();
		            user.setUserId(resultSet.getInt("userId"));
		            user.setUserName(resultSet.getString("userName"));
		            user.setFirstName(resultSet.getString("firstName"));
		            user.setLastName(resultSet.getString("lastName"));
		            user.setEmail(resultSet.getString("email"));
		            user.setPhoneNumber(resultSet.getString("phoneNumber"));
		            user.setDob(resultSet.getDate("dob").toLocalDate());
		            user.setGender(resultSet.getString("gender"));
		            user.setAddress(resultSet.getString("address"));
		            users.add(user);
		        }
		    } catch (SQLException | ClassNotFoundException ex) {
		        ex.printStackTrace();
		    }
		    return users;
		}
	    

}




