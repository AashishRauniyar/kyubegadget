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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        response.setContentType("text/html");
	        PrintWriter out = response.getWriter();
	        
	        try {
	            // Get the user name parameter from the request
	            String userName = request.getParameter("userName");
	            
	            // Call the method to delete the user from the database
	            boolean deleted = UserDao.deleteUser(userName);
	            
	            if (deleted) {
	                response.sendRedirect(StringUtils.WELCOME_PAGE); // Redirect to a success page
	            } else {
	                response.sendRedirect(StringUtils.PROFILE_PAGE); // Redirect to a failure page
	                out.println("<h1>Failed to delete user</h1>");
	            }
	        } catch (IOException e) {
	            e.printStackTrace();
	            // Redirect to an error page in case of IO exception
	            response.sendRedirect(StringUtils.ERROR_PAGE);
	        }
	    }

}
