<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%--Importing all the dependent classes--%>
<%@page import="com.sforum.*"%>
<%@page import="java.util.Iterator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
	<div class="bg-primary text-white" style="padding: 20px; margin: zero;">Post
		Details</div>

	<!--  scriptlet start -->
	<%@page import="java.util.ArrayList"%>
	<%--Importing all the dependent classes--%>
	<%@page import="com.sforum.*"%>
	<%@page import="com.sforum.model.*"%>
	<%@page import="java.util.Iterator"%>
	<%
		Post post = (Post) request.getAttribute("selectedpost");
		ArrayList<Answer> answerList = (ArrayList) request.getAttribute("answers");
	%>
	<div class="card m-3 shadow-lg text-white bg-primary">
		<div class="card-body">
			<h4 class="card-title ">
				Quesstion.<%=post.getPostId()%></h4>
			<h6 class="card-subtitle mb-2">
				Asked By:
				<%=post.getEmployeeP().getEmpAlias()%></h6>
			<h6 class="card-subtitle mb-2 ">
				Posted on :
				<%=post.getPostDate().toString()%></h6>
			<p class="card-text bg-secondary font-weight-bold">
				Post Description :
				<%=post.getPostDesc()%></p>
			<c:if test="${sessionScope.adminCheck}">
				<form action="/forum/DeletePostController" method="post">
					<input type=hidden name=deletePost value=<%=post.getPostId()%>>
					<input class="btn btn-danger" style="margin-top: 5px;" type=submit
						value='Does not feel right? Delete this Question'>
				</form>
			</c:if>
		</div>
	</div>
	<%
		// Iterating through subjectList

		if (request.getAttribute("answers") != null) // Null check for the object
		{
			ArrayList<Post> searchResult = (ArrayList) request.getAttribute("answers");
			if (searchResult.size() == 0 || searchResult == null) {
	%>
	<center>
		<div class="badge badge-pill badge-success mb-3"
			style="font-size: large; padding: 20px;">No Answers added yet.</div>
		</div>
	</center>
	<c:if test="${not sessionScope.adminCheck}">
		<form:form action="addPostAnswer" modelAttribute="answer">
			<div class="card ml-5 mr-5  shadow-lg text-white bg-info">
				<h5 class="card-header">Add an Answer</h5>
				<div class="card-body">
					<h6 class="card-title">Enter Answer</h6>
					<p class="card-text">
						<form:input class="form-control shadow-lg mb-3 bg-white rounded"
							style="width: 420px; color: black;" name="answer_description"
							type="text" title="Answer" path="answerDesc"
							placeholder="What do you think about this post..."
							required="true" />
					</p>
					<form:input type="hidden" name="currentPostId"
						value="<%=post.getPostId()%>" path="" /><input type=submit
						value="Add Answer " class="btn btn-danger">
				</div>
			</div>
		</form:form>
	</c:if>
	<%
		} else {
				Iterator<Answer> iterator = answerList.iterator(); // Iterator interface

				while (iterator.hasNext()) // iterate through all the data until the last record
				{
					Answer currentAnswer = iterator.next();
					//	currentPost.getEmployeeObj().getEmp_alias()assign individual employee record to the employee class object
	%>

	<div class="card ml-4 mr-4 mb-2 mu-2 shadow-lg">
		<div class="card-body">
			<h4 class="card-title">
				Answer
				<%=currentAnswer.getAnswerId()%></h4>
			<h6 class="card-subtitle mb-2 text-muted">
				Answered By<%=currentAnswer.getEmployeeA().getEmpAlias()%></h6>
			<h6 class="card-subtitle mb-2 text-muted">
				Posted on :
				<%=currentAnswer.getAnswerDate().toString()%></h6>
			<p class="card-text"><%=currentAnswer.getAnswerDesc()%></p>
			<c:if test="${sessionScope.adminCheck}">
				<form action="/forum/DeleteAnswerController" method="post">
					<input type=hidden name=deleteAnswer
						value=<%=currentAnswer.getAnswerId()%>> <input
						class="btn btn-danger" style="margin-top: 5px;" type=submit
						value='Does not feel right? Delete this Answer'>
				</form>
			</c:if>
		</div>

	</div>
	<%
		}
	%>
	<c:if test="${not sessionScope.adminCheck}">
		<form:form action="addPostAnswer" modelAttribute="answer">
			<div class="card m-5 shadow-lg text-white bg-info">
				<h5 class="card-header">Add an Answer</h5>
				<div class="card-body">
					<h6 class="card-title">Enter Answer</h6>
					<p class="card-text">
						<form:input class="form-control shadow-lg mb-3 bg-white rounded"
							style="width: 420px; color: black;" name="answer_description"
							type="text" title="Answer" path="answerDesc"
							placeholder="What do you think about this post..."
							required="true" />
					</p>
					<p class="card-text">
						<input class="form-control shadow-lg mb-3 bg-white rounded"
							style="width: 420px; color: black;" name="answer_employee_id"
							type="hidden" title="Employee Id" value="${sessionScope.empId}"
							placeholder="What is your Employee Id..." required="true">
					</p>
					<input type=hidden name=currentPostId value=<%=post.getPostId()%>>
					<input type=submit value="Add Answer " class="btn btn-danger">
				</div>
			</div>
		</form:form>
	</c:if>
	<%
		}
		}
	%>

</body>
</ html>