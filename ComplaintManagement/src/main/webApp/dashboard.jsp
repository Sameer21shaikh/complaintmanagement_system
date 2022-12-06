<%@page import="java.text.DateFormat"%>
<%@page import="com.manage.entity.Complaint"%>
<%@page import="java.util.List"%>
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

table {
	margin: 30px auto;
	max-width: 800px;
}
</style>


<meta charset="ISO-8859-1">
<title>Dashboard</title>
</head>
<body>

	<%
		String username = (String) session.getAttribute("session");
	%>


	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand nav-link" href=""><%=username.toUpperCase()%></a>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">
				<a class="nav-item nav-link" href="adminProfile">Profile</a> <a
					class="nav-item nav-link active" href="dashboard">Dashboard</a> <a
					class="nav-item nav-link" href="totalHistory">History</a>

			</div>
		</div>
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="search"
				placeholder="Search" aria-label="Search" id="search-form">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit"
				id="search-complaint">Search</button>
		</form>
	</nav>

	<%
		List<Complaint> complaints = (List<Complaint>) request.getAttribute("fetchAll");
		int count = 0;
	%>

	<h4 class="display-4" style='text-align: center;'>Admin Dashboard
	</h4>

	<table class="table table-bordered">
		<caption>Inprocess Complaints</caption>
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
				<th scope="col">Update</th>
			</tr>
		</thead>
		<tbody class="tbody-light" style="background-color: lightgrey;">
			<c:forEach var="all" items="${fetchAll}">


				<tr>
					<td>${all.complaintId}</td>
					<td><%=DateFormat.getInstance().format(complaints.get(count).getComplaintDate())%></td>
					<td>${all.catagary}</td>
					<td>${all.product}</td>
					<td>${all.productCatagary}</td>
					<td>${all.complaintDescription}</td>
					<td>${all.support.comments}</td>
					<td>${all.support.status}</td>
					<td>${all.customer.username}</td>
					<%
						count++;
					%>
					<td><a
						href="/admin/updateComplaint?complaintId=${all.complaintId}"><button
								id="btn" class="btn btn-outline-primary mb-2" type="button">Edit</button></a></td>
				</tr>

			</c:forEach>
		</tbody>
	</table>


	<form style='text-align: center;' action="/logout" method="post">
		<input class="btn btn-danger mb-2"
			style="margin-right: auto; margin-left: auto;" type="submit"
			value="Logout" />
	</form>
</body>
</html>