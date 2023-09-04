<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Borrow List</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<%@ include file="header.jsp"%>
<style>
/* Add your custom styles here */
.rounded-image {
	border-radius: 50%;
	width: 50px; /* Adjust the width to your preference */
	height: 50px; /* Adjust the height to your preference */
	object-fit: cover;
}
</style>
</head>
<body>
	<div class="container mt-5">
		<h1>Borrow List of ${borrowList[0].book.title}</h1>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>User Image</th>
					<th>User Name</th>
					<th>Borrow Date</th>
					<th>Due Date</th>
					<th>Return Date</th>
					<th>Fine</th>
				</tr>
			</thead>
			<tbody>
				<!-- Add rows dynamically here using a loop -->
				<c:forEach items="${borrowList}" var="borrow">
					<tr>
						<td><img src="${borrow.user.profileImage}" alt="User Image"
							class="rounded-image"></td>
						<td>${borrow.user.name}</td>
						<td>${borrow.borrowDate}</td>
						<td>${borrow.dueDate}</td>
						<c:choose>
							<c:when test="${empty borrow.returnDate}">
								<td>-</td>
							</c:when>
							<c:otherwise>
								<td>${borrow.returnDate}</td>
							</c:otherwise>
						</c:choose>
						<td>${borrow.fine}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>
