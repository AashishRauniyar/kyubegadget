
package com.kyubegadget.controller.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kyubegadget.model.Cart;
import com.kyubegadget.utils.StringUtils;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");

        try {
            HttpSession session = request.getSession();
            int productId = Integer.parseInt(request.getParameter("productId"));
            
            

            Cart cart = new Cart();
            cart.setProductId(productId);
            cart.setStock(1);

            ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList");
            if (cartList == null) {
                cartList = new ArrayList<>();
                session.setAttribute("cartList", cartList);
                //30 minutes
                session.setMaxInactiveInterval(30 * 60);
            }

            boolean productExists = cartList.stream().anyMatch(c -> c.getProductId() == productId);
            if (!productExists) {
                cartList.add(cart);
                response.sendRedirect(request.getContextPath()+StringUtils.WELCOME_PAGE);
            } else {
                for (Cart c : cartList) {
                    if (c.getProductId() == productId) {
                        c.setStock(c.getStock() + 1);
                        break;
                    }
                }
                response.sendRedirect(request.getContextPath()+StringUtils.WELCOME_PAGE);
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID");
        } catch (IOException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal Server Error");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal Server Error");
        }
    }
}