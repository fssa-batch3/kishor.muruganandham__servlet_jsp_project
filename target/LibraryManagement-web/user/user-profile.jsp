<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Profile</title>
<!-- Include Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<style>
.circular-image {
	border-radius: 50%;
	width: 150px;
	height: 150px;
	object-fit: cover;
}
</style>
</head>
<body>
	<div class="container mt-4">
		<h1>User Profile</h1>

		<form id="profileForm" method="post" action="update-user">

			<div class="profile-image-container">
				<img src="${user.profileImage}" alt="Profile Image"
					class="circular-image">
				<div class="edit-image-button" ${editable ? "" : "hidden"}>
					<span class="edit-image-pen" onclick="promptForImageURL()">✎</span>
				</div>
			</div>

			<label for="name">Name:</label> <input type="text" id="name"
				name="name" value="${user.name}" ${editable ? "" : "readonly"}><br>

			<label for="mobileNo">Mobile No:</label> <input type="text"
				id="mobileNo" name="mobileNo" value="${user.mobileNo}"
				${editable ? "" : "readonly"}><br> <label>Gender:</label>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="gender"
					id="maleGender" value="M"
					${editable ? (user.gender == 'M' ? "checked" : "") : "disabled"}>
				<label class="form-check-label" for="maleGender"> Male </label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="gender"
					id="femaleGender" value="F"
					${editable ? (user.gender == 'F' ? "checked" : "") : "disabled"}>
				<label class="form-check-label" for="femaleGender"> Female </label>
			</div>

			<br> <label for="dob">Date of Birth:</label> <input type="date"
				id="dob" name="dob" value="${user.dob}"
				${editable ? "" : "readonly"}><br> <input type="text"
				id="profileImage" name="profileImage" hidden=true value="${user.profileImage}">

			<button type="button" id="editButton" ${editable ? "hidden" : ""}
				class="btn btn-primary">Edit</button>
			<button type="submit" id="saveButton" ${editable ? "" : "hidden"}
				class="btn btn-success">Save</button>
			<button type="button" id="discardButton" ${editable ? "" : "hidden"}
				class="btn btn-secondary">Discard</button>
			<a href="logout" id="logoutButton" ${editable ? "hidden" : ""}
				class="btn btn-danger">Logout</a> <button type="button"
				id="deleteButton" ${editable ? "hidden" : ""} class="btn btn-danger">Delete</button>
		</form>

		<script>
        const editButton = document.getElementById('editButton');
        const saveButton = document.getElementById('saveButton');
        const discardButton = document.getElementById('discardButton');
        const formElements = document.querySelectorAll('#profileForm input');
        const profileImageContainer = document.querySelector('.profile-image-container');
        const editImageButton = document.querySelector('.edit-image-button');
        const logoutButton = document.getElementById('logoutButton');
        const deleteButton = document.getElementById('deleteButton');

        editButton.addEventListener('click', () => {
            formElements.forEach(input => input.removeAttribute('readonly'));
            editButton.hidden = true;
            saveButton.hidden = false;
            discardButton.hidden = false;
            logoutButton.hidden = true;
            deleteButton.hidden = true;
            editImageButton.hidden = false;
        });

        discardButton.addEventListener('click', () => {
            formElements.forEach(input => input.setAttribute('readonly', 'readonly'));
            location.reload();
        });

        function promptForImageURL() {
            const newImageURL = prompt('Enter new profile image URL:');
            if (newImageURL) {
                const profileImage = document.querySelector('.circular-image');
                profileImage.src = newImageURL;
            }
            const profileImageUrlInput = document.getElementById('profileImage');
            profileImageUrlInput.value = newImageURL;
        }

        deleteButton.addEventListener('click', () => {
        	  const confirm = window.confirm('Are you sure you want to delete your account?');
        	  if (confirm) {
        	   	window.location.href = "delete-user";
        	  } else {
        	   	location.reload();
        	  }
        	});

    </script>
	</div>

	<!-- Include Bootstrap JS and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
</body>
</html>
