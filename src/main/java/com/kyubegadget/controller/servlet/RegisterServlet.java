package com.kyubegadget.controller.servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;


import com.kyubegadget.controller.dao.UserDao;
import com.kyubegadget.model.UserModel;
import com.kyubegadget.utils.StringUtils;
/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	UserDao ud = new UserDao();	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    // TODO Auto-generated method stub
	    doGet(request, response);
	    String userName = request.getParameter(StringUtils.userName);
	    String firstName = request.getParameter(StringUtils.firstName);
	    String lastName = request.getParameter(StringUtils.lastName);
	    String email = request.getParameter(StringUtils.email);
	    String phoneNumber = request.getParameter(StringUtils.phoneNumber);
	    String password = request.getParameter(StringUtils.password);
	    String rePassword = request.getParameter(StringUtils.rePassword);
	    
	    String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
	    UserModel.setPassword(hashedPassword);
	    
	    
	    String dobString = request.getParameter(StringUtils.dob);
	    LocalDate dob = LocalDate.parse(dobString);
	    String gender = request.getParameter(StringUtils.gender);
	    String address = request.getParameter(StringUtils.address);
	    
	    System.out.println("Received user registration details:");
	    System.out.println("Username: " + userName);
	    System.out.println("First Name: " + firstName);
	    System.out.println("Last Name: " + lastName);
	    System.out.println("Email: " + email);
	    System.out.println("Phone Number: " + phoneNumber);
	    System.out.println("Password: " + hashedPassword);
	    System.out.println("Date of Birth: " + dob);
	    System.out.println("Gender: " + gender);
	    System.out.println("Address: " + address);
	    
	    
	 // Validation for empty fields
	 		if (firstName.isEmpty() || lastName.isEmpty() || userName.isEmpty() || dobString.isEmpty() || gender.isEmpty()
	 				|| email.isEmpty() || phoneNumber.isEmpty() || address.isEmpty() || password.isEmpty()
	 				|| (rePassword != null && rePassword.isEmpty())) {
//	             response.sendRedirect(request.getContextPath() + "/Register.jsp?error=empty");
	 			redirectToRegistrationPage(request, response, "Please fill all the fields.");
	 			return; // Return from the method to stop further execution
	 		}

	 		// Validation for name format
	 		if (!isValidName(firstName) || !isValidName(lastName)) {
//	             response.sendRedirect(request.getContextPath() + "/Register.jsp?error=name");
	 			redirectToRegistrationPage(request, response, "Invalid first name or last name format.");
	 			return;
	 		}

	 		// Validation for username format
	 		if (!isValidUsername(userName)) {
	 			redirectToRegistrationPage(request, response, "Invalid username format.");
	 			return;
	 		}

	 		// 3. Birthday Date Restriction
	 		if (dob.isAfter(LocalDate.now())) {
	 			// Redirect to the registration page with an error message
	 			redirectToRegistrationPage(request, response, "Invalid date of birth.");
	 			return;
	 		}

	 		// Validation for email format
	 		if (!email.contains("@") || !email.contains(".")) {
	 			redirectToRegistrationPage(request, response, "Invalid email format.");

	 			return;
	 		}
	 		
	 		// Validation for address format
			if (!isValidName(address)) {
				redirectToRegistrationPage(request, response, "Invalid address format.");
				return;
			}

	 		// Validation for phonenumber format
	 		if (!isValidPhoneNumber(phoneNumber)) {

	 			redirectToRegistrationPage(request, response, "Invalid phone number format.");
	 			return;
	 		}

	 		// Check if the phone number already exists in the database
	 		if (ud.isPhoneNumberExists(phoneNumber)) {
	 			redirectToRegistrationPage(request, response, "Phone number already exists.");
	 			return;
	 		}

	 		// Check if the email already exists in the database
	 		if (ud.isEmailExists(email)) {
	 			redirectToRegistrationPage(request, response, "Email already exists.");
	 			return;
	 		}

	 		// Check if the username already exists in the database
	 		if (ud.isUsernameExists(userName)) {
	 			redirectToRegistrationPage(request, response, "Username already exists.");
	 			return;
	 		}

	 		// Password complexity and match validation
	 		if (!isValidPassword(password, rePassword)) {
	 			redirectToRegistrationPage(request, response, "Invalid password format or passwords don't match.");
	 			return;
	 		}
	 		
	 		

	   

	    UserModel userModel = new UserModel(userName, firstName, lastName, email, phoneNumber, hashedPassword, dob,
	            gender, address);

	    // Adding user to the database
	    int result = ud.addUser(userModel);

		if (result > 0) {
			HttpSession session = request.getSession();
//			session.setAttribute(StringUtils.userName, userName);
			session.setAttribute(StringUtils.firstName, firstName);
			session.setAttribute(StringUtils.lastName, lastName);
			session.setAttribute(StringUtils.email, email);
			session.setAttribute(StringUtils.phoneNumber, phoneNumber);
			session.setAttribute(StringUtils.gender,gender);
			session.setAttribute(StringUtils.address, address);
			
			response.sendRedirect(request.getContextPath() + StringUtils.LOGIN_PAGE + "?" + StringUtils.ERROR_MESSAGE + "="
					+ StringUtils.SUCCESS_REGISTER_MESSAGE);
		} else {
			response.sendRedirect(request.getContextPath() + StringUtils.REGISTER_PAGE + "?" + StringUtils.ERROR_MESSAGE
					+ "=" + StringUtils.REGISTER_ERROR_MESSAGE);
			System.out.println("An unexpected server error occurred. ");
		}
	}
	

	// Helper methods for validations
		private boolean isValidName(String name) {
			// Implement name validation logic
			return !name.matches(".*\\d.*") && !name.matches(".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?].*");
		}

	//private boolean isValidUsername(String username) {
//	    // Implement username validation logic
//	    return username.length() > 6 && !username.matches(".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?].*");
	//}

		private boolean isValidUsername(String username) {
			// Implement username validation logic
			return username.length() > 6 && !username.matches(".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?].*")
					&& username.matches(".*[a-zA-Z0-9].*");
		}

		 private void redirectToRegistrationPage(HttpServletRequest request, HttpServletResponse response,
		            String errorMessage) throws ServletException, IOException {
		        request.setAttribute(StringUtils.ERROR_MESSAGE, errorMessage);
		        request.getRequestDispatcher(StringUtils.REGISTER_PAGE).forward(request, response);
		    }

		private boolean isValidPassword(String password, String repassword) {
			// Implement password validation logic
			return password.length() > 6 && // Checks if password length is greater than 6
					password.matches(".*\\d.*") && // Checks if password contains at least one digit
					password.matches(".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?].*") && // Checks if password contains
																							// at least one special
																							// character
					password.matches(".*[A-Z].*") && // Checks if password contains at least one uppercase letter
					password.equals(repassword); // Checks if password matches the re-entered password
		}

	//phone number validation
		private boolean isValidPhoneNumber(String phoneNumber) {
			// Implement phone number validation logic
			return phoneNumber.startsWith("+") && phoneNumber.length() == 14;
		}

	    

}
