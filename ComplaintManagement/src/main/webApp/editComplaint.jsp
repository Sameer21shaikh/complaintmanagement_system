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

#editForm {
	background-color: #a6a6a6;
	border: 1px solid #777;
	font-size: 20px;
	border-radius: 5px;
	padding: 20px;
	max-width: 400px;
	margin: 30px auto;
	box-shadow: 2px 5px 10px rgba(0, 0, 0, 0.5);
}
</style>
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


	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand active" href=""><%=username.toUpperCase()%></a>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">
				<a class="nav-item nav-link " href="customerProfile">Profile</a> <a
					class="nav-item nav-link active" href="complaint">Dashboard</a> <a
					class="nav-item nav-link" href="history">History</a>
			</div>
		</div>

	</nav>
	<div style="text-align: center;">
		<h1>Complaint Response</h1>


		<form id="editForm" action="dashboard" method="post"
			id="editComplaint">
			<div class="row">
				<div class="col">
					<label for="exampleInputEmail1">Customer Id </label> <input
						class="form-control" name="customerId" id="customerId"
						value=<%=complaint.getCustomer().getCustomerId()%>
						readonly="readonly">
				</div>
				<div class="col">
					<label for="exampleInputEmail1">ComplaintId</label> <input
						class="form-control" name="complaintId" id="complaintId"
						type="text" value=<%=complaint.getComplaintId()%>
						readonly="readonly">
				</div>
			</div>
			<div class="row">
				<div class="col">
					<label for="exampleFormControlTextarea1">Catagary : </label> <select
						name="catagary" id="catagary" class="form-control"
						required="required">
						<option selected="selected"><%=complaint.getCatagary()%></option>
					</select>
				</div>
				<div class="col">
					<label for="exampleFormControlTextarea1">Product : </label> <select
						name="product" id="product" class="form-control"
						required="required">
						<option value="" selected="selected"><%=complaint.getProduct()%></option>
					</select>
				</div>
				<div class="col">
					<label for="exampleFormControlTextarea1">ProductCatagary: </label>
					<select name="productCatagary" id="productCatagary"
						class="form-control" required="required">
						<option value="" selected="selected"><%=complaint.getProductCatagary()%></option>
					</select>
				</div>
			</div>
			<label for="exampleInputEmail1">Description</label>
			<textarea class="form-control" rows="2" cols="20"
				name="complaintDescription" id="complaintDescription"> <%=complaint.getComplaintDescription()%></textarea>
			<br> <input class="form-control btn-outline-primary"
				type="submit" value="Update Complaint">
		</form>
	</div>
	<form style='text-align: center;' action="/logout" method="post">
		<input class="btn btn-danger mb-2" id="btn" type="submit"
			value="Logout" />
	</form>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		var catagaryObject = {
			"In-Warranty" : {
				"General" : [ "Track Order", "Replace", "Return/Refund" ],
				"Electronics" : [ "Mobile/PC/Tablets",
						"Head-Phones/Ear-Phones", "House-Electronics" ],
				"Clothes" : [ "Men's Wear", "Girls's Wear" ],
				"FootWear" : [ "Men's Wear", "Girls's Wear" ]
			},
			"Non-Warranty" : {
				"General" : [ "Track Order", "Replace", "Return/Refund" ],
				"Electronics" : [ "Mobile/PC/Tablets",
						"Head-Phones/Ear-Phones", "House-Electronics" ],
				"Clothes" : [ "Men's Wear", "Girls's Wear" ],
				"FootWear" : [ "Men's Wear", "Girls's Wear" ]
			}
		}
		window.onload = function() {
			var catagarySel = document.getElementById("catagary");
			var product = document.getElementById("product");
			var productCatagary = document.getElementById("productCatagary");
			for ( var x in catagaryObject) {
				catagarySel.options[catagarySel.options.length] = new Option(x,
						x);
			}
			catagarySel.onchange = function() {
				//empty Chapters- and Topics- dropdowns
				productCatagary.length = 1;
				product.length = 1;
				//display correct values
				for ( var y in catagaryObject[this.value]) {
					product.options[product.options.length] = new Option(y, y);
				}
			}
			product.onchange = function() {
				//empty Chapters dropdown
				productCatagary.length = 1;
				//display correct values
				var z = catagaryObject[catagarySel.value][this.value];
				for (var i = 0; i < z.length; i++) {
					productCatagary.options[productCatagary.options.length] = new Option(
							z[i], z[i]);
				}
			}
		}
	</script>

	<script>
		$('#editForm')
				.on(
						'submit',
						function(event) {
							event.preventDefault();

							console.log($('#catagary').val())

							let formData = {
								"complaintId" : $('#complaintId').val(),
								"catagary" : $("#catagary").val(),
								"product" : $("#product").val(),
								"productCatagary" : $("#productCatagary").val(),
								"complaintDescription" : $(
										"#complaintDescription").val(),
								"customerId" : $('#customerId').val()
							}
							$
									.ajax({
										type : "POST",
										contentType : 'application/json; charset=utf-8',
										dataType : 'json',
										url : 'editform',
										data : JSON.stringify(formData),
										success : function(result) {
											console.log(result)
											if (result.message = "success") {
												window.location
														.replace('http://localhost:8081/customer/complaint')
												alert("Compalint Is Update");
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
