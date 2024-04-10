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

.form-group .half-width {
	width: calc(50% - 10px);
	display: inline-block;
	margin-right: 10px;
}

.form-group .full-width {
	width: 100%;
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
</style>
</head>
<body>

	<!-- navbar -->
	<%@ include file="navbar.jsp"%>

	<div id="error" class="error">
		<%-- Display error message if it exists --%>
		<%
		String errorMessage = request.getParameter("errorMessage");
		if (errorMessage != null && !errorMessage.isEmpty()) {
		%>
		<p class="error-message"><%=errorMessage%></p>
		<button id="close-button" class="close-button">OK</button>
		<%
		}
		%>
	</div>

	<div class="cont">
		<h2>User Registration</h2>
		<form action="../RegisterServlet" method="post">
			<div class="form-group">
				<label for="userName">Username:</label> <input type="text"
					id="userName" name="userName" required>
			</div>
			<div class="form-group">
				<label for="firstName">First Name:</label> <input type="text"
					id="firstName" name="firstName" required>
			</div>
			<div class="form-group">
				<label for="lastName">Last Name:</label> <input type="text"
					id="lastName" name="lastName" required>
			</div>
			<div class="form-group">
				<label for="email">Email:</label> <input type="email" id="email"
					name="email" required>
			</div>
			<div class="form-group">
				<label for="phoneNumber">Phone Number:</label> <input type="text"
					id="phoneNumber" name="phoneNumber">
			</div>
			<div class="form-group">
				<label for="password">Password</label> <input type="password"
					id="password" name="password">
			</div>
			<div class="form-group">
				<label for="password">Reenter password</label> <input
					type="password" id="rePassword" name="rePassword">
			</div>
			<div class="form-group">
				<label for="dob">Date of Birth:</label> <input type="date" id="dob"
					name="dob">
			</div>
			<div class="form-group">
				<label for="gender">Gender:</label> <select id="gender"
					name="gender">
					<option value="Male">Male</option>
					<option value="Female">Female</option>
					<option value="Other">Other</option>
				</select>
			</div>
			<div class="form-group">
				<label for="address">Address:</label> <input type="text"
					id="address" name="address" required>
			</div>

			<div class="form-group">
				<input type="submit" value="Register" class="btn">
			</div>
		</form>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>
