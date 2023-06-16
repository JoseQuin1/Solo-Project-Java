<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<a href="/profile"
					style="background-color: #4CAF50; border: none; border-radius: 10px; color: white; text-align: center; text-decoration: none; padding: 0 5px; font-size: 12px;">My
					Profile </a>

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
	<main>
	
		<div class="puppy-wrapper-box d-flex justify-content-center mx-auto flex-wrap">
		
			<div class="mid-box border border-solid border-3"style="border-radius: 0 35px 35px 0;">
				<h1 class="mb-5 display-5 text-light"
					style="text-shadow: 2px 4px 10px #000000;">Puppy Details</h1>
				<h3>About Me!</h3>
				<div class="d-flex">
					<div class="flip-card">
						<div class="flip-card-inner">
							<div class="flip-card-front">
								<img style="height: 370px; box-shadow: 2px 4px 10px #000000;"
									alt="puppyImg"
									src="${pageContext.request.contextPath}/images/puppyImg${oneDog.id}.jpeg">
							</div>
							<div class="flip-card-back">
								<div class="text-start p-3 bg-light rounded">

									<c:choose>
										<c:when test="${oneDog.userWhoLiked.contains(currentUser)}">
											<div class="d-flex justify-content-between">
												<p>
													<span class="text-success">ID# </span><span
														class="dog-details text-dark"><c:out
															value="${oneDog.id}" /></span>
												</p>
												<p>
													<a href="/user/unlike/${oneDog.id}"
														style="text-shadow: 2px 4px 10px #000000; text-decoration: none; color: orange;">unlike</a>
												</p>
											</div>
										</c:when>
										<c:otherwise>
											<div class="d-flex justify-content-between">
												<p>
													<span class="text-success">ID# </span><span
														class="dog-details text-dark"><c:out
															value="${oneDog.id}" /></span>
												</p>
												<p>
													<a href="/user/like/${oneDog.id}"
														style="text-shadow: 2px 4px 10px #000000; text-decoration: none; color: orange;">Like
														me</a>
												</p>
											</div>
										</c:otherwise>
									</c:choose>
									<p>
										<span class="text-success">Name:</span> <span
											class="dog-details text-dark"><c:out
												value="${oneDog.name}" /></span>
									</p>
									<p>
										<span class="text-success">Age:</span> <span
											class="dog-details text-dark"><c:out
												value="${oneDog.age}" /> weeks</span>
									</p>
									<c:choose>
										<c:when test="${oneDog.gender == 'f'}">
											<p>
												<span class="text-success">Gender:</span> <span
													class="dog-details text-dark">Female</span>
											</p>
										</c:when>
										<c:otherwise>
											<p>
												<span class="text-success">Gender:</span> <span
													class="dog-details text-dark">Male</span>
											</p>
										</c:otherwise>
									</c:choose>
									<p>
										<span class="text-success">Breed: </span> <span
											class="dog-details text-dark"><c:out
												value="${oneDog.breed}" /></span>
									</p>
									<p>
										<span class="text-success">Color: </span> <span
											class="dog-details text-dark"><c:out
												value="${oneDog.color}" /></span>
									</p>
									<p>
										<span class="text-success">Moms Weight: </span> <span
											class="dog-details text-dark"><c:out
												value="${oneDog.weight}" /> lbs</span>
									</p>
									<p>
										<span class="text-success">Status: </span> <span
											class="dog-details text-dark"><c:out
												value="${oneDog.status}" /></span>
									</p>

								</div>
							</div>
						</div>
					</div>
					<div style="padding-left: 100px;">
						<h4>Price: $<fmt:formatNumber type="number" maxFractionDigits="2" value="${oneDog.price}" /></h4>
						<p style="font-size: 10px; color:red; margin-top: -10px;">< hover pic for more details ></p>
					</div>
				</div>
				<p style="margin-top: 200px;">
					<span style="margin-left: 40px;">Hi!</span> Thank you for visiting
					me! I would like to get into more details about myself, but the
					designer of this project is <span class="text-danger fw-bold">lazy,</span>
					and only wants to give you "<span
						style="color: orange; font-weight: bold;">filler</span>" text.
					I'll keep it short and say, pick me, I'm adorable!
				</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
					do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
					enim ad minim veniam, quis nostrud exercitation ullamco laboris
					nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
					reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
					pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
					culpa qui officia deserunt mollit anim id est laborum.</p>

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
								<p class="m-0 p-0">them at 19 weeks old and they are
									learning more every day.</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<div class="mid-box border border-solid border-3 py-5"
				style="box-shadow: 2px 4px 10px #000000; border-radius: 35px 0 0 35px;">
				<h4 style="border-bottom: 2px solid gray; padding-bottom: 20px;">What
					comes included FREE with each of our puppies</h4>
				<p class="info-col d-flex justify-content-between">
					Health Warranty <img style="height: 40px;" alt="puppyImg"
						src="${pageContext.request.contextPath}/images/icons/thumbs-up-icon.jpeg">
				</p>
				<p class="info-col">
					Health Certificate <img style="height: 40px;" alt="puppyImg"
						src="${pageContext.request.contextPath}/images/icons/thumbs-up-icon.jpeg">
				</p>
				<p class="info-col">
					Top Breeders <img style="height: 40px;" alt="puppyImg"
						src="${pageContext.request.contextPath}/images/icons/thumbs-up-icon.jpeg">
				</p>
				<p class="info-col">
					No Puppy Mill Promise <img style="height: 40px;" alt="puppyImg"
						src="${pageContext.request.contextPath}/images/icons/thumbs-up-icon.jpeg">
				</p>
				<p class="info-col">
					Exclusive Training Package <img style="height: 40px;"
						alt="puppyImg"
						src="${pageContext.request.contextPath}/images/icons/thumbs-up-icon.jpeg">
				</p>
				<p class="info-col">
					Transparent Online Pricing <img style="height: 40px;"
						alt="puppyImg"
						src="${pageContext.request.contextPath}/images/icons/thumbs-up-icon.jpeg">
				</p>
				<p class="info-col">
					Up to 100% Financing <img style="height: 40px;" alt="puppyImg"
						src="${pageContext.request.contextPath}/images/icons/thumbs-up-icon.jpeg">
				</p>
				<p class="info-col">
					Microchipped <img style="height: 40px;" alt="puppyImg"
						src="${pageContext.request.contextPath}/images/icons/thumbs-up-icon.jpeg">
				</p>
				<p class="info-col">
					Veterinary Perks & Discounts <img style="height: 40px;"
						alt="puppyImg"
						src="${pageContext.request.contextPath}/images/icons/thumbs-up-icon.jpeg">
				</p>
				<p class="info-col">
					Puppy Care Instructions and Guidance <img style="height: 40px;"
						alt="puppyImg"
						src="${pageContext.request.contextPath}/images/icons/thumbs-up-icon.jpeg">
				</p>
				<p class="info-col">
					Microchipped <img style="height: 40px;" alt="puppyImg"
						src="${pageContext.request.contextPath}/images/icons/thumbs-up-icon.jpeg">
				</p>
				<div class="">
					<form class="puppy-form">
						<h2 class="text-center" style="padding: 5px 0 0 5px;">Ask
							about me</h2>
						<div class="d-flex justify-content-between">
							<div class="p-2">
								<label name="fname"></label> <input name="fname" type="text"
									placeholder="First Name" class="contact-form-input" /> <label
									name="email"></label> <input name="email" type="email"
									placeholder="Email Address" class="contact-form-input" />
							</div>
							<div class="p-2 rounded">
								<label name="lname"></label> <input name="lname" type="text"
									placeholder="Last Name" class="contact-form-input" /> <label
									name="phone"></label> <input name="phone" type="number"
									placeholder="Phone Number" class="contact-form-input" />
							</div>
						</div>
						<div class="px-2" style="margin-top: 10px;">
							<label name="message"></label>
							<textarea rows="5" cols="3" name="message"
								placeholder="Write your message here"
								style="width: 100%; max-height: 100px; min-height: 100px;">
						</textarea>
						</div>
						<div class=" text-center my-4">
							<button type="submit" class="btn btn-sm rounded-pill"
								style="background-color: #97E994; box-shadow: 2px 4px 10px #000000;">
								Send</button>
						</div>

					</form>
				</div>
			</div>


		</div>

	</main>
	<footer class="bg-success mt-5 mx-auto my-auto">
		<h1 class="text-light col-2 text-center mx-auto pb-2"
			style="text-shadow: 2px 4px 10px #000000; back-ground-color: white;">PuppyShop</h1>
		<div
			class="mx-auto mt-5 col-4 d-flex justify-content-between flex-wrap">
			<a href="/" class=" link-dark text-decoration-none">Home</a> <a
				href="/aboutUs" class=" link-dark text-decoration-none">About Us</a>
			<a href="/contactUs"
				class="headerAnchor link-dark text-decoration-none">Contact Us</a> <a
				href="/puppies" class=" link-dark text-decoration-none">Puppies</a>
			<a href="/reviews" class=" link-dark text-decoration-none">Reviews</a>
			<a href="/travel" class=" link-dark text-decoration-none">Puppy
				Travel</a>
		</div>
		<div
			class="
				d-flex 
				justify-content-between 
				mx-auto
				my-5 pb-5 col-5
				text-light
				flex-wrap"
			style="height: auto;">
			<div class="d-flex justify-content-between p-2">
				<img class="footerIcon" alt="phone"
					src="${pageContext.request.contextPath}/images/phone-call.png">
				<p>(800) 789-7545</p>
			</div>
			<div class="d-flex justify-content-between p-2">
				<img class="footerIcon" alt="location"
					src="${pageContext.request.contextPath}/images/location_icon.png">
				<p>
					9858 Clint Moore Rd # 110 <br>Boca Raton, FL 33496
				</p>
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