package com.kyubegadget.controller.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.kyubegadget.controller.dao.UserDao;
import com.kyubegadget.controller.dbcontroller.DatabaseController;
import com.kyubegadget.model.UserModel;
import com.kyubegadget.utils.StringUtils;



/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	UserDao ud = new UserDao();	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter(StringUtils.userName);
        String password = request.getParameter(StringUtils.password);
        String hashedPasswordDB = ud.getHashedPassword(userName);

        if (hashedPasswordDB != null && hashedPasswordDB.contains("$")) {
            String[] parts = hashedPasswordDB.split("\\$");
            String extractedSalt = parts[2];
            String extractedHash = parts[3];
            String hashedPasswordSalt = "$2a$" + extractedSalt + "$" + extractedHash;

            // Check admin login
            int adminLoginResult = ud.getAdminLoginInfo(userName, hashedPasswordSalt);
            if (adminLoginResult == 1) {
                // Successful admin login
                HttpSession session = request.getSession();
                session.setAttribute(StringUtils.userName, userName);
                session.setAttribute("role", "admin");
                session.setMaxInactiveInterval(30 * 60);
                response.sendRedirect(request.getContextPath() + StringUtils.ADMIN_PAGE);
                return;
            } else if (adminLoginResult == 0) {
                // Admin credentials are not correct, proceed to check user login
                int userLoginResult = ud.getUserLoginInfo(userName, hashedPasswordSalt);
                if (userLoginResult == 1) {
                    // Successful user login
                    HttpSession session = request.getSession();
                    session.setAttribute(StringUtils.userName, userName);
                    session.setAttribute("role", "user");
                    session.setMaxInactiveInterval(30 * 60);
                    response.sendRedirect(request.getContextPath() + StringUtils.WELCOME_PAGE);
                    return;
                }
            } else {
                // Error occurred during admin login
                // Handle error
            }
        }

        // Incorrect username or password or non-existing user
        request.setAttribute("errorMessage", "Incorrect username or password");
        // Redirect to login page for any other case
        response.sendRedirect(request.getContextPath() + StringUtils.LOGIN_PAGE);
    }



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
