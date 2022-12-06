
<%@page import="java.util.List"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.manage.entity.Complaint"%>
<%@page import="java.security.Principal"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Complaint</title>
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

table {
	margin-left: auto;
	margin-right: auto;
	margin-top: auto;
	max-width: 80%;
}

#complaintForm {
	margin-left: auto;
	margin-right: auto;
	margin-top: auto;
	background-color: rgba(0, 0, 0, 0.5);
	/* 	background-color: #a6a6a6; */
	border: 1px solid #777;
	color: white;
	font-size: 15px;
	border-radius: 5px;
	padding: 10px;
	max-width: 600px;
	box-shadow: 2px 5px 10px rgba(0, 0, 0, 0.5);
}

#inprocess {
	background-color: #ffb3b3;
	padding: auto;
	margin: 20px;
	text-align: center;
	font-size: 22px;
	border: 2px solid black;
	border-radius: 50px 20px;
}

#solved {
	background-color: #ffffb3;
	padding: auto;
	margin: 20px;
	text-align: center;
	font-size: 22px;
	border: 2px solid black;
	border-radius: 50px 50px 50px 50px;
}

#total {
	background-color: #b3ffb3;
	padding: auto;
	margin: 20px;
	text-align: center;
	font-size: 22px;
	border: 2px solid black;
	border-radius: 50px 20px;
}
</style>
<!-- CSS End -->
</head>
<body>



	<%
		String username = (String) session.getAttribute("session");
	%>

	<!-- Start Navigation Bar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand nav-link" href=><%=username.toUpperCase()%></a>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">
				<a class="nav-item nav-link " href="customerProfile">Profile</a> <a
					class="nav-item nav-link active" href="complaint">Dashboard</a> <a
					class="nav-item nav-link " href="history">History</a>
			</div>
		</div>
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="search"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>
	</nav>
	<!-- End Navigation Bar -->


	<h4 class="display-4" style='text-align: center;'>Customer
		Dashboard</h4>

	<div class="container">
		<div class="row">
			<div id="inprocess" class="col mr-auto">
				<a class="nav-item nav-link " href="complaint"> InProcess
					Complaints<br> ${inprocess} 
			</div>
			</a>
			<div id="solved" class="col mr-auto">
				<a class="nav-item nav-link " href="complaint"> Solved
					Complaints<br> ${solved} 
			</div>
			</a>
			<div id="total" class="col mr-auto ">
				<a class="nav-item nav-link active" href="history"> Total
					Complaints <br> ${total}
				</a>
			</div>
		</div>
	</div>





	<!-- Start Table -->
	<table class="table table-bordered">

		<caption>
			Inprocess Complaints-
			<h3>${size}</h3>
		</caption>


		<thead class="thead-dark">
			<tr>
				<th scope="col">Complaint Id</th>
				<th scope="col">Complaint Date</th>
				<th scope="col">Complaint Catagary</th>
				<th scope="col">Complaint Product</th>
				<th scope="col">Complaint ProductCatagary</th>
				<th scope="col">Complain Description</th>
				<th scope="col">Status</th>
				<th scope="col">Update</th>
			</tr>
		</thead>
		<%
			List<Complaint> complaints = (List<Complaint>) request.getAttribute("complaintList");
			int count = 0;
		%>

		<tbody class="tbody-light" style="background-color: lightgrey;">
			<c:forEach var="all" items="${complaintList}">

				<tr>
					<td>${all.complaintId}</td>

					<td><%=DateFormat.getInstance().format(complaints.get(count).getComplaintDate())%></td>
					<td>${all.catagary}</td>
					<td>${all.product}</td>
					<td>${all.productCatagary}</td>
					<td>${all.complaintDescription}</td>
					<td>${all.support.status}</td>
					<%
						count++;
					%>
					<td><a
						href="/customer/editComplaint?complaintId=${all.complaintId}">
							<button class="btn btn-outline-primary mb-2 btn-sm" type="button">EDIT</button>
					</a>
						<button class="btn btn-outline-danger mb-2 btn-sm" type="submit"
							id="delete" onclick="deleteComplaint(${all.complaintId})">DELETE</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- End Table -->


	<!-- Start Add Complaint Form -->
	<div style="text-align: center;">
		<form id="complaintForm" action="complaints" method="post">

			<div class="row">
				<div class="col">
					<label for="exampleFormControlTextarea1">Catagary : </label> <select
						name="catagary" id="catagary" class="form-control"
						required="required">
						<option value="" selected="selected">Select Catagary</option>
					</select>

				</div>
				<br>
				<div class="col">
					<label for="exampleFormControlTextarea1">Product : </label> <select
						name="product" id="product" class="form-control"
						required="required">
						<option value="" selected="selected">Please select
							Product first</option>
					</select>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col">
					<label for="exampleFormControlTextarea1">ProductCatagary: </label>
					<select name="productCatagary" id="productCatagary"
						class="form-control" required="required">
						<option value="" selected="selected">Please select
							ProductCatagary</option>
					</select>
				</div>
				<br>
				<div class="col">
					<label for="exampleFormControlTextarea1">Complaint
						Description</label> <br>
					<textarea rows="3" cols="30" maxlength="150"
						id="complaintDescription" name="complaintDescription"
						required="required" placeholder="Type your complaint here" WRAP></textarea>
				</div>
			</div>
			<br> <br> <input type="submit"
				class="btn btn-outline-success mb-2">
		</form>
	</div>
	<!-- Start Add Complaint Form -->


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
		let registerComplaint = false;
		$('#complaintForm').on('submit', function(event) {
			event.preventDefault();
			console.log("submit button clicked")
			console.log($("#catagary").val())
			let un = {
				"catagary" : $("#catagary").val(),
				"product" : $("#product").val(),
				"productCatagary" : $("#productCatagary").val(),
				"complaintDescription" : $("#complaintDescription").val()
			}

			$.ajax({
				type : "POST",
				contentType : 'application/json; charset=utf-8',
				dataType : 'json',
				url : 'complaint',
				data : JSON.stringify(un),
				success : function(result) {
					console.log(result)
					if (result.message = "success") {
						window.location.reload()
						alert("Complaint Is Added");
					}
				},
				error : function(xhr, status, error) {
					console.log(error)
				},
			});
		})
	</script>

	<script type="text/javascript">
		function deleteComplaint(id) {
			var sure= confirm("
			Are you Want To Delete?")
			$.ajax({
				type
			: "post",
				contentType : 'application/json; charset=utf-8
			',
				dataType : 'json',
				url : 'deleteComplaint',
				data :
			JSON.stringify({
					"complaintId" : id
				}),
		
				success :
			function(result) {
					
					if (sure==true && result.message==
			"SUCCESS") {
						location.reload()alert("ComplaintIsDeleted");
					}
				},
				error:function(xhr, status, error) {
					console.log(error)

				}
			});

		}
	
			
			
			
			
			</script>
	<br>
	<form style='text-align: center;' action="/logout" method="post">
		<input class="btn btn-danger mb-2" type="submit" id="logout_confirm"
			value="Logout" />
	</form>





</body>
</html>
