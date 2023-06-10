<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<header class="header mx-auto d-flex justify-content-between fixed-top">
		<div class="pt-4 col-4">
			<div>
				<img class="myIcon" alt="location Icon"
					src="${pageContext.request.contextPath}/images/location_Icon.png">
				<a
					href="https://www.google.com/maps/place/PuppyBuddy+Boca/@26.4073937,-80.2041224,
					17z/data=!3m1!4b1!4m6!3m5!1s0x88d919850de9707d:0x3ebe8c54ab9b9c0d!8m2!3d26.4073937!4d-80.2015475!16s%2Fg%2F11pq3b4jt3?entry=ttu"
					class="location link-dark text-decoration-none">9858 Clint
					Moore Rd # 110, Boca Raton, FL 33496</a>
			</div>
			<div class="d-flex justify-content-between mt-4">
				<a href="/" class="headerAnchor link-dark text-decoration-none">Home</a>
				<a href="/aboutUs"class="headerAnchor link-dark text-decoration-none">About Us</a> 
				<a href="#" class="headerAnchor link-dark text-decoration-none">Reviews</a>
				<a href="/puppies" class="headerAnchor link-dark text-decoration-none">Puppies</a>
			</div>
		</div>
		<div>
			<img class="mylogo" alt="logo"
				src="${pageContext.request.contextPath}/images/logo.webp">
		</div>
		<div class="pt-4 col-4">
			<div class="d-flex flex-row-reverse">
				<p class=" col-5 p-1 bg-success text-light text-center rounded">
					(800) 789-7545</p>
			</div>
			<div class="d-flex justify-content-between">
				<a href="#" class="headerAnchor link-dark text-decoration-none">Service</a>
				<a href="/contactUs" class="headerAnchor link-dark text-decoration-none">ContactUs</a>
				<a href="/logout" class="headerAnchor link-dark text-decoration-none">Logout</a>
			</div>
		</div>
	</header>
	<h1 style="margin-top:150px;">Welcome, ${user.firstName}</h1>
	<form:form action="/doggies/new" method="post" modelAttribute="dog"
			style="width:50%; min-width:500px; padding-left: 10px;">
				<div class="mb-3">
					<form:label path="name">Name:</form:label>
					<form:errors path="name" class="text-danger"/>
					<form:input path="name" type="text" class="form-control" />
				</div>
				<div class="mb-3">
					<form:label path="age">Age:</form:label>
					<form:errors path="age" class="text-danger"/>
					<form:input path="age" type="number" class="form-control" />
				</div>
				<div class="mb-3">
					<form:label path="breed">Breed:</form:label>
					<form:errors path="breed" class="text-danger"/>
					<form:input path="breed" type="text" class="form-control" />
				</div>
				<div class="mb-3">
					<form:label path="weight">Mother's Weight:</form:label>
					<form:errors path="weight" class="text-danger"/>
					<form:input path="weight" type="number" class="form-control" />
				</div>
				<div class="mb-3">
					<form:label path="color">Color:</form:label>
					<form:errors path="color" class="text-danger"/>
					<form:input path="color" type="text" class="form-control" />
				</div>
				<div class="mb-3">
					<form:label path="status">Status:</form:label>
					<form:errors path="status" class="text-danger"/>
					<form:input path="status" type="text" class="form-control" />
				</div>
								<div class="mb-3">
					<form:label path="availableDate">Status:</form:label>
					<form:errors path="availableDate" class="text-danger"/>
					<form:input path="availableDate" type="date" class="form-control" />
				</div>
				<input type="submit" value="Submit"/>
	</form:form>
	<h3 class="text-center">My Catalog</h3>
	<div style="
			height:auto; 
			width:90%; 
			min-width: 650px;
			border-style: solid; 
			padding: 0 10px; 
			margin:auto; ">
			
		<table class="table table-border">
			<thead>
				<tr>
					<th>Name</th>
					<th>Age</th>
					<th>Breed</th>
					<th>Color</th>
					<th>Mom's Weight</th>
					<th>Status</th>
					<th>Date Available</th>
				</tr>
			</thead>
			<c:forEach var="oneDog" items="${doggies}">
				<tbody>
				<c:if test="${oneDog.user.id == userId}">
					<td><c:out value="${oneDog.name}"></c:out></td>
					<td><c:out value="${oneDog.age}"></c:out></td>
					<td><c:out value="${oneDog.name}"></c:out></td>
					<td><c:out value="${oneDog.breed}"></c:out></td>
					<td><c:out value="${oneDog.color}"></c:out></td>
					<td><c:out value="${oneDog.weight}"></c:out></td>
					<td><fmt:formatDate value="${oneDog.availableDate}" pattern="yyyy-MM-dd"/></td>
				</c:if>
				</tbody>
			</c:forEach>
		</table>
	</div>
	
</body>
</html>