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
	<main class="d-flex">
		<div style="height: auto: width:23%; min-width: 300px;">
		<h3 class="top-div-under-header pt-3" style="margin-left: 20px;">Catalog</h3>
			<div style="padding: 10px 30px;">
			
				<div class="d-flex">
					<img class="myIcon" style="margin: 15px 10px 0 0;" alt="user Icon"
						src="${pageContext.request.contextPath}/images/icons/user-regular.svg">
					<a href="/profile" class="text-decoration-none text-dark"
						style="margin-top: 10px;">Account</a>
				</div>
				
				<c:choose>
					<c:when test="${user.profile == 'Breeder'}">
						<div class="d-flex">
							<img class="myIcon" style="margin: 15px 10px 0 0;" alt="user Icon"
								src="${pageContext.request.contextPath}/images/icons/catalog-icon.png">
							<a href="/myCatalog" class="text-decoration-none text-warning"
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
					<a href="/order-history" class="text-decoration-none text-dark"
						style="margin-top: 10px;">Order History</a>
				</div>
	
			</div>
		</div>
		<div style="height: 500px; width: 100%; min-width: 650px; margin-right: 30px;">
			<h4 class="text-center text-light mb-3" style="text-shadow: 2px 4px 10px #000000;">Add to Catalog</h4>
		<div class="" style="height:auto;">
		<form:form action="/doggies/new" method="post" modelAttribute="dog" enctype="multipart/form-data"
				style="
					height: auto;
					border-radius: 25px; 
					background-color:#F0F8FF;
					box-shadow: 2px 4px 10px #000000;">
				<div class="d-flex justify-content-between">
					<div class="p-3" style="width:50%; border-radius:25px 0 0 0;">
						<div class="mb-3">
							<form:label path="name">Name:</form:label>
							<form:errors path="name" class="text-danger"/>
							<form:input path="name" type="text" class="form-control" />
						</div>
						<div class="mb-3">
							<form:label path="age">Age:</form:label>
							<form:errors path="age" class="text-danger"/>
							<form:input path="age" type="number" class="form-control" />
						</div>
						<div class="mb-3">
							<form:label path="price">Price:</form:label>
							<form:errors path="price" class="text-danger"/>
							<form:input path="price" type="number" min="0" class="form-control" />
						</div>
					</div>
					<div class="p-3" style="width:50%;border-radius:0 25px 0 0;">
						<div class="mb-3">
							<form:label path="weight">Mother's Weight:</form:label>
							<form:errors path="weight" class="text-danger"/>
							<form:input path="weight" type="number" class="form-control" />
						</div>
						<div class="mb-3">
							<form:label path="breed">Breed:</form:label>
							<form:errors path="breed" class="text-danger"/>
							<form:select path="breed" class="form-control">
									<option value="selected"></option>
									<option value="Great Dane">Great Dane</option>
									<option value="Corgi">Corgi</option>
									<option value="Golden Retriever">Golden Retriever</option>
									<option value="Labrador Retriever">Labrador Retriever</option>
									<option value="Jack Rusell Terrier">Jack Rusell Terrier</option>
									<option value="Husky">Husky</option>
									<option value="German Shepherd">German Shepherd</option>
									<option value="Pointer">Pointer</option>
									<option value="King Charles Spaniel">King Charles Spaniel</option>
									
							</form:select>
						</div>
					<div class="d-flex justify-content-around"
							style="margin:42px 0 0 0;">
							<div class="mb-3">
								<form:label path="color">Color:</form:label>
								<form:errors path="color" class="text-danger"/>
								<form:select path="color" class="catalog-form-input">
									<option value="selected"></option>
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
								<form:errors path="status" class="text-danger"/>
								<form:select path="status" class="catalog-form-input">
									<option value="selected"></option>
									<option value="avilable">Available</option>
									<option value="unavailable">Unavailable</option>
								</form:select>
			 				</div>
			 				<div class="mb-3">
								<form:label path="gender">Gender:</form:label>
								<form:errors path="gender" class="text-danger"/>
								<form:select path="gender" class="catalog-form-input">
									<option value="selected"></option>
									<option value="male">M</option>
									<option value="female">F</option>
								</form:select>
			 				</div>
		 				</div>
 					</div>
 				</div>
				<div class="d-flex justify-content-start"style="padding-left:20px;"><input type="file" name="file"/></div>
					<input type="submit" value="Submit for approval!" 
						class="bg-primary text-light" 
						style="width:100%; margin-top:30px; height:40px; border-radius: 0 0 25px 25px;"/>
		</form:form>
		</div>
		<h4 class="text-center text-light my-3" style="text-shadow: 2px 4px 10px #000000;">Pending Approval</h4>
			<div style="
					height: 300px;
					width:100%; 
					min-width: 500px; 
					border-style: solid; 
					border-radius: 25px; 
					border-color: #DCDCDC; 
					background-color:#F0F8FF;
					overflow: scroll;
					box-shadow: 2px 4px 10px #000000;">

				<table class="table table-border rounded text-center">
					<thead>
						<tr>
							<th>Name</th>
							<th>Age</th>
							<th>Breed</th>
							<th>Color</th>
							<th>Mom's Weight</th>
							<th>Status</th>
							<th>Gender</th>
							<th>Image</th>
							<th>Action</th>
						</tr>
					</thead>
					<c:forEach var="oneDog" items="${doggies}">
						<tbody>
							<c:if test="${oneDog.user.id == userId}">
 								<td><c:out value="${oneDog.name}"></c:out></td>
								<td><c:out value="${oneDog.age}"></c:out> weeks</td>
								<td><c:out value="${oneDog.breed}"></c:out></td>
								<td><c:out value="${oneDog.color}"></c:out></td>
								<td><c:out value="${oneDog.weight}"></c:out></td>
								<td><c:out value="${oneDog.status}"></c:out></td>
								<td><c:out value="${oneDog.gender}"></c:out></td>
								<td><c:out value="${oneDog.fileName}"></c:out></td>
								<td><a href="/puppy/${oneDog.id}/edit">edit</a> | <a
									href="/puppy/${oneDog.id}/delete">delete</a></td>
							</c:if>
						</tbody>
					</c:forEach>
				</table>
			</div>
		</div>
	</main>
</body>
</html>