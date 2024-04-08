<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../styles/output.css" rel="stylesheet">
</head>
<body >
<%@ include file="navbar.jsp"%>
    <div class="container mx-auto py-8">
        <div class="max-w-xl mx-auto bg-white rounded-lg shadow-md overflow-hidden">
            <div class="flex">
                <div class="w-1/2">
                    <img src="https://www.bhphotovideo.com/images/images2500x2500/apple_mgyj3am_a_airpods_max_silver_1610234.jpg" alt="Product Image" class="w-full">
                </div>
                <div class="w-1/2 p-8">
                    <h2 class="text-gray-700 font-bold uppercase">APPLE</h2>
                    <h1 class="text-3xl font-bold text-gray-900 mb-4">Airpods</h1>
                    <p class="text-2xl font-semibold text-gray-900">$149 <span class="text-gray-500 line-through">$199</span></p>
                    <p class="text-gray-700 mt-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget ante non risus vestibulum auctor ut nec nisl.</p>
                    <div class="flex items-center mt-6">
                        <label for="quantity" class="mr-2">Quantity:</label>
                        <input type="number" id="quantity" name="quantity" value="1" min="1" max="10" class="appearance-none w-20 py-1 px-2 border border-gray-300 text-gray-700 leading-tight rounded-md focus:outline-none focus:border-gray-500">
                    </div>
                    <div class="flex justify-between mt-8">
                        <button class="bg-gray-900 text-white font-semibold py-2 px-4 rounded-full shadow-md hover:bg-gray-800 focus:outline-none focus:bg-gray-800">Add to Cart</button>
                        <button class="bg-blue-500 text-white font-semibold py-2 px-4 rounded-full shadow-md hover:bg-blue-600 focus:outline-none focus:bg-blue-600">Buy Now</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="footer.jsp"%>
</body>
</html>