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
		<main class="pt-3">
		<h3 style="padding-left: 20px;">My Favorites</h3>
		<div class="d-flex flex-wrap">
		
			<div style="height: auto: width:auto; padding: 10px 30px;">
			
				<div class="d-flex">
					<img class="myIcon" style="margin: 15px 10px 0 0;" alt="user Icon"
						src="${pageContext.request.contextPath}/images/icons/user-regular.svg">
					<a href="/profile" class="text-decoration-none text-dark"
						style="margin-top: 10px;">My Account</a>
				</div>
				<c:choose>
					<c:when test="${user.profile == 'Breeder'}">
						<div class="d-flex">
							<img class="myIcon" style="margin: 15px 10px 0 0;" alt="user Icon"
								src="${pageContext.request.contextPath}/images/icons/catalog-icon.png">
							<a href="/myCatalog" class="text-decoration-none text-dark"
								style="margin-top: 10px;">My Catalog</a>
						</div>
												<div class="d-flex">
							<img class="myIcon" style="margin: 15px 10px 0 0;" alt="user Icon"
								src="${pageContext.request.contextPath}/images/icons/heart-icon.png">
							<a href="/favorites" class="text-decoration-none text-dark"
								style="margin-top: 10px;">My Favorites</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="d-flex">
							<img class="myIcon" style="margin: 15px 10px 0 0;" alt="user Icon"
								src="${pageContext.request.contextPath}/images/icons/heart-icon.png">
							<a href="/favorites" class="text-decoration-none text-warning"
								style="margin-top: 10px;">My Favorites</a>
						</div>
					</c:otherwise>
				</c:choose>
				
				<div class="d-flex">
					<img class="myIcon" style="margin: 15px 10px 0 0;" alt="user Icon"
						src="${pageContext.request.contextPath}/images/icons/cart-icon.png">
					<a href="/order-history" class="text-decoration-none text-dark"
						style="margin-top: 10px;">Order History</a>
				</div>
	
			</div>

			<div class="col-6 p-5 mx-5 overflow-auto" style="height: 500px">
				<c:forEach items="${dogs}" var="oneDog">
					<c:if test="${oneDog.userWhoLiked.contains(currentUser) && currentUser.dogsLiked.contains(oneDog)}">
					<div class="my-3 d-flex">
					<a href="/puppy/${oneDog.id}"><img class="mypicture rounded d-inline-block"
						style="box-shadow: 2px 2px 10px #000000;" alt="my picture1"
						title="click me"
						src="${pageContext.request.contextPath}/images/puppyImg${oneDog.id}.jpeg"></a>
						<div>
							<p class="favorite-puppy-info" style="margin-left:20px;"><span class="text-secondary">Puppy ID#:</span> <c:out value="${oneDog.id}"/></p>
							<p class="favorite-puppy-info" style="margin-left:20px;"><span class="favorite-puppy-info text-secondary">Name:</span> <c:out value="${oneDog.name}"/></p>
							<p class="favorite-puppy-info" style="margin-left:20px;"><span class="favorite-puppy-info text-secondary">Breed:</span> <c:out value="${oneDog.breed}"/></p>
							<p class="favorite-puppy-info" style="margin-left:20px;"><span class="favorite-puppy-info text-secondary">Puppy Message:</span>Hello There! Thank you for adding me to your favorites. Please feel free to 
								<span>
									<a href="/contactUs"style="text-shadow: 2px 4px 10px #000000; text-decoration: none; color: white;">Ask About Me!</a>
								</span> I look forward to meeting you.
							</p>
							<p style="margin-left:20px;"><a href="/userFavorite/unlike/${oneDog.id}"
								style="text-shadow: 2px 4px 10px #000000; text-decoration: none;color: orange;">unlike</a>
							</p>
						</div>
					</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</main>

</body>
</html>