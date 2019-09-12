<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>VFORUM</title>
<link type="text/css" rel="stylesheet"
	href="<c:url value="css/style.css"/>">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link type="text/css" rel="stylesheet"
	href="<c:url value="css/material.css" />">
<link type="text/css" rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet"
	href="<c:url value="css/font.css" />">
</head>
<body id="_5" style="background-image: url(./img/image1.jpg)">
	<!-- navigation bar -->
	<div>
		<a href="/forum/HomeController"> <span id="log"> <span
				id="i">V</span> <span id="cir"></span> <span id="ntro">Forum</span>
		</span>
		</a>
		<ul id="nav-bar">
			<!--You can add elements to navigation bar here like view_answer and view_question-->
			<span class="badge badge-primary " style="font-size: 14px;">${sessionScope.emp.getEmpName()}</span>
			<span class="badge badge-primary " style="font-size: 25px;">${sessionScope.admin.getAdminUname()}</span>

			<span class="badge badge-success m-3" style="font-size: 14px;">${requestScope.message }</span>
			<a href="viewEmpPosts"><li>View Posted Questions</li></a>
			<a href="/forum/LogoutController"><li>Logout</li></a>
		</ul>
	</div>
	<!-- content -->
	<div class="bg-primary text-white mb-2"
		style="padding: 20px; margin: zero;">All Answers</div>
	<!--  scriptlet start -->
	<%@page import="java.util.ArrayList"%>
	<%--Importing all the dependent classes--%>
	<%@page import="com.sforum.*"%>
	<%@page import="com.sforum.model.*"%>
	<%@page import="java.util.Iterator"%>
	<%--
		ArrayList<Answer> answerList = (ArrayList) request.getAttribute("answers");
	--%>
	<%--
		// Iterating through subjectList

		if (request.getAttribute("answers") != null) // Null check for the object
		{
			ArrayList<Answer> searchResult = (ArrayList) request.getAttribute("answers");
			if (searchResult.size() == 0 || searchResult == null) {
	--%>
	<c:if test="${ answers == null}">
		<div class="badge badge-pill badge-success mb-3"
			style="font-size: large; padding: 20px;">No Answers added by
			this user yet.</div>
		</center>
	</c:if>
	<center>
		<%--
		} else {
				Iterator<Answer> iterator = answerList.iterator(); // Iterator interface

				while (iterator.hasNext()) // iterate through all the data until the last record
				{
					Answer currentAnswer = iterator.next();
					//	currentPost.getEmployeeObj().getEmp_alias()assign individual employee record to the employee class object
	--%>
		<c:forEach var="currentAnswer" items="answers">
			<div class="card ml-4 mr-4 mb-2 mu-2 shadow-lg">
				<div class="card-body">
					<h4 class="card-title">Answer { currentAnswer.getAnswerId() }
					</h4>
					<h6 class="card-subtitle mb-2 text-muted">Answered By ${ currentAnswer.getEmployeeA().getEmpAlias() }
					</h6>
					<h6 class="card-subtitle mb-2 text-muted">Posted on : ${ currentAnswer.getAnswerDate().toString() }
					</h6>
					<p class="card-text">${ currentAnswer.getAnswerDesc() }</p>
					<form action="/forum/PostController" method="post">
						<input type=hidden name=currentPostId
							value=${ currentAnswer.getPostA().getPostId() }> <input
							class="btn btn-success" style="margin-top: 5px;" type=submit
							value='Show Entire Post'>
					</form>
					<form action="/forum/EditAnswerController" method="post">
						<input type=hidden name=editAnswer
							value=${ currentAnswer.getAnswerId() }> <input
							class="btn btn-danger" style="margin-top: 5px;" type=submit
							value='Edit Answer'>
					</form>
				</div>
			</div>
		</c:forEach>
		<%--
		}
	--%>

		<%--
			}}
		--%>
</body>
</html>