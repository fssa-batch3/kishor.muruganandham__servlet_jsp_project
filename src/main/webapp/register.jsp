<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Register Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<style>
/* Your CSS styles for the Registration Page go here */
.form {
	display: flex;
	flex-direction: column;
	gap: 10px;
	background-color: #ffffff;
	padding: 30px;
	width: 450px;
	border-radius: 20px;
	font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto,
		Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
}

::placeholder {
	font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto,
		Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
}

.form button {
	align-self: flex-end;
}

.flex-column>label {
	color: #151717;
	font-weight: 600;
}

.inputForm {
	border: 1.5px solid #ecedec;
	border-radius: 10px;
	height: 50px;
	display: flex;
	align-items: center;
	padding-left: 10px;
	transition: 0.2s ease-in-out;
}

.input {
	margin-left: 10px;
	border-radius: 10px;
	border: none;
	width: 100%;
}

.input:focus {
	outline: none;
}

.inputForm:focus-within {
	border: 1.5px solid #2d79f3;
}

.flex-row {
	display: flex;
	flex-direction: row;
	align-items: center;
	gap: 10px;
	justify-content: space-between;
}

.flex-row>div>label {
	font-size: 14px;
	color: black;
	font-weight: 400;
}

.span {
	font-size: 14px;
	margin-left: 5px;
	color: #2d79f3;
	font-weight: 500;
	cursor: pointer;
}

.button-submit {
	margin: 20px 0 10px 0;
	background-color: #151717;
	border: none;
	color: white;
	font-size: 15px;
	font-weight: 500;
	border-radius: 10px;
	height: 50px;
	width: 100%;
	cursor: pointer;
}

.p {
	text-align: center;
	color: black;
	font-size: 14px;
	margin: 5px 0;
}

.container {
	margin-top: 5%;
	display: flex;
	flex-direction: column;
	align-items: center;
}

h1 {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container mt-3">
		<h1>Register</h1>
		<c:if test="${not empty requestScope.errorMessage}">
			<div class="alert alert-danger alert-dismissible fade show"
				role="alert">
				${requestScope.errorMessage}
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
				<%
				session.removeAttribute("errorMessage");
				%>
			</div>
		</c:if>
		<form action="register" method="post" class="form">
			<!-- Name Field -->
			<div class="flex-column">
				<label for="name">Name:</label>
			</div>
			<div class="inputForm">
				<input placeholder="Enter your Name" class="input" type="text"
					id="name" name="name" required autofocus>
			</div>

			<!-- Email Field -->
			<div class="flex-column">
				<label for="email">Email:</label>
			</div>
			<div class="inputForm">
				<input placeholder="Enter your Email" class="input" type="email"
					id="email" name="email" required>
			</div>

			<!-- Mobile Number Field -->
			<div class="flex-column">
				<label for="mobileNo">Mobile Number:</label>
			</div>
			<div class="inputForm">
				<input placeholder="Enter your Mobile Number" class="input"
					type="text" id="mobileNo" name="mobileNo" required>
			</div>

			<!-- Password Field -->
			<div class="flex-column">
				<label for="password">Password:</label>
			</div>
			<div class="inputForm">
				<input placeholder="Enter your Password" class="input"
					type="password" id="password" name="password" required>
			</div>

			<!-- Gender Field -->
			<div class="flex-column">
				<label for="gender">Gender:</label>
			</div>
			<div class="inputForm">
				<select class="input" id="gender" name="gender" required>
					<option selected="selected" value="M">Male</option>
					<option value="F">Female</option>
				</select>
			</div>

			<!-- Date of Birth Field -->
			<div class="flex-column">
				<label for="dob">Date of Birth:</label>
			</div>
			<div class="inputForm">
				<input class="input" type="date" id="dob" name="dob" required>
			</div>

			<!-- Register Button -->
			<button class="button-submit" type="submit">Register</button>
			<p class="p">
				Already have an account? <a href="login.jsp" class="span">Log In</a>
			</p>
		</form>


		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
			crossorigin="anonymous"></script>


	</div>
</body>
</html>
