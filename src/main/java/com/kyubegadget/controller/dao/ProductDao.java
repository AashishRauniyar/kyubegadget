package com.kyubegadget.controller.dao;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kyubegadget.controller.dbcontroller.DatabaseController;
import com.kyubegadget.model.ProductModel;
import com.kyubegadget.utils.QueryUtils;

public class ProductDao {

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
    
    
    
    //get all product
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
    
    
    public ProductModel getProductById(String productId) {
        ProductModel product = null;
        try (Connection conn = DatabaseController.getConn()) {
            String getProductByIdQuery = QueryUtils.GET_PRODUCT_BY_ID;
            PreparedStatement statement = conn.prepareStatement(getProductByIdQuery);
            statement.setString(1, productId);
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
    
    
    
    //search product
    public List<ProductModel> searchProductsByName(String productName) {
        List<ProductModel> products = new ArrayList<>();
        try (Connection conn = DatabaseController.getConn()) {
            // Define your SQL query to search for products by name
            String searchQuery = "SELECT * FROM product WHERE productName LIKE ?";
            
            // Create the PreparedStatement with the query
            PreparedStatement statement = conn.prepareStatement(searchQuery);
            
            // Set the search parameter
            statement.setString(1,  productName + "%");
            
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
    
    //// Retrieve cart items from session
   // List<Map<String, Object>> cartItems = (List<Map<String, Object>>) session.getAttribute("cartItems");
    
	// Add product to cart
	public void addProductToCart(ProductModel product, int quantity, List<Map<String, Object>> cartItems) {
		Map<String, Object> cartItem = new HashMap<>();
		cartItem.put("product", product);
		cartItem.put("quantity", quantity);
		cartItems.add(cartItem);
	}

	// Remove product from cart
	public void removeProductFromCart(ProductModel product, List<Map<String, Object>> cartItems) {
		for (Map<String, Object> cartItem : cartItems) {
			ProductModel cartProduct = (ProductModel) cartItem.get("product");
			if (cartProduct.getProductId() == product.getProductId()) {
				cartItems.remove(cartItem);
				break;
			}
		}
	}

	// Update product quantity in cart
	public void updateProductQuantityInCart(ProductModel product, int quantity, List<Map<String, Object>> cartItems) {
		for (Map<String, Object> cartItem : cartItems) {
			ProductModel cartProduct = (ProductModel) cartItem.get("product");
			if (cartProduct.getProductId() == product.getProductId()) {
				cartItem.put("quantity", quantity);
				break;
			}
		}
	}

	// Clear cart
	public void clearCart(List<Map<String, Object>> cartItems) {
		cartItems.clear();
	}

	// Calculate total price of items in cart
	public double calculateTotalPrice(List<Map<String, Object>> cartItems) {
		double totalPrice = 0.0;
		for (Map<String, Object> cartItem : cartItems) {
			ProductModel product = (ProductModel) cartItem.get("product");
			int quantity = (int) cartItem.get("quantity");
			totalPrice += product.getPrice() * quantity;
		}
		return totalPrice;
	}


}
