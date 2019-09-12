<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%--Importing all the dependent classes--%>
<%@page import="com.sforum.*"%>
<%@page import="java.util.Iterator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>VFORUM</title>
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
<c:if test="${ empty sessionScope.user_name }">
	<jsp:forward page="/HomeController"></jsp:forward>
</c:if>
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
			<c:if test="${not sessionScope.adminCheck}">
				<a href="/forum/ViewAnsController"><li>View Your Answers</li></a>
				<a href="/forum/ViewQuestionController"><li>View Posted
						Questions</li></a>
			</c:if>
			<a href="/forum/LogoutController"><li
				href="/forum/LogoutController">Logout</li></a>
		</ul>
	</div>
	<!-- content -->

	<div class="bg-secondary text-white"
		style="padding: 20px; margin: zero;">Search Results</div>



	<!--  script-let start -->
	<%@page import="java.util.ArrayList"%>
	<%--Importing all the dependent classes--%>
	<%@page import="com.sforum.*"%>
	<%@page import="com.sforum.model.*"%>
	<%@page import="java.util.Iterator"%>
	<%--
		// Iterating through subjectList
		if (request.getAttribute("searchResult") != null) // Null check for the object
		{
			ArrayList<Post> searchResult = (ArrayList) request.getAttribute("searchResult");
			if (searchResult.size() == 0 || searchResult == null) {
	--%>

	<c:if test="${ searchResult == null }">
		<a href="/forum/index.jsp">
			<button type="button" class="btn btn-danger"
				style="margin: 20px; padding: 2px; align-content: stretch;">No
				Results to Display. Search Again. Click Here</button>
		</a>
	</c:if>
	<%--
		} else {
				Iterator<Post> iterator = searchResult.iterator(); // Iterator interface

				while (iterator.hasNext()) // iterate through all the data until the last record
				{
					Post currentPost = iterator.next();
					//	currentPost.getEmployeeObj().getEmp_alias()assign individual employee record to the employee class object
	--%>
	<c:forEach var="currentPost" items="searchResult">
		<div class="card m-5 shadow-lg">
			<div class="card-body">
				<h4 class="card-title">Q. ${currentPost.getPostId() }</h4>
				<h6 class="card-subtitle mb-2 text-muted">Asked By:
					${currentPost.getEmployeeP().getEmpAlias() }</h6>
				<h6 class="card-subtitle mb-2 text-muted">Posted on :
					${currentPost.getPostDate().toString() }</h6>
				<div class="card-text bg-primary text-white"
					style="margin: zero; padding: 10px;">
					${currentPost.getPostDesc() }</div>
				<form action="/forum/PostController" method="post">
					<input type=hidden name=currentPostId
						value=${currentPost.getPostId() }> <input
						class="btn btn-success" style="margin-top: 5px;" type=submit
						value='Show Answers'>
				</form>
				<c:if test="${sessionScope.adminCheck}">
					<form action="/forum/DeletePostController" method="post">
						<input type=hidden name=deletePost
							value=${currentPost.getPostId() }> <input
							class="btn btn-danger" style="margin-top: 5px;" type=submit
							value='Does not feel right? Delete this Question'>
					</form>
				</c:if>

			</div>
		</div>
	</c:forEach>
	<%--
		}
		}}
	--%>

</body>
</html>