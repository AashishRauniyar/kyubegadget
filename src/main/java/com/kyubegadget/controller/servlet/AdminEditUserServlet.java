package com.kyubegadget.controller.servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kyubegadget.controller.dao.UserDao;
import com.kyubegadget.model.UserModel;

@WebServlet("/AdminEditUserServlet")

public class AdminEditUserServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/*
	 * protected void doPost(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { String firstName =
	 * request.getParameter("firstName"); String lastName =
	 * request.getParameter("lastName"); String dob = request.getParameter("dob");
	 * String email = request.getParameter("email"); String address =
	 * request.getParameter("address"); String phoneNumber =
	 * request.getParameter("phoneNumber"); String gender =
	 * request.getParameter("gender");
	 * 
	 * // Update the user details in the database UserDao userDao = new UserDao();
	 * UserModel user = new UserModel(null, firstName, lastName, dob, email,
	 * phoneNumber,null, gender, address) ; try { userDao.updateUserbyadmin(user); }
	 * catch (ClassNotFoundException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }
	 * 
	 * // Redirect back to the user information page
	 * response.sendRedirect(request.getContextPath() + "/pages/UserList.jsp"); }
	 */
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        int userId = Integer.parseInt(request.getParameter("userId"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");

        // Update user in the database
        UserModel userModel = new UserModel();
        userModel.setUserId(userId);
        userModel.setFirstName(firstName);
        userModel.setLastName(lastName);
        userModel.setEmail(email);
        userModel.setAddress(address);
        userModel.setPhoneNumber(phoneNumber);

        UserDao userDao = new UserDao();
        int rowsAffected = userDao.updateUserbyadmin(userModel); // Assuming you have a method updateUserByAdmin in your UserDao

        // Redirect back to the page
        if (rowsAffected > 0) {
            response.sendRedirect(request.getContextPath() + "/pages/UserList.jsp"); // Redirect to the admin panel or wherever appropriate
        } else {
            // Handle the case where update failed
            response.getWriter().println("Failed to update user. Please try again.");
        }
    }
}
