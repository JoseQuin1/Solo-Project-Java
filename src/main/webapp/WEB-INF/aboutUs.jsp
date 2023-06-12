<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About-Us</title>
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
				<a href="/aboutUs"
					class="headerAnchor link-dark text-decoration-none">About Us</a> <a
					href="/reviews" class="headerAnchor link-dark text-decoration-none">Reviews</a>
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
				<a href="/contactUs"
					class="headerAnchor link-dark text-decoration-none">ContactUs</a>
				<c:choose>
					<c:when test="${userId != null}">
						<a	href="/logout" class="headerAnchor link-dark text-decoration-none">Logout</a>
					</c:when>
					<c:otherwise>
						<a href="/login" class="headerAnchor link-dark text-decoration-none">Login</a>
					</c:otherwise>
				</c:choose>
				
			</div>
		</div>
	</div>
		<div class="d-flex justify-content-center">
			<c:if test="${userId != null}">
			<a href="/profile"
				style="  background-color: #4CAF50; /* Green */
  border: none;
  border-radius: 10px;
  color: white;
  text-align: center;
  text-decoration: none;
  padding:0 5px;
  font-size: 12px;"
					>My Profile</a>

			</c:if> 
		</div>
	</header>
	<div class="divRow d-flex justify-content-center mx-auto col-7">
		<img class="aboutUs-mission-pic" alt="aboutUs-picture"
			src="${pageContext.request.contextPath}/images/aboutUs-pic.jpeg">
		<h1 class="p-3 mt-5 display-5">Our mission is to make lives
			better by placing healthy puppies and adult dogs in happy homes</h1>
	</div>
	<div class="divRow d-flex justify-content-center mx-auto col-7">
		<h1 class="p-2 mt-5 display-5">We have placed over 100,000 dogs
			into over 100,000 homes.</h1>
		<img class="aboutUs-mission-pic2" alt="aboutUs-picture2"
			src="${pageContext.request.contextPath}/images/aboutUs-pic2.jpeg">
	</div>
	<h1 class="divRow mx-auto text-center">LeaderShip</h1>

	<c:forEach var="i" begin="1" end="3">
		<div class="divRow mx-auto d-flex justify-content-center col-6">
			<img class="rounded" alt="person${i}"
				src="${pageContext.request.contextPath}/images/aboutUs-person${i}-pic.jpeg">
			<div class="px-3">
				<div class="">
					<c:if test="${i==1}">
						<h5 class="m-0 pb-2">David Cannon - CEO</h5>
					</c:if>
					<c:if test="${i==2}">
						<h5 class="m-0 pb-2">Mark Willington - CIO</h5>
					</c:if>
					<c:if test="${i==3}">
						<h5 class="m-0 pb-2">Chloe Decker - CFO</h5>
					</c:if>
				</div>
				<p class="m-0">Lorem ipsum dolor sit amet, consectetur
					adipiscing elit, sed do eiusmod tempor incididunt ut labore et
					dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
					exercitation ullamco laboris nisi ut aliquip ex ea commodo
					consequat. Duis aute irure dolor in reprehenderit in voluptate
					velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
					occaecat cupidatat non proident, sunt in culpa qui officia deserunt
					mollit anim id est laborum.</p>
			</div>
		</div>
	</c:forEach>
	<footer class="bg-success mt-5 text-center">
		<h1
			class="text-light p-1 border border-light border-5 rounded col-3 mx-auto">Puppy
			Shop & Shelter</h1>
		<div class="mx-auto col-3 mt-5 d-flex justify-content-between">
			<a href="/" class=" link-dark text-decoration-none">Home</a> <a
				href="/aboutUs" class=" link-dark text-decoration-none">About Us</a> <a 
				href="/contactUs" class="headerAnchor link-dark text-decoration-none">ContactUs</a><a
				href="#" class=" link-dark text-decoration-none">Puppies</a><a
				href="#" class=" link-dark text-decoration-none">Shelter</a>
		</div>
		<div
			class="d-flex justify-content-between mx-auto col-5 my-5 pb-5 text-light">
			<div class="d-flex justify-content-between">
				<img class="footerIcon" alt="phone"
					src="${pageContext.request.contextPath}/images/phone-call.png">
				<p>(800) 789-7545</p>
			</div>
			<div class="d-flex justify-content-between col-4">
				<img class="footerIcon" alt="location"
					src="${pageContext.request.contextPath}/images/location_icon.png">
				<p class="">9858 Clint Moore Rd # 110 Boca Raton, FL 33496</p>
			</div>
			<div class="d-flex justify-content-between">
				<img class="footerIcon" alt="email"
					src="${pageContext.request.contextPath}/images/email.png">
				<p>PuppyShopShelter@Email.com</p>
			</div>
		</div>
		<div class="bg-white py-3">
			<p>
				Copyright <span><img class="copyRightIcon" alt="copyright"
					src="${pageContext.request.contextPath}/images/copyright.png"></span>
				2023 PuppyShopShelter.com - All Rights Reserved.
			</p>
		</div>
	</footer>
</body>
</html>