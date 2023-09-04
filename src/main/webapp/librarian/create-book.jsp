<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Create Book</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<%@ include file="header.jsp"%>
</head>
<body>
	<div class="container mt-5">
		<h1>Create Book</h1>
		<form action="create-book" method="POST">
			<div class="form-group">
				<label for="title">Title:</label> <input type="text"
					class="form-control" id="title" name="title"
					value="Atomic Habits: the life-changing million-copy" required>
			</div>
			<div class="form-group">
				<label for="author">Author:</label> <input type="text"
					class="form-control" id="author" name="author" value="James Clear "
					required>
			</div>
			<div class="form-group">
				<label for="publisher">Publisher:</label> <input type="text"
					class="form-control" id="publisher" name="publisher"
					value="Random House Business Books" required>
			</div>
			<div class="form-group">
				<label for="genre">Genre:</label> <input type="text"
					class="form-control" id="genre" name="genre" value="Productivity"
					required>
			</div>
			<div class="form-group">
				<label for="language">Language:</label> <input type="text"
					class="form-control" id="language" name="language" value="English"
					required>
			</div>
			<div class="form-group">
				<label for="description">Description:</label>
				<textarea class="form-control" id="description" name="description"
					rows="4" required>People think that when you want to change your life, you need to think big. But world-renowned habits expert James Clear has discovered another way. He knows that real change comes from the compound effect of hundreds of small decisions: doing two push-ups a day, waking up five minutes early, or holding a single short phone call.</textarea>
			</div>
			<div class="form-group">
				<label for="totalCopies">Total Copies:</label> <input type="number"
					class="form-control" id="totalCopies" name="totalCopies" value="10"
					required>
			</div>
			<div class="form-group">
				<label for="coverImage">Cover Image URL:</label> <input type="text"
					class="form-control" id="coverImage" name="coverImage"
					value="https://m.media-amazon.com/images/I/51-nXsSRfZL._SX328_BO1,204,203,200_.jpg"
					required>
			</div>
			<button type="submit" class="btn btn-primary">Create Book</button>
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>
