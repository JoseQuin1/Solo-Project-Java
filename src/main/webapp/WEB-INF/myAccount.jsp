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
	<h3 class="top-div-under-header pt-3" style="margin-left: 20px;">Account</h3>
	<main class="">
		<div class="d-flex flex-wrap">
		
			<div style="padding: 10px 30px;">
			
				<div class="d-flex">
					<img class="myIcon" style="margin: 15px 10px 0 0;" alt="user Icon"
						src="${pageContext.request.contextPath}/images/icons/user-regular.svg">
					<a href="/profile" class="text-decoration-none text-warning"
						style="margin-top: 10px;">Account</a>
				</div>
				
				<c:choose>
					<c:when test="${user.profile == 'Breeder'}">
						<div class="d-flex">
							<img class="myIcon" style="margin: 15px 10px 0 0;" alt="user Icon"
								src="${pageContext.request.contextPath}/images/icons/catalog-icon.png">
							<a href="/myCatalog" class="text-decoration-none text-dark"
								style="margin-top: 10px;">Catalog</a>
						</div>
												<div class="d-flex">
							<img class="myIcon" style="margin: 15px 10px 0 0;" alt="user Icon"
								src="${pageContext.request.contextPath}/images/icons/heart-icon.png">
							<a href="/favorites" class="text-decoration-none text-dark"
								style="margin-top: 10px;">Favorites</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="d-flex">
							<img class="myIcon" style="margin: 15px 10px 0 0;" alt="user Icon"
								src="${pageContext.request.contextPath}/images/icons/heart-icon.png">
							<a href="/favorites" class="text-decoration-none text-dark"
								style="margin-top: 10px;">Favorites</a>
						</div>
					</c:otherwise>
				</c:choose>
				
				<div class="d-flex">
					<img class="myIcon" style="margin: 15px 10px 0 0;" alt="user Icon"
						src="${pageContext.request.contextPath}/images/icons/cart-icon.png">
					<a href="#" class="text-decoration-none text-dark"
						style="margin-top: 10px;">Order History</a>
				</div>
	
			</div>

			<div class="col-4 p-5 mx-5">
				<h6 class="mb-3">First Name</h6>
				<p class="myAccount-p">
					<c:out value="${user.firstName}" />
					<span>
						<a href="#" style="color:orange; text-decoration: none;">edit</a>
					</span>
				</p>
				<h6 class="my-3">Last Name</h6>
				<p class="myAccount-p">
					<c:out value="${user.lastName}" />
					<span>
						<a href="#" style="color:orange; text-decoration: none;">edit</a>
					</span>
				</p>
				<h6 class="my-3">Email</h6>
				<p class="myAccount-p">
					<c:out value="${user.email}" />
					<span>
						<a href="#" style="color:orange; text-decoration: none;">edit</a>
					</span>
				</p>
			</div>
		</div>
	</main>
</body>
</html>