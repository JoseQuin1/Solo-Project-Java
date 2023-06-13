<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Puppy Details</title>
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
	<main class="top-div-under-header mx-auto">

		<h1 class="text-center my-5 pt-5 text-light"
			style="text-shadow: 2px 4px 10px #000000;">Puppy Details</h1>
		
			<div
				class="d-flex justify-content-center flex-wrap mx-auto py-5 rounded"
				style="min-width: 300px; ">
					
				<div class="text-end p-3">
					<p><a href="/like/${oneDog.id}"
							style="text-shadow: 2px 4px 10px #000000; text-decoration: none; color: orange;">Ask About Me</a></p>
					<p><a href="/like/${oneDog.id}"
							style="text-shadow: 2px 4px 10px #000000; text-decoration: none; color: orange;">Like me</a></p>
					<p><span class="text-success">Name:</span> <span class="dog-details"><c:out value="${oneDog.name}"/></span></p>
					<p><span class="text-success">Age:</span> <span class="dog-details"><c:out value="${oneDog.age}"/> weeks</span> </p>
					<c:choose>
						<c:when test="${oneDog.gender == 'f'}">
							<p><span class="text-success">Gender:</span> <span class="dog-details">Female</span></p>
						</c:when>
						<c:otherwise>
							<p><span class="text-success">Gender:</span> <span class="dog-details">Male</span></p>
						</c:otherwise>
					</c:choose>
					<p><span class="text-success">Breed: </span> <span class="dog-details"><c:out value="${oneDog.breed}"/></span></p>
					<p><span class="text-success">Color: </span> <span class="dog-details"><c:out value="${oneDog.color}"/></span></p>
					<p><span class="text-success">Moms Weight: </span> <span class="dog-details"><c:out value="${oneDog.weight}"/> lbs</span> </p>
					<p><span class="text-success">Status: </span> <span class="dog-details"><c:out value="${oneDog.status}"/></span></p>
					
				</div>
	
				<div class="text-center p-3">
					<img
						style="height: 370px; box-shadow: 2px 4px 10px #000000;"
						alt="puppyImg"
						src="${pageContext.request.contextPath}/images/puppyImg${oneDog.id}.jpeg">
	
				</div>
				
					
			</div>
			<div class="d-flex justify-content-between flex-wrap mx-5"
				style="min-width: 900px;"
			>
				<div 
					class="mid-box border border-solid border-3 col-6"
					style="border-radius: 0 35px 35px 0;">
					<h3>About Me!</h3>
					<p>This is my time to shine! Only, the designer of this project is <span class="text-danger fw-bold">lazy,</span> and only wants to give you "<span style="color:orange;font-weight: bold;">filler</span>" text. 
						I'll keep it short and say, <span style="color:orange; font-weight: bold;">pick me, i'm adorable!</span> Oh, Yeah! I'm totally worth the price, don't even think about it, just do it! I'm waiting!</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, 
					quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
					Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
					Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
					
					<div style="margin: 40px 0;">
						<c:forEach var="i" begin="1" end="2">
						<div class="d-flex my-4 border border-light">
							<img class="puppy-details-Review rounded" alt="person${i}"
								src="${pageContext.request.contextPath}/images/person${i}.jpeg">
							<div class="px-3">
								<div class="">
									<c:if test="${i==1}">
										<p class="m-0 p-0">by Chris W.</p>
									</c:if>
									<c:if test="${i==2}">
										<p class="m-0 p-0">by Mark C.</p>
									</c:if>
									<img class="ratingIcon" alt="fiveStar"
										src="${pageContext.request.contextPath}/images/fiveStarRating.jpeg">
								</div>
								<p class="m-0 p-0">I am so in love with my new fur babies,</p>
								<p class="m-0 p-0">they are absolutely amazing.</p>
								<p class="m-0 p-0">They were pretty much trained when I got</p>
								<p class="m-0 p-0">them at 19 weeks old and they are learning more every day.</p>
							</div>
						</div>
						</c:forEach>
					</div>
				</div>
					
				<div 
					class="mid-box border border-solid border-3 col-6" 
					style="box-shadow: 2px 4px 10px #000000; border-radius: 35px 0 0 35px;
					">
					<h3 style="border-bottom: 2px solid gray; padding-bottom: 20px;">What comes included FREE with each of our puppies</h3>
					<p class="info-col d-flex justify-content-between">Health Warranty 
						<img style="height: 40px;"
							alt="puppyImg" src="${pageContext.request.contextPath}/images/icons/thumbs-up-icon.jpeg"></p>	
					<p class="info-col">Health Certificate
						<img style="height: 40px;"
							alt="puppyImg" src="${pageContext.request.contextPath}/images/icons/thumbs-up-icon.jpeg"></p>
					<p class="info-col">Top Breeders
						<img style="height: 40px;"
							alt="puppyImg" src="${pageContext.request.contextPath}/images/icons/thumbs-up-icon.jpeg"></p>
					<p class="info-col">No Puppy Mill Promise
						<img style="height: 40px;"
							alt="puppyImg" src="${pageContext.request.contextPath}/images/icons/thumbs-up-icon.jpeg"> </p>
					<p class="info-col">Exclusive Training Package 
						<img style="height: 40px;"
							alt="puppyImg" src="${pageContext.request.contextPath}/images/icons/thumbs-up-icon.jpeg"></p>
					<p class="info-col">Transparent Online Pricing 
						<img style="height: 40px;"
							alt="puppyImg" src="${pageContext.request.contextPath}/images/icons/thumbs-up-icon.jpeg"></p>
					<p class="info-col">Up to 100% Financing 
						<img style="height: 40px;"
							alt="puppyImg" src="${pageContext.request.contextPath}/images/icons/thumbs-up-icon.jpeg"></p>
					<p class="info-col">Microchipped 
						<img style="height: 40px;"
							alt="puppyImg" src="${pageContext.request.contextPath}/images/icons/thumbs-up-icon.jpeg"></p>
					<p class="info-col">Veterinary Perks & Discounts 
						<img style="height: 40px;"
							alt="puppyImg" src="${pageContext.request.contextPath}/images/icons/thumbs-up-icon.jpeg"></p>
					<p class="info-col">Puppy Care Instructions and Guidance 
						<img style="height: 40px;"
							alt="puppyImg" src="${pageContext.request.contextPath}/images/icons/thumbs-up-icon.jpeg"></p>
					<p class="info-col">Microchipped 
						<img style="height: 40px;"
							alt="puppyImg" src="${pageContext.request.contextPath}/images/icons/thumbs-up-icon.jpeg"></p>
					
				</div>
					

			</div>

	</main>
	<footer class="bg-success mt-5 mx-auto my-auto">
		<h1 class="text-light col-2 text-center mx-auto pb-2"
			style="text-shadow: 2px 4px 10px #000000; back-ground-color: white;">PuppyShop</h1>
		<div class="mx-auto mt-5 col-4 d-flex justify-content-between flex-wrap">
			<a href="/" class=" link-dark text-decoration-none">Home</a> <a
				href="/aboutUs" class=" link-dark text-decoration-none">About Us</a>
			<a href="/contactUs"
				class="headerAnchor link-dark text-decoration-none">Contact Us</a> <a
				href="/puppies" class=" link-dark text-decoration-none">Puppies</a>
			<a href="/reviews" class=" link-dark text-decoration-none">Reviews</a>
			<a href="/travel" class=" link-dark text-decoration-none">Puppy Travel</a>
		</div>
		<div class="
				d-flex 
				justify-content-between 
				mx-auto
				my-5 pb-5 col-5
				text-light
				flex-wrap" style="height:auto;">
			<div class="d-flex justify-content-between p-2">
				<img class="footerIcon" alt="phone"
					src="${pageContext.request.contextPath}/images/phone-call.png">
				<p>(800) 789-7545</p>
			</div>
			<div class="d-flex justify-content-between p-2">
				<img class="footerIcon" alt="location"
					src="${pageContext.request.contextPath}/images/location_icon.png">
				<p>9858 Clint Moore Rd # 110 <br>Boca Raton, FL 33496</p>
			</div>
			<div class="d-flex justify-content-between p-2">
				<img class="footerIcon" alt="email"
					src="${pageContext.request.contextPath}/images/email.png">
				<p>PuppyShop@Email.com</p>
			</div>
		</div>
		<div class="bg-white py-3 mx-auto text-center">
			<p>
				Copyright <span><img class="copyRightIcon" alt="copyright"
					src="${pageContext.request.contextPath}/images/copyright.png"></span>
				2023 PuppyShopShelter.com - All Rights Reserved.
			</p>
		</div>
	</footer>
</body>
</html>