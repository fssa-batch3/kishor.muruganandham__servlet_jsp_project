<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>User Profile</title>
<link rel="stylesheet" href="../assets/css/main_page.css" />
<link rel="icon" href="../assets/images/book-half.svg"
	type="image/x-icon" />

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"
	integrity="sha512-42PE0rd+wZ2hNXftlM78BSehIGzezNeQuzihiBCvUEB3CVxHvsShF86wBWwQORNxNINlBPuq7rG4WWhNiTVHFg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://upload-widget.cloudinary.com/global/all.js"
	type="text/javascript"></script>

<script src="../assets/js/db.js"></script>
<script src="../assets/js/script.js"></script>
<script src="../assets/js/header.js" defer></script>
<script src="../assets/js/sidebar.js" defer></script>
</head>
<body>

	<nav class="sidebar" id="sidebar">
		<div class="side-header">
			<div class="logo">
				<i class="bi bi-book-half"></i>
				<p>Bookly</p>
			</div>
			<div class="divider-line"></div>
			<div class="nav-list">
				<a href="./admin-dashboard.html" class="nav-items"><i
					class="bi bi-grid"></i>
					<p>Dashboard</p>
					<div class="tooltip" role="tooltip" data-popper-placement="right">
						Dashboard
						<div class="arrow" data-popper-arrow></div>
					</div> </a> <a href="./book-list" class="nav-items"><i
					class="bi bi-building"></i>
					<p>Library</p>
					<div class="tooltip" role="tooltip" style="top: 195px"
						data-popper-placement="right">
						Library
						<div class="arrow" data-popper-arrow></div>
					</div> </a> <a href="./borrow-list" class="nav-items"><i
					class="bi bi-inboxes-fill"></i>
					<p>Borrow List</p>
					<div class="tooltip" role="tooltip" style="top: 255px"
						data-popper-placement="right">
						Borrow List
						<div class="arrow" data-popper-arrow></div>
					</div> </a> <a href="./create-book" class="nav-items"><i
					class="bi bi-file-plus"></i>
					<p>Create Book</p>
					<div class="tooltip" role="tooltip" style="top: 315px"
						data-popper-placement="right">
						Create Book
						<div class="arrow" data-popper-arrow></div>
					</div> </a> <a href="./user-list" class="nav-items"><i
					class="bi bi-person"></i>
					<p>User List</p>
					<div class="tooltip" role="tooltip" style="top: 370px"
						data-popper-placement="right">
						User List
						<div class="arrow" data-popper-arrow></div>
					</div> </a> <a href="./bookrequest_list.html" class="nav-items "><i
					class="bi bi-hdd-stack"></i>
					<p>Book Request List</p>
					<div class="tooltip" role="tooltip" style="top: 430px;"
						data-popper-placement="right">
						Book Request List
						<div class="arrow" data-popper-arrow></div>
					</div> </a>
			</div>
		</div>
		<div class="side-footer">
			<div class="dark-toggle">
				<a href="#" onclick="darkMode()" class="nav-items"><i
					class="bi bi-moon-stars-fill dark-light"></i>
					<p class="da-li-text">Dark mode</p>
					<div class="tooltip" role="tooltip"
						style="bottom: 115px; top: unset" data-popper-placement="right">
						Theme
						<div class="arrow" data-popper-arrow></div>
					</div> </a> <a href="<%= request.getContextPath() %>/logout" class="nav-items" id="sign-out"><i
					class="bi bi-box-arrow-left"></i>
					<p>Log Out</p>
					<div class="tooltip" role="tooltip"
						style="bottom: 55px; top: unset" data-popper-placement="right">
						Log-Out
						<div class="arrow" data-popper-arrow></div>
					</div> </a>
			</div>
		</div>
	</nav>


	<section class="main-container">
		<jsp:include page="header.jsp"></jsp:include>
		<main class="user-detail-container">
			<form action="profile" class="user-detail-form" method="post"
				enctype="multipart/form-data">
				<div class="form-title">
					<h2>User-Profile</h2>
				</div>
				<div class="user-image">
					<i class="bi bi-pencil-fill"></i>
				</div>
				<div class="input-flex-grp">

					<div class="input-group">
						<label for="ud-display-name">Name :</label>
						<div class="input-field">
							<input type="text" name="name" id="ud-display-name"
								class="input ud-input" value="${user.name}" disabled />
						</div>
					</div>
					<div class="input-group">
						<label for="ud-last-name">Gender : <sup>*</sup></label>
						<div class="input-field">
							<select name="gender" id="ud-last-name" class="input ud-input"
								disabled>
								<c:choose>
									<c:when test="${user.gender.equals('F')}">
										<option value="F" selected>Female</option>
										<option value="M">Male</option>
									</c:when>
									<c:otherwise>
										<option value="F">Female</option>
										<option value="M" selected>Male</option>
									</c:otherwise>
								</c:choose>
							</select>


						</div>
					</div>
					<div class="input-group">
						<label for="ud-dob">Date of Birth :</label>
						<div class="input-field">
							<input type="date" name="ud-dob" id="ud-dob"
								class="input ud-input datePicker" value="${user.dob}"
								placeholder="YYYY-MM-DD" disabled required />
						</div>
					</div>
					<div class="input-group">
						<label for="ud-age">Age :</label>
						<div class="input-field">
							<input type="number" name="ud-age" id="ud-age" class="input"
								value="20" disabled />
						</div>
					</div>
					<div class="input-group">
						<label for="ud-phone-number">Phone Number :</label>
						<div class="input-field">
							<input type="number" name="ud-phone-number" id="ud-phone-number"
								class="input ud-input" value="${user.mobileNo}" disabled />
						</div>
					</div>
					<input type="text" id="hiddenImageInput" name="profileImage"
						style="display: none" value="" />
					<div class="input-group">
						<label for="ud-email">Email address :</label>
						<div class="input-field">
							<input type="email" name="ud-email" id="ud-email" class="input"
								value="${user.email}" disabled />
						</div>
					</div>
				</div>
				<div class="input-group"
					style="display: flex; margin: auto; gap: 20px; max-width: 500px">
					<button class="user-detail-edit submit" type="button">Edit</button>
					<button class="user-detail-delete submit" type="button" onclick="location.href = '../delete';">Delete</button>
					<button class="user-detail-save submit" type="submit">Save
						Changes</button>
					<button class="user-detail-cancel submit">Cancel</button>
				</div>
			</form>
		</main>
	</section>

	<div class="backdrop"></div>
	<div class="modal">
		<div class="modal-header">
			<h3 class="modal-title">Upload Profile Image</h3>
			<div class="modal-close">
				<i class="bi bi-x-lg"></i>
			</div>
		</div>
		<div class="modal-body">
			<form id="saveForm" action="../upload-image" method="post"
				enctype="multipart/form-data">
				<div class="input-group" style="width: 100%">
					<label for="image-url">Image URL:</label>
					<div class="input-field">
						<input type="text" name="image-url" id="imageLink" value="" />
					</div>
				</div>
				<div class="input-group" style="width: 100%">
					<label for="image-file">Upload Image:</label>
					<div class="input-field">
						<input type="file" id="imageUpload" accept="image/*"
							name="image-file" />
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="modal-submit" id="applyImageBtn">Apply</button>
				</div>
			</form>

		</div>

	</div>

	<script type="text/javascript">
	// Get user detail elements and display user data
	const profDisp = document.querySelector(".user-image");
	const dateOfBirth = document.getElementById("ud-dob");
	const udInput = document.querySelectorAll(".ud-input");
	const age = document.getElementById("ud-age");
	const profileEditBtn = document.querySelector(".user-image .bi-pencil-fill");
	const datePicker = document.querySelector(".datePicker");
	const minDate = moment().subtract(100, "year").format("YYYY-MM-DD");
	const maxDate = moment().subtract(10, "year").format("YYYY-MM-DD");
	datePicker.setAttribute("min", minDate);
	datePicker.setAttribute("max", maxDate);

	profDisp.style.background = `url(${user.profileImage}) no-repeat center center/cover`;
	age.value = moment().diff(dateOfBirth.value, "years");

	// Add event listeners to edit, save, cancel, and delete buttons
	const editBtn = document.querySelector(".user-detail-edit");
	const deleteBtn = document.querySelector(".user-detail-delete");
	const cancelBtn = document.querySelector(".user-detail-cancel");
	const saveBtn = document.querySelector(".user-detail-save");
	const saveForm = document.querySelector(".user-detail-form");

	editBtn.addEventListener("click", (e) => {
	  e.preventDefault();
	  udInput.forEach((i) => i.removeAttribute("disabled"));
	  editBtn.style.display = "none";
	  deleteBtn.style.display = "none";
	  cancelBtn.style.display = "block";
	  saveBtn.style.display = "block";
	  profileEditBtn.style.display = "block";
	});

	cancelBtn.addEventListener("click", (e) => {
	  e.preventDefault();
	  location.reload();
	});

	deleteBtn.addEventListener("click", (e) => {
	  e.preventDefault();
	  const confirmValue = confirm("Are you sure you want to delete your account?");
	  if (confirmValue === false) {
	    return;
	  }
	  const promptValue = prompt(
	    `This action cannot be undone. This will permanently delete the ${thisUser.username} account and remove all details associated with it. Please type your password to confirm.`
	  );
	  const isPasswordValid = comparePassword(promptValue, thisUser.password);
	  if (!isPasswordValid) {
	    alert("Please enter your password correctly");
	    return;
	  }
	});

	const modalCloseBtn = document.querySelector(".modal-close");
	modalCloseBtn.addEventListener("click", closeBorrowModal);

	const imageLinkInput = document.getElementById("imageLink");
	const imageUploadInput = document.getElementById("imageUpload");
	const applyImageBtn = document.getElementById("applyImageBtn");

	profileEditBtn.addEventListener("click", () => {
	  openBorrowModal();
	});

	function openBorrowModal() {
	  document.querySelector(".backdrop").classList.add("active");
	  document.querySelector(".modal").classList.add("active");
	}

	const hiddenImageFile = document.getElementById("hiddenImageFile");
	const hiddenImageInput = document.getElementById("hiddenImageInput");



	function closeBorrowModal() {
	  document.querySelector(".backdrop").classList.remove("active");
	  document.querySelector(".modal").classList.remove("active");
	}

	</script>
</body>
</html>
