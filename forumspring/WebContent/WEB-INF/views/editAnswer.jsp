<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<body id="_5" style="background-image: url(img/image1.jpg)">
	<!-- navigation bar -->
	<div>
		<a href="/"> <span id="log"> <span id="log"> <span
				id="i">V</span> <span id="cir"></span> <span id="ntro">Forum</span>
		</span>
		</a>
		<ul id="nav-bar">
			<!--You can add elements to navigation bar here like view_answer and view_question-->
			<span class="badge badge-primary " style="font-size: 14px;">${sessionScope.emp.getEmpName()}</span>
						<span class="badge badge-primary " style="font-size: 25px;">${sessionScope.admin.getAdminUname()}</span>
			
			<span class="badge badge-success m-3" style="font-size: 14px;">${requestScope.message }</span>
			
			<c:if test="${sessionScope.adminCheck}">
				<a href="/forum/ViewAnsController"><li>View Your Answers</li></a>
				<a href="/forum/ViewQuestionController"><li>View Posted
						Questions</li></a>
			</c:if>
			<a href="/forum/LogoutController"><li
				href="/forum/LogoutController">Logout</li></a>
		</ul>
	</div>

	<!-- content -->
	<div id="content">
		<center>
			<!--  	<div class="heading">
				<h1 class="logo">
					<div id="i">V</div>
					<div id="cir">i</div>
					<div id="ntro">Forum</div>
				</h1>
				<div class="badge badge-pill badge-success"
					style="font-size: large; margin: 10px; padding: 10px;">where
					question leads to answers</div>
			</div>
-->
			<form action="/forum/UpdateAnswerController" method="post">
				<div class="card m-5 shadow-lg text-white bg-info">
					<h5 class="card-header">Edit Answer</h5>
					<div class="card-body">
						<h6 class="card-title">Answer Desc</h6>
						<p class="card-text">
							<input class="form-control shadow-lg mb-3 bg-white roundesd"
								style="width: 100%; color: black;" type="text" id="customerName"
								name="answerdesc"
								value='${requestScope.currentAnswer.getAnswerDesc()}'
								placeholder="What's on your mind..." required>
						</p>
						<p class="card-text">
							<input class="form-control shadow-lg mb-3 bg-white rounded"
								style="width: 420px; color: black;" name="currentanswerId"
								type="hidden" title="Employee Id"
								value="${requestScope.currentAnswer.getAnswerId()}" required>
						</p>
						<!--  	<input type=hidden name=newanswerpostid
							value=>-->
						<input type=submit value="Execute Update Answer "
							class="btn btn-danger">
					</div>
				</div>
			</form>

		</center>
	</div>
</body>
</html>