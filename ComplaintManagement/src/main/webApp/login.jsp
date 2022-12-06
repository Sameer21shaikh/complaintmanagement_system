<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<style type="text/css">
body {
	background-size: cover;
	background-image: url("complaint-handling.jpg");
	background-attachment: fixed;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 14px;
}

form {
	background-color: rgba(0, 0, 0, 0.5);
	color: white;
	/* 	filter: alpha(opacity = 50);
 	opacity: 0.5;  */
	border: 1px solid #777;
	font-size: 15px;
	border-radius: 20px;
	padding: 20px;
	max-width: 500px;
	margin: 20px auto;
	text-align: left;
}

#btn {
	text-align: center;
	background-color: black;
}
</style>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>


	<nav id="bg" class="navbar navbar-expand-lg navbar-dark bg-dark">

		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">
				<a class="nav-item nav-link active" href="index">Home</a><a
					class="nav-item nav-link" href="/register">Register</a> <a
					class="nav-item nav-link" href="login">Login</a> <span
					class="sr-only">(current)</span>

			</div>
		</div>
	</nav>


	<div style="text-align: center;">
		<h4 class="display-4">User Login</h4>

		<form action="login" method="post">
			<label for="exampleFormControlTextarea1">Email<span
				style="color: red; font-weight: bold">*</span></label> <input
				class="form-control" type="text" name="username" placeholder="Email"
				id="email" required="required" onchange="validate_email()" /><span
				id="email_alert"></span> <br> <label
				for="exampleFormControlTextarea1">Password<span
				style="color: red; font-weight: bold">*</span></label> <input
				class="form-control" type="password" name="password"
				placeholder="password" id="pass" required="required" />
			<div class="form-check">
				<input type="checkbox" class="form-check-input"
					onclick="see_password()" /> <label class="form-check-label"
					for="flexCheckDefault"> Show Password </label>
			</div>
			<br> <input id="btn" class="btn btn-primary mb-2" type="submit"
				value="Login"><br> <br>

			<h5 class="display-6">
				Click Here For <a href="register" class="fw-bold text-body"><u
					style="color: red;">Sign Up</u></a>
			</h5>
		</form>

	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		function validate_email() {
			var regx = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
			let email = $('#email').val()
			if (regx.test(email)) {

				return true;
			} else {
				$('#email_alert').css('color', 'red')
				$('#email_alert').html('Invalid	Email Address')
				return false;
			}
		}

		function see_password() {
			var x = document.getElementById("pass");
			if (x.type == "password") {
				x.type = "text";
			} else {
				x.type = "password";
			}
		}
	</script>
</body>
</html>