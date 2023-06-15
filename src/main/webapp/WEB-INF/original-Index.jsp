<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PuppyShop & Shelter</title>
<link rel="stylesheet" href="/css/style.css">
<script type="text/javascript" src="/js/app.js"></script>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css" />
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script src="/js/javascript.js"></script>

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
				<a href="/aboutUs"
					class="headerAnchor link-dark text-decoration-none">About Us</a> <a
					href="#" class="headerAnchor link-dark text-decoration-none">Puppies</a>
				<a href="#" class="headerAnchor link-dark text-decoration-none">Shelter</a>
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
				<a href="#" class="headerAnchor link-dark text-decoration-none">Reviews</a>
				<a href="/contactUs"
					class="headerAnchor link-dark text-decoration-none">ContactUs</a>
			</div>
		</div>
	</header>
	<h1 class="mb-3 display-3 col-8 mx-auto text-center"
		style="margin-top: 150px; color: #C02C30;">Welcome to PuppyShop &
		Shelter</h1>
	<div class="bg-warning position-relative"
		style="height: 800px; margin-top: 40px;">
		<img class="bgPic" alt="bg walpaper"
			src="${pageContext.request.contextPath}/images/backgroundImg.avif">
		<div class="absolute mx-auto col-8 pt-2">
			<button class="scroll-btn" onclick="scrollX(-100)"><</button>
			<button class="scroll-btn" onclick="scrollX(100)">></button>
			<div
				class=" d-flex mx-auto col-8 overflow-auto overflow-hidden scroll-container">
				<c:forEach var="i" begin="0" end="7">
					<div class="puppy rounded" onmouseover='changeColor(this);'
						onmouseout='resetColor(this);'>
						<img
							onclick='popupCenter({url: "http://localhost:8080/", title: "details", w: 500, h: 500});'
							class="mypicture" alt="my picture1" title="click me"
							src="${pageContext.request.contextPath}/images/puppyImg${i}.jpeg">

						<p class="mb-0">
							Name:
							<c:out value="${objList[i].name}" />
						</p>
						<p class="mb-0">
							Age:
							<c:out value="${objList[i].age}" />
						</p>
						<p class="mb-0">
							Type:
							<c:out value="${objList[i].type}" />
						</p>
					</div>
				</c:forEach>
			</div>
			<div class="d-flex flex-row-reverse mt-3 col-8 mx-auto">
				<a href="#" class="btn btn-large bg-success text-light rounded-pill">See
					available puppies</a>
			</div>

		</div>
	</div>
	<main>
		<h1 class="text-center my-5 pt-5">About Us</h1>
		<h5 class="text-center mx-auto col-9 p-1">We are a community of
			dog lovers, committed to connecting the nation’s top breeders to
			caring, responsible individuals and families. We hold ourselves and
			our customers to the highest standards and aim to improve the life of
			each puppy, breeder and owner who joins our family.</h5>
		<div
			class="aboutUs my-5 p-5 border border-success border-4 d-flex justify-content-around col-9 mx-auto rounded">
			<div
				class="box border border-1 border-secondary text-center p-3 rounded">
				<img class="myMainIcon" alt="safe"
					src="${pageContext.request.contextPath}/images/SafeIcon.png">
				<h3>Safe</h3>
				<p>Our breeders are vetted and screened in partnership with
					USDA.</p>
			</div>
			<div
				class="box border border-1 border-secondary text-center p-3 rounded">
				<img class="myMainIcon" alt="healthy"
					src="${pageContext.request.contextPath}/images/Healthy.png">
				<h3>Healthy</h3>
				<p>All our puppies recieve our industry-leading 10-year puppy
					health commitment.</p>
			</div>
			<div
				class="box border border-1 border-secondary text-center p-3 rounded">
				<img class="myMainIcon" alt="healthy"
					src="${pageContext.request.contextPath}/images/travel.png">
				<h3>Comfy</h3>
				<p>Our private travel network ensures your new pup arrives home
					healthy and safe.</p>
			</div>
		</div>
		<h1 class="text-center my-5 pt-5">Reviews</h1>
		<div id="divReview"
			class="reviewDiv d-flex justify-content-between mx-auto overflow-auto overflow-hidden text-nowrap">
			<c:forEach var="i" begin="1" end="3">
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
			</c:forEach>
		</div>
	</main>
	<footer class="bg-success mt-5 text-center">
		<h1
			class="text-light p-1 border border-light border-5 rounded col-3 mx-auto">PuppyShop
			& Shelter</h1>
		<div class="mx-auto col-3 mt-5 d-flex justify-content-between">
			<a href="/" class=" link-dark text-decoration-none">Home</a> <a
				href="/aboutUs" class=" link-dark text-decoration-none">About Us</a>
			<a href="/contactUs"
				class="headerAnchor link-dark text-decoration-none">Contact Us</a><a
				href="#" class=" link-dark text-decoration-none">Puppies</a> <a
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
<nav class="navbar sticky-top navbar-expand-lg" style="background-color:white;">
		<div class="container">
			<a class="navbar-brand" href="/"> <img class="mylogo rounded"
				alt="logo" src="${pageContext.request.contextPath}/images/logo.webp">
			</a>
			<c:if test="${userId != null}">
				<a href="/profile"
					style="background-color: #4CAF50;
						border: none; 
						border-radius: 10px; 
						color: white; 
						text-align: center; 
						text-decoration: none; 
						padding: 0 5px; 
						font-size: 12px;">My Profile
				</a>

			</c:if>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto w-100 justify-content-center">
					<li class="nav-item active"><a class="nav-link" href="/">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/aboutUs">About</a>
					<li class="nav-item"><a class="nav-link" href="/contactUs">Contact</a>
					<li class="nav-item"><a class="nav-link" href="/reviews">Reviews</a>
					<li class="nav-item"><a class="nav-link" href="/puppies">Puppies</a>
					<li class="nav-item">
					<c:choose>
							<c:when test="${userId != null}">
								<a href="/logout" class="nav-link">Logout</a>
							</c:when>
							<c:otherwise>
								<a href="/login" class="nav-link">Login</a>
							</c:otherwise>
					</c:choose></li>
				</ul>
			</div>
		</div>
	</nav>
	<main>
		<div
			class="d-flex justify-content-center position-relative bg-warning">
			<div class="leftbox position-absolute colBox col-6"></div>
			<div class="rightbox position-absolute colBox col-6 bg-success"></div>
			<form action=""
				class="center position-absolute bg-light text-success col-7 flex-wrap">
				<div>
					<h2 style="margin-top: 100px;">Send a Message</h2>
					<div class="d-flex flex-wrap">
						<div style="margin-right: 30px;">
							<div class="d-flex flex-column mb-3">
								<label name="fname">First Name</label> 
								<input
									class="contact-form-input border border-0 border-bottom"
									name="fname" type="text" />
							</div>
							<div class="d-flex flex-column">
								<label name="email"></label> 
								<input
									class="contact-form-input border border-0 border-bottom"
									name="email" type="email" placeholder="Email Address" />
							</div>
						</div>
						<div>
							<div class="d-flex flex-column mb-3">
								<label name="lname">Last Name</label> 
								<input
									class="contact-form-input border border-0 border-bottom"
									name="lname" type="text" />
							</div>
							<div class="d-flex flex-column">
								<label name="phone"></label> 
								<input
									class="contact-form-input border border-0 border-bottom"
									name="phone" type="number" placeholder="Mobile Number" />
							</div>
						</div>

					</div>
					<div class="" style="margin-left: -4px; margin-top: 30px;">
						<label name="message"></label>
						<textarea rows="5" cols="50" name="message"
							placeholder="write your message here"
							style="width:830px;"></textarea>
					</div>
				</div>
			</form>
			<div class="contact-info bg-success text-light position-absolute p-5">
				<h2 class="mb-5">Contact Info</h2>
				<div class="infoBox d-flex my-3">
					<img class="contact-Us-Icon bg-light rounded-circle" alt="phone"
						src="${pageContext.request.contextPath}/images/phoneContactUs.png">
					<p style="margin-left: 20px;">(800) 789-7545</p>
				</div>
				<div class="infoBox d-flex my-3">
					<img class="contact-Us-Icon bg-light rounded-circle" alt="location"
						src="${pageContext.request.contextPath}/images/locationContactUs.png">
					<p style="margin-left: 20px;">9858 Clint Moore Rd # 110 Boca
						Raton, FL 33496</p>
				</div>
				<div class="infoBox d-flex my-3">
					<img class="contact-Us-Icon bg-light rounded-circle" alt="email"
						src="${pageContext.request.contextPath}/images/emailContactUs.png">
					<p style="margin-left: 20px;">PuppyShopShelter@Email.com</p>
				</div>
			</div>
		</div>