<%-- <%@ page import="com.kyubegadget.controller.dao.ProductDao"%>
<%@ page import="com.kyubegadget.model.ProductModel"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home page</title>
<link href="../styles/output.css" rel="stylesheet">
</head>
<body>

	<%@ include file="navbar.jsp"%>

	<!--  Grid Section - Starts Here  -->
	<section id="Projects"
		class="mx-auto mb-5 mt-10 grid w-fit grid-cols-1 justify-center justify-items-center gap-x-14 gap-y-20 md:grid-cols-2 lg:grid-cols-3">
		<%
		ProductDao productDao = new ProductDao();
		List<ProductModel> products = productDao.getAllProducts();
		for (ProductModel product : products) {
		%>

		<div
			class="w-72 rounded-xl bg-white shadow-md duration-500 hover:scale-105 hover:shadow-xl">
			<a href="insideProduct.jsp?id=<%=product.getProductId()%>"> <img
				src="../images/<%=product.getImageUrl()%>"
				alt="<%=product.getProductName()%>"
				class="h-80 w-72 rounded-t-xl object-cover" />

				<div class="w-72 px-4 py-3">
					<span class="mr-3 text-xs uppercase text-gray-400"><%=product.getProductBrand()%></span>
					<p class="block truncate text-lg font-bold capitalize text-black"><%=product.getProductName()%></p>
					<div class="flex items-center">
						<p class="my-3 cursor-auto text-lg font-semibold text-black">
							$<%=product.getPrice()%></p>
						<div class="ml-auto">
							<button
								class="flex items-center text-sm text-white bg-gray-900 border-0 py-1 px-2 focus:outline-none hover:bg-gray-600 rounded">Add
								to Cart</button>
						</div>
					</div>
				</div>
			</a>
		</div>
		<%
		}
		%>




	</section>

	<!--  Grid Section - Ends Here -->


	<%@ include file="footer.jsp"%>


</body>
</html> --%>



<%@ page import="com.kyubegadget.controller.dao.ProductDao"%>
<%@ page import="com.kyubegadget.model.ProductModel"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home page</title>
<!-- <link href="../styles/output.css" rel="stylesheet">  -->
<link href="<%=request.getContextPath()%>/styles/output.css"
	rel="stylesheet">


</head>
<body>

	<%@ include file="navbar.jsp"%>

	<!-- Grid Section - Starts Here -->
	<section id="Projects"
		class="mx-auto mb-5 mt-10 grid w-fit grid-cols-1 justify-center justify-items-center gap-x-14 gap-y-20 md:grid-cols-2 lg:grid-cols-3">
		<%
		ProductDao productDao = new ProductDao(null);
		List<ProductModel> products = null;
		String message = "";

		// Check if there are search results or regular products
		if (request.getAttribute("searchResults") != null) {
			products = (List<ProductModel>) request.getAttribute("searchResults");
			message = "Search Results";
		} else {
			products = productDao.getAllProducts();
			message = "All Products";
		}

		for (ProductModel product : products) {
		%>
		<!-- 	<form action="../AddToCartServlet" method="post"> -->
		<div
			class="w-72 rounded-xl bg-white shadow-md duration-500 hover:scale-105 hover:shadow-xl">
			<%-- <a href="insideProduct.jsp?id=<%= product.getProductId() %>"> --%>
			<a
				href="<%=request.getContextPath()%>/pages/insideProduct.jsp?id=<%=product.getProductId()%>"></a>

			<%-- <img src="../images/<%= product.getImageUrl() %>" alt="<%= product.getProductName() %>" class="h-80 w-72 rounded-t-xl object-cover" /> --%>
			<img
				src="<%=request.getContextPath()%>/images/<%=product.getImageUrl()%>"
				alt="<%=product.getProductName()%>"
				class="h-80 w-72 rounded-t-xl object-cover" />
			<div class="w-72 px-4 py-3">
				<span class="mr-3 text-xs uppercase text-gray-400"><%=product.getProductBrand()%></span>
				<p class="block truncate text-lg font-bold capitalize text-black"><%=product.getProductName()%></p>
				<div class="flex items-center">
					<p class="my-3 cursor-auto text-lg font-semibold text-black">
						$<%=product.getPrice()%></p>
					<div class="ml-auto">

						<%
						if (session.getAttribute("userName") != null) {
						%>
						<%-- 							<a
								href="<%=request.getContextPath()%>/AddToCartServlet?productId=<%=product.getProductId()%>"
								class="flex items-center text-sm text-white bg-gray-900 border-0 py-1 px-2 focus:outline-none hover:bg-gray-600 rounded" onclick="addToCart() return false;">Add
								to Cart</a> --%>

						<a href="#"
							class="flex items-center text-sm text-white bg-gray-900 border-0 py-1 px-2 focus:outline-none hover:bg-gray-600 rounded"
							onclick="addToCart('<%=product.getProductId()%>'); return false;">Add
							to Cart</a>

						<%
						} else {
						%>
						<button
							class="bg-gray-900 text-white font-semibold py-2 px-4 rounded-full shadow-md hover:bg-gray-800 focus:outline-none focus:bg-gray-800 ">Add
							to Cart</button>
						<%
						}
						%>

					</div>
				</div>
			</div>

		</div>
		<!-- 		</form> -->
		<%
		}
		%>

		<!-- Display message if no products found -->
		<div class="w-full text-center mt-5">
			<p><%=message%></p>
		</div>
	</section>
	<!-- Grid Section - Ends Here -->

	<%@ include file="footer.jsp"%>

</body>
<script>
function addToCart(productId) {
    fetch('<%=request.getContextPath()%>/AddToCartServlet?productId=' + productId)
        .then(response => {
            if (!response.ok) {
                throw new Error('Failed to add item to cart');
            }
            return response.json();
        })
        .then(data => {
            updateCartCount(data.count);
        })
        .catch(error => {
            console.error('Error:', error);
        });
}

</script>

</html>
