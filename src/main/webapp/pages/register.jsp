<%@ page language="java" contentType="text/html; charset=UTF-8"
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
