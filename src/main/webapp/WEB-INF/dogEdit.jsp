<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>
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
	<main class="top-div-under-header border border-light rounded">
	<div class="d-flex">
		<div style="
				height:auto:
				width:30%; 
				min-width:300px;
				padding-left: 40px;">
			<div class="d-flex">
				<img class="myIcon" style="margin: 15px 10px 0 0;" alt="user Icon"
						src="${pageContext.request.contextPath}/icon/user-regular.svg">	
				<a href="/profile" 
					class="text-decoration-none text-dark" 
					style="margin-top: 10px;">My Account</a>
			</div>
			<div class="d-flex">
				<img class="myIcon" style="margin: 15px 10px 0 0;" alt="user Icon"
						src="${pageContext.request.contextPath}/icon/catalog-icon.png">	
				<a href="/myCatalog" 
					class="text-decoration-none text-dark" 
					style="margin-top: 10px;">My Catalog</a>
			</div>
			<div class="d-flex">
				<img class="myIcon" style="margin: 15px 10px 0 0;" alt="user Icon"
						src="${pageContext.request.contextPath}/icon/cart-icon.png">	
				<a href="/myCatalog" 
					class="text-decoration-none text-dark" 
					style="margin-top: 10px;">Order History</a>
			</div>
				
		</div>
		<div style="margin-left: 15%;">
		<form:form action="/puppy/${dog.id}/edit" method="put" modelAttribute="dog" enctype="multipart/form-data"
				style="
					width:30%;
					min-width:500px;
					padding: 30px;
					background-color:#F0F8FF;">
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
				<div class="d-flex justify-content-between"
					style="margin:20px 0;">
					<div class="mb-3">
						<form:label path="color">Color:</form:label>
						<form:errors path="color" class="text-danger"/>
						<form:select path="color">
							<option value="${dog.color}"><c:out value="${dog.color}"/></option>
							<option value="white">White</option>
							<option value="beige">Beige</option>
							<option value="brown">Brown</option>
							<option value="black">Black</option>
							<option value="gold">Gold</option>
							<option value="red">Red</option>
							<option value="gray">Gray</option>
						</form:select>
					</div>
					<div class="mb-3">
						<form:label path="status">Status:</form:label>
						<form:errors path="status" class="text-danger"/>
						<form:select path="status">
							<option value="${dog.status}"><c:out value="${dog.status}"/></option>
							<option value="avilable">Available</option>
							<option value="unavailable">Unavailable</option>
						</form:select>
	 				</div>
	 				<div class="mb-3">
						<form:label path="gender">Gender:</form:label>
						<form:errors path="gender" class="text-danger"/>
						<form:select path="gender">
							<option value="${dog.gender}"><c:out value="${dog.gender}"/></option>
							<option value="male">M</option>
							<option value="female">F</option>
						</form:select>
	 				</div>
 				</div>
			<input type="file" name="file" />
					<input type="submit" value="Submit" class="mt-4 bg-primary text-light" style="width:100%;"/>
	</form:form>
	</div>
	</div>
		</main>

	
</body>
</html>