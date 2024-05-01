package com.kyubegadget.controller.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.kyubegadget.controller.dao.ProductDao;
import com.kyubegadget.model.ProductModel;
import com.kyubegadget.utils.StringUtils;

@WebServlet("/EditProductServlet")
public class EditProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private ProductDao productDao;

    public void init() {
        productDao = new ProductDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productIdString = request.getParameter("productId");
        
        if(productIdString == null || productIdString.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/viewProduct.jsp?error=productId is required");
            return;
        }
        
        int productId = Integer.parseInt(productIdString);
        ProductModel product = productDao.getProductById(productId);
        
        if(product == null) {
            response.sendRedirect(request.getContextPath() + "/viewProduct.jsp?error=Product not found");
            return;
        }
        
        request.setAttribute("product", product);
        request.getRequestDispatcher("/pages/editProduct.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productIdString = request.getParameter("productId");
        int productId = 0; // Default value
        
        try {
            productId = Integer.parseInt(productIdString);
        } catch (NumberFormatException e) {
            // Handle the case where productIdString is not a valid integer
            // You may redirect the user to an error page or display an error message
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/viewProduct.jsp?error=Invalid product ID");
            return;
        }

        String productName = request.getParameter("productName");
        String productBrand = request.getParameter("productBrand");
        double price = Double.parseDouble(request.getParameter("price"));
        String productDescription = request.getParameter("productDescription");
        String imageUrl = ""; // You need to handle image upload separately
        
        Part part = request.getPart(StringUtils.imageUrl);
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
        
        int productCategoryId = Integer.parseInt(request.getParameter("productCategoryId"));
        int stock = Integer.parseInt(request.getParameter("stock"));

        ProductModel product = new ProductModel(productId, productName, productBrand, price, productDescription, imageUrl, productCategoryId, stock);
        
        boolean result = productDao.updateProduct(product);

        if (result) {
            response.sendRedirect(request.getContextPath() + "/viewProduct.jsp?success=Product updated successfully");
        } else {
            response.sendRedirect(request.getContextPath() + "/viewProduct.jsp?error=Failed to update product");
        }
    }

}
