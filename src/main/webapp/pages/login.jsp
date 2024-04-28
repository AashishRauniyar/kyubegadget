<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <!-- <link href="../styles/output.css" rel="stylesheet">  -->
   <link href="<%= request.getContextPath() %>/styles/output.css" rel="stylesheet">
   </head>
<body>



   

<div class="border border-gray-300 max-w-sm mx-auto mt-10 p-6 rounded-lg">

<div class="font-bold text-orange-500 text-center">
      <h1>Welcome Back | KYUBE GADGET</h1>
    </div>
<form  action="../LoginServlet" method="POST" class="max-w-sm mx-auto mt-10">
        <div class="text-right text-[12px] ">
          <span class="text-gray-600">Don't have an account? <a href="./register.jsp" class="hover:text-orange-500 text-black">Sign Up</a> </span>
        </div>
        <div class="mb-5">
          <label for="userName" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">User Name</label>
          <input type="text" name="userName" id="userName" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-orange-500 focus:border-orange-500 block w-full p-2.5 " placeholder="enter user name" required />
        </div>
        <div class="mb-5">
          <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Password</label>
          <input type="password" name="password" id="password" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-orange-500 focus:border-orange-500 block w-full p-2.5   " placeholder="********" required />
        </div>
        
        
        <button type="submit" class="text-white bg-orange-500 hover:bg-orange-800 focus:ring-4 focus:outline-none focus:ring-orange-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center ">Login </button>
      </form>
</div>

</body>

</html>


