<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Borrow History</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<%@ include file="header.jsp"%>
</head>
<body>
	<div class="container mt-4">
		<h1>Borrow History</h1>
		<table class="table" >
			<thead>
				<tr>
					<th>User</th>
					<th>Book</th>
					<th>Borrow Date</th>
					<th>Return Date</th>
					<th>Due Date</th>
					<th>Fine</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="borrow" items="${borrowHistory}">
					<tr>
						<td>${borrow.user.name}</td>
						<td>${borrow.book.title}</td>
						<td>${borrow.borrowDate}</td>
						<td>${borrow.returnDate}</td>
						<td>${borrow.dueDate}</td>
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
