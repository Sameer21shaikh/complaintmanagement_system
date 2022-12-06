<%@page import="com.manage.entity.Complaint"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- CSS Start -->
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

#editForm {
	background-color: #a6a6a6;
	border: 1px solid #777;
	font-size: 20px;
	border-radius: 5px;
	padding: 20px;
	max-width: 600px;
	margin: 30px auto;
	box-shadow: 2px 5px 10px rgba(0, 0, 0, 0.5);
	margin: 30px auto;
}
</style>
<!--CSS End  -->
<meta charset="ISO-8859-1">
<title>Edit</title>
</head>
<body>
	<%
		Complaint complaint = (Complaint) request.getAttribute("complaint");
	%>
	<%
		String username = (String) session.getAttribute("session");
	%>

	<!-- Start Navigation Bar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href=""><%=username.toUpperCase()%></a>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">
				<a class="nav-item nav-link " href="adminProfile">Profile</a> <a
					class="nav-item nav-link active" href="dashboard">Dashboard</a> <a
					class="nav-item nav-link" href="totalHistory">History</a> <span
					class="sr-only">(current)</span>
			</div>
		</div>
	</nav>
	<!-- End Navigation Bar -->

	<!-- Form Start For Display Complaint and Give Response  -->
	<div style="text-align: center;">
		<h1>Complaint Response</h1>
		<form id="editForm" action="dashboard" method="post" id="updateform">
			<div class="row">
				<div class="col">
					<label for="exampleInputEmail1">Customer Id </label><input
						class="form-control" name="customerId" id="customerId"
						value=<%=complaint.getCustomer().getCustomerId()%>
						readonly="readonly">
				</div>
				<div class="col">
					<label for="exampleInputEmail1">complaintId</label><input
						class="form-control" name="complaintId" id="complaintId"
						type="text" value=<%=complaint.getComplaintId()%>
						readonly="readonly">
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col">
					<label for="exampleInputEmail1">Catagary</label> <input
						class="form-control" name="catagary" id="catagary" type="text"
						value=<%=complaint.getCatagary()%> readonly="readonly">
				</div>
				<div class="col">
					<label for="exampleInputEmail1">Product</label> <input
						class="form-control" name="product" id="product" type="text"
						value=<%=complaint.getProduct()%> readonly="readonly">
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col">
					<label for="exampleInputEmail1">Product-Catagary</label> <input
						class="form-control" name="productCatagary" id="productCatagary"
						type="text" value=<%=complaint.getProductCatagary()%>
						readonly="readonly">
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col">
					<label for="exampleInputEmail1">Description</label>
					<textarea class="form-control" rows="2" cols="20"
						name="complaintDescription" id="complaintDescription"
						readonly="readonly"> <%=complaint.getComplaintDescription()%></textarea>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col">
					<label for="exampleInputEmail1"> Comments </label><input
						class="form-control" name="comments" id="comments" type="text"
						placeholder="Comments">
				</div>
				<div class="col">
					<label for="exampleInputEmail1">Status </label><select
						class="form-control" name="status" id="status">
						<option value="INPROCESS">INPROCESS</option>
						<option value="SOLVED">SOLVED</option>
					</select>
				</div>
			</div>
			<br> <br> <input class="form-control btn-outline-primary"
				type="submit" value="Update Complaint">
		</form>
	</div>
	<form style='text-align: center;' action="/logout" method="post">
		<input class="btn btn-danger mb-2" id="btn" type="submit"
			value="Logout" />
	</form>
	<!-- Form End For Display Complaint and Give Response  -->

	<!-- Script For Add Complaint Response  -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$('#editForm')
				.on(
						'submit',
						function(event) {
							event.preventDefault();

							console.log($('#status').val()), console.log($(
									'#comments').val())
							let formData = {

								"complaintId" : $('#complaintId').val(),
								"status" : $('#status').val(),
								"comments" : $('#comments').val(),
								"customerId" : $('#customerId').val()
							}
							$
									.ajax({
										type : "post",
										contentType : 'application/json; charset=utf-8',
										dataType : 'json',
										url : 'updateform',
										data : JSON.stringify(formData),
										success : function(result) {
											console.log(result)
											if (result.message = "success") {
												alert("Response Updated")
												window.location
														.replace('http://localhost:8081/admin/dashboard')
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
