<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reviews</title>
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
	<main class="top-div-under-header text-center">
		<div class="py-5">
			<h1>Genuine Customer Reviews</h1>
			<p class="mx-auto col-6 mt-5">PuppyShop is a safe, easy, and responsible way to find your new puppy. We serve you best by putting the health and well-being of your puppy first. Don't just take our word for it.</p>
		</div>
		<div class="d-flex mx-auto col-6" style="margin: 20px 0 150px 0;">
			<div class="text-center">
				<h4 class="pt-4">4.3 / 5</h4>
				<img style="margin: -110px 0 -100px 0; height: 300px;" class="mylogo" alt="logo"
					 src="${pageContext.request.contextPath}/images/icons/four-star-rating.jpeg">
				<h4>Based on 12,000 verified reviews</h4>
			</div>
			<div style="width:50%; margin-left: 100px;">
				<h4>12,000 verified reviews</h4>
				<div class=d-flex>
					<p>5 Stars</p>
					<div class="bg-warning" style="width:70%; height: 20px; margin: 0 15px;"></div>
					<p>11,000</p>
				</div>
								<div class=d-flex>
					<p>4 Stars</p>
					<div class="bg-warning" style="width:20%; height: 20px; margin: 0 15px;"></div>
					<p>1,000</p>
				</div>
								<div class=d-flex>
					<p>3 Stars</p>
					<div class="bg-warning" style="width:10%; height: 20px; margin: 0 15px;"></div>
					<p>700</p>
				</div>
								<div class=d-flex>
					<p>2 Stars</p>
					<div class="bg-warning" style="width:4%; height: 20px; margin: 0 15px;"></div>
					<p>200</p>
				</div>
					<div class=d-flex>
					<p>1 Stars</p>
					<div class="bg-warning" style="width:2%; height: 20px; margin: 0 15px;"></div>
					<p>100</p>
				</div>
			</div>
		</div>
	</main>
		<div class="mx-auto col-6" style="margin-bottom: 100px;">
			<c:forEach var="i" begin="1" end="3">
			<div class="d-flex mb-5 border border-light rounded shadow p-3 mb-5 bg-body">
				<img class="personReview rounded" alt="person${i}"
					src="${pageContext.request.contextPath}/images/person${i}.jpeg">
				<div class="px-3">
					<div class="">
						<c:if test="${i==1}">
							<p class="m-0 p-0">by Chris W.</p>
						</c:if>
						<c:if test="${i==2}">
							<p class="m-0 p-0">by Mark C.</p>
						</c:if>
						<c:if test="${i==3}">
							<p class="m-0 p-0">by Chloe P.</p>
						</c:if>
						<img class="ratingIcon" alt="fiveStar"
							src="${pageContext.request.contextPath}/images/fiveStarRating.jpeg">
					</div>
					<p class="m-0 p-0">I am so in love with my new fur babies,</p>
					<p class="m-0 p-0">they are absolutely amazing.</p>
					<p class="m-0 p-0">They were pretty much trained when I got</p>
					<p class="m-0 p-0">them at 19 weeks old and they are learning
						more every day.</p>
				</div>
				</div>
			</c:forEach>
		</div>
		<footer class="bg-success mt-5 text-center">
		<h1 class="text-light col-2 mx-auto pb-2"
			style="text-shadow: 2px 4px 10px #000000; back-ground-color: white;">PuppyShop</h1>
		<div class="mx-auto col-3 mt-5 d-flex justify-content-between">
			<a href="/" class=" link-dark text-decoration-none">Home</a> <a
				href="/aboutUs" class=" link-dark text-decoration-none">About Us</a>
			<a href="/contactUs"
				class="headerAnchor link-dark text-decoration-none">Contact Us</a> <a
				href="/puppies" class=" link-dark text-decoration-none">Puppies</a>
			<a href="/reviews" class=" link-dark text-decoration-none">Reviews</a>
			<a href="/travel" class=" link-dark text-decoration-none">Puppy Travel</a>
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