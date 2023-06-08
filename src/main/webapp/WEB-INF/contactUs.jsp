<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact-us</title>
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
								<a href="#" class="headerAnchor link-dark text-decoration-none">Login</a>
			</div>
		</div>
	</header>
	<main>
		<div
			class="d-flex justify-content-center position-relative bg-warning">
			<div class="leftbox position-absolute colBox col-6"></div>
			<div class="rightbox position-absolute colBox col-6 bg-success"></div>
			<form action=""
				class="center position-absolute bg-light text-success col-7">
				<div>
					<h2 style="margin-top: 100px;">Send a Message</h2>
					<div class="d-flex">
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
	</main>
</body>
</html>