<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link href="../styles/output.css" rel="stylesheet">
</head>
<body>

<%@ include file="navbar.jsp"%>

<div class="login-container">
    

<form  action="../LoginServlet" method="POST" class="max-w-sm mx-auto mt-10">
  <div class="text-right text-[12px] ">
    <span class="text-gray-600">Don't have an account? <a href="./register.jsp" class="hover:text-indigo-500 text-black">Sign Up</a> </span>
  </div>
  <div class="mb-5">
    <label for="userName" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">User Name</label>
    <input type="text" name="userName" id="userName" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" placeholder="enter user name" required />
  </div>
  <div class="mb-5">
    <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Password</label>
    <input type="password" name="password" id="password" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500 dark:shadow-sm-light" required />
  </div>
  
  
  <button type="submit" class="text-white bg-indigo-500 hover:bg-indigo-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Login </button>
</form>

</div>

<%@ include file="footer.jsp"%>

</body>
</html>
