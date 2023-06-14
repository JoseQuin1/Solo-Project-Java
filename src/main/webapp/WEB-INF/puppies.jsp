<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Puppies</title>
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
	<header class=" header fixed-top flex-wrap">
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
					<div class="d-flex" style="padding-left: 3px;">
						<img class="myIcon" style="height: 20px; padding-top: 2px;"
							alt="location Icon"
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
					<a href="/puppy-travel"
						class="headerAnchor link-dark text-decoration-none">Puppy
						Travel</a> <a href="/contactUs"
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
	<main class="top-div-under-header pt-3">
		<div class="col-6 mx-auto">
			<h1 class="mb-3" style="margin-bottom: 50px;">Available Puppies for sale</h1>
			<p>Please browse our selection of puppies, and discover your perfect companion.</p>
			<div class="row mt-5">
				<c:forEach var="oneDog" items="${dogs}" varStatus="status">
					<c:if test="${oneDog.user.id == null}">
						<div class="col-md-4">
													
							<div class="m-3 p-2 border border-3" 
								style=" width:100px; min-width:220px; box-shadow: 2px 4px 10px #000000; border-radius:15px; border-color:lightgray;">
								<a href="/puppy/${oneDog.id}"><img class="rounded"
									style="
										height: 200px; width:200px; margin: 0 15px 5px 0;" alt="puppy pic"
									title="click me"
									src="${pageContext.request.contextPath}/images/puppyImg${oneDog.id}.jpeg"></a>
								<c:choose>
									<c:when test="${oneDog.userWhoLiked.contains(currentUser)}">
										<a href="/unlike/${oneDog.id}"
											style=" text-shadow: 2px 4px 10px #000000; text-decoration: none;">unlike</a>
									</c:when>
									<c:otherwise>
										<a href="/like/${oneDog.id}"
											style=" text-shadow: 2px 4px 10px #000000; text-decoration: none;">like</a>
									</c:otherwise>
								</c:choose>	
								<p class="text-danger font-weight-bold" style="font-size:20px;">
									<c:out value="${oneDog.name}" /></p>
								<p class=""style="font-size:15px; margin-top:-15px">
									<c:out value="${oneDog.age}" /> weeks</p>
								<p class="" style="font-size:15px; margin-top:-15px;">
									<c:out value="${oneDog.breed}" /></p>
									
							</div>
							
						</div>
						<c:if test="${status.count % 3==0 }">
							<div class="row"></div>
						</c:if>
					</c:if>
				</c:forEach>
			</div>

		</div>
	</main>
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
			<a href="/travel" class=" link-dark text-decoration-none">Puppy
				Travel</a>
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