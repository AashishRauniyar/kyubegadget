<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/styles/output.css"
	rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
</head>
<body>

<%
    // Retrieve the existing session variable
    javax.servlet.http.HttpSession existingSession = request.getSession(false);

    // Check if session exists and if the role is "admin"
    if (existingSession == null || existingSession.getAttribute("role") == null || !existingSession.getAttribute("role").equals("admin")) {
        // If not admin, redirect to index page
        response.sendRedirect(request.getContextPath() +"/pages/shop.jsp");
    } else {
        // Admin is authenticated, allow access to admin panel

        // Your HTML content for admin panel goes here

        %>


	<%@include file="adminSideBar.jsp"%>


<%-- <div class="sidebar w-64 h-[100vh] relative"> 
  <div class="flex  h-[70px] border border-y-black items-center p-3 ">
    <p class="text-purple-600 font-bold text-xl ml-3">Kyube Gadget</p>
  </div>
  <div class="p-3">
    <ul>
      <li class="flex flex-col">
        <a href="" class="hover:bg-blue-600 p-3 rounded-lg hover:text-white"><i class='bx bx-home mr-3'></i>Home</a>
        <a href="" class="hover:bg-blue-600 p-3 rounded-lg hover:text-white"><i class='bx bxs-dashboard mr-3'></i>Dashboard</a>
        <a href="" class="hover:bg-blue-600 p-3 rounded-lg hover:text-white"><i class='bx bx-list-ol mr-3' ></i>Orders</a>
        <a href="" class="hover:bg-blue-600 p-3 rounded-lg hover:text-white"><i class='bx bx-customize mr-3'></i>Product</a>
        <a href="<%=request.getContextPath()%>/pages/UserList.jsp" class="hover:bg-blue-600 p-3 rounded-lg hover:text-white"><i class='bx bx-user-circle mr-3'></i></i>Customer</a>
      </li>
    </ul>
  </div>
  <div class="h-[70px] absolute inset-x-0 bottom-0 flex items-center p-3 border border-y-black">
    <a class="nav-link dropdown-toggle ml-3" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Admin name</a>
  </div>
</div> --%>





    
</body>

<script>
	

</script>

</html>
 <%
    }
%>