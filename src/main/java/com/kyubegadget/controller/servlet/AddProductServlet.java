package com.kyubegadget.controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kyubegadget.controller.dao.ProductDao;
import com.kyubegadget.model.ProductModel;
import com.kyubegadget.utils.StringUtils;

/**
 * Servlet implementation class AddProductServlet
 */
@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	ProductDao productDao = new ProductDao();
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductServlet() {
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
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doGet(request, response);
//
//        String productName = request.getParameter(StringUtils.productName);
//        String productBrand = request.getParameter(StringUtils.productBrand);
//        double price = Double.parseDouble(request.getParameter(StringUtils.price));
//        String productDescription = request.getParameter(StringUtils.productDescription);
//        String imageUrl = request.getParameter(StringUtils.imageUrl);
//        int productCategoryId = Integer.parseInt(request.getParameter(StringUtils.productCategoryId));
//        int stock = Integer.parseInt(request.getParameter(StringUtils.stock));
//
//        
//        
//        
//
////        ProductModel productModel = new ProductModel(productName, productBrand, price, productDescription, imageUrl, productCategoryId,stock);
//        ProductModel productModel = new ProductModel(productName, productBrand, price, productDescription, imageUrl, productCategoryId,stock);
//
//        // Adding product to the database
//        int result = productDao.addProduct(productModel);
//
//        if (result > 0) {
//            HttpSession session = request.getSession();
//            session.setAttribute(StringUtils.PRODUCT_ADDED_MESSAGE, "Product added successfully.");
//            response.sendRedirect(request.getContextPath() + StringUtils.WELCOME_PAGE);
//        } else {
//            response.sendRedirect(request.getContextPath() + StringUtils.WELCOME_PAGE + "?" + StringUtils.ERROR_MESSAGE + "=" + StringUtils.ADD_PRODUCT_ERROR_MESSAGE);
//            System.out.println("An unexpected server error occurred.");
//        }
//    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    doGet(request, response);

	    String productName = request.getParameter(StringUtils.productName);
	    String productBrand = request.getParameter(StringUtils.productBrand);
	    double price = Double.parseDouble(request.getParameter(StringUtils.price));
	    String productDescription = request.getParameter(StringUtils.productDescription);
	    String imageUrl = request.getParameter(StringUtils.imageUrl);
	    
	    // Check if productCategoryId and stock parameters are not null before parsing
	    Integer productCategoryId = null;
	    Integer stock = null;
	    
	    String productCategoryIdParam = request.getParameter(StringUtils.productCategoryId);
	    String stockParam = request.getParameter(StringUtils.stock);
	    
	    if (productCategoryIdParam != null && !productCategoryIdParam.isEmpty()) {
	        productCategoryId = Integer.parseInt(productCategoryIdParam);
	    }
	    
	    if (stockParam != null && !stockParam.isEmpty()) {
	        stock = Integer.parseInt(stockParam);
	    }

	    // Create the product model
	    ProductModel productModel = new ProductModel(productName, productBrand, price, productDescription, imageUrl, productCategoryId, stock);

	    // Adding product to the database
	    int result = productDao.addProduct(productModel);

	    if (result > 0) {
	        HttpSession session = request.getSession();
	        session.setAttribute(StringUtils.PRODUCT_ADDED_MESSAGE, "Product added successfully.");
	        response.sendRedirect(request.getContextPath() + StringUtils.ADD_PRODUCT);
	    } else {
	        response.sendRedirect(request.getContextPath() + StringUtils.WELCOME_PAGE + "?" + StringUtils.ERROR_MESSAGE + "=" + StringUtils.ADD_PRODUCT_ERROR_MESSAGE);
	        System.out.println("An unexpected server error occurred.");
	    }
	}


}
