<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
<c:if test="${emp}">
	<jsp:forward page="/login"></jsp:forward>
</c:if>
<body id="_5" style="background-image: url(img/image1.jpg)">
	<div>
		<a href="/"> <span id="log"> <span id="i">V</span> <span
				id="cir"></span> <span id="ntro">Forum</span>
		</span>
		</a>
		<ul id="nav-bar">
			<span class="badge badge-primary " style="font-size: 25px;">${emp}</span>
			<span class="badge badge-success m-3" style="font-size: 25px;">${requestScope.message }</span>
			<c:if test="${not sessionScope.adminCheck}">
				<a href="viewEmpAnswers"><li>View Your Answers</li></a>
				<a href="viewEmpPosts"><li>View Posted Questions</li></a>
			</c:if>
			<a href="logoutController"><li href="logoutController">Logout</li></a>
		</ul>
	</div>
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
			${homeResult.size()}
			<form action="searchPosts" method="post">

				<input class="form-control shadow-lg mb-3 bg-white rounded"
					style="width: 420px; color: black;" name="searchquery" type="text"
					title="Question"
					placeholder="Looking for Some Question, simply just search here... "
					required>
				<center>
					<div>
						<input class="btn btn-primary" name="submit" type="submit"
							value="Search" class="up-in">
						<c:if test="${not sessionScope.adminCheck}">
							<input class="btn btn-warning" type="button"
								value="Create a new question"
								onclick="location.href='askQuestionPage'" id="tosign">
						</c:if>
					</div>
				</center>
			</form>

		</center>
	</div>
	<%@page import="java.util.List"%>
	<%@page import="com.sforum.*"%>
	<%@page import="com.sforum.model.*"%>
	<%@page import="java.util.Iterator"%>




	<%-- 	<%
		<c:if test="${homeResult} != null">
		if () {
			List<Post> searchResult = new ArrayList<Post>();
			if (searchResult.size() == 0 || searchResult == null) {
	%> --%>
	<c:if test="${homeResult == null}">
		<a href="/forum/index.jsp">
			<button type="button" class="btn btn-danger"
				style="margin: 20px; padding: 2px; align-content: stretch;">No
				Results to Display. Search Again. Click Here</button>
		</a>
	</c:if>
	<%--
		}else {
				Iterator<Post> iterator = searchResult.iterator();
				while (iterator.hasNext()) {
					Post currentPost = iterator.next();
	--%>
	<c:forEach items="${homeResult}" var="currentPost">
		<div class="card m-5 shadow-lg">
			<div class="card-body">
				<h4 class="card-title">Q.${currentPost.getPostId()}</h4>
				<h6 class="card-subtitle mb-2 text-muted">Asked By:
					${currentPost.getEmployeeP().getEmpAlias()}</h6>
				<h6 class="card-subtitle mb-2 text-muted">Posted on :</h6>
				<div class="card-text bg-primary text-white"
					style="margin: zero; padding: 10px;">${currentPost.getPostDesc()}</div>
				<form action="viewPostAnswers">
					<input type="hidden" name="currentPostId"
						value="${currentPost.getPostId()}" /> <input
						class="btn btn-success" style="margin-top: 5px;" type=submit
						value='Show Answers'>
				</form>
				<c:if test="${sessionScope.adminCheck}">
					<form action="" method="post">
						<input type=hidden name=deletePost value=${currentPost.getPostId()}>
						<input class="btn btn-danger" style="margin-top: 5px;" type=submit
							value='Does not feel right? Delete this Question'>
					</form>
				</c:if>
			</div>
		</div>
	</c:forEach>
	<%--
		}
		}}
	--} --%>
</body>
</html>