<%@page import="java.security.Principal"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>History</title>
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

table {
	margin: 30px auto;
	max-width: 800px;
}
</style>
</head>
<body>



	<%
		String username = (String) session.getAttribute("session");
	%>


	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href=""><%=username.toUpperCase()%></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">
				<a class="nav-item nav-link" href="adminProfile">Profile</a> <a
					class="nav-item nav-link" href="dashboard">Dashboard</a> <a
					class="nav-item nav-link active" href="totalHistory">History</a> <span
					class="sr-only">(current)</span>
			</div>
		</div>
		<form class="form-inline my-2 my-lg-0" id="search-form">
			<input class="form-control mr-sm-2" type="search" id="input-search"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>
	</nav>
	<h4 class="display-4" style='text-align: center;'>All History</h4>
	<table class="table table-bordered">
		<caption>All Complaints</caption>
		<thead class="thead-dark">
			<tr>
				<th scope="col">Complaint Id</th>
				<th scope="col">Complaint Date</th>
				<th scope="col">Complaint Catagary</th>
				<th scope="col">Complaint Product</th>
				<th scope="col">Complaint ProductCatagary</th>
				<th scope="col">Complain Description</th>
				<th scope="col">Comments</th>
				<th scope="col">Status</th>
				<th scope="col">Customer</th>
			</tr>
		</thead>
		<tbody class="tbody-light" style="background-color: lightgrey;">
			<c:forEach var="all" items="${totalHistory}">
				<tr>
					<td>${all.complaintId}</td>
					<td>${all.getComplaintDate()}</td>
					<td>${all.catagary}</td>
					<td>${all.product}</td>
					<td>${all.productCatagary}</td>
					<td>${all.complaintDescription}</td>
					<td>${all.support.comments}</td>
					<td>${all.support.status}</td>
					<td>${all.customer.username}</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		let getComplaintByCustomerName = false;

		$('#search-form')
				.on(
						'submit',
						function(event) {
							event.preventDefault();
							console.log("submit button clicked")
							let name = $('#input-search').val();

							window.location.href = "http://localhost:8081/admin/totalHistory?search="
									+ name;
						})
	</script>



	<form style='text-align: center;' action="excel" method="get">
		<input class="btn btn-primery mb-2" type="submit"
			value="Download Excel File">
	</form>


	<form style='text-align: center;' action="/logout" method="post">
		<input class="btn btn-danger mb-2" type="submit" value="Logout" />
	</form>
</body>
</html>