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
<title>My Account</title>
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
	<h3 class="top-div-under-header pt-3" style="margin-left:20px;">My Account</h3>
	<main class="d-flex">
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
			<c:if test="${user.profile == 'Breeder'}">
				<div class="d-flex">
					<img class="myIcon" style="margin: 15px 10px 0 0;" alt="user Icon"
							src="${pageContext.request.contextPath}/icon/catalog-icon.png">	
					<a href="/myCatalog" 
						class="text-decoration-none text-dark" 
						style="margin-top: 10px;">My Catalog</a>
				</div>
			</c:if>
			<div class="d-flex">
				<img class="myIcon" style="margin: 15px 10px 0 0;" alt="user Icon"
						src="${pageContext.request.contextPath}/icon/cart-icon.png">	
				<a href="/myCatalog" 
					class="text-decoration-none text-dark" 
					style="margin-top: 10px;">Order History</a>
			</div>
				
		</div>
		<div style="width:70%; margin-left: 20px;">
			<h6 class="mb-3">First Name</h6>
			<p class="myAccount-p"><c:out value="${user.firstName}" /></p>
			<h6 class="my-3">Last Name</h6>
			<p class="myAccount-p"><c:out value="${user.lastName}" /></p>
			<h6 class="my-3">Email</h6>
			<p class="myAccount-p"><c:out value="${user.email}" /></p>
		</div>
	</main>
</body>
</html>