<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Book Details</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<%@ include file="header.jsp"%>
<style>
/* Adjust styling as needed */
.book-image {
	max-width: 100%;
	height: auto;
}
</style>
<body>
	<div class="container mt-4">
		<div class="row">
			<div class="col-md-4">
				<img src="${book.coverImage}" alt="Book Cover"
					class="img-fluid book-image">

				<c:choose>
					<c:when
						test="${book.availableCopies > 0 && requestScope.borrowed == null}">
						<a href="borrow?bookId=${book.bookId}" class="btn btn-primary">Borrow</a>
					</c:when>
					<c:when test="${requestScope.borrowed != null}">
						<p class="text-info">Book is already borrowed by you</p>
					</c:when>
					<c:otherwise>
						<p class="text-info">Book will be available soon</p>
					</c:otherwise>
				</c:choose>

			</div>
			<div class="col-md-8">
				<h1>${book.title}</h1>
				<p>
					<strong>Author:</strong> ${book.author}
				</p>
				<p>
					<strong>Publisher:</strong> ${book.publisher}
				</p>
				<p>
					<strong>Genre:</strong> ${book.genre}
				</p>
				<p>
					<strong>Language:</strong> ${book.language}
				</p>
				<p>
					<strong>Description:</strong> ${book.description}
				</p>
				<p>
					<strong>Total Copies:</strong> ${book.totalCopies}
				</p>
				<p>
					<strong>Available Copies:</strong> ${book.availableCopies}
				</p>
				<p>
					<strong>Loaned Copies:</strong> ${book.loanedCopies}
				</p>


			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>
