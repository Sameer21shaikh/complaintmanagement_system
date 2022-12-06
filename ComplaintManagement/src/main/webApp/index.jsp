<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<style>
body {
	background-size: cover;
	background-image: url("complaint-handling.jpg");
	background-attachment: fixed;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 14px;
}
</style>
<meta charset="ISO-8859-1">
<title>Index</title>
</head>
<body>
	<%
		String msg = request.getParameter("msg");
		if (msg != null) {
	%>

	<%=msg%>
	<%
		}
	%>


	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">
				<a class="nav-item nav-link active" href="index">Home</a> <span
					class="sr-only">(current)</span><a class="nav-item nav-link"
					href="/register">Register</a> <a class="nav-item nav-link"
					href="login">Login</a>
			</div>
		</div>
	</nav>


	<h1 style='text-align: center;'>SHOPING SUPPORT SYSTEM</h1>

	<section class="vh-100 opacity: 0.5">
		<div class="container py-5 h-100 opacity-50">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col col-lg-9 col-xl-7">
					<div class="card" style="border-radius: 15px;">
						<div class="card-body p-5">

							<div class="text-center mb-4 pb-2">
								<img
									src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-quotes/bulb.webp"
									alt="Bulb" width="100">
							</div>

							<figure class="text-center mb-0">
								<blockquote class="blockquote">
									<p class="pb-3">
										<em class="fas fa-quote-left fa-xs text-primary"></em> <span
											class="lead font-italic">"We don't want to push our
											ideas on to customers, we simply want to make what they
											want."</span> <em class="fas fa-quote-right fa-xs text-primary"></em>
									</p>
								</blockquote>
								<figcaption class="blockquote-footer mb-0">We are
									supporter</figcaption>
							</figure>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>