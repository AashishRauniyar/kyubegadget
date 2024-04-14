package com.kyubegadget.controller.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.kyubegadget.controller.dao.OrderDao;
import com.kyubegadget.controller.dbcontroller.DatabaseController;
import com.kyubegadget.controller.dao.OrderLineService;
import com.kyubegadget.model.Cart;
import com.kyubegadget.model.OrderModel;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

@WebServlet(name = "CheckOutServlet", urlPatterns = {"/check-out"})
public class CheckOutServlet extends HttpServlet {
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to the checkout page
        request.getRequestDispatcher("/pages/Payment.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("userName");
        double totalAmount = Double.parseDouble(request.getParameter("totalAmount")); // Assuming you have a parameter named "totalAmount" in your request

        // Store order details in the orders table
        try (Connection connection = DatabaseController.getConn()) {
            OrderDao orderDao = new OrderDao(connection);
            OrderModel order = new OrderModel(0, new Date(), username, totalAmount, "Pending");
            int orderId = orderDao.insertOrder(order);

            // Store order line details in the orderline table
            OrderLineService orderLineService = new OrderLineService(connection);
            List<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList");
            if (cartList != null) {
                for (Cart item : cartList) {
                    orderLineService.createOrderLine(orderId, item.getProductId(), item.getStock());
                }
            }

            // Clear the cart after checkout
            session.removeAttribute("cartList");

            // Redirect to a thank you page or any other page
            response.sendRedirect(request.getContextPath() + "/thankyou.jsp");
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the SQL exception appropriately
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        } catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    }
}

