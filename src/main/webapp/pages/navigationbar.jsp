<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/styles/output.css"
	rel="stylesheet">
</head>
<body>

<nav style="background-color:#fb923c" class="">
        <div class="max-w-7xl mx-auto px-4">
          <div class="flex justify-between items-center h-16">
            <!-- Logo -->
            <div class="flex-shrink-0">
              <a href="#" class="flex items-center">
                <img class="h-8" src="https://p1.hiclipart.com/preview/175/373/242/chibi-kyuubi-illustration-of-naruto-fox-png-clipart.jpg" alt="GadgetSite">
                <span class="ml-2 text-white font-semibold">Kyube Gadget</span>
              </a>
            </div>
      
            <!-- Mobile menu button -->
            <div class="flex md:hidden">
              <button id="mobile-menu-btn" class="text-white">
                <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
                </svg>
              </button>
            </div>
      
            <!-- Navigation links -->
            <div class="hidden md:flex flex-grow justify-end">
              <ul class="flex items-center space-x-4">
                <li><a href="<%=request.getContextPath()%>/pages/home.jsp" class="text-white hover:text-gray-200">Home</a></li>
                <li><a href="<%=request.getContextPath()%>/pages/shop.jsp" class="text-white hover:text-gray-200">Shop</a></li>
                <li><a href="<%=request.getContextPath()%>/pages/about.jsp" class="text-white hover:text-gray-200">About</a></li>
                <li><a href="<%=request.getContextPath()%>/pages/contact.jsp" class="text-white hover:text-gray-200">Contact Us</a></li>
                <li ><a href="<%=request.getContextPath()%>/pages/login.jsp">
                  <div class="flex ml-2">
      
                    <div><svg  xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="white" class="w-6 h-6">
                      <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0ZM4.501 20.118a7.5 7.5 0 0 1 14.998 0A17.933 17.933 0 0 1 12 21.75c-2.676 0-5.216-.584-7.499-1.632Z" />
                    </svg> 
                  </div>
                  <div class="text-white">Login</div>
                </div>
                  
                
                </a></li>
      
                <li ><a href="./cart.jsp">
                  <div class="flex ml-2">
      
                    <div>
                      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="white" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 0 0-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 0 0-16.536-1.84M7.5 14.25 5.106 5.272M6 20.25a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Zm12.75 0a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Z" />
                      </svg>
                  </div>
                  <div class="text-white">Cart</div>
                </div>
                  
                
                </a></li>
      
      
      
                
              </ul>
            </div>
          </div>
        </div>
      
        <!-- Mobile menu -->
        <div style="background-color:#fb923c" id="mobile-menu" class="md:hidden hidden ">
          <ul class="pt-4 pb-2 px-2 space-y-2">
            <li><a href="<%=request.getContextPath()%>/pages/home.jsp" class="block text-white font-semibold hover:text-gray-200">Home</a></li>
            <li><a href="<%=request.getContextPath()%>/pages/shop.jsp" class="block text-white font-semibold hover:text-gray-200">Shop</a></li>
            <li><a href="<%=request.getContextPath()%>/pages/about.jsp" class="block text-white font-semibold hover:text-gray-200">About</a></li>
            <li><a href="<%=request.getContextPath()%>/pages/contact.jsp" class="block text-white font-semibold hover:text-gray-200">Contact Us</a></li>
            <li ><a href="<%=request.getContextPath()%>/pages/login.jsp">
              <div class="flex ">
      
                <div><svg  xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="white" class="w-6 h-6">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0ZM4.501 20.118a7.5 7.5 0 0 1 14.998 0A17.933 17.933 0 0 1 12 21.75c-2.676 0-5.216-.584-7.499-1.632Z" />
                </svg> 
              </div>
              <div class="text-white">Login</div>
            </div>
              
            
            </a></li>
            <li ><a href="./cart.jsp">
              <div class="flex">
      
                <div>
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="white" class="w-6 h-6">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 0 0-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 0 0-16.536-1.84M7.5 14.25 5.106 5.272M6 20.25a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Zm12.75 0a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Z" />
                  </svg>
              </div>
              <div class="text-white">Cart</div>
            </div>
              
            
            </a></li>
          </ul>
        </div>
      </nav>
</body>
<!-- <script


 src="https://cdn.tailwindcss.com">
</script> -->

<script>

//for navbar
document.getElementById('mobile-menu-btn').addEventListener('click', function() {
  document.getElementById('mobile-menu').classList.toggle('hidden');
});

</script>
</html>