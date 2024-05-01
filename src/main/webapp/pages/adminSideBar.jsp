<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sidebar</title>
<link href="<%=request.getContextPath()%>/styles/output.css"
	rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
</head>
<body>
<div class="flex">
<div class="sidebar w-64 h-[100vh] relative bg-gray-800"> 
  <div class="flex flex-col items-center justify-center h-16 bg-indigo-600 text-white">
                <p class="font-bold text-xl">Admin Panel</p>
                <p class="font-bold text-md">Kyube Gadget</p>
            </div>
  <div class="p-3">
    <ul>
                    <li class="my-2">
                        <a href="#" class="flex items-center p-3 rounded-lg text-white hover:bg-indigo-600">
                            <i class='bx bx-home mr-3'></i>
                            Home
                        </a>
                    </li>
                    <li class="my-2">
                        <a href="<%=request.getContextPath()%>/pages/dashboard.jsp" class="flex items-center p-3 rounded-lg text-white hover:bg-indigo-600">
                            <i class='bx bxs-dashboard mr-3'></i>
                            Dashboard
                        </a>
                    </li>
                    <li class="my-2">
                        <a href="<%=request.getContextPath()%>/pages/orderList.jsp" class="flex items-center p-3 rounded-lg text-white hover:bg-indigo-600">
                            <i class='bx bx-list-ol mr-3'></i>
                            Orders
                        </a>
                    </li>
                    <li class="my-2">
                        <a href="<%=request.getContextPath()%>/pages/testManageProduct.jsp" class="flex items-center p-3 rounded-lg text-white hover:bg-indigo-600">
                            <i class='bx bx-customize mr-3'></i>
                            Product
                        </a>
                    </li>
                    <li class="my-2">
                        <a href="<%=request.getContextPath()%>/pages/UserList.jsp" class="flex items-center p-3 rounded-lg text-white hover:bg-indigo-600">
                            <i class='bx bx-user-circle mr-3'></i>
                            Customer
                        </a>
                    </li>
                    <li class="my-2">
                        <a href="<%=request.getContextPath()%>/pages/SalesList.jsp" class="flex items-center p-3 rounded-lg text-white hover:bg-indigo-600">
                            <i class='bx bx-dollar-circle mr-3'></i>
                            Sales
                        </a>
                    </li>
                    
                    
                    <li class="my-2" >
                    <a href="./logout.jsp" class="flex items-center p-3 rounded-lg text-white hover:bg-indigo-600">Logout</a>
                    </li>
                </ul>
  </div>
  
</div>
</div>
</body>
</html>