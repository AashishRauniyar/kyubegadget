package com.kyubegadget.controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kyubegadget.model.ProductModel;

import java.util.*;
@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // Get session
	    HttpSession session = request.getSession();
	    
	    // Retrieve cart items from session
	    List<ProductModel> cartItems = (List<ProductModel>) session.getAttribute("cartItems");
	    
	    // If cart is null, create a new cart
	    if (cartItems == null) {
	        cartItems = new ArrayList<>();
	        session.setAttribute("cartItems", cartItems);
	    }
	    
	    // Get parameters from request
	    String productIdStr = request.getParameter("productId");
	    String productName = request.getParameter("productName");
	    String priceStr = request.getParameter("price");
	    String imageUrl = request.getParameter("imageUrl");
	    
	    // Check if any of the parameters is null
	    if (productIdStr == null || productName == null || priceStr == null || imageUrl == null) {
	        // Handle the error appropriately, e.g., redirect the user to an error page
	        response.sendRedirect("./cart.jsp");
	        return;
	    }
	    
	    // Parse parameters to appropriate types
	    int productId = Integer.parseInt(productIdStr);
	    double price = Double.parseDouble(priceStr);
	    
	    // Create a new product object
	    ProductModel product = new ProductModel(productName, null, price, null, imageUrl, 0, 0);
	    
	    // Add product to the cart
	    cartItems.add(product);
	    
	    // Redirect back to the product page or any other appropriate page
	    response.sendRedirect("product.jsp");
	}

}
