<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Catalog</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script type="text/javascript" src="/js/app.js"></script>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css" />
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<header class=" header fixed-top">
		<div class="mx-auto d-flex justify-content-between">
			<div class="pt-4 col-4">
				<div style="padding-left: 5px;">
					<img class="myIcon" alt="location Icon"
						src="${pageContext.request.contextPath}/images/icons/location_Icon1.png">
					<a
						href="https://www.google.com/maps/place/PuppyBuddy+Boca/@26.4073937,-80.2041224,
					17z/data=!3m1!4b1!4m6!3m5!1s0x88d919850de9707d:0x3ebe8c54ab9b9c0d!8m2!3d26.4073937!4d-80.2015475!16s%2Fg%2F11pq3b4jt3?entry=ttu"
						class="location link-dark text-decoration-none">9858 Clint
						Moore Rd # 110, Boca Raton, FL 33496</a>
				</div>
				<div class="d-flex justify-content-between mt-4">
					<div class="d-flex" style="padding-left:3px;">
						<img class="myIcon" style="height: 20px; padding-top: 2px;" alt="location Icon"
							 src="${pageContext.request.contextPath}/images/icons/home-icon.png">
						<a href="/" class="headerAnchor link-dark text-decoration-none">Home</a>
					</div>
					<a href="/aboutUs"
						class="headerAnchor link-dark text-decoration-none">About Us</a> <a
						href="/reviews"
						class="headerAnchor link-dark text-decoration-none">Reviews</a> <a
						href="/puppies"
						class="headerAnchor link-dark text-decoration-none">Puppies</a>
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
					<a href="/puppy-travel" class="headerAnchor link-dark text-decoration-none">Puppy Travel</a>
					<a href="/contactUs"
						class="headerAnchor link-dark text-decoration-none">ContactUs</a>
					<c:choose>
						<c:when test="${userId != null}">
							<a href="/logout"
								class="headerAnchor link-dark text-decoration-none">Logout</a>
						</c:when>
						<c:otherwise>
							<a href="/login"
								class="headerAnchor link-dark text-decoration-none">Login</a>
						</c:otherwise>
					</c:choose>

				</div>
			</div>
		</div>
		<div class="d-flex justify-content-center">
			<c:if test="${userId != null}">
				<a href="/profile"
					style="background-color: #4CAF50; /* Green */ border: none; border-radius: 10px; color: white; text-align: center; text-decoration: none; padding: 0 5px; font-size: 12px;">My
					Profile</a>

			</c:if>
		</div>
	</header>
	<h3 class="top-div-under-header pt-3" style="margin-left: 20px;">My Catalog</h3>
	<main class="d-flex">
		<div style="height: auto: width:23%; min-width: 300px; padding-left: 40px;">
			<div class="d-flex">
				<img class="myIcon" style="margin: 15px 10px 0 0;" alt="user Icon"
					src="${pageContext.request.contextPath}/images/icons/user-regular.svg">
				<a href="/profile" class="text-decoration-none text-dark"
					style="margin-top: 10px;">My Account</a>
			</div>
			<div class="d-flex">
				<img class="myIcon" style="margin: 15px 10px 0 0;" alt="user Icon"
					src="${pageContext.request.contextPath}/images/icons/catalog-icon.png">
				<a href="/myCatalog" class="text-decoration-none text-dark"
					style="margin-top: 10px;">My Catalog</a>
			</div>
			<div class="d-flex">
				<img class="myIcon" style="margin: 15px 10px 0 0;" alt="user Icon"
					src="${pageContext.request.contextPath}/images/icons/cart-icon.png">
				<a href="/myCatalog" class="text-decoration-none text-dark"
					style="margin-top: 10px;">Order History</a>
			</div>
		</div>
		<div style="height: 500px; width: 100%; min-width: 650px; margin-right: 30px;">
			<h4 class="text-center text-light mb-3" style="text-shadow: 2px 4px 10px #000000;">Catalog
				<a href="/doggies/new" style="margin-left: 5px; text-decoration: none; font-size: 15px;">( add )</a>
			</h4>
			<div style="
					height: 300px; 
					min-width: 650px; 
					border-style: solid; 
					border-radius: 10px; 
					border-color: #DCDCDC; 
					padding: 0 10px; 
					overflow: scroll;
					box-shadow: 2px 4px 10px #000000;">

				<table class="table table-border rounded text-center">
					<thead>
						<tr>
							<th>Name</th>
							<th>Age</th>
							<th>Breed</th>
							<th>Color</th>
							<th>Mom's Weight</th>
							<th>Status</th>
							<th>Gender</th>
							<th>Image</th>
							<th>Action</th>
						</tr>
					</thead>
					<c:forEach var="oneDog" items="${doggies}">
						<tbody>
							<c:if test="${oneDog.user.id == userId}">
 								<td><c:out value="${oneDog.name}"></c:out></td>
								<td><c:out value="${oneDog.age}"></c:out> weeks</td>
								<td><c:out value="${oneDog.breed}"></c:out></td>
								<td><c:out value="${oneDog.color}"></c:out></td>
								<td><c:out value="${oneDog.weight}"></c:out></td>
								<td><c:out value="${oneDog.status}"></c:out></td>
								<td><c:out value="${oneDog.gender}"></c:out></td>
								<td><c:out value="${oneDog.fileName}"></c:out></td>
								<td><a href="/puppy/${oneDog.id}/edit">edit</a> | <a
									href="/puppy/${oneDog.id}/delete">delete</a></td>
							</c:if>
						</tbody>
					</c:forEach>
				</table>
			</div>
		</div>
	</main>
</body>
</html>