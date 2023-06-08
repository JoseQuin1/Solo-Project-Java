<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create New Team</title>
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
		<h1>New Team</h1>
	</header>
	<main class="mx-auto col-6">
		<form:form action="/teams/new" method="post" modelAttribute="team">
			<div class="pb-3">
				<form:errors path="name" class="error text-danger"/>
				<form:label path="name">Team Name:</form:label>
				<form:input path="name" type="text"/>
			</div>
			<div class="pb-3">
				<form:errors path="skill_level" class="error text-danger"/>
				<form:label path="skill_level">Skill Level (1-5):</form:label>
				<form:input path="skill_level" type="number" min="1" max="5"/>
			</div>
			<div class="pb-3">
				<form:errors path="gameDay" class="error text-danger"/>
				<form:label path="gameDay">Game Day:</form:label>
				<form:select path="gameDay">
					<option selected="selected"></option>
					<option value="Sunday">Sunday</option>
					<option value="Monday">Monday</option>
					<option value="Tuesday">Tuesday</option>
					<option value="Wednesday">Wednesday</option>
					<option value="Thursday">Thursday</option>
					<option value="Friday">Friday</option>
					<option value="Saturday">Saturday</option>
				</form:select>
			</div>
			<div><input type="submit" value="Submit" class="btn btn-primary text-light btn-sm"/></div>
		</form:form>
	</main>
</body>
</html>