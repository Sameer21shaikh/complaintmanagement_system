<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
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

#bg {
	background-attachment: fixed;
}

form {
	background-color: #a6a6a6;
	border: 1px solid #777;
	font-size: 15px;
	border-radius: 20px;
	padding: 20px;
	max-width: 500px;
	margin: 20px auto;
	text-align: left;
	/* box-shadow: 2px 5px 10px rgba(0, 0, 0, 0.5); */
}
}
</style>
<title>register</title>
</head>
<body>

	<nav id="bg" class="navbar navbar-expand-lg navbar-dark bg-dark">

		<div class="collapse navbar-collapse " id="navbarNavAltMarkup">
			<div class="navbar-nav">
				<a class="nav-item nav-link active" href="index">Home</a><a
					class="nav-item nav-link" href="/register">Register</a> <span
					class="sr-only">(current)</span><a class="nav-item nav-link"
					href="login">Login</a>

			</div>
		</div>
	</nav>
	<%
		String msg = (String) request.getAttribute("msg");
		if (msg != null) {
	%>
	<div class="alert alert-warning alert-dismissible fade show"
		role="alert" id="email-alert">

		<%=msg%>
		<%
			}
		%>
	</div>



	<div class="alert alert-success" id="success-alert"
		style="display: none">Customer Already Exist</div>

	<div style="text-align: center;">

		<h2 class="text-uppercase text-center mb-5">Registration</h2>
		<form name="formValidation" action="register" id="validate"
			method="post" onsubmit="validate_Form()">



			<label for="exampleFormControlTextarea1">Full Name<span
				style="color: red; font-weight: bold">*</span></label> <input id="name"
				class="form-control form-control-lg" type="text" name="username"
				placeholder="Full Name" required="required"
				onkeyup="validate_name()" /> <span id="name_alert"></span><br>


			<label for="exampleFormControlTextarea1">Email<span
				style="color: red; font-weight: bold">*</span></label> <input id="email"
				class="form-control form-control-lg" type="email" name="email"
				placeholder="Email" required="required" onchange="validate_email()" /><span
				id="email_alert"></span><br> <label
				for="exampleFormControlTextarea1">Contact<span
				style="color: red; font-weight: bold">*</span></label> <input id="contact"
				class="form-control form-control-lg" type="text" name="contact"
				placeholder="Contact" required="required" maxlength="10"
				onchange="validate_contact()" /><span id="contact_alert"></span><br>



			<label for="exampleFormControlTextarea1">Password<span
				style="color: red; font-weight: bold">*</span></label> <input id="pass"
				class="form-control form-control-lg" type="password" name="password"
				placeholder="Password" required="required" />

			<div class="form-check">
				<input type="checkbox" class="form-check-input"
					onclick="show_password()" /> <label class="form-check-label"
					for="flexCheckDefault"> Show Password </label>
			</div>
			<br> <label for="exampleFormControlTextarea1">Confirm
				Password<span style="color: red; font-weight: bold">*</span>
			</label> <input id="confirm_pass" class="form-control form-control-lg"
				type="password" name="confirm_pass" placeholder="Confirm Password"
				required="required" onkeyup="validate_password()"> <span
				id="pass_alert"></span> <br> <label
				for="exampleFormControlTextarea1">Address</label><span
				style="color: red; font-weight: bold">*</span> <input type="text"
				placeholder="Address" class="form-control form-control-lg"
				name="address" id="address" required="required"
				onkeyup="validate_address()" /> <span id="name_address"></span><br>
			<br> <br> <input id="btn" id="form3Example4cg"
				class="btn btn-outline-success btn-block btn-lg gradient-custom-4 text-body"
				type="submit" value="Register" data-target="#myModal"> <br>

			<h5 class="display-6">
				Have already an account? <a href="login" class="fw-bold text-body"><u>Login
						here</u></a>
			</h5>
		</form>


	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		function validate_name() {
			var regx = /^[a-zA-Z][a-zA-Z ]*$/;
			let name = $('#name').val()
			if (regx.test(name)) {

				return true;
			} else {
				$('#name_alert').css('color', 'red')
				$('#name_alert').html('Please enter only letters')
				return false;
			}
		}

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

		function validate_contact() {
			var regx = /^[0-9]{10}$/;
			var contact = document.getElementById('contact').value;
			if (!(regx.test(contact))) {
				document.getElementById('contact_alert').style.color = 'red';
				document.getElementById('contact_alert').innerHTML = 'Please Enter 10 Digit Number';
				return false;
			}
			document.getElementById('contact_alert').innerHTML = '';
			return true;
		}

		function validate_password() {

			let userpassword = $('#pass').val()
			let confirmpass = $('#confirm_pass').val()
			if (userpassword == confirmpass) {

				return true;
			} else {
				$('#pass_alert').css('color', 'red')
				$('#pass_alert').html('Mismatch')
				return false;
			}

		}

		function show_password() {
			var x = document.getElementById("pass");
			if (x.type === "password") {
				x.type = "text";
			} else {
				x.type = "password";
			}
		}

		function validate_address() {
			var regx = /^[a-zA-Z][a-zA-Z ]*$/;
			let address = $('#address').val()
			if (regx.test(address)) {
				return true;
			} else {
				$('#name_address').css('color', 'red')
				$('#name_address').html('Please enter only letters')
				return false;
			}
		}

		$('#validate').on('submit', function(event) {
			event.preventDefault()

			if (checkValidation()) {

				$(this).unbind('submit').submit()
			} else {
				alert("User Already Exist")
				window.location.reload();
			}

		})

		function checkValidation() {

			let hasErrors = true

			if (!validate_name()) {
				hasErrors = false
			}
			if (!validate_email()) {
				hasErrors = false
			}
			if (!validate_contact()) {
				hasErrors = false;
			}
			if (!validate_password()) {
				hasErrors = false;
			}

			return hasErrors

		}
	</script>

</body>
</html>