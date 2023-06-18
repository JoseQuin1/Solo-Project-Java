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

</head>
<body>
	<nav class="navbar sticky-top navbar-expand-lg"
		style="background-color: white;">
		<div class="container border-bottom">
			<a class="navbar-brand" href="/"> <img class="mylogo rounded"
				alt="logo" src="${pageContext.request.contextPath}/images/logo.webp">
			</a>
			<c:if test="${userId != null}">
				<a href="/profile"class="profile-anchor-tag">My Profile </a>

			</c:if>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto w-100 justify-content-end">
					<li class="nav-item active"><a class="nav-link" href="/">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/aboutUs">About</a>
					<li class="nav-item"><a class="nav-link" href="/contactUs">Contact</a>
					<li class="nav-item"><a class="nav-link" href="/reviews">Reviews</a>
					<li class="nav-item"><a class="nav-link" href="/puppies">Puppies</a>
					<li class="nav-item"><a class="nav-link" href="/travel">Travel</a>
					<li class="nav-item"><c:choose>
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
	<main class="pt-5">
		<div class="main-box mx-auto p-5 col-8 d-flex justify-content-center flex-wrap rounded">
			
			  	<div class="contact-card-info">
					<div class="d-flex">
						<img class="contact-Us-Icon rounded-circle" alt="phone"
							src="${pageContext.request.contextPath}/images/phoneContactUs.png">
						<p class="contact-info">(800) 789-7545</p>
					</div>
					<div class="d-flex"style="margin: 30px 0;">
						<img class="contact-Us-Icon rounded-circle" alt="email"
							src="${pageContext.request.contextPath}/images/emailContactUs.png">
						<p class="contact-info">PuppyShopShelter@Email.com</p>
					</div>
					<div class="d-flex">
						<img class="contact-Us-Icon  rounded-circle" alt="location"
							src="${pageContext.request.contextPath}/images/locationContactUs.png">
						<p class="contact-info">9858 Clint Moore Rd # 110 <br>Boca
							Raton, FL 33496</p>
					</div>
				</div>
		<form:form action="/contactUs" method="post" modelAttribute="message"
				class="m-2" style="min-width:400px; height: auto; width:500px;">
					<h2 class="text-center"style="padding: 5px 0 0 5px;">Send a Message</h2>
					<div class="d-flex justify-content-between">
						<div class="p-2">
							<form:label path="firstName" ></form:label>
							<form:errors path="firstName" class="text-danger"/>
							<form:input path="firstName" type="text" placeholder="First Name" class="contact-form-input"/>
								
							<form:label path="email"></form:label> 
							<form:errors path="email" class="text-danger"/>
							<form:input path="email" type="email" placeholder="Email Address" class="contact-form-input" />
						</div>
						<div class="p-2 rounded">
							<form:label path="lastName" class=""></form:label>
							<form:errors path="lastName" class="text-danger"/>
							<form:input path="lastName" type="text" placeholder="Last Name"  class="contact-form-input"/>
								
							<form:label path="phone"></form:label> 
							<form:errors path="phone" class="text-danger"/>
							<form:input path="phone" type="number" placeholder="Phone Number" class="contact-form-input" />
						</div>
					</div>

 				<div class="px-2" style="margin-top: 10px;">
						<form:label path="comment"></form:label>
						<form:errors path="comment" class="text-danger"/>
						<form:textarea path="comment" style="width:100%; height:100px;" placeholder="Write your message here"/>
				</div>

					<div class=" text-center my-4">
						<button type="submit" class="btn btn-sm rounded-pill"style="background-color:#CEE204; box-shadow: 2px 4px 10px #000000;"> Send </button>
					</div>
				
			</form:form>
			</div>
	</main>
</body>
</html>