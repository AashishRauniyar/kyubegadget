package com.kyubegadget.controller.servlet;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.kyubegadget.controller.dao.ProductDao;
import com.kyubegadget.model.ProductModel;
import com.kyubegadget.utils.StringUtils;
import java.io.File;

import java.io.FileOutputStream;

import java.io.OutputStream;
/**
 * Servlet implementation class AddProductServlet
 */
@WebServlet("/AddProductServlet")
@MultipartConfig
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
	
	
	//main code
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    doGet(request, response);

	    String productName = request.getParameter(StringUtils.productName);
	    String productBrand = request.getParameter(StringUtils.productBrand);
	    double price = Double.parseDouble(request.getParameter(StringUtils.price));
	    String productDescription = request.getParameter(StringUtils.productDescription);
	    
	    //main purano
//	    String imageUrl = request.getParameter(StringUtils.imageUrl);
	    
	    //trying
	    Part part = request.getPart(StringUtils.imageUrl);
	    
	    
	    
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
	    ProductModel productModel = new ProductModel(productName, productBrand, price, productDescription, part.getSubmittedFileName(), productCategoryId, stock);

	    // Adding product to the database
	    int result = productDao.addProduct(productModel);
	   
//	    String path = request.getRealPath("images"+File.separator+part.getSubmittedFileName());
//	    System.out.println(path);
//	    
//	    
//	    //uploading code..
//	    FileOutputStream fos = new FileOutputStream(path);
//	    
//	    InputStream is = part.getInputStream();
//	    
//	    // reading data
//	    
//	    byte []data = new byte[is.available()];
//	    
//	    is.read(data);
//	    
//	    // writing the data
//	    
//	    fos.write(data);
//	    fos.close();
	    
	 // Obtain the absolute path to the destination directory
//	    String uploadPath = getServletContext().getRealPath("/") + "images/";
//	    String uploadPath = getServletContext().getRealPath("/") + "images/";
	    String uploadPath = "C:\\Users\\VICTUS\\Desktop\\advanced-java-coursework\\kyubegadget\\src\\main\\webapp\\images\\";

	    System.out.println(uploadPath);
	    

	    // Create the destination directory if it doesn't exist
	    File uploadDir = new File(uploadPath);
	    if (!uploadDir.exists()) {
	        uploadDir.mkdir();
	    }

	    // Obtain the input stream of the uploaded file
	    InputStream inputStream = part.getInputStream();

	    // Specify the path for the destination file
	    String fileName = part.getSubmittedFileName(); // Or part.getSubmittedFileName() if you want to use the original file name
	    String filePath = uploadPath + fileName;

	    // Create an output stream to write the uploaded file
	    OutputStream outputStream = new FileOutputStream(filePath);

	    // Write the uploaded file to the destination directory
	    int read = 0;
	    byte[] bytes = new byte[1024];
	    while ((read = inputStream.read(bytes)) != -1) {
	        outputStream.write(bytes, 0, read);
	    }

	    // Close streams
	    inputStream.close();
	    outputStream.close();

	    // Optionally, you can delete the temporary file
	    part.delete();

	    
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
