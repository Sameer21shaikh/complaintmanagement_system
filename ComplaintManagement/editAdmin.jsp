<%@page import="com.manage.entity.Customer"%>
<%@page import="com.manage.entity.Complaint"%>


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
	background-image: url("http://localhost:8081/complaint-handling.jpg");
	background-attachment: fixed;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 14px;
}

form {
	background-color: skyblue;
	border: 1px solid #777;
	font-size: 20px;
	border-radius: 5px;
	padding: 20px;
	max-width: 400px;
	margin: 30px auto;
	box-shadow: 2px 5px 10px rgba(0, 0, 0, 0.5);
}

#btn {
	text-align: center;
	background-color: black;
}
</style>
<meta charset="ISO-8859-1">
<title>Edit</title>
</head>
<body>
	<%
		Customer customer = (Customer) request.getAttribute("customer");
	%>
	<%
		String username = (String) session.getAttribute("session");
	%>


	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand transition" href="profile"><%=username.toUpperCase()%></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">
				<a class="nav-item nav-link active" href="/index">Home</a> <a
					class="nav-item nav-link disabled" href="complaint">Dashboard</a> <span
					class="sr-only">(current)</span> <a class="nav-item nav-link"
					href="history">History</a>
			</div>
		</div>
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="search"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>
	</nav>
	<div style="text-align: center;">
		<h1>Complaint Response</h1>


		<form action="dashboard" method="post" id="editCustomer">
			<div class="row">
				<div class="col">
					<label for="exampleInputEmail1">Customer Id </label> <input
						type="text" class="form-control" name="customerId" id="customerId"
						value=<%=customer.getCustomerId()%> readonly="readonly">
				</div>
				<div class="col">
					<label for="exampleInputEmail1">Name </label> <input type="text"
						class="form-control" name="username" id="username"
						value=<%=customer.getUsername()%>>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<label for="exampleInputEmail1">Email </label> <input
						class="form-control" name="email" id="email"
						value=<%=customer.getEmail()%> readonly="readonly">
				</div>
				<div class="col">
					<label for="exampleInputEmail1">Contact</label> <input
						type="number" class="form-control" name="contact" id="contact"
						required="required">
				</div>
			</div>
			<br> <input class="form-control" type="submit"
				value="Update Complaint">
		</form>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script>
		$('#editCustomer')
				.on(
						'submit',
						function(event) {
							event.preventDefault();

							console.log($('#customerId').val())
							console.log($('#username').val())
							console.log($('#contact').val())

							let formData = {
								"customerId" : $('#customerId').val(),
								"username" : $("#username").val(),
								"contact" : $("#contact").val()
							}
							$
									.ajax({
										type : "POST",
										contentType : 'application/json; charset=utf-8',
										dataType : 'json',
										url : 'updateCustomer',
										data : JSON.stringify(formData),
										success : function(result) {
											console.log(result)
											if (result.message = "success") {
												window.location
														.replace('http://localhost:8081/admin/profile')
											}
										},
										error : function(xhr, status, error) {
											console.log(error)
										},
									})
						})
	</script>
</body>
</html>
