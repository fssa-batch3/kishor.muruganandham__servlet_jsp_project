<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Book List</title>
<link rel="stylesheet" href="style.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<%@ include file="header.jsp"%>
</head>
<body>
	<main>
		<div class="container">
			<c:forEach var="book" items="${bookList}">
				<a href="book-details?bookId=${book.bookId}" class="book-card-link">
					<div class="book-card">
						<div class="book-card__cover">
							<div class="book-card__book">
								<div class="book-card__book-front">
									<img class="book-card__img" src="${book.coverImage}"
										alt="Book Cover">
								</div>
								<div class="book-card__book-back"></div>
								<div class="book-card__book-side"></div>
							</div>
						</div>
						<div class="book-card__content">
							<div class="book-card__title">${book.title}</div>
							<div class="book-card__author">${book.author}</div>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>
	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>
