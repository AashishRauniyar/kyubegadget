<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Registration</title>


<style>
body {
	font-family: Arial, sans-serif;
}

.cont {
	max-width: 500px;
	margin: 50px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	font-weight: bold;
}

.form-group input {
	width: calc(100% - 20px);
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

.form-group select {
	width: calc(100% - 22px);
	padding: 9px;
	border: 1px solid #ccc;
	border-radius: 3px;
	appearance: none;
}

.form-group .btn {
	background-color: #6366F1;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

.form-group .btn:hover {
	background-color: #4C51BF;
}

.error {
	color: red;
	font-size: 12px
}
</style>
</head>
<body>
<%@ include file="navbar.jsp"%>

	<div class="cont">

		<h2>User Registration</h2>
		<form id="registrationForm" action="../RegisterServlet" method="post"
			onsubmit="return validateForm()">

			<div class="form-group">
				<label for="userName">Username:</label> <input type="text"
					id="userName" name="userName" required> <span
					id="userNameError" class="error"></span>

			</div>
			<div class="form-group">
				<label for="firstName">First Name:</label> <input type="text"
					id="firstName" name="firstName" required> <span
					id="firstNameError" class="error"></span>
			</div>
			<div class="form-group">
				<label for="lastName">Last Name:</label> <input type="text"
					id="lastName" name="lastName" required> <span
					id="lastNameError" class="error"></span>
			</div>
			<div class="form-group">
				<label for="email">Email:</label> <input type="email" id="email"
					name="email" required> <span id="emailError" class="error"></span>
			</div>
			<div class="form-group">
				<label for="phoneNumber">Phone Number:</label> <input type="text"
					id="phoneNumber" name="phoneNumber"> <span
					id="phoneNumberError" class="error"></span>
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					id="password" name="password" required> <span
					id="passwordError" class="error"></span>
			</div>
			<div class="form-group">
				<label for="rePassword">Re-enter Password:</label> <input
					type="password" id="rePassword" name="rePassword" required>
				<span id="rePasswordError" class="error"></span>
			</div>
			<div class="form-group">
				<label for="dob">Date of Birth:</label> <input type="date" id="dob"
					name="dob" required> <span id="dobError" class="error"></span>
			</div>
			<div class="form-group">
				<label for="gender">Gender:</label> <select id="gender"
					name="gender" required>
					<option value="Male">Male</option>
					<option value="Female">Female</option>
					<option value="Other">Other</option>
				</select>
			</div>
			<div class="form-group">
				<label for="address">Address:</label> <input type="text"
					id="address" name="address" required> <span
					id="addressError" class="error"></span>
			</div>

			<div class="form-group">
				<input type="submit" value="Register" class="btn">
			</div>
		</form>
	</div>

	<script>
		function validateForm() {
			var isValid = true;

			// Reset previous error messages
			var errorElements = document.getElementsByClassName("error");
			for (var i = 0; i < errorElements.length; i++) {
				errorElements[i].innerText = "";
			}

			// Username validation
			var userName = document.getElementById("userName").value;
			if (userName.trim() === "" || userName.length < 6) {
				document.getElementById("userNameError").innerText = "Username must be at least 6 characters.";
				isValid = false;
			}

			// First name validation
			var firstName = document.getElementById("firstName").value;
			if (firstName.trim() === "") {
				document.getElementById("firstNameError").innerText = "Please enter your first name.";
				isValid = false;
			}

			// Last name validation
			var lastName = document.getElementById("lastName").value;
			if (lastName.trim() === "") {
				document.getElementById("lastNameError").innerText = "Please enter your last name.";
				isValid = false;
			}

			// Email validation
			var email = document.getElementById("email").value;
			if (email.trim() === "") {
				document.getElementById("emailError").innerText = "Please enter your email.";
				isValid = false;
			}

			// Phone number validation
			var phoneNumber = document.getElementById("phoneNumber").value;
			if (!/^\d{10}$/.test(phoneNumber)) {
				document.getElementById("phoneNumberError").innerText = "Phone number must be a 10-digit number.";
				isValid = false;
			}

			// Password validation
			var password = document.getElementById("password").value;
			if (!/^(?=.*\d)(?=.*[!@#$%^&*])(?=.*[a-zA-Z]).{6,}$/.test(password)) {
				document.getElementById("passwordError").innerText = "Password must be at least 6 characters and contain at least one digit, one special character, and one letter.";
				isValid = false;
			}

			// Re-enter password validation
			var rePassword = document.getElementById("rePassword").value;
			if (rePassword.trim() === "") {
				document.getElementById("rePasswordError").innerText = "Please re-enter your password.";
				isValid = false;
			} else if (rePassword !== password) {
				document.getElementById("rePasswordError").innerText = "Passwords do not match.";
				isValid = false;
			}

			// Date of Birth validation
			var dob = document.getElementById("dob").value;
			var dobDate = new Date(dob);
			var currentDate = new Date();
			if (dobDate >= currentDate) {
				document.getElementById("dobError").innerText = "Date of birth must be before today's date.";
				isValid = false;
			}

			// Gender validation
			var gender = document.getElementById("gender").value;
			if (gender.trim() === "") {
				// Optional: display error message for gender if required
				// Example: document.getElementById("genderError").innerText = "Please select your gender.";
				// isValid = false;
			}

			// Address validation
			var address = document.getElementById("address").value;
			if (address.trim() === "") {
				document.getElementById("addressError").innerText = "Please enter your address.";
				isValid = false;
			}

			return isValid;
		}
	</script>

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	$(document).ready(function() {
	    $('#userName').blur(function() { // Use blur event instead of click for better UX
	        var userName = $('#userName').val();
	        $.ajax({
	            url: '../RegisterServlet',
	            type: 'GET',
	            data: {
	                userName: userName
	            },
	            success: function(response) {
	                if (response === 'true') {
	                    $('#userNameError').text('Username exists!');
	                } else {
	                    $('#userNameError').text('Available').css('color', 'green');
	                }
	            },
	            error: function() {
	                $('#userNameError').text('Error occurred while checking username.');
	            }
	        });
	    });
	});
	
	</script>

	<script>
	//for email
	$(document).ready(function() {
    $('#email').blur(function() { // Use blur event instead of click for better UX
        var email = $('#email').val();
        $.ajax({
            url: '../RegisterServlet',
            type: 'GET',
            data: {
                email: email
            },
            success: function(response) {
                if (response === 'true') {
                    $('#emailError').text('Email exists!');
                } else {
                    $('#emailError').text('Available').css('color', 'green');
                }
            },
            error: function() {
                $('#emailError').text('Error occurred while checking email.');
            }
        });
    });
});

	
	</script>

	<script>
	
	
	//for phone number
			//phone number
		$(document).ready(function() {
    $('#phoneNumber').blur(function() { // Use blur event instead of click for better UX
        var phoneNumber = $('#phoneNumber').val();
        $.ajax({
            url: '../RegisterServlet',
            type: 'GET',
            data: {
                phoneNumber: phoneNumber
            },
            success: function(response) {
                if (response === 'true') {
                    $('#phoneNumberError').text('Phone number exists!');
                } else {
                    $('#phoneNumberError').text('Available').css('color', 'green');
                }
            },
            error: function() {
                $('#phoneNumberError').text('Error occurred while checking phone number.');
            }
        });
    });
    </script>

<%@ include file="footer.jsp"%>
</body>
</html>
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/fontawesome.min.css" integrity="sha512-UuQ/zJlbMVAw/UU8vVBhnI4op+/tFOpQZVT+FormmIEhRSCnJWyHiBbEVgM4Uztsht41f3FzVWgLuwzUqOObKw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>SignIn/Up page</title>
    <link href="<%= request.getContextPath() %>/styles/output.css" rel="stylesheet">
    <style>
        *{
            box-sizing: border-box;
        }

        body {
            background: #f6f5f7;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            /* font-family: ; */
            height: 100vh;
            margin: -20px 0 50px;
        }

        h1 {
            font-weight: bold;
            margin: 0;
        }

        h2 {
            text-align: center;
        }

        p {
            font-size: 14px;
            font-weight: 100;
            line-height: 20px;
            letter-spacing: 0.5px;
            margin: 20px 0 30px;
        }

        span {
            font-size: 12px;
        }

        a {
            color: #333;
            font-size: 14px;
            text-decoration: none;
            margin: 15px 0;
        }

        button {
            border-radius: 20px;
            border: 1px solid #ffffff;
            background-color: #ffa726;
            color: #ffffff;
            font-size: 12px;
            font-weight: bold;
            padding: 12px 45px;
            letter-spacing: 1px;
            text-transform: uppercase;
            transition: transform 80ms ease-in;
        }

        button:active {
            transform: scale(0.95);
        }

        button:focus {
            outline: none;
        }

        button:ghost {
            background-color: transparent;
            border-color: #ffffff;
        }

        form {
            background-color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 50px;
            height: 100%;
            text-align: center;
        }

        /* input {
            background-color: #eee;
            border: none;
            padding: 12px 15px;
            margin: 8px 0;
            width: 100%;
        } */

        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
            position: relative;
            overflow: hidden;
            width: 80%;
            max-width: 100%;
            min-height: 650px;
        }

        .form-container {
            position: absolute;
            top: 0;
            height: 100%;
            transition: all 0.6s ease-in-out;
        }

        .sign-in-container {
            left: 0;
            width: 50%;
            z-index: 2;
        }

        .container.right-panel-active .sign-in-container{
            transform: translateX(100%);
        }

        .sign-up-container {
            left: 0;
            width: 50%;
            opacity: 0;
            z-index: 1;
        }

        .container.right-panel-active .sign-up-container {
            transform: translateX(100%);
            opacity: 1;
            z-index: 5;
            animation: show 0.6s;
        }

        @keyframes show {
            0%,
            49.99% {
                opacity: 0;
                z-index: 5;
            }

            50%,
            100% {
                opacity: 1;
                z-index: 5;
            }
        }

        .overlay-container {
            position: absolute;
            top: 0;
            left: 50%;
            width: 50%;
            height: 100%;
            overflow: hidden;
            transition: transform 0.6s ease-in;
            z-index: 100;
        }

        .container.right-panel-active .overlay-container {
            transform: translateX(-100%);
        }

        .overlay {
            background: #ffa726;
            background: -webkit-linear-gradient(to right, #ffa726, #ffa726);
            background: linear-gradient(to right, #ff4b2b, #ffa726);
            background-repeat: no-repeat;
            background-size: cover;
            background-position: 0 0;
            color: #ffffff;
            position: relative;
            left: -100%;
            height: 100%;
            width: 200%;
            transform: translateX(0);
            transition: transform 0.6s ease-in-out;
        }

        .container.right-panel-active .overlay {
            transform: translateX(50%);
        }

        .overlay-panel {
            position: absolute;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            top: 0;
            padding: 0 40px;
            text-align: center;
            height: 100%;
            width: 50%;
            transform: translateX(0);
            transition: transform 0.6s ease-in-out;
        }

        .overlay-left {
            transform: translateX(-20%);
        }

        .container.right-panel-active .overlay-left {
            transform: translateX(0);
        }

        .overlay-right {
            right: 0;
            transform: translateX(0);
        }

        .container.right-panel-active .overlay-right {
            transform: translateX(20%);
        }

        .social-container {
            margin: 20px 0;
        }

        .social-container a {
            border: 1px solid #dddddd;
            border-radius: 50%;
            display: inline-flex;
            justify-content: center;
            align-items: center;
            margin: 0 5px;
            height: 40px;
            width: 40px;
        }

        .input-group {
            display: flex;
            margin-bottom: 5px;
        }   

        .input-group input {
            flex: 1;
            margin-right: 10px;
        }

        .input-group input:last-child {
            margin-right: 0;
        }

        .input-group input, .input-group select {
            width: 100%;
            padding: 12px 15px;
            margin: 8px 0;
            background-color: #eee;
            border: none;
            border-radius: 10px;
        }

        /* .input-group input[type="checkbox"] {
            margin-right: 5px;
        } */

        .checkbox-group {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 5px;
            width: 100%;
        }

        .checkbox-group label {
            margin-left: 5px;
        }
        
        
    </style>
</head>
<body>
   <!--  <div class="container" id="container">
        <div class="form-container sign-in-container">
            <form id="registrationForm" action="../RegisterServlet" method="POST" onsubmit="return validateForm() ;">
                <h1>Create Account</h1>
                <div class="social-container">
                    <a href="" class=""><i class="fab fa-facebook-f"></i></a>
                    <a href="" class=""><i class="fab fa-google-plus-g"></i></a>
                    <a href="" class=""><i class="fab fa-linkedin-in"></i></a>
                </div>
                <div class="input-group">
                    <input id="firstName" style="margin-right: 10px;" name="firstName" type="text" placeholder="First name">
                    
                    <input id="lastName" style="margin-left: 10px;" name="lastName" type="text" placeholder="Last name">
                    
                </div>
                <span class="error" id="firstNameError"></span>
                <span class="error" id="lastNameError"></span>
                <div class="input-group">
                    <input id="address" style="width: 360px;" name="address" type="text" placeholder="Address">
                    
                </div>
                <span class="error" id="addressError"></span>
                <div class="input-group">
                    <input id="email" style="margin-right: 10px;" name="email" type="email" placeholder="Email">
                    
                    <input id="phoneNumber" style="margin-left: 10px;" name="phoneNumber" type="text" placeholder="Phone number">
                    
                </div>
                <span class="error" id="emailError"></span>
                <span class="error" id="phoneNumberError"></span>
                <div class="input-group">
                    <select style="margin-right: 10px; width: 170px;" id="gender" name="gender" required>
                        <option value="" disabled selected>Select Gender</option>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                        <option value="other">Other</option>
                    </select>
                    <div>
                        <input id="dob" placeholder="Date of Birth" style="margin-left: 10px; width: 170px;" name="dob" type="date" id="dob" name="dob" required>
                        
                    </div>
                </div>
                 <span class="error" id="dobError"></span>
                <div class="input-group">
                    <input id="userName" style="width: 360px;" name="userName" type="text" placeholder="Username"> 
                    
                </div>
                <span class="error" id="userNameError"></span>
                <div class="input-group">
                    <input  style="margin-right: 10px;" type="password" id="password" name="password" placeholder="Password" required>
                    
                    <input style="margin-left: 10px;" type="password" id="rePassword" name="rePassword" placeholder="Re-enter password" required>  
                                    
                </div>
                <span class="error" id="passwordError"></span>
                <span class="error" id="rePasswordError"></span>
                <div class="checkbox-group">
                    <input type="checkbox" id="showPasswordCheckbox">
                    <label for="showPasswordCheckbox">Show Password</label>
                </div>
                <button id="">Sign up</button>               
            </form>
        </div>        
        <div class="form-container sign-up-container">
            <form action="../LoginServlet" method="POST">
                <h1>Sign In</h1>
                <div class="social-container">
                    <a href="" class=""><i class="fab fa-facebook-f"></i></a>
                    <a href="" class=""><i class="fab fa-google-plus-g"></i></a>
                    <a href="" class=""><i class="fab fa-linkedin-in"></i></a>                    
                </div>
                <span>or use your account</span>
                <div class="input-group">
                    <input style="width: 360px;" name="userName" type="text" placeholder="Username">
                </div>
                <div class="input-group">
                    <input style="width: 360px;" name="password" type="password" id="signInPassword" placeholder="Password">
                </div>
                <button>Sign In</button>     
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h1>Hello, Friend!</h1>
                    <p>
                        Enter your personal details and start journey with us
                    </p>
                    <button class="ghost" id="signIn">Sign Up</button>
                </div>
                <div class="overlay-panel overlay-right">
                    <h1>Welcome Back!</h1>
                    <p>
                        To keep connected with us please login with your personal info
                    </p>
                    <button class="ghost" id="signUp">Sign In</button>
                </div>
            </div>
        </div>
    </div> -->
    <div class="border border-gray-300 max-w-lg mx-auto mt-10 p-6 rounded-lg">

  <div class="font-bold text-orange-500 text-center">
    <h1>Register | KYUBE GADGET</h1>
  </div>

  <form action="../RegisterServlet" method="POST" class="max-w-lg mx-auto mt-10">
    <div class="text-right text-[12px] ">
      <span class="text-gray-600">Already have an account? <a href="./login.jsp" class="hover:text-orange-500 text-black">Login</a> </span>
    </div>

    <div class="grid grid-cols-2 gap-4">
      <div class="mb-5">
        <label for="firstName" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">First Name</label>
        <input type="text" name="firstName" id="firstName" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-orange-500 focus:border-orange-500 block w-full p-2.5" placeholder="Enter first name" required />
      </div>

      <div class="mb-5">
        <label for="lastName" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Last Name</label>
        <input type="text" name="lastName" id="lastName" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-orange-500 focus:border-orange-500 block w-full p-2.5" placeholder="Enter last name" required />
      </div>

      <div class="mb-5">
        <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Email</label>
        <input type="email" name="email" id="email" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-orange-500 focus:border-orange-500 block w-full p-2.5" placeholder="example@example.com" required />
      </div>

      <div class="mb-5">
        <label for="address" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Address</label>
        <input type="text" name="address" id="address" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-orange-500 focus:border-orange-500 block w-full p-2.5" placeholder="Enter address" required />
      </div>

      <div class="mb-5">
        <label for="phoneNumber" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Phone Number</label>
        <input type="tel" name="phoneNumber" id="phoneNumber" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-orange-500 focus:border-orange-500 block w-full p-2.5" placeholder="Enter phone number" required />
      </div>

      <div class="mb-5">
        <label for="dob" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Date of Birth</label>
        <input type="date" name="dob" id="dob" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-orange-500 focus:border-orange-500 block w-full p-2.5" required />
      </div>

      <div class="mb-5">
        <label for="gender" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Gender</label>
        <select name="gender" id="gender" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-orange-500 focus:border-orange-500 block w-full p-2.5" required>
          <option value="" disabled selected>Select your gender</option>
          <option value="male">Male</option>
          <option value="female">Female</option>
          <option value="other">Other</option>
        </select>
      </div>

      <div class="mb-5">
        <label for="username" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Username</label>
        <input type="text" name="userName" id="username" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-orange-500 focus:border-orange-500 block w-full p-2.5" placeholder="Enter username" required />
      </div>

      <div class="mb-5">
        <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Password</label>
        <input type="password" name="password" id="password" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-orange-500 focus:border-orange-500 block w-full p-2.5" placeholder="********" required />
      </div>

      <div class="mb-5">
        <label for="confirmPassword" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Confirm Password</label>
        <input type="password" name="password" id="confirmPassword" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-orange-500 focus:border-orange-500 block w-full p-2.5" placeholder="********" required />
      </div>
    </div>

    <button type="submit" class="text-white bg-orange-500 hover:bg-orange-800 focus:ring-4 focus:outline-none focus:ring-orange-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">Register</button>
  </form>
</div>
    
    <script>
        document.getElementById("showPasswordCheckbox").addEventListener("change", function() {
            var passwordInput = document.getElementById("password");
            var retypePasswordInput = document.getElementById("retypePassword");
    
            if (this.checked) {
                passwordInput.type = "text";
                retypePasswordInput.type = "text";
            } else {
                passwordInput.type = "password";
                retypePasswordInput.type = "password";
            }
        });
    </script>
    <script>
        const signUpButton = document.getElementById("signUp");
        const signInButton = document.getElementById("signIn");
        const container = document.getElementById("container");

        signUpButton.addEventListener('click', () => {
            container.classList.add("right-panel-active")
        })

        signInButton.addEventListener('click', () => {
            container.classList.remove("right-panel-active")
        })
    </script>
    	<script>
		function validateForm() {
			var isValid = true;

			// Reset previous error messages
			var errorElements = document.getElementsByClassName("error");
			for (var i = 0; i < errorElements.length; i++) {
				errorElements[i].innerText = "";
			}

			// Username validation
			var userName = document.getElementById("userName").value;
			if (userName.trim() === "" || userName.length < 6) {
				document.getElementById("userNameError").innerText = "Username must be at least 6 characters.";
				isValid = false;
			}

			// First name validation
			var firstName = document.getElementById("firstName").value;
			if (firstName.trim() === "") {
				document.getElementById("firstNameError").innerText = "Please enter your first name.";
				isValid = false;
			}

			// Last name validation
			var lastName = document.getElementById("lastName").value;
			if (lastName.trim() === "") {
				document.getElementById("lastNameError").innerText = "Please enter your last name.";
				isValid = false;
			}

			// Email validation
			var email = document.getElementById("email").value;
			if (email.trim() === "") {
				document.getElementById("emailError").innerText = "Please enter your email.";
				isValid = false;
			}

			// Phone number validation
			var phoneNumber = document.getElementById("phoneNumber").value;
			if (!/^\d{10}$/.test(phoneNumber)) {
				document.getElementById("phoneNumberError").innerText = "Phone number must be a 10-digit number.";
				isValid = false;
			}

			// Password validation
			var password = document.getElementById("password").value;
			if (!/^(?=.*\d)(?=.*[!@#$%^&*])(?=.*[a-zA-Z]).{6,}$/.test(password)) {
				document.getElementById("passwordError").innerText = "Password must be at least 6 characters and contain at least one digit, one special character, and one letter.";
				isValid = false;
			}

			// Re-enter password validation
			var rePassword = document.getElementById("rePassword").value;
			if (rePassword.trim() === "") {
				document.getElementById("rePasswordError").innerText = "Please re-enter your password.";
				isValid = false;
			} else if (rePassword !== password) {
				document.getElementById("rePasswordError").innerText = "Passwords do not match.";
				isValid = false;
			}

			// Date of Birth validation
			var dob = document.getElementById("dob").value;
			var dobDate = new Date(dob);
			var currentDate = new Date();
			if (dobDate >= currentDate) {
				document.getElementById("dobError").innerText = "Date of birth must be before today's date.";
				isValid = false;
			}

			// Gender validation
			var gender = document.getElementById("gender").value;
			if (gender.trim() === "") {
				// Optional: display error message for gender if required
				// Example: document.getElementById("genderError").innerText = "Please select your gender.";
				// isValid = false;
			}

			// Address validation
			var address = document.getElementById("address").value;
			if (address.trim() === "") {
				document.getElementById("addressError").innerText = "Please enter your address.";
				isValid = false;
			}

			return isValid;
		}
	</script>

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	$(document).ready(function() {
	    $('#userName').blur(function() { // Use blur event instead of click for better UX
	        var userName = $('#userName').val();
	        $.ajax({
	            url: '../RegisterServlet',
	            type: 'GET',
	            data: {
	                userName: userName
	            },
	            success: function(response) {
	                if (response === 'true') {
	                    $('#userNameError').text('Username exists!');
	                } else {
	                    $('#userNameError').text('Available').css('color', 'green');
	                }
	            },
	            error: function() {
	                $('#userNameError').text('Error occurred while checking username.');
	            }
	        });
	    });
	});
	
	</script>

	<script>
	//for email
	$(document).ready(function() {
    $('#email').blur(function() { // Use blur event instead of click for better UX
        var email = $('#email').val();
        $.ajax({
            url: '../RegisterServlet',
            type: 'GET',
            data: {
                email: email
            },
            success: function(response) {
                if (response === 'true') {
                    $('#emailError').text('Email exists!');
                } else {
                    $('#emailError').text('Available').css('color', 'green');
                }
            },
            error: function() {
                $('#emailError').text('Error occurred while checking email.');
            }
        });
    });
});

	
	</script>

	<script>
	
	
	//for phone number
			//phone number
		$(document).ready(function() {
    $('#phoneNumber').blur(function() { // Use blur event instead of click for better UX
        var phoneNumber = $('#phoneNumber').val();
        $.ajax({
            url: '../RegisterServlet',
            type: 'GET',
            data: {
                phoneNumber: phoneNumber
            },
            success: function(response) {
                if (response === 'true') {
                    $('#phoneNumberError').text('Phone number exists!');
                } else {
                    $('#phoneNumberError').text('Available').css('color', 'green');
                }
            },
            error: function() {
                $('#phoneNumberError').text('Error occurred while checking phone number.');
            }
        });
    });
    </script>
    
    <script>
        document.getElementById("showPasswordCheckbox").addEventListener("change", function() {
            var passwordInput = document.getElementById("password");
            var retypePasswordInput = document.getElementById("rePassword");
    
            if (this.checked) {
                passwordInput.type = "text";
                retypePasswordInput.type = "text";
            } else {
                passwordInput.type = "password";
                retypePasswordInput.type = "password";
            }
        });
    </script>
    <!-- <script>
        const signUpButton = document.getElementById("signUp");
        const signInButton = document.getElementById("signIn");
        const container = document.getElementById("container");

        signUpButton.addEventListener('click', () => {
            container.classList.add("right-panel-active")
        })

        signInButton.addEventListener('click', () => {
            container.classList.remove("right-panel-active")
        })
    </script> -->
    
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
    
</body>
</html>