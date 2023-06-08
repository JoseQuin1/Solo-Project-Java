<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Team Details</title>
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
	<header class="mx-auto col-6 py-5 d-flex justify-content-between">
		<h1><c:out value="${team.name}"/></h1>
		<a href="/teams">back to dashboard</a>
	</header>
	<main class="mx-auto col-6">
		<p>Team Name: ${team.name}</p>
		<p>Skill Level: ${team.skill_level}</p>
		<p>Game Day: ${team.gameDay}</p>
		<c:if test="${team.user.id == userId}">
			<div>
				<a href="/teams/${team.id}/edit">edit</a>
				<a href="/teams/${team.id}/delete">delete</a>
			</div>
		</c:if>
	</main>
</body>
</html>