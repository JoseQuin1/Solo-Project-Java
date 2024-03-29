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
	<h3 style="margin-left:20px;">Edit Puppy</h3>
	<main class="border border-light rounded">
		<div class="d-flex">
			<div style="
					height: auto: 
					width:30%; 
					min-width: 300px; 
					padding-left: 40px;">
				<div class="d-flex">
					<img class="myIcon" style="margin: 15px 10px 0 0;" alt="user Icon"
						src="${pageContext.request.contextPath}/images/icons/user-regular.svg">
					<a href="/profile" class="text-decoration-none text-dark"
						style="margin-top: 10px;">My Account</a>
				</div>
				<div class="d-flex">
					<img class="myIcon" style="margin: 15px 10px 0 0;" alt="user Icon"
						src="${pageContext.request.contextPath}/images/icons/catalog-icon.png">
					<a href="/myCatalog" class="text-decoration-none text-dark"
						style="margin-top: 10px;">My Catalog</a>
				</div>
				<div class="d-flex">
					<img class="myIcon" style="margin: 15px 10px 0 0;" alt="user Icon"
						src="${pageContext.request.contextPath}/images/icons/cart-icon.png">
					<a href="/myCatalog" class="text-decoration-none text-dark"
						style="margin-top: 10px;">Order History</a>
				</div>

			</div>
			<div class="" style="height: auto; width: 500px;">
				<form:form action="/puppy/${id}/edit" method="put" modelAttribute="dog"
					enctype="multipart/form-data"
					style="
					height: auto;
					min-width:400px;
					padding: 30px;
					border-radius: 25px; 
					background-color:#F0F8FF;
					box-shadow: 2px 4px 10px #000000;">
					<div class="mb-3">
						<form:label path="name">Name:</form:label>
						<form:errors path="name" class="text-danger" />
						<form:input path="name" type="text" class="form-control" />
					</div>
					<div class="mb-3">
						<form:label path="age">Age:</form:label>
						<form:errors path="age" class="text-danger" />
						<form:input path="age" type="number" class="form-control" />
					</div>
					<div class="mb-3">
						<form:label path="price">Price:</form:label>
						<form:errors path="price" class="text-danger" />
						<form:input path="price" type="number" min="0"
							class="form-control" />
					</div>
					<div class="mb-3">
						<form:label path="weight">Mother's Weight:</form:label>
						<form:errors path="weight" class="text-danger" />
						<form:input path="weight" type="number" class="form-control" />
					</div>
					<div class="mb-3">
						<form:label path="breed">Breed:</form:label>
						<form:errors path="breed" class="text-danger" />
						<form:select path="breed" class="form-control">
						<option value="${dog.breed}"><c:out value="${dog.breed}" /></option>
							<option value=""></option>
							<option value="Great Dane">Great Dane</option>
							<option value="Corgi">Corgi</option>
							<option value="Golden Retriever">Golden Retriever</option>
							<option value="Labrador Retriever">Labrador Retriever</option>
							<option value="Jack Rusell Terrier">Jack Rusell Terrier</option>
							<option value="Husky">Husky</option>
							<option value="German Shepherd">German Shepherd</option>
							<option value="Pointer">Pointer</option>
							<option value="King Charles Spaniel">King Charles
								Spaniel</option>

						</form:select>
					</div>
					<div class="d-flex justify-content-around" style="margin: 20px 0;">
						<div class="mb-3">
							<form:label path="color">Color:</form:label>
							<form:errors path="color" class="text-danger" />
							<form:select path="color" style="width:100px;">
															<option value="${dog.color}"><c:out
										value="${dog.color}" /></option>
								<option value=""></option>
								<option value="white">White</option>
								<option value="beige">Beige</option>
								<option value="brown">Brown</option>
								<option value="black">Black</option>
								<option value="gold">Gold</option>
								<option value="red">Red</option>
								<option value="gray">Gray</option>
							</form:select>
						</div>
						<div class="mb-3">
							<form:label path="status">Status:</form:label>
							<form:errors path="status" class="text-danger" />
							<form:select path="status" style="width:100px;">
															<option value="${dog.status}"><c:out
										value="${dog.status}" /></option>
								<option value=""></option>
								<option value="avilable">Available</option>
								<option value="unavailable">Unavailable</option>
							</form:select>
						</div>
						<div class="mb-3">
							<form:label path="gender">Gender:</form:label>
							<form:errors path="gender" class="text-danger" />
							<form:select path="gender" style="width:100px;">
								<option value="${dog.gender}"><c:out
										value="${dog.gender}" /></option>
								<option value=""></option>
								<option value="male">M</option>
								<option value="female">F</option>
							</form:select>
						</div>
					</div>
					<input type="file" name="file" />
					<input type="submit" value="Submit for approval!"
						class="bg-primary text-light rounded-pill"
						style="width: 100%; margin-top: 40px; height: 40px;" />
				</form:form>
			</div>
		</div>
	</main>


</body>
</html>