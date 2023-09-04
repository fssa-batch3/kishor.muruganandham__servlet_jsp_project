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

.editable {
	border: 1px solid #ccc;
	padding: 5px;
}

.edit-buttons {
	margin-top: 10px;
}

.hidden-input {
	display: none;
}
</style>
</head>
<body>
	<div class="container mt-4">
		<div class="row">
			<div class="col-md-4">
				<div class="position-relative">
					<img src="${book.coverImage}" alt="Book Cover"
						class="img-fluid book-image">
					<button class="btn btn-primary position-absolute" id="editImageBtn"
						style="bottom: 15px; right: 15px; display: none">
						<i class="bi bi-pencil-square"></i> Edit
					</button>
				</div>
				<div class="edit-buttons mt-3">
					<button type="button" class="btn btn-primary" id="editBtn">Edit</button>
					<button type="button" class="btn btn-danger" id="deleteBtn">Delete</button>
					<button type="button" class="btn btn-success hidden-input"
						id="saveBtn">Save</button>
					<button type="button" class="btn btn-secondary hidden-input"
						id="cancelBtn">Cancel</button>
					<a href="book-borrows?bookId=${book.bookId}" class="btn btn-info">View
						Borrows</a>
				</div>
			</div>
			<div class="col-md-8">
				<h1>${book.title}</h1>
				<form action="update-book" method="POST">
					<input type="hidden" name="bookId" value="${book.bookId}">
					<div class="form-group">
						<label for="title">Title:</label> <input type="text"
							class="form-control editable" id="title" name="title"
							value="${book.title}" required disabled>
					</div>
					<div class="form-group">
						<label for="author">Author:</label> <input type="text"
							class="form-control editable" id="author" name="author"
							value="${book.author}" required disabled>
					</div>
					<div class="form-group">
						<label for="publisher">Publisher:</label> <input type="text"
							class="form-control editable" id="publisher" name="publisher"
							value="${book.publisher}" required disabled>
					</div>
					<div class="form-group">
						<label for="genre">Genre:</label> <input type="text"
							class="form-control editable" id="genre" name="genre"
							value="${book.genre}" required disabled>
					</div>
					<div class="form-group">
						<label for="language">Language:</label> <input type="text"
							class="form-control editable" id="language" name="language"
							value="${book.language}" required disabled>
					</div>
					<div class="form-group">
						<label for="description">Description:</label>
						<textarea class="form-control editable" id="description"
							name="description" rows="4" required disabled>${book.description}</textarea>
					</div>
					<div class="form-group">
						<label for="totalCopies">Total Copies:</label> <input
							type="number" class="form-control editable" id="totalCopies"
							name="totalCopies" value="${book.totalCopies}" required disabled>
					</div>
					<div class="form-group">
						<label for="availableCopies">Available Copies:</label> <input
							type="number" class="form-control editable" id="availableCopies"
							name="availableCopies" value="${book.availableCopies}" required
							disabled>
					</div>
					<div class="form-group">
						<label for="loanedCopies">Loaned Copies:</label> <input
							type="number" class="form-control editable" id="loanedCopies"
							name="loanedCopies" value="${book.loanedCopies}" required
							disabled>
					</div>
					<input type="hidden" name="coverImage" id="hiddenImageInput"
						value="${book.coverImage}">

				</form>
			</div>
		</div>
	</div>

	<!-- Include jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

	<!-- Add this script to your JSP file -->
	<script>
	$(document).ready(function() {
	    // Function to toggle editing mode
	    function toggleEditing() {
		// Enable/disable input fields
		$(".editable").prop("disabled", function(i, v) {
		    return !v;
		});

		// Show/hide edit and delete buttons
		$("#editBtn, #deleteBtn").toggle();

		// Show/hide save and cancel buttons
		$("#saveBtn, #cancelBtn").toggle();

		// Show/hide the book image edit button
		$("#editImageBtn").toggle();
	    }

	    // Edit button click event
	    $("#editBtn").click(function() {
		toggleEditing();
	    });

	    // Save button click event
	    $("#saveBtn").click(function() {
		// Submit the form to update the book
		$("form").submit();
	    });

	    // Cancel button click event
	    $("#cancelBtn").click(function() {
		// Reload the page to cancel edits
		location.reload();
	    });

	    // Pen icon (edit image) button click event
	    $("#editImageBtn").click(function() {
		var newImageUrl = prompt("Enter the new Book Image URL:");
		if (newImageUrl) {
		    // Set the new image URL in the hidden input field
		    $("#hiddenImageInput").val(newImageUrl);

		    // Update the book image
		    $(".book-image").attr("src", newImageUrl);
		}
	    });

	    // Delete button click event
	    $("#deleteBtn").click(function() {
		if (confirm("Are you sure you want to delete this book?")) {
		    // Redirect to the delete-book servlet
		    var redirectUrl = '${book.bookId}';
		    window.location.href = "delete-book?bookId=" + redirectUrl;
		}
	    });

	});
    </script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>
