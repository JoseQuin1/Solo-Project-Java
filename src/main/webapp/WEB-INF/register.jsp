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
	<div style="
			min-width:400px;
			height:700px; 
			width:400px; 
			margin-right:150px;
			border-style: solid;
			border-radius: 25px;
			box-shadow: 2px 2px 20px #000000">
			<form:form action="/register" method="post" modelAttribute="newUser" 
				class="col-6 p-5"
				style="width:100%; height:auto;">
				<h2 class="mb-3">New Registration</h2>
				<div class="mb-3">
					<form:label path="firstName">First Name:</form:label>
					<form:errors path="firstName" class="text-danger"/>
					<form:input path="firstName" type="text" class="form-control" />
				</div>
				<div class="mb-3">
					<form:label path="lastName">Last Name:</form:label>
					<form:errors path="lastName" class="text-danger"/>
					<form:input path="lastName" type="text" class="form-control" />
				</div>
				<div class="mb-3">
					<form:label path="email">Email:</form:label>
					<form:errors path="email" class="text-danger"/>
					<form:input path="email" type="email" class="form-control" />
				</div>
								<p>Profile Type:</p>
				<div class="mb-3">
					<form:label path="profile">
					<form:errors path="profile" class="text-danger"/>
						<form:radiobutton
							path="profile"
							value="User"/> User
					</form:label>
					<form:label path="profile">
					<form:errors path="profile" class="text-danger"/>
						<form:radiobutton
							path="profile"
							value="Breeder"/> Breeder
					</form:label>
				</div>
				<div class="mb-3">
					<form:label path="password">Password:</form:label>
					<form:errors path="password" class="text-danger"/>
					<form:input path="password" type="password" class="form-control" />
				</div>
				<div class="mb-3">
					<form:label path="confirm">Confirm PW:</form:label>
					<form:errors path="confirm" class="text-danger"/>
					<form:input path="confirm" type="password" class="form-control" />
				</div>
				<input type="submit" value="Register" class="btn btn-primary"/>
			</form:form>

		</div>
	</main>
</body>
</html>