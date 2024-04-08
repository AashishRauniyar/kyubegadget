<%@ page import="com.kyubegadget.controller.dao.ProductDao"%>
<%@ page import="com.kyubegadget.model.ProductModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home page</title>
    <link href="../styles/output.css" rel="stylesheet">
    <style>
        /* Modal */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 9999; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgba(0, 0, 0, 0.5); /* Black w/ opacity */
        }

        .modal-content {
            background-color: #fefefe;
            margin: 10% 200px; /* auto rakhamla na vaye 10% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 80%; /* Could be more or less, depending on screen size */
            height: 80%; /* Set the height to 80% of the modal */
            position: relative;
            overflow: auto; /* Enable scroll if content exceeds modal size */
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        /* Adjustments for iframe */
        .modal-content iframe {
            width: 100%; /* Make iframe fill the modal content */
            height: 100%; /* Make iframe fill the modal content */
            border: none; /* Remove iframe border */
        }
    </style>
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

    <div class="w-72 rounded-xl bg-white shadow-md duration-500 hover:scale-105 hover:shadow-xl">
        <!-- Open the modal with the productId when clicked -->
        <a href="javascript:void(0)" onclick="showModal('<%= product.getProductId() %>')">
            <!-- Your product display content here -->
            <img src="../<%= product.getImageUrl() %>" alt="<%= product.getProductName() %>"
                 class="h-80 w-72 rounded-t-xl object-cover"/>
            <div class="w-72 px-4 py-3">
                <span class="mr-3 text-xs uppercase text-gray-400"><%= product.getProductBrand() %></span>
                <p class="block truncate text-lg font-bold capitalize text-black"><%= product.getProductName() %></p>
                <div class="flex items-center">
                    <p class="my-3 cursor-auto text-lg font-semibold text-black">$<%= product.getPrice() %></p>
                    <div class="ml-auto">
                        <button class="flex items-center text-sm text-white bg-gray-900 border-0 py-1 px-2 focus:outline-none hover:bg-gray-600 rounded">Add to Cart
                        </button>
                    </div>
                </div>
            </div>
        </a>
    </div>
    <% } %>
</section>

<!--  Grid Section - Ends Here -->

<%@ include file="footer.jsp"%>

<!-- The modal -->
<div id="myModal" class="modal">
    <!-- Modal content -->
    <div class="modal-content">
        <span class="close" onclick="hideModal()">&times;</span>
        <!-- The iframe to load insideProduct.jsp -->
        <iframe id="modalFrame" class="modal-frame" frameborder="0"></iframe>
    </div>
</div>

<!-- JavaScript to show/hide modal -->
<script>
    function showModal(productId) {
        // Set the src attribute of the iframe to insideProduct.jsp with the productId as a parameter
        document.getElementById('modalFrame').src = 'insideProduct.jsp?id=' + productId;
        // Display the modal
        document.getElementById('myModal').style.display = 'block';
    }

    function hideModal() {
        // Hide the modal
        document.getElementById('myModal').style.display = 'none';
    }
</script>

</body>
</html>
