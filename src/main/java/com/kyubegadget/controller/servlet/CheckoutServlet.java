//
//package com.kyubegadget.controller.servlet;
//
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.sql.Statement;
//import java.sql.Timestamp;
//import java.util.ArrayList;
//import java.util.Date;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import com.kyubegadget.controller.dao.OrderDao;
//import com.kyubegadget.controller.dao.OrderLineDao;
//import com.kyubegadget.controller.dao.UserDao;
//import com.kyubegadget.controller.dbcontroller.DatabaseController;
//import com.kyubegadget.model.Cart;
//import com.kyubegadget.model.OrderLineModel;
//import com.kyubegadget.model.OrderModel;
//import com.kyubegadget.utils.StringUtils;
//
//@WebServlet("/CheckoutServlet")
//public class CheckoutServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//    
//    UserDao ud = new UserDao();
//    OrderDao od = new OrderDao();
//    OrderLineDao ol = new OrderLineDao();
//    
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html; charset=UTF-8");
//
//        try {
//            HttpSession session = request.getSession();
//            int userId = ud.getUserIdFromSession(session);
//
//            ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList");
//            
//         // Debugging: Print cartList
//            System.out.println("Cart List: " + cartList);
//            for (Cart cart : cartList) {
//                System.out.println("Product ID: " + cart.getProductId());
//                System.out.println("Price: " + cart.getPrice());
//                System.out.println("Stock: " + cart.getStock());
//
//                
//            }
//
//            
//            if (cartList == null || cartList.isEmpty()) {
//                response.sendRedirect(request.getContextPath() + StringUtils.WELCOME_PAGE);
//                return;
//            }
//
//            double totalAmount = calculateTotalAmount(cartList);
//            OrderModel order = new OrderModel(0, new Date(), userId, totalAmount, "Pending");
//            int orderId = od.saveOrderToDatabase(order);
//
//            for (Cart cartItem : cartList) {
//                OrderLineModel orderLine = new OrderLineModel(0, orderId, cartItem.getProductId(), cartItem.getStock());
//                ol.saveOrderLineToDatabase(orderLine);
//            }
//
//            session.removeAttribute("cartList");
//            
//            response.sendRedirect(request.getContextPath() + "/pages/orderSuccessful.jsp");
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal Server Error");
//        }
//    }
//
//    
//    
//    private double calculateTotalAmount(ArrayList<Cart> cartList) {
//        double totalAmount = 0.0;
//        for (Cart cart : cartList) {
//            totalAmount += cart.getPrice() * cart.getStock();
//        }
//        return totalAmount;
//    }
//    
//
//    
//
//    
//
//}


package com.kyubegadget.controller.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kyubegadget.controller.dao.OrderDao;
import com.kyubegadget.controller.dao.OrderLineDao;
import com.kyubegadget.controller.dao.UserDao;
import com.kyubegadget.model.Cart;
import com.kyubegadget.model.OrderLineModel;
import com.kyubegadget.model.OrderModel;
import com.kyubegadget.utils.StringUtils;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    UserDao ud = new UserDao();
    OrderDao od = new OrderDao();
    OrderLineDao ol = new OrderLineDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");

        try {
            HttpSession session = request.getSession();
            int userId = ud.getUserIdFromSession(session);

            ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList");

            if (cartList == null || cartList.isEmpty()) {
                response.sendRedirect(request.getContextPath() + StringUtils.WELCOME_PAGE);
                return;
            }

            double totalAmount = (double) session.getAttribute("totalAmount"); // Retrieve totalAmount from session
            OrderModel order = new OrderModel(0, new Date(), userId, totalAmount, "Pending");
            int orderId = od.saveOrderToDatabase(order);

            for (Cart cartItem : cartList) {
                OrderLineModel orderLine = new OrderLineModel(0, orderId, cartItem.getProductId(), cartItem.getStock());
                ol.saveOrderLineToDatabase(orderLine);
            }

            session.removeAttribute("cartList");
            response.sendRedirect(request.getContextPath() + "/pages/orderSuccessful.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal Server Error");
        }
    }
}

