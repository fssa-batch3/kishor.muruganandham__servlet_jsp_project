<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User List</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<%@ include file="header.jsp"%>
<style>
/* Add custom CSS for rounded images */
.rounded-image {
	border-radius: 50%;
	width: 50px; /* Adjust the width to your preference */
	height: 50px; /* Adjust the height to your preference */
	object-fit: cover;
}
</style>
</head>
<body>
	<div class="container mt-5 mx-0">
		<h1>User List</h1>
		<div class="table">
			<table class="table table-bordered">
				<thead class="thead-light">
					<tr>
						<th>User ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Mobile No</th>
						<th>Gender</th>
						<th>Date of Birth</th>
						<th>Created Date</th>
						<th>Status</th>
						<th>Role</th>
						<th>Profile Image</th>
						<th>Actions</th>
						<!-- New column for actions -->
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${userList}" var="user">
						<tr>
							<td style="min-width: 100px;">${user.userId}</td>
							<td style="min-width: 150px;">${user.name}</td>
							<td style="min-width: 150px;">${user.email}</td>
							<td style="min-width: 100px;">${user.mobileNo}</td>
							<td style="min-width: 100px;">${user.gender}</td>
							<td style="min-width: 150px;">${user.dob}</td>
							<td style="min-width: 150px;">${user.createdDate}</td>
							<td>
								<!-- Display "Active" or "Inactive" based on the isActive property -->
								${user.active ? 'Active' : 'Inactive'}
							</td>
							<td>
								<!-- Display "Librarian" or "User" based on the isAdmin property -->
								${user.admin ? 'Librarian' : 'User'}
							</td>
							<td><img src="${user.profileImage}" alt="Profile Image"
								class="rounded-image"></td>
							<td><a href="user-borrows?userId=${user.userId}"
								class="btn btn-info">View Borrows</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>
