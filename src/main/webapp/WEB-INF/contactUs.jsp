<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PuppyShop</title>
<link rel="stylesheet" href="/css/style.css">
<script type="text/javascript" src="/js/app.js"></script>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css" />
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script src="/js/javascript.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</head>
<body>

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