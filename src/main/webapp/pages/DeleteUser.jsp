<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Delete User</title>
<style>
/* Reset styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background-color: #f7f7f7;
}

.container {
    display: flex;
}

/* Sidebar styles */
#sidebar {
    width: 20%;
    background-color: #2c3e50;
    color: #fff;
    padding: 20px;
    margin-top: 20px;

}

/* Content styles */
.content {
    flex: 1;
    padding: 20px;
}

.content h1 {
    margin-bottom: 20px;
    color: #333;
}

/* Form styles */
.form-container {
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form-header {
    text-align: center;
    margin-bottom: 20px;
}

.form-header h1 {
    font-size: 24px;
}

.form-content {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 20px;
}

.delete-btn, .cancel-btn {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.delete-btn {
    background-color: #ff4d4d;
    color: white;
}

.delete-btn:hover {
    background-color: #cc0000;
}

.cancel-btn {
    background-color: #e6e6e6;
    color: #333;
}

.cancel-btn:hover {
    background-color: #d9d9d9;
}
</style>
</head>
<body>
	<%@ include file="./navbar.jsp"%>
	<div class="container">
		<div id="sidebar">
			<%@include file="./profileSidebar.jsp"%>
		</div>

		<div class="content">
			<div class="form-container">
				<div class="form-header">
					<h1>Delete User</h1>
					<p id="username"><%= (String) session.getAttribute("userName")%></p>
				</div>
				<form id="deleteForm" action="../DeleteUserServlet" method="post">
					<div class="form-content">
						<!-- Delete button with red background -->
						<button type="button" class="delete-btn" onclick="confirmDelete()">Delete</button>
						<!-- Cancel button -->
						<button type="button" class="cancel-btn" onclick="window.location='index.jsp'">Cancel</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
        // Function to load sidebar content using AJAX
        function loadSidebar() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("sidebar").innerHTML = this.responseText;
                }
            };
            xhttp.open("GET", "sidebar.jsp", true);
            xhttp.send();
        }

        // Function to confirm delete action
        function confirmDelete() {
            if (confirm("Are you sure you want to delete this account?")) {
                document.getElementById("deleteForm").submit();
            }
        }

        // Load the sidebar initially
       window.onload = function() {
            loadSidebar();
        };
	</script>
</body>
</html>
