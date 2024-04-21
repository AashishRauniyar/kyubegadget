package com.kyubegadget.utils;

public class QueryUtils {

	public static final String insertUserQuery = "INSERT INTO Users (userName, firstName, lastName, email, phoneNumber,password, dob, gender, address) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?)";
	
	
	
	//query to get product
	public static final String insertProductQuery = "INSERT INTO product ( productName, productBrand, price, productDescription, imageUrl, productCategoryId, stock)"
			+ "VALUES" + "(?,?,?,?,?,?,?)";
	public static final String insertCategoryQuery = "INSERT INTO productCategory (productCategoryId, categoryName)"
			+ "VALUES" + "(?,?)";
	
	
	// to fetch admin data
	
	
	public static final String GET_LOGIN_USER_INFOS = "SELECT userName, password FROM Users WHERE userName = ? And password = ?";


	public static final String GET_USER = "SELECT * from Users";

	public static final String GET_HASHED_PASSWORD = "SELECT password FROM Users WHERE userName = ?";

	public static final String GET_DETAILS_BYUSERNAME = "SELECT * FROM Users WHERE userName = ?";
	
	public static final String GET_LOGIN_ADMIN_INFOS = "SELECT userType FROM users WHERE userName = ? AND password = ?";

	
	
	// profile update 
	public static final String UPDATE_USER_DETAILS = "UPDATE Users SET firstName = ?, lastName = ?, email = ?, "
	        + "phoneNumber = ?, gender = ? WHERE userName = ?";

	public static final String UPDATE_ADDRESS_DETAILS = "UPDATE Address SET city = ?, province = ?, "
	        + "country = ?, postalCode = ? WHERE userId = ?";

	
	
	
	
	//product category
	
	public static final String ADD_CATEGORY = "INSERT INTO productCategory (categoryName)  values (?)";
	
	//old
//    public static final String GET_ALL_CATEGORIES = "SELECT categoryName from productCategory";
    
    
    //new for categories
    public static final String GET_ALL_CATEGORIES = "SELECT productCategoryId,categoryName from productCategory";
    public static final String GET_CATEGORY_NAME = "SELECT categoryName from productCategory where productCategoryId = ?";
    
    public static final String DELETE_PRODUCT = "DELETE FROM product WHERE productId = ?";



    
    
    // for product
    
    public static final String ADD_PRODUCT = "INSERT product (productName, productBrand, price, productDescription, imageUrl, productCategoryId, stock) VALUES (?, ?, ?, ?, ?, ?, ?)";
    
    public static final String GET_ALL_PRODUCTS = "SELECT * from product";
    
    
    public static final String GET_PRODUCT_BY_ID = "SELECT * FROM product WHERE productId = ?";
    
    // delete user
    public static final String DELETE_USER = "DELETE FROM Users WHERE userName = ?";
    
    
    public static final String GET_PRODUCTS_BY_CATEGORY_ID = "SELECT * FROM product WHERE productCategoryId = ?";    
    
    //Cart
    public static final String GET_CART_PRODUCT = "SELECT * FROM product WHERE productId = ?";
}