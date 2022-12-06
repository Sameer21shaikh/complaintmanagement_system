<%@page import="com.manage.entity.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

#btn {
	text-align: center;
	background-color: black;
}

table {
	margin: 30px auto;
	max-width: 800px;
}
</style>
<meta charset="ISO-8859-1">
<title>Profile</title>
</head>
<body>

	<%
		String username = (String) session.getAttribute("session");

		Customer customer = (Customer) request.getAttribute("customerDetails");
	%>


	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand nav-link active" href=""><%=username.toUpperCase()%></a>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">
				<a class="nav-item nav-link active" href="customerProfile">Profile</a>
				<a class="nav-item nav-link " href="complaint">Dashboard</a> <a
					class="nav-item nav-link " href="history">History</a>
			</div>
		</div>
	</nav>



	<h4 class="display-4" style='text-align: center;'>User Profile</h4>



	<div class="row">
		<div class="col-lg-4">
			<div class="card mb-4">
				<div class="card-body text-center">
					<img
						src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp"
						alt="avatar" class="rounded-circle img-fluid"
						style="width: 150px;">
					<h5 class="my-3"><%=customer.getUsername().toUpperCase()%></h5>
					<h5 class="my-3"><%=customer.getRole()%></h5>

					<br>
					<div class="d-flex justify-content-center mb-2">
						<a
							href="/customer/editCustomer?customerId=<%=customer.getCustomerId()%>"><button
								type="button" class="btn btn-outline-primary btn-sm">Update</button></a>&nbsp;

					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-8">
			<div class="card mb-4">
				<div class="card-body">
					<div class="row">
						<div class="col-sm-3">
							<p class="mb-0">ID</p>
						</div>
						<div class="col-sm-9">
							<p class="text-muted mb-0"><%=customer.getCustomerId()%></p>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-3">
							<p class="mb-0">Full Name</p>
						</div>
						<div class="col-sm-9">
							<p class="text-muted mb-0"><%=customer.getUsername()%></p>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-3">
							<p class="mb-0">Email</p>
						</div>
						<div class="col-sm-9">
							<p class="text-muted mb-0"><%=customer.getEmail()%></p>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-3">
							<p class="mb-0">Phone</p>
						</div>
						<div class="col-sm-9">
							<p class="text-muted mb-0"><%=customer.getContact()%></p>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-3">
							<p class="mb-0">Address</p>
						</div>
						<div class="col-sm-9">
							<p class="text-muted mb-0"><%=customer.getAddress()%></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form style='text-align: center;' action="/logout" method="post">
		<input class="btn btn-danger mb-2" type="submit" value="Logout" />
	</form>
</body>
</html>