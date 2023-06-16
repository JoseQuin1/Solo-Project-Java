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
		<div class="container border-bottom">
			<a class="navbar-brand" href="/"> <img class="mylogo rounded"
				alt="logo" src="${pageContext.request.contextPath}/images/logo.webp">
			</a>
			<c:if test="${userId != null}">
				<a href="/profile" class="profile-a-tag">My Profile</a>
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