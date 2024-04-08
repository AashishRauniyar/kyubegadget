
<%
String userName1 = (String) session.getAttribute("userName");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kyubegadget.model.ProductCategoryModel"%>
<%@ page import="com.kyubegadget.controller.dao.CategoryDao"%>
<%@ page import="com.kyubegadget.utils.StringUtils"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
// Fetch categories from the database or wherever they are stored
CategoryDao categoryDao = new CategoryDao();
List<ProductCategoryModel> categories = categoryDao.getAllCategories();

%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../styles/output.css" rel="stylesheet">
</head>
<body>


	<nav class="max-h-[70px]">
		<div class="flex justify-between mt-2">
			<div class="ml-5 flex items-center">
				<svg class="w-8 text-deep-purple-accent-400" viewBox="0 0 24 24"
					stroke-linejoin="round" stroke-width="2" stroke-linecap="round"
					stroke-miterlimit="10" stroke="currentColor" fill="none">
                <rect x="3" y="1" width="7" height="12"></rect>
                <rect x="3" y="17" width="7" height="6"></rect>
                <rect x="14" y="1" width="7" height="6"></rect>
                <rect x="14" y="11" width="7" height="12"></rect>
            </svg>
			</div>
			<div class="flex items-center">
				<input type="text"
					class="h-[40px] border border-b-gray-200 pl-4 rounded-s-full"
					placeholder="Search">
				<div
					class="h-[40px] border border-b-gray-200 rounded-e-full hover:bg-slate-200 hover:border-indigo-700 ">
					<img
						src="https://www.pngall.com/wp-content/uploads/13/Search-Button-Black-PNG-Cutout.png"
						alt="" class="h-[40px] p-3">
				</div>

				<%
				if (userName1 != null) {
				%>

				<div class="flex items-center mr-4">
					<div class="">
						<a href="#"
							class="flex h-9 w-24 justify-center rounded-3xl items-center my-1 mx-4 text-sm text-gray-700 font-medium hover:text-indigo-500">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24"
								style="fill: rgba(0, 0, 0, 1); transform:; msFilter:;">
                <path
									d="M12 2a5 5 0 1 0 5 5 5 5 0 0 0-5-5zm0 8a3 3 0 1 1 3-3 3 3 0 0 1-3 3zm9 11v-1a7 7 0 0 0-7-7h-4a7 7 0 0 0-7 7v1h2v-1a5 5 0 0 1 5-5h4a5 5 0 0 1 5 5v1z"></path>
            </svg>
							<p class="ml-2"><%=userName1%></p>
						</a>
					</div>
					<div class="">
						<a href="./profile.jsp"
							class="flex h-9 w-24 justify-center rounded-3xl items-center my-1 mx-4 text-sm text-gray-700 font-medium hover:text-indigo-500">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24"
								style="fill: rgba(0, 0, 0, 1); transform:; msFilter:;">
                <path
									d="M12 2a5 5 0 1 0 5 5 5 5 0 0 0-5-5zm0 8a3 3 0 1 1 3-3 3 3 0 0 1-3 3zm9 11v-1a7 7 0 0 0-7-7h-4a7 7 0 0 0-7 7v1h2v-1a5 5 0 0 1 5-5h4a5 5 0 0 1 5 5v1z"></path>
            </svg>
							<p class="ml-2">Profile</p>
						</a>
					</div>
				</div>

				<%
				} else {
				%>

				<div class="flex items-center mr-4">
					<div class="">
						<a href="./register.jsp"
							class="flex h-9 w-24 justify-center rounded-3xl items-center my-1 mx-4 text-sm text-gray-700 font-medium hover:text-indigo-500">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24"
								style="fill: rgba(0, 0, 0, 1); transform:; msFilter:;">
                <path
									d="M12 2a5 5 0 1 0 5 5 5 5 0 0 0-5-5zm0 8a3 3 0 1 1 3-3 3 3 0 0 1-3 3zm9 11v-1a7 7 0 0 0-7-7h-4a7 7 0 0 0-7 7v1h2v-1a5 5 0 0 1 5-5h4a5 5 0 0 1 5 5v1z"></path>
            </svg>
							<p class="ml-2">Register</p>
						</a>
					</div>
					<div class="">
						<a href="./login.jsp"
							class="flex h-9 w-24 justify-center rounded-3xl items-center my-1 mx-4 text-sm text-gray-700 font-medium hover:text-indigo-500">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24"
								style="fill: rgba(0, 0, 0, 1); transform:; msFilter:;">
                <path
									d="M12 2a5 5 0 1 0 5 5 5 5 0 0 0-5-5zm0 8a3 3 0 1 1 3-3 3 3 0 0 1-3 3zm9 11v-1a7 7 0 0 0-7-7h-4a7 7 0 0 0-7 7v1h2v-1a5 5 0 0 1 5-5h4a5 5 0 0 1 5 5v1z"></path>
            </svg>
							<p class="ml-2">Login</p>
						</a>
					</div>
				</div>

				<%
				}
				%>


				<div class="">
					<a href="./cart.jsp"
						class="flex h-9 w-24 justify-center rounded-3xl items-center my-1 mx-4 text-sm text-gray-700 font-medium hover:text-indigo-500">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
							viewBox="0 0 24 24"
							style="fill: rgba(0, 0, 0, 1); transform:; msFilter:;">
                        <path
								d="M21.822 7.431A1 1 0 0 0 21 7H7.333L6.179 4.23A1.994 1.994 0 0 0 4.333 3H2v2h2.333l4.744 11.385A1 1 0 0 0 10 17h8c.417 0 .79-.259.937-.648l3-8a1 1 0 0 0-.115-.921zM17.307 15h-6.64l-2.5-6h11.39l-2.25 6z"></path>
                        <circle cx="10.5" cy="19.5" r="1.5"></circle>
                        <circle cx="17.5" cy="19.5" r="1.5"></circle>
                    </svg>
						<p class="ml-2">Cart</p>
					</a>
				</div>
			</div>
		</div>
		<nav class="bg-white shadow-md">
			<div class="container mx-auto px-4 py-2">
				<div class="flex justify-between items-center">
					<!-- Logo -->
					<a href="#" class="text-indigo-500 font-bold text-lg">Kyube
						Gadget</a>
					<!-- Navigation Links -->
					<div class="hidden md:block">
						<a href="./index.jsp"
							class="my-1 mx-4 text-sm text-gray-700 font-medium hover:text-indigo-500">Home</a>
						<a href="./about.jsp"
							class="my-1 mx-4 text-sm text-gray-700 font-medium hover:text-indigo-500">About</a>
						<a href="#"
							class="my-1 mx-4 text-sm text-gray-700 font-medium hover:text-indigo-500">Contact
							Us</a>
						
						
						<!-- Categories Dropdown -->
						<div class="relative inline-block">
							<button
								class="dropdown-button my-1 mx-4 text-sm text-gray-700 font-medium hover:text-indigo-500 focus:outline-none">Categories</button>
							<div class="dropdown-menu absolute hidden z-10 left-0  mt-2 w-40 bg-white shadow-md rounded-md">
								<!-- Iterate over categories and dynamically generate dropdown items -->
								
									
									<%
								for(ProductCategoryModel pm: categories){
								%>
									
										 
										<a href="#"
										class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">
										
										<%out.println(pm.getCategoryName());%>
										</a>
									
									<%
								}
									%>
									
								<ul>
								
								
								</ul>
								

							</div>
						</div>


					</div>
					<!-- Mobile Menu Button (Hidden on desktop) -->
					<div class="md:hidden">
						<button class="text-gray-800 focus:outline-none">
							<!-- Hamburger icon -->
							<svg class="w-6 h-6" fill="none" stroke="currentColor"
								viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round"
									stroke-linejoin="round" stroke-width="2"
									d="M4 6h16M4 12h16M4 18h16"></path>
                        </svg>
						</button>
					</div>
				</div>
			</div>
		</nav>
	</nav>

</body>

<script>
	// Get the categories button and dropdown menu
	var categoriesButton = document.querySelector('.dropdown-button');
	var dropdownMenu = document.querySelector('.dropdown-menu');

	// Add event listener to the categories button
	categoriesButton.addEventListener('click', function() {
		// Toggle the visibility of the dropdown menu
		dropdownMenu.classList.toggle('hidden');
	});

	// Close dropdown menu when clicking outside of it
	document.addEventListener('click', function(event) {
		if (!categoriesButton.contains(event.target)
				&& !dropdownMenu.contains(event.target)) {
			dropdownMenu.classList.add('hidden');
		}
	});
</script>

</html>