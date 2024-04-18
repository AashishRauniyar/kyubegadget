package com.kyubegadget.controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kyubegadget.controller.dao.UserDao;
import com.kyubegadget.utils.StringUtils;

/**
 * Servlet implementation class DeleteUser
 */
@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the user name parameter from the request
        String userName = request.getParameter("userName");

        if (userName != null && !userName.isEmpty()) {
            try {
                // Call the UserDao to delete the user by userName
                UserDao userDao = new UserDao();
                boolean deleted = userDao.deleteUserByUserName(userName);
                if (deleted) {
                    // User successfully deleted
                    response.sendRedirect(request.getContextPath()+StringUtils.USER_LIST); // Redirect to the user list page
                } else {
                    // Error occurred while deleting user
                    response.getWriter().println("Failed to delete user");
                }
            } catch (Exception e) {
                response.getWriter().println("An error occurred: " + e.getMessage());
            }
        } else {
            response.getWriter().println("User name parameter is missing");
        }
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}