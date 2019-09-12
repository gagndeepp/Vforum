<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Home Page</title>
<link type="text/css" rel="stylesheet"
	href="<c:url value="css/style.css" />">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link type="text/css" rel="stylesheet"
	href="<c:url value="css/material.css" />">
<link type="text/css" rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet"
	href="<c:url value="css/font.css" />">
</head>
<body id="_5" style="background-image: url(/forum/img/image1.jpg)">
	<!-- navigation bar -->
	<a href="/forum/HomeController"> <span id="log"> <span
			id="i">V</span> <span id="cir"></span> <span id="ntro">Forum</span>
	</span>
	</a>
	<ul id="nav-bar">
		<span class="badge badge-danger m-3" style="font-size: 14px;">${requestScope.message}</span>
		<span class="badge badge-danger m-3" style="font-size: 14px;">${requestScope.message1 }</span>
		<!-- <a href="/forum/ViewQuestionController"><li>View Your
				Questions</li></a>
		<a href="/forum/ViewAnsController"><li>View Your Answers</li></a>
		<a href="login.html"><li>Logout</li></a>
 -->
	</ul>

	<center>
		<div class="card m-5 shadow-lg text-white bg-info w-50">
			<form:form action="registerEmployee" autocomplete="off"
				modelAttribute="employee">
				<h5 class="card-header">Register Employee</h5>
				<div class="card-body">
					<h6 class="card-title">Enter Name</h6>
					<p class="card-text">
						<form:input class ="form-control shadow-lg mb-3 bg-white rounded
							user11"
							style="width: 420px; color: black;" type="text"
							path="empName" placeholder="Hi, What's your name..."
							required="true" />
					</p>
					<h6 class="card-title">Enter Emp Id (Login Id)</h6>
					<p class="card-text">
						<form:input
							class="form-control shadow-lg mb-3 bg-white rounded user11"
							style="width: 420px; color: black;" type="text" path="empId"
							placeholder="They must've given you an id..." required="true" />
					</p>
					<h6 class="card-title">Enter Alias</h6>
					<p class="card-text">
						<form:input
							class="form-control shadow-lg mb-3 bg-white rounded user11"
							style="width: 420px; color: black;" type="text" path="empAlias"
							text="What do they call you..." required="true" />
					</p>
					<h6 class="card-title">Enter Designation</h6>
					<p class="card-text">
						<form:input
							class="form-control shadow-lg mb-3 bg-white rounded user11"
							style="width: 420px; color: black;" type="text"
							path="empDesignation" placeholder="Enter your Designation..."
							required="true" />
					</p>
					<h6 class="card-title">Enter Location</h6>
					<p class="card-text">
						<form:input
							class="form-control shadow-lg mb-3 bg-white rounded user11"
							style="width: 420px; color: black;" type="text"
							path="empLocation" placeholder="Where do you live..."
							required="true" />
					</p>
					<h6 class="card-title">Set Password</h6>
					<p class="card-text">
						<form:input class="form-control shadow-lg mb-3 bg-white rounded"
							path="empPassword" style="width: 420px; color: black;"
							type="password" name="password" id="key"
							placeholder="Your security is in your hands..." required="true" />
					</p>

					<input type=submit value="Sign up " class="btn btn-success">
					<button class="btn btn-warning"
						onclick="location.href='/forum/jsp/login.jsp'">You look
						familiar, Login here</button>
				</div>
			</form:form>
	</center>
</body>

</html>