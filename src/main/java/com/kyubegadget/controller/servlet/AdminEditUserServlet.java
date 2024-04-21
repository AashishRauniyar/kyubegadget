package com.kyubegadget.controller.servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.kyubegadget.controller.dao.UserDao;
import com.kyubegadget.model.UserModel;

@WebServlet("/AdminEditUserServlet")

public class AdminEditUserServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String dob = request.getParameter("dob");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String phoneNumber = request.getParameter("phoneNumber");
		String gender = request.getParameter("gender");

		// Update the user details in the database
		UserDao userDao = new UserDao();
		UserModel user = new UserModel(null, firstName, lastName, dob, email, phoneNumber,null, gender, address) ;
		try {
			userDao.updateUserbyadmin(user);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// Redirect back to the user information page
		response.sendRedirect(request.getContextPath() + "/pages/UserList.jsp");
	}
}
