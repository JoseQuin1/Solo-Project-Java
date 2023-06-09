<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log into your account</title>
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
								<a href="/login" class="headerAnchor link-dark text-decoration-none">Login</a>
			</div>
		</div>
	</header>
	<main 
		class="top-div-under-header d-flex justify-content-center" 
		style="min-width:500px; height:80%;" >
	<div 
		style="width:90%;">
		<img 
			class="myMainIcon" alt="safe"
			style="width:100%; height:90%;"
			src="${pageContext.request.contextPath}/images/login-Images/loginLeftColumnImg.png">
	</div>
	<div style="min-width:500px; width:500px; padding: 100px 50px 0 0;" >
		<form:form action="/login" method="post" modelAttribute="newLogin" 
			style="width:90%; height:auto;"
			class="">
					<h3 class="mb-5">Log into PuppyShop</h3>
					<div class="mb-3">
						<div class="row">
							<form:label 
								path="email"
								class="loginFormLabel">Email Address:
							</form:label>
						</div>
						<form:errors path="email" class="text-danger"/>
						<form:input path="email" type="email" class="loginFromInput" />
					</div>
					<div class="mb-3">
						<div class="row">
							<form:label 
								path="password"
								class="loginFormLabel">Password:
							</form:label>
						</div>
						<form:errors path="password" class="text-danger"/>
						<form:input path="password" type="password" class="loginFromInput" />
					</div>
					<div class="d-flex justify-content-center">
					<input type="submit" value="Login" 
						class="btn mt-3 bg-primary text-light" 
						style="width:200px; border-radius:25px;"/>
					</div>
					<div class="d-flex justify-content-between mt-4">
						<div class="loginOrLine"></div>
						<p style="color:LightGray;" >or</p>
						<div class="loginOrLine"></div>
					</div>
					<div class="d-flex justify-content-center">
						<a href="/register" 
							style="text-decoration: none; color:green;">Create new account?</a>
					</div>
		</form:form>
		</div>
	</main>
</body>
</html>