<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<body id="_5"
	style="background-image: url(<c:url value="img/image1.jpg" />)">
	<a href=""> <span id="log"> <span id="i">V</span> <span
			id="cir"></span> <span id="ntro">Forum</span>
	</span></a>
	<ul id="nav-bar">
		<span class="badge badge-success m-3" style="font-size: 14px;">${requestScope.message }</span>
	</ul>

	<div class='d-flex justify-content-center p-5'>
		<div class="card m-5 shadow-lg text-white bg-info mw-50 ">
			<form:form action="checkLogin" modelAttribute="employee">

				<h5 class="card-header">Login as Employee</h5>
				<div class="card-body">
					<h6 class="card-title ">Enter Emp id</h6>
					<p class="card-text">
						<form:input
							class="form-control shadow-lg mb-3 bg-white rounded user11"
							style="width: 420px; color: black;" path="empId" type="number"
							placeholder="Are you really an Employee..." required="true" />
					</p>
					<h6 class="card-title">Enter Password</h6>
					<p class="card-text">
						<form:input class="form-control shadow-lg mb-3 bg-white rounded"
							path="empPassword" style="width: 420px; color: black;"
							var="key-emp" type="password"
							placeholder="Let's check your memory..." required="true" />
					</p>

					<input type=submit value="Login as Employee" class="btn btn-danger">
			</form:form>
			<form action="registerPage">
				<input type=submit class="btn btn-warning"
					value="New Here? Register">
			</form>


		</div>

	</div>

	<div class="card m-5 shadow-lg text-white bg-info mw-50 ">
		<form action="/forum/AdminLoginController" method="post">
			<h5 class="card-header">Login as Admin</h5>
			<div class="card-body">
				<h6 class="card-title">Enter Admin id</h6>
				<p class="card-text">
					<input class="form-control shadow-lg mb-3 bg-white rounded"
						style="width: 420px; color: black;" name="admin_id" class="user11"
						type="number" placeholder="Are you really an admin..."
						required="true">
				</p>
				<h6 class="card-title">Enter Password</h6>
				<p class="card-text">
					<input class="form-control shadow-lg mb-3 bg-white rounded"
						name="passwrd" style="width: 420px; color: black;" id="key-admin"
						type="password" placeholder="Let's check your memory..."
						required="true">
				</p>

				<input type=submit value="Login as Admin" class="btn btn-danger">

			</div>
		</form>
	</div>

	</div>


	<!-- content 
	<div id="content">
		<center>
			<div class="heading">
				<h1 class="logo">
					<div id="i">V</div>
					<div id="cir">i</div>
					<div id="ntro">Forum</div>
				</h1>
				<div class="badge badge-pill badge-success"
					style="font-size: large; margin: 10px; padding: 10px;">where
					question leads to answers</div>
			</div>

			<form action="/forum/SearchController" method="post">

				<input class="form-control shadow-lg mb-3 bg-white rounded"
					style="width: 420px; color: black;" name="searchquery" type="text"
					title="Question"
					placeholder="Looking for Some Question, simply just search here... "
					required>

				<center>
					<div>
						<input class="btn btn-primary" name="submit" type="submit"
							value="Search" class="up-in"> <input
							class="btn btn-warning" type="button"
							value="Create a new question"
							onclick="location.href='/forum/jsp/askquestion.jsp'" id="tosign">
					</div>
				</center>
			</form>

		</center>
	</div>
	-->
</body>

</html>