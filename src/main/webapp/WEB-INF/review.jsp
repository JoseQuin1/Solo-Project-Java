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
	<main class="top-div-under-header">
		<div class="text-center py-5 mx-auto col-6">
			<h1>Genuine Customer Reviews</h1>
			<p class="mt-5">PuppyShop is a safe, easy, and responsible way to find your new puppy. We serve you best by putting the health and well-being of your puppy first. Don't just take our word for it.</p>
		</div>
		<div class="d-flex justify-content-between mx-auto col-6 flex-wrap mb-5">
			<div class="p-3 text-center">
				<h4 class="pt-4">4.3 / 5</h4>
				<img style="margin: -110px 0 -100px 0; height: 300px;" class="mylogo" alt="logo"
					 src="${pageContext.request.contextPath}/images/icons/four-star-rating.jpeg">
				<h4>Based on 12,000 verified reviews</h4>
			</div>
			<div class="col-6 p-3" style="min-width:500px;">
				<h4>12,000 verified reviews</h4>
				<div class=d-flex>
					<p>5 Stars</p>
					<div class="rating-bar bg-warning" style="width:70%;"></div>
					<p>11,000</p>
				</div>
								<div class=d-flex>
					<p>4 Stars</p>
					<div class="rating-bar bg-warning" style="width:30%;"></div>
					<p>1,000</p>
				</div>
								<div class=d-flex>
					<p>3 Stars</p>
					<div class="rating-bar bg-warning" style="width:16%;"></div>
					<p>700</p>
				</div>
								<div class=d-flex>
					<p>2 Stars</p>
					<div class="rating-bar bg-warning" style="width:10%;"></div>
					<p>200</p>
				</div>
					<div class=d-flex>
					<p>1 Stars</p>
					<div class="rating-bar bg-warning" style="width:5%;"></div>
					<p>100</p>
				</div>
			</div>
		</div>
	</main>
		<div class="mx-auto col-6" style="margin-bottom: 100px;">
			<c:forEach var="i" begin="1" end="3">
			<div class="d-flex mb-5 border border-light rounded shadow p-3 mb-5 bg-body flex-wrap">
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
			</div>
			</c:forEach>
		</div>
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
		<div class="d-flex justify-content-between mx-auto my-5 pb-5 col-5 text-light flex-wrap" style="height:auto;">
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