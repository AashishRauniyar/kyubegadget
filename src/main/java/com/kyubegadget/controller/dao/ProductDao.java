package com.kyubegadget.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.kyubegadget.controller.dbcontroller.DatabaseController;
import com.kyubegadget.model.Cart;
import com.kyubegadget.model.ProductModel;
import com.kyubegadget.utils.QueryUtils;

public class ProductDao {
	
	/*
	 * private Connection conn;
	 * 
	 * // Constructor that accepts a Connection object public ProductDao(Connection
	 * conn) { this.conn = conn; }
	 */
    
	
    

    
    // this method is used in admin panel to add products
	public int addProduct(ProductModel product) {
		try (Connection conn = DatabaseController.getConn()) {
			String addProductQuery = QueryUtils.ADD_PRODUCT;
			PreparedStatement statement = conn.prepareStatement(addProductQuery);
			statement.setString(1, product.getProductName());
			statement.setString(2, product.getProductBrand());
			statement.setDouble(3, product.getPrice());
			statement.setString(4, product.getProductDescription());
			statement.setString(5, product.getImageUrl());
			statement.setInt(6, product.getProductCategoryId());
			statement.setInt(7, product.getStock());

			int rowsInserted = statement.executeUpdate();
			statement.close();
			return rowsInserted;
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return -1; // or handle the exception as needed
		}
	}

	
	// get all product, used in index page to show product
	public List<ProductModel> getAllProducts() {
		List<ProductModel> products = new ArrayList<>();
		try (Connection conn = DatabaseController.getConn()) {
			String getAllProductsQuery = QueryUtils.GET_ALL_PRODUCTS;
			PreparedStatement statement = conn.prepareStatement(getAllProductsQuery);
			ResultSet resultSet = statement.executeQuery();

			while (resultSet.next()) {
				ProductModel product = new ProductModel();
				product.setProductId(resultSet.getInt("productId"));
				product.setProductName(resultSet.getString("productName"));
				product.setProductBrand(resultSet.getString("productBrand"));
				product.setPrice(resultSet.getDouble("price"));
				product.setProductDescription(resultSet.getString("productDescription"));
				product.setImageUrl(resultSet.getString("imageUrl"));
				product.setProductCategoryId(resultSet.getInt("productCategoryId"));
				product.setStock(resultSet.getInt("stock"));
				products.add(product);
			}
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
		}
		return products;
	}

	
	
//	public ProductModel getProductById(String productId) {
//		ProductModel product = null;
//		try (Connection conn = DatabaseController.getConn()) {
//			String getProductByIdQuery = QueryUtils.GET_PRODUCT_BY_ID;
//			PreparedStatement statement = conn.prepareStatement(getProductByIdQuery);
//			statement.setString(1, productId);
//			ResultSet resultSet = statement.executeQuery();
//
//			if (resultSet.next()) {
//				product = new ProductModel();
//				product.setProductId(resultSet.getInt("productId"));
//				product.setProductName(resultSet.getString("productName"));
//				product.setProductBrand(resultSet.getString("productBrand"));
//				product.setPrice(resultSet.getDouble("price"));
//				product.setProductDescription(resultSet.getString("productDescription"));
//				product.setImageUrl(resultSet.getString("imageUrl"));
//				product.setProductCategoryId(resultSet.getInt("productCategoryId"));
//				product.setStock(resultSet.getInt("stock"));
//			}
//		} catch (SQLException | ClassNotFoundException ex) {
//			ex.printStackTrace();
//		}
//		return product;
//	}
	
	public ProductModel getProductById(int productId) {
	    ProductModel product = null;
	    try (Connection conn = DatabaseController.getConn()) {
	        String getProductByIdQuery = QueryUtils.GET_PRODUCT_BY_ID;
	        PreparedStatement statement = conn.prepareStatement(getProductByIdQuery);
	        statement.setInt(1, productId);
	        ResultSet resultSet = statement.executeQuery();

	        if (resultSet.next()) {
	            product = new ProductModel();
	            product.setProductId(resultSet.getInt("productId"));
	            product.setProductName(resultSet.getString("productName"));
	            product.setProductBrand(resultSet.getString("productBrand"));
	            product.setPrice(resultSet.getDouble("price"));
	            product.setProductDescription(resultSet.getString("productDescription"));
	            product.setImageUrl(resultSet.getString("imageUrl"));
	            product.setProductCategoryId(resultSet.getInt("productCategoryId"));
	            product.setStock(resultSet.getInt("stock"));
	        }
	    } catch (SQLException | ClassNotFoundException ex) {
	        ex.printStackTrace();
	    }
	    return product;
	}


	// You can add other methods related to product CRUD operations here

	// search product
	public List<ProductModel> searchProductsByName(String productName) {
		List<ProductModel> products = new ArrayList<>();
		try (Connection conn = DatabaseController.getConn()) {
			// Define your SQL query to search for products by name
			String searchQuery = QueryUtils.SEARCH_PRODUCT_BY_NAME;

			// Create the PreparedStatement with the query
			PreparedStatement statement = conn.prepareStatement(searchQuery);

			// Set the search parameter
			statement.setString(1, productName + "%");

			// Execute the query
			ResultSet resultSet = statement.executeQuery();

			// Iterate through the result set and create ProductModel objects
			while (resultSet.next()) {
				ProductModel product = new ProductModel();
				product.setProductId(resultSet.getInt("productId"));
				product.setProductName(resultSet.getString("productName"));
				product.setProductBrand(resultSet.getString("productBrand"));
				product.setPrice(resultSet.getDouble("price"));
				product.setProductDescription(resultSet.getString("productDescription"));
				product.setImageUrl(resultSet.getString("imageUrl"));
				product.setProductCategoryId(resultSet.getInt("productCategoryId"));
				product.setStock(resultSet.getInt("stock"));
				products.add(product);
			}
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
		}
		return products;
	}

	/*
	 * public List<Cart> getCartProduct(ArrayList<Cart> cartList) { List<Cart>
	 * product = new ArrayList<>(); try (Connection conn =
	 * DatabaseController.getConn()) { if (cartList.size() > 0) { for (Cart item :
	 * cartList) { String getCartProductQuery = QueryUtils.GET_CART_PRODUCT;
	 * PreparedStatement statement = conn.prepareStatement(getCartProductQuery); //
	 * Set productId parameter in the query statement.setInt(1,
	 * item.getProductId()); ResultSet resultSet = statement.executeQuery();
	 * 
	 * while (resultSet.next()) { Cart cart = new Cart();
	 * cart.setProductId(resultSet.getInt("productId"));
	 * cart.setProductName(resultSet.getString("productName"));
	 * cart.setProductBrand(resultSet.getString("productBrand"));
	 * cart.setPrice(resultSet.getDouble("price") * item.getStock());
	 * cart.setImageUrl(resultSet.getString("imageUrl"));
	 * cart.setStock(item.getStock()); product.add(cart); } } } } catch
	 * (SQLException | ClassNotFoundException ex) { ex.printStackTrace(); } return
	 * product; }
	 */
	
	
	public List<Cart> getCartProduct(ArrayList<Cart> cartList) {
	    List<Cart> product = new ArrayList<>();
	    try (Connection conn = DatabaseController.getConn()) {
	        if (cartList.size() > 0) {
	            for (Cart item : cartList) {
	                String getCartProductQuery = QueryUtils.GET_CART_PRODUCT;
	                PreparedStatement statement = conn.prepareStatement(getCartProductQuery);
	                // Set productId parameter in the query
	                statement.setInt(1, item.getProductId());
	                ResultSet resultSet = statement.executeQuery();

	                while (resultSet.next()) {
	                    Cart cart = new Cart();
	                    cart.setProductId(resultSet.getInt("productId"));
	                    cart.setProductName(resultSet.getString("productName"));
	                    cart.setProductBrand(resultSet.getString("productBrand"));
	                    // Fetch the price directly from the database without considering stock
	                    cart.setPrice(resultSet.getDouble("price"));
	                    cart.setImageUrl(resultSet.getString("imageUrl"));
	                    cart.setStock(item.getStock());
	                    product.add(cart);
	                }
	            }
	        }
	    } catch (SQLException | ClassNotFoundException ex) {
	        ex.printStackTrace();
	    }
	    return product;
	}

	

    
	
	

	// to delete a product using productId
	public boolean deleteProduct(int productId) {
	    try (Connection conn = DatabaseController.getConn()) {
	        String deleteQuery = QueryUtils.DELETE_PRODUCT;
	        PreparedStatement pstmt = conn.prepareStatement(deleteQuery);
	        pstmt.setInt(1, productId);

	        int rowsAffected = pstmt.executeUpdate();

	        // If rowsAffected > 0, it means a product was deleted successfully
	        return rowsAffected > 0;
	    } catch (SQLException | ClassNotFoundException ex) {
	        ex.printStackTrace();
	        return false;
	    }
	}
	
	
	public List<ProductModel> getProductsByCategoryId(int categoryId) {
	    List<ProductModel> products = new ArrayList<>();
	    try (Connection conn = DatabaseController.getConn()) {
	        String getProductsByCategoryQuery = QueryUtils.GET_PRODUCTS_BY_CATEGORY_ID;
	        PreparedStatement statement = conn.prepareStatement(getProductsByCategoryQuery);
	        statement.setInt(1, categoryId);
	        ResultSet resultSet = statement.executeQuery();

	        while (resultSet.next()) {
	            ProductModel product = new ProductModel();
	            product.setProductId(resultSet.getInt("productId"));
	            product.setProductName(resultSet.getString("productName"));
	            product.setProductBrand(resultSet.getString("productBrand"));
	            product.setPrice(resultSet.getDouble("price"));
	            product.setProductDescription(resultSet.getString("productDescription"));
	            product.setImageUrl(resultSet.getString("imageUrl"));
	            product.setProductCategoryId(resultSet.getInt("productCategoryId"));
	            product.setStock(resultSet.getInt("stock"));
	            products.add(product);
	        }
	    } catch (SQLException | ClassNotFoundException ex) {
	        ex.printStackTrace();
	    }
	    return products;
	}

	/*
	 * public double getProductPriceFromDatabase(int productId) { double price =
	 * 0.0; try { // Prepare SQL query to retrieve price from the database based on
	 * productId String query = "SELECT price FROM product WHERE productId = ?";
	 * PreparedStatement statement = conn.prepareStatement(query);
	 * statement.setInt(1, productId);
	 * 
	 * // Execute the query ResultSet resultSet = statement.executeQuery();
	 * 
	 * // Check if any result is returned if (resultSet.next()) { // Retrieve the
	 * price from the result set price = resultSet.getDouble("price"); }
	 * 
	 * // Close the resources resultSet.close(); statement.close(); } catch
	 * (SQLException e) { e.printStackTrace(); } return price; }
	 */
	
	public double getProductPriceFromDatabase(int productId) {
	    double price = 0.0;
	    try (Connection conn = DatabaseController.getConn()) {
	        String getPriceQuery = QueryUtils.GET_PRODUCT_PRICE;
	        PreparedStatement statement = conn.prepareStatement(getPriceQuery);
	        statement.setInt(1, productId);
	        ResultSet resultSet = statement.executeQuery();

	        if (resultSet.next()) {
	            price = resultSet.getDouble("price");
	        }
	    } catch (SQLException | ClassNotFoundException ex) {
	        ex.printStackTrace();
	    }
	    return price;
	}

	
	// to show total product in category dao
	public static int getTotalProducts() throws SQLException, ClassNotFoundException {
	    int totalProducts = 0;
	    String sql = "SELECT COUNT(*) FROM product"; // Assuming 'products' is the table name
	    try (Connection conn = DatabaseController.getConn();
	         PreparedStatement pstmt = conn.prepareStatement(sql);
	         ResultSet rs = pstmt.executeQuery()) {
	        if (rs.next()) {
	            totalProducts = rs.getInt(1);
	        }
	    }
	    return totalProducts;
	}
	
	
	// get products sorted by price
	
	public List<ProductModel> getAllProductsSortedByPrice() {
        List<ProductModel> products = new ArrayList<>();
        String sql = QueryUtils.GET_PRODUCT_SORTBY_PRICE;

        try (Connection conn = DatabaseController.getConn()) {
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                ProductModel product = new ProductModel();
                product.setProductId(rs.getInt("productId"));
                product.setProductName(rs.getString("productName"));
                product.setPrice(rs.getDouble("price"));
                product.setImageUrl(rs.getString("imageUrl"));
                // Set other product attributes as needed
                products.add(product);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Handle or log the exception as needed
        }

        return products;
    } 
	
	
	
	public boolean updateProduct(ProductModel product) {
	    try (Connection conn = DatabaseController.getConn()) {
	        String updateProductQuery = "UPDATE product SET productName=?, productBrand=?, price=?, productDescription=?, imageUrl=?, productCategoryId=?, stock=? WHERE productId=?";
	        PreparedStatement statement = conn.prepareStatement(updateProductQuery);
	        statement.setString(1, product.getProductName());
	        statement.setString(2, product.getProductBrand());
	        statement.setDouble(3, product.getPrice());
	        statement.setString(4, product.getProductDescription());
	        statement.setString(5, product.getImageUrl());
	        statement.setInt(6, product.getProductCategoryId());           
	        statement.setInt(7, product.getStock());
	        statement.setInt(8, product.getProductId());

	        int rowsUpdated = statement.executeUpdate();
	        return rowsUpdated > 0;
	    } catch (SQLException | ClassNotFoundException ex) {
	        ex.printStackTrace();
	        return false;
	    }
	}
	




}