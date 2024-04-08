<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Profile</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	
}

.cont-profile {

	display: flex;
	min-height: 70vh;
	margin-top: 20px;
	/* Ensure container stretches to at least full viewport height */
}





.profile-Detiles, .profile-edit {
	display: block;
}

.profile-edit {
	display: none;
}
.content {
    margin-left: 100px;
    flex: 1;
    padding: 20px;
    margin-right: 500px;
    
}

.profile-heading {
	margin-bottom: 20px;
}

.profile-heading h2 {
	margin: 0;
	font-size: 24px;
	color: #333;
}

.profile-label {
	font-weight: bold;
	color: #333;
}

.profile-table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

.profile-table th, .profile-table td {
	padding: 10px;
	border-bottom: 1px solid #ddd;
	text-align: left;
}

.profile-edit input[type="text"] {
	width: calc(100% - 20px);
	/* Take up full width of parent with a little padding */
	padding: 8px;
	margin: 4px 0;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.profile-edit button {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-top: 10px;
	margin-right: 10px;
}

.profile-edit button.cancel {
	background-color: #ff5555;
}

.profile-edit button:hover {
	background-color: #45a049;
}
</style>


</head>
<body>
<%@ include file="./navbar.jsp"%>
	<div class="cont-profile">
		<div id="sidebar">
			<%@include file="./profileSidebar.jsp"%>
		</div>

		<div class="content">
			<div class="profile-heading">
				<h2>User Profile</h2>
			</div>
			<div class="profile-Detiles">
				<table class="profile-table">
					<tr>
						<th scope="row">First Name</th>
						<td><%=(String) session.getAttribute("firstName")%></td>
					</tr>
					<tr>
						<th scope="row">Last Name</th>
						<td><%=(String) session.getAttribute("lastName")%></td>
					</tr>
					<tr>
						<th scope="row">PhoneNumber</th>
						<td><%=(String) session.getAttribute("phoneNumber")%></td>
					</tr>
					<tr>
						<th scope="row">Gender</th>
						<td><%=(String) session.getAttribute("gender")%></td>
					</tr>
					<tr>
						<th scope="row">BirthDay</th>
						<td><%=session.getAttribute("dob") != null
		? ((java.time.LocalDate) session.getAttribute("dob")).toString()
		: ""%></td>

					</tr>
					<tr>
						<th scope="row">Email</th>
						<td><%=(String) session.getAttribute("email")%></td>
					</tr>
					<tr>
						<th scope="row">City</th>
						<td><%=(String) session.getAttribute("city")%></td>
					</tr>

					<tr>
						<th scope="row">Province</th>
						<td><%=(String) session.getAttribute("province")%></td>

					</tr>
					<tr>
						<th scope="row">Country</th>
						<td><%=(String) session.getAttribute("country")%></td>
					</tr>

					<tr>
						<th scope="row">PostalCode</th>
						<td><%=(String) session.getAttribute("postalCode")%></td>
					</tr>

					<!-- Add more rows for other profile details -->
				</table>
			</div>
			<div class="profile-edit">
				<form action="../EditProfile" method="post">
					<table class="profile-table">
						<tr>
							<th scope="row">First Name</th>
							<td><input type="text" name="firstName"
								value="<%=(String) session.getAttribute("firstName")%>"></td>
						</tr>
						<tr>
							<th scope="row">Last Name</th>
							<td><input type="text" name="lastName"
								value="<%=(String) session.getAttribute("lastName")%>"></td>
						</tr>
						<tr>
							<th scope="row">Phone Number</th>
							<td><input type="text" name="phoneNumber"
								value="<%=(String) session.getAttribute("phoneNumber")%>"></td>
						</tr>

						<tr>
							<th scope="row">Email</th>
							<td><input type="text" name="email"
								value="<%=(String) session.getAttribute("email")%>"></td>
						</tr>
						<tr>
							<th scope="row">City</th>
							<td><input type="text" name="city"
								value="<%=(String) session.getAttribute("city")%>"></td>
						</tr>
						<tr>
							<th scope="row">Province</th>
							<td><input type="text" name="province"
								value="<%=(String) session.getAttribute("province")%>"></td>
						</tr>
						<tr>
							<th scope="row">Country</th>
							<td><input type="text" name="country"
								value="<%=(String) session.getAttribute("country")%>"></td>
						</tr>
						<tr>
							<th scope="row">Postal Code</th>
							<td><input type="text" name="postalCode"
								value="<%=(String) session.getAttribute("postalCode")%>"></td>
						</tr>
						<!-- Add more rows for other editable fields -->
					</table>
					<button type="submit">Save</button>
					<button type="button" class="cancel" onclick="cancelEdit()">Cancel</button>
				</form>
			</div>
		</div>
	</div>
<%@ include file="./footer.jsp"%>
	<script>
		// Get DOM elements
		const editProfileLink = document.getElementById('edit-profile');
		const profileDetiles = document.querySelector('.profile-Detiles');
		const profileEdit = document.querySelector('.profile-edit');

		// Function to toggle between profile details and edit form
		function toggleProfileEdit() {
			profileDetiles.style.display = 'none';
			profileEdit.style.display = 'block';
		}

		// Event listener for clicking on the "Edit Profile" link
		editProfileLink.addEventListener('click', function(event) {
			event.preventDefault();
			toggleProfileEdit();
		});

		// Function to cancel edit and display profile details
		function cancelEdit() {
			profileDetiles.style.display = 'block';
			profileEdit.style.display = 'none';
		}
	</script>

	
</body>
</html>