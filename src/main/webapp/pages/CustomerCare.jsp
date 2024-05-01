<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Customer Care</title>
<link rel="stylesheet" href="styles.css">
<!-- Include your CSS file -->
</head>
<style>
/* styles.css */

/* Resetting default margin and padding */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

/* Body styles */
body {
	font-family: Arial, sans-serif;
	line-height: 1.6;
	background-color: #f4f4f4;
	color: #333;
}

/* Header styles */
#contact-form h1 {
	background-color: #333;
	color: #fff;
	padding: 1rem;
	text-align: center;
}

.CCC {
	display: flex;
}

/* Main content styles */
main {
	max-width: 800px;
	margin-left: 200px;
	padding: 2rem;
}

/* Contact form styles */
#contact-form {
	background-color: #fff;
	padding: 2rem;
	width: 600px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

#contact-form h2 {
	margin-bottom: 1rem;
	color: #333;
}

#contact-form label {
	display: block;
	margin-bottom: 0.5rem;
	color: #333;
}

#contact-form input[type="text"], #contact-form input[type="email"],
	#contact-form textarea {
	width: 100%;
	padding: 0.5rem;
	margin-bottom: 1rem;
	border: 1px solid #ccc;
	border-radius: 3px;
}

#contact-form textarea {
	resize: vertical;
}

#contact-form button {
	display: block;
	width: 100%;
	padding: 0.75rem;
	background-color: #333;
	color: #fff;
	border: none;
	border-radius: 3px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

#contact-form button:hover {
	background-color: #555;
}

/* Footer styles */
footer {
	background-color: #333;
	color: #fff;
	text-align: center;
	padding: 1rem 0;
}

#sidebar {
    width: 20%;
    background-color: #2c3e50;
    color: #fff;
    padding: 20px;
    margin-top: 20px;

}
</style>
<body>

<%@ include file="./navigationbar.jsp"%>


	<div class="CCC">
			<div id="sidebar">
			<%@include file="./profileSidebar.jsp"%>
		</div>
		<main>
			<section id="contact-form">
				<h1>Customer Care</h1>
				<h2>Contact Us</h2>
				<form action="#!" method="post">
					<label for="name">Name:</label> <input type="text" id="name"
						name="name" required> <label for="email">Email:</label> <input
						type="email" id="email" name="email" required> <label
						for="message">Message:</label>
					<textarea id="message" name="message" required></textarea>
					<button type="submit">Submit</button>
				</form>
			</section>
			<section id="customer-info">
				<!-- Display customer support information -->
			</section>
		</main>
	</div>
	<%@ include file="./footer.jsp"%>

</body>
</html>
