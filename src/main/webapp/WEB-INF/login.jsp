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