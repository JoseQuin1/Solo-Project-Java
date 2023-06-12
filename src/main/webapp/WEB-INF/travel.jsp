<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Puppy Travel</title>
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
	<main class="top-div-under-header">
		
		<div class="contrainer pt-1 text-center" style="height:auto;">
			<div class="travel-main-div d-inline-block ">
				<h3 class="text-warning mb-5">Meet the Breeder</h3>
				<p>Meet the breeder and your puppy at a location near the kennel. (Not available on all Puppies)</p>
				<p>This option is <span class="fw-bold">$287</span>, which includes:</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
					Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in 
					reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, 
					sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
					Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in 
					reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, 
					sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
			</div>
			<div class="travel-main-div d-inline-block">
				<h3 class="text-warning mb-5">Pick Up Near Your Home</h3>
				<p>Puppy travels to a location near you. <br> (Not available on all Puppies)</p>
				<p>This option is <span class="fw-bold">$799</span>, which includes:</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
					Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in 
					reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, 
					sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
					Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in 
					reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, 
					sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
			</div>
			<div class="travel-main-div d-inline-block ">
				<h3 class="text-warning mb-5">Puppy Chaperone</h3>
				<p>Puppy travels to a location near you. <br> (Not available on all Puppies)</p>
				<!-- <p>A person will pick up the puppy from the breeder location <br> and escort the puppy directly to your door step. (Not available on all Puppies)</p> -->
				<p>This option is <span class="fw-bold">$1599</span>, which includes:</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
					Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in 
					reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, 
					sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
					Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in 
					reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, 
					sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
			</div>
		</div>
	
	</main>
</body>
</html>