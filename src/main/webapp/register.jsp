<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Register Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">

</head>
<body>
	<div class="container mt-5">
		<h1>Register</h1>
		<form action="register" method="post">
			<div class="form-group">
				<label for="name">Name:</label> <input type="text"
					class="form-control" id="name" name="name" value="Utchi Kanna" required>
			</div>
			<div class="form-group">
				<label for="email">Email:</label> <input type="email"
					class="form-control" id="email" name="email" value="utchi@gmail.com" required>
			</div>
			<div class="form-group">
				<label for="mobileNo">Mobile Number:</label> <input type="text"
					class="form-control" id="mobileNo" name="mobileNo" value="7548824945" required>
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					class="form-control" id="password" name="password" value="12345Utchi" required>
			</div>
			<div class="form-group">
				<label for="gender">Gender:</label> <select class="form-control"
					id="gender" name="gender" required>
					<option selected="selected" value="M">Male</option>
					<option value="F">Female</option>
				</select>
			</div>
			<div class="form-group">
				<label for="dob">Date of Birth:</label> <input type="date"
					class="form-control" id="dob" name="dob" value="2003-08-31" required>
			</div>
			<button type="submit" class="btn btn-primary">Register</button>
			<a href="login.jsp" class="btn btn btn-secondary"> Go to Login</a>
		</form>

		<%-- Display success or error message if present --%>
		<%
		String successMessage = (String) request.getAttribute("success");
		%>
		<%
		String errorMessage = (String) request.getAttribute("error");
		%>
		<%
		if (successMessage != null && !successMessage.isEmpty()) {
		%>
		<div class="alert alert-success mt-3">
			<%=successMessage%>
		</div>
		<%
		} else if (errorMessage != null && !errorMessage.isEmpty()) {
		%>
		<div class="alert alert-danger mt-3">
			<%=errorMessage%>
		</div>
		<%
		}
		%>
	</div>
</body>
</html>
