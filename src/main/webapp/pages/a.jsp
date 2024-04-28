<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SignIn/Up page</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 flex items-center justify-center h-screen">
    <div class="max-w-md w-full">
        <div class="bg-white p-8 rounded-lg shadow-md">
            <h1 class="text-2xl font-bold mb-4">Create Account</h1>
            <form id="registrationForm" action="../RegisterServlet" method="POST" onsubmit="return validateForm();" class="space-y-4">
                <div class="flex space-x-4">
                    <input id="firstName" name="firstName" type="text" placeholder="First name" class="w-1/2 px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-indigo-500">
                    <input id="lastName" name="lastName" type="text" placeholder="Last name" class="w-1/2 px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-indigo-500">
                </div>
                <input id="address" name="address" type="text" placeholder="Address" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-indigo-500">
                <input id="email" name="email" type="email" placeholder="Email" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-indigo-500">
                <input id="phoneNumber" name="phoneNumber" type="text" placeholder="Phone number" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-indigo-500">
                <div class="flex space-x-4">
                    <select id="gender" name="gender" required class="w-1/2 px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-indigo-500">
                        <option value="" disabled selected>Select Gender</option>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                        <option value="other">Other</option>
                    </select>
                    <input id="dob" name="dob" type="date" placeholder="Date of Birth" class="w-1/2 px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-indigo-500">
                </div>
                <input id="userName" name="userName" type="text" placeholder="Username" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-indigo-500">
                <input id="password" name="password" type="password" placeholder="Password" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-indigo-500">
                <input id="rePassword" name="rePassword" type="password" placeholder="Re-enter password" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-indigo-500">
                <button type="submit" class="w-full bg-indigo-500 text-white py-2 px-4 rounded-md hover:bg-indigo-600 transition duration-300">Sign up</button>
            </form>
        </div>
        <div class="text-center mt-4">
            <span>Already have an account? <a href="#" class="text-indigo-500">Sign In</a></span>
        </div>
    </div>
</body>
<script>
    const signUpButton = document.getElementById("signUp");
    const signInButton = document.getElementById("signIn");
    const container = document.getElementById("container");
    const regi = document.getElementById("register");

    signUpButton.addEventListener('click', () => {
        container.classList.add("right-panel-active");
    });

    signInButton.addEventListener('click', () => {
        container.classList.remove("right-panel-active");
    });
    
    regi.addEventListener('click', () => {
        container.classList.add("right-panel-active");
    });

    // Add this function to remove right-panel-active class after form submission
    
</script>
</html>
