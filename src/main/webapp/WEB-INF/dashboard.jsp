<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kickball League Dashboard</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
	<script type="text/javascript" src="/js/app.js"></script>
	<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<header class="mx-auto col-6 p-5">
		<div class="booksHeaderRow d-flex justify-content-between"><h1>Welcome, ${user.firstName}</h1><a href="/logout">logout</a></div>
	</header>
	<main class="mx-auto col-6 p-5">
		<div>
			<table class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>Team Name</th>
					<th>Skill Level(1-5)</th>
					<th>Game Day</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="oneTeam" items="${teams}">
					<tr>
						<td>
							<a href="/teams/${oneTeam.id}">${oneTeam.name}</a>
<%-- 							<c:if test="${oneTeam.user.id == userId}">
								<a class="btn btn-sm bg-warning" href="/classes/${oneCourse.id}/edit">edit</a>
							</c:if> --%>
						</td>
						<td>${oneTeam.skill_level}</td>
						<td>${oneTeam.gameDay}</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
		</div>
		<div><a href="/teams/new" class="btn bg-primary">Create New Team</a></div>
	</main>
</body>
</html>