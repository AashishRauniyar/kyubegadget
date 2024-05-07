package com.kyubegadget.controller.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.kyubegadget.model.ProductModel;
import com.kyubegadget.controller.dao.ProductDao;

import com.kyubegadget.utils.StringUtils;
/**
 * Servlet implementation class GetProductIdServlet
 */
@MultipartConfig
@WebServlet("/GetProductIdServlet")
public class GetProductIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetProductIdServlet() {

    
    }
    
    
    private ProductDao productDao;

    public void init() {
        productDao = new ProductDao();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		  String productIdString = request.getParameter("productId");
		  System.out.println("productId: " + productIdString);
	        
	        int productId =0; // Default value
	        
	        try {
	            productId = Integer.parseInt(productIdString);
	        } catch (NumberFormatException e) {
	            // Handle the case where productIdString is not a valid integer
	            // You may redirect the user to an error page or display an error message
	            e.printStackTrace();
	            response.sendRedirect(request.getContextPath() + "/pages/testManageProduct.jsp?error=Invalid product ID");
	            return;
	        }

	        String productName = request.getParameter("productName");
	        System.out.println(productName);
	        String productBrand = request.getParameter("productBrand");
	        System.out.println(productBrand);
	        double price = Double.parseDouble(request.getParameter("price"));
	        String productDescription = request.getParameter("productDescription");
	        
	        
	        Part part = request.getPart(StringUtils.imageUrl);
	        
	        
	        int productCategoryId = Integer.parseInt(request.getParameter("productCategoryId"));
	        int stock = Integer.parseInt(request.getParameter("stock"));

	        
	        
	        
	        
	        
		    ProductModel productModel = new ProductModel(productId,productName, productBrand, price, productDescription, part.getSubmittedFileName(), productCategoryId, stock);
	        
		 // Adding product to the database
		    int result = productDao.updateProduct(productModel);
		    System.out.println(result);
		   
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
	        	response.sendRedirect(request.getContextPath() + "/pages/testManageProduct.jsp?success=Product updated successfully");
		    } else {
		    	response.sendRedirect(request.getContextPath() + "/pages/testManageProduct.jsp?error=Failed to update product");
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
