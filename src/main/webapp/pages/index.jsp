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

	<!-- ✅ Grid Section - Starts Here 👇 -->
	<section id="Projects"
		class="mx-auto mb-5 mt-10 grid w-fit grid-cols-1 justify-center justify-items-center gap-x-14 gap-y-20 md:grid-cols-2 lg:grid-cols-3">


		<!--   ✅ Product card 1 - Starts Here 👇 -->
		<div
			class="w-72 rounded-xl bg-white shadow-md duration-500 hover:scale-105 hover:shadow-xl">
			<a href="#"> <img
				src="https://www.bhphotovideo.com/images/images2500x2500/apple_mgyj3am_a_airpods_max_silver_1610234.jpg"
				alt="Product" class="h-80 w-72 rounded-t-xl object-cover" />
				<div class="w-72 px-4 py-3">
					<span class="mr-3 text-xs uppercase text-gray-400">APPLE</span>
					<p class="block truncate text-lg font-bold capitalize text-black">Airpods</p>
					<div class="flex items-center">
						<p class="my-3 cursor-auto text-lg font-semibold text-black">$149</p>
						<del>
							<p class="ml-2 cursor-auto text-sm text-gray-600">$199</p>
						</del>
						<div class="ml-auto">
							<button
								class="flex items-center text-sm text-white bg-gray-900 border-0 py-1 px-2 focus:outline-none hover:bg-gray-600 rounded">Add
								to Cart</button>
						</div>
					</div>
				</div>
			</a>
		</div>
		<!--   🛑 Product card 1 - Ends Here  -->

		<!--   ✅ Product card 2 - Starts Here 👇 -->
		<div
			class="w-72 rounded-xl bg-white shadow-md duration-500 hover:scale-105 hover:shadow-xl">
			<a href="./insideProduct.jsp"> <img
				src="https://choicemandu.com/image/cache/catalog/iphone/iwatch-1000x1000.jpg"
				alt="Product" class="h-80 w-72 rounded-t-xl object-cover" />
				<div class="w-72 px-4 py-3">
					<span class="mr-3 text-xs uppercase text-gray-400">Apple</span>
					<p class="block truncate text-lg font-bold capitalize text-black">Watch
						Ultra</p>
					<div class="flex items-center">
						<p class="my-3 cursor-auto text-lg font-semibold text-black">$200</p>
						<del>
							<p class="ml-2 cursor-auto text-sm text-gray-600">$250</p>
						</del>
						<div class="ml-auto">
							<button
								class="flex items-center text-sm text-white bg-gray-900 border-0 py-1 px-2 focus:outline-none hover:bg-gray-600 rounded">Add
								to Cart</button>
						</div>
					</div>
				</div>
			</a>
		</div>
		<!--   🛑 Product card 2- Ends Here  -->

		<!--   ✅ Product card 3 - Starts Here 👇 -->
		<div
			class="w-72 rounded-xl bg-white shadow-md duration-500 hover:scale-105 hover:shadow-xl">
			<a href="#"> <img
				src="https://images.unsplash.com/photo-1651950537598-373e4358d320?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwcm9maWxlLXBhZ2V8MjV8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
				alt="Product" class="h-80 w-72 rounded-t-xl object-cover" />
				<div class="w-72 px-4 py-3">
					<span class="mr-3 text-xs uppercase text-gray-400">Brand</span>
					<p class="block truncate text-lg font-bold capitalize text-black">Product
						Name</p>
					<div class="flex items-center">
						<p class="my-3 cursor-auto text-lg font-semibold text-black">$149</p>
						<del>
							<p class="ml-2 cursor-auto text-sm text-gray-600">$199</p>
						</del>
						<div class="ml-auto">
							<button
								class="flex items-center text-sm text-white bg-gray-900 border-0 py-1 px-2 focus:outline-none hover:bg-gray-600 rounded">Add
								to Cart</button>
						</div>
					</div>
				</div>
			</a>
		</div>
		<!--   🛑 Product card 3 - Ends Here  -->

		<!--   ✅ Product card 4 - Starts Here 👇 -->
		<div
			class="w-72 rounded-xl bg-white shadow-md duration-500 hover:scale-105 hover:shadow-xl">
			<a href="#"> <img
				src="https://images.unsplash.com/photo-1651950540805-b7c71869e689?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwcm9maWxlLXBhZ2V8Mjl8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
				alt="Product" class="h-80 w-72 rounded-t-xl object-cover" />
				<div class="w-72 px-4 py-3">
					<span class="mr-3 text-xs uppercase text-gray-400">Brand</span>
					<p class="block truncate text-lg font-bold capitalize text-black">Product
						Name</p>
					<div class="flex items-center">
						<p class="my-3 cursor-auto text-lg font-semibold text-black">$149</p>
						<del>
							<p class="ml-2 cursor-auto text-sm text-gray-600">$199</p>
						</del>
						<div class="ml-auto">
							<button
								class="flex items-center text-sm text-white bg-gray-900 border-0 py-1 px-2 focus:outline-none hover:bg-gray-600 rounded">Add
								to Cart</button>
						</div>
					</div>
				</div>
			</a>
		</div>
		<!--   🛑 Product card 4 - Ends Here  -->

		<!--   ✅ Product card 5 - Starts Here 👇 -->
		<div
			class="w-72 rounded-xl bg-white shadow-md duration-500 hover:scale-105 hover:shadow-xl">
			<a href="#"> <img
				src="https://sony.scene7.com/is/image/sonyglobalsolutions/og-2?$categorypdpnav$&fmt=png-alpha"
				alt="Product" class="h-80 w-72 rounded-t-xl object-cover" />
				<div class="w-72 px-4 py-3">
					<span class="mr-3 text-xs uppercase text-gray-400">Brand</span>
					<p class="block truncate text-lg font-bold capitalize text-black">Product
						Name</p>
					<div class="flex items-center">
						<p class="my-3 cursor-auto text-lg font-semibold text-black">$149</p>
						<del>
							<p class="ml-2 cursor-auto text-sm text-gray-600">$199</p>
						</del>
						<div class="ml-auto">
							<button
								class="flex items-center text-sm text-white bg-gray-900 border-0 py-1 px-2 focus:outline-none hover:bg-gray-600 rounded">Add
								to Cart</button>
						</div>
					</div>
				</div>
			</a>
		</div>
		<!--   🛑 Product card 5 - Ends Here  -->

		<!--   ✅ Product card 6 - Starts Here 👇 -->
		<div
			class="w-72 rounded-xl bg-white shadow-md duration-500 hover:scale-105 hover:shadow-xl">
			<a href="#"> <img
				src="https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-card-40-iphone15prohero-202309_FMT_WHH?wid=508&hei=472&fmt=p-jpg&qlt=95&.v=1693086369818"
				alt="Product" class="h-80 w-72 rounded-t-xl object-cover" />
				<div class="w-72 px-4 py-3">
					<span class="mr-3 text-xs uppercase text-gray-400">Brand</span>
					<p class="block truncate text-lg font-bold capitalize text-black">Product
						Name</p>
					<div class="flex items-center">
						<p class="my-3 cursor-auto text-lg font-semibold text-black">$149</p>
						<del>
							<p class="ml-2 cursor-auto text-sm text-gray-600">$199</p>
						</del>
						<div class="ml-auto">
							<button
								class="flex items-center text-sm text-white bg-gray-900 border-0 py-1 px-2 focus:outline-none hover:bg-gray-600 rounded">Add
								to Cart</button>
						</div>
					</div>
				</div>
			</a>
		</div>
		<!--   🛑 Product card 6 - Ends Here  -->

		<!-- product 7,8,9 start -->

		<div
			class="w-72 rounded-xl bg-white shadow-md duration-500 hover:scale-105 hover:shadow-xl">
			<a href="#"> <img
				src="https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-card-40-iphone15prohero-202309_FMT_WHH?wid=508&hei=472&fmt=p-jpg&qlt=95&.v=1693086369818"
				alt="Product" class="h-80 w-72 rounded-t-xl object-cover" />
				<div class="w-72 px-4 py-3">
					<span class="mr-3 text-xs uppercase text-gray-400">Brand</span>
					<p class="block truncate text-lg font-bold capitalize text-black">Product
						Name</p>
					<div class="flex items-center">
						<p class="my-3 cursor-auto text-lg font-semibold text-black">$149</p>
						<del>
							<p class="ml-2 cursor-auto text-sm text-gray-600">$199</p>
						</del>
						<div class="ml-auto">
							<button
								class="flex items-center text-sm text-white bg-gray-900 border-0 py-1 px-2 focus:outline-none hover:bg-gray-600 rounded">Add
								to Cart</button>
						</div>
					</div>
				</div>
			</a>
		</div>
		<div
			class="w-72 rounded-xl bg-white shadow-md duration-500 hover:scale-105 hover:shadow-xl">
			<a href="#"> <img
				src="https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-card-40-iphone15prohero-202309_FMT_WHH?wid=508&hei=472&fmt=p-jpg&qlt=95&.v=1693086369818"
				alt="Product" class="h-80 w-72 rounded-t-xl object-cover" />
				<div class="w-72 px-4 py-3">
					<span class="mr-3 text-xs uppercase text-gray-400">Brand</span>
					<p class="block truncate text-lg font-bold capitalize text-black">Product
						Name</p>
					<div class="flex items-center">
						<p class="my-3 cursor-auto text-lg font-semibold text-black">$149</p>
						<del>
							<p class="ml-2 cursor-auto text-sm text-gray-600">$199</p>
						</del>
						<div class="ml-auto">
							<button
								class="flex items-center text-sm text-white bg-gray-900 border-0 py-1 px-2 focus:outline-none hover:bg-gray-600 rounded">Add
								to Cart</button>
						</div>
					</div>
				</div>
			</a>
		</div>
		<div
			class="w-72 rounded-xl bg-white shadow-md duration-500 hover:scale-105 hover:shadow-xl">
			<a href="#"> <img
				src="../images/one5.jpeg"
				alt="Product" class="h-80 w-72 rounded-t-xl object-cover" />
				<div class="w-72 px-4 py-3">
					<span class="mr-3 text-xs uppercase text-gray-400">Brand</span>
					<p class="block truncate text-lg font-bold capitalize text-black">Product
						Name</p>
					<div class="flex items-center">
						<p class="my-3 cursor-auto text-lg font-semibold text-black">$149</p>
						<del>
							<p class="ml-2 cursor-auto text-sm text-gray-600">$199</p>
						</del>
						<div class="ml-auto">
							<button
								class="flex items-center text-sm text-white bg-gray-900 border-0 py-1 px-2 focus:outline-none hover:bg-gray-600 rounded">Add
								to Cart</button>
						</div>
					</div>
				</div>
			</a>
		</div>
		<!-- Product 7,8,9 end -->

	</section>

	<!-- 🛑 Grid Section - Ends Here -->


<%@ include file="footer.jsp"%>


</body>
</html>