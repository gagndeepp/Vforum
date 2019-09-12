<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<c:if test="${empty sessionScope.emp}">
	<jsp:forward page="jsp/login.jsp"></jsp:forward>
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
			<a href="viewEmpAnswers"><li>View Your Answers</li></a>
			<a href="/forum/LogoutController">
				<li href="/forum/LogoutController">Logout</li>
			</a>
		</ul>
	</div>

	<!-- content -->

	<div class="bg-primary text-white" style="padding: 20px; margin: zero;">Posts
		Posted....</div>


	<!--  script-let start -->
	<%@page import="java.util.ArrayList"%>
	<%--Importing all the dependent classes--%>
	<%@page import="com.sforum.*"%>
	<%@page import="com.sforum.model.*"%>
	<%@page import="java.util.Iterator"%>
	<%
		// Iterating through subjectList
		if (request.getAttribute("searchResult") != null) // Null check for the object
		{
			ArrayList<Post> searchResult = (ArrayList) request.getAttribute("searchResult");
			if (searchResult.size() == 0 || searchResult == null) {
	%>
	<a href="/forum/jsp/askquestion.jsp">
		<button type="button" class="btn btn-danger"
			style="margin: 20px; padding: 2px; align-content: stretch;">No
			Results to Display. Add Post. Click Here</button>
	</a>
	<%
		} else {
				Iterator<Post> iterator = searchResult.iterator(); // Iterator interface

				while (iterator.hasNext()) // iterate through all the data until the last record
				{
					Post currentPost = iterator.next();
					//	currentPost.getEmployeeObj().getEmp_alias()assign individual employee record to the employee class object
	%>

	<div class="card m-5 shadow-lg">
		<div class="card-body">
			<h4 class="card-title">
				Q.<%=currentPost.getPostId()%></h4>
			<h6 class="card-subtitle mb-2 text-muted">
				Asked By:
				<%=currentPost.getEmployeeP().getEmpAlias()%></h6>
			<h6 class="card-subtitle mb-2 text-muted">
				Posted on :
				<%=currentPost.getPostDate().toString()%></h6>

			<div class="card-text bg-primary text-white"
				style="margin: zero; padding: 10px;"><%=currentPost.getPostDesc()%></div>

			<form action="/forum/PostController" method="post">
				<input type=hidden name=currentPostId
					value=<%=currentPost.getPostId()%>> <input
					class="btn btn-success" style="margin-top: 5px;" type=submit
					value='Show Answers'>
			</form>
			<form action="editQuestion" method="post">
				<input type=hidden name=editPost value=<%=currentPost.getPostId()%>>
				<input class="btn btn-danger" style="margin-top: 5px;" type=submit
					value='Edit Quesstion'>
			</form>

		</div>
	</div>
	<%
		}
			}
		}
	%>

</body>
</html>