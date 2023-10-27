<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.fssa.librarymanagement.model.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>User Profile</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"
	integrity="sha512-42PE0rd+wZ2hNXftlM78BSehIGzezNeQuzihiBCvUEB3CVxHvsShF86wBWwQORNxNINlBPuq7rG4WWhNiTVHFg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<link rel="stylesheet" href="../assets/css/main_page.css" />
<link rel="icon" href="../assets/images/book-half.svg"
	type="image/x-icon" />
<script src="../assets/js/script.js"></script>
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
				<a href="./dashboard" class="nav-items"><i class="bi bi-house"></i>
					<p>Home</p>
					<div class="tooltip" role="tooltip" data-popper-placement="right">
						Home
						<div class="arrow" data-popper-arrow></div>
					</div> </a> <a href="./book-list" class="nav-items"><i
					class="bi bi-building"></i>
					<p>Library</p>
					<div class="tooltip" role="tooltip" style="top: 195px"
						data-popper-placement="right">
						Library
						<div class="arrow" data-popper-arrow></div>
					</div> </a> <a href="./borrow-history" class="nav-items"><i
					class="bi bi-hourglass"></i>
					<p>History</p>
					<div class="tooltip" role="tooltip" style="top: 255px"
						data-popper-placement="right">
						History
						<div class="arrow" data-popper-arrow></div>
					</div> </a> <a href="./request-book" class="nav-items"><i
					class="bi bi-file-earmark-text"></i>
					<p>Request Book</p>
					<div class="tooltip" role="tooltip" style="top: 315px"
						data-popper-placement="right">
						Request Book
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
					</div> </a> <a href="<%=request.getContextPath()%>/logout" class="nav-items"
					id="sign-out"><i class="bi bi-box-arrow-left"></i>
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
			<form action="profile" class="user-detail-form" method="post">
				<div class="form-title">
					<h2>User-Profile</h2>
				</div>
				<div class="user-image">
					<i class="bi bi-pencil-fill"></i>
				</div>
				<div class="input-flex-grp">

					<div class="input-group">
						<label for="ud-display-name">Name : <sup>*</sup></label>
						<div class="input-field">
							<input type="text" name="name" id="ud-display-name"
								class="input ud-input" value="${user.name}" disabled
								autocomplete="name" />
						</div>
					</div>
					<div class="input-group">
						<label for="ud-gender">Gender : <sup>*</sup></label>
						<div class="input-field">
							<%
							User user = (User) request.getAttribute("user");
							String selectedValue;
							if (user != null) {
								if (user.getGender() == 'M') {
									selectedValue = "M";
								} else if (user.getGender() == 'F') {
									selectedValue = "F";
								} else {
									selectedValue = "O";
								}
							} else {
								selectedValue = "O";
							}
							%>
							<select name="ud-gender" id="ud-gender" class="input ud-input"
								disabled>
								<option value="Male"
									<%=selectedValue.equals("M") ? "selected" : ""%>>Male</option>
								<option value="Female"
									<%=selectedValue.equals("F") ? "selected" : ""%>>Female</option>
								<option value="Others"
									<%=selectedValue.equals("O") ? "selected" : ""%>>Others</option>
							</select>
						</div>
					</div>
					<div class="input-group">
						<label for="ud-dob">Date of Birth : <sup>*</sup></label>
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
						<label for="ud-phone-number">Phone Number : <sup>*</sup></label>
						<div class="input-field">
							<input type="number" name="ud-phone-number" id="ud-phone-number"
								class="input ud-input" value="${user.mobileNo}" disabled />
						</div>
					</div>
					<input type="text" id="hiddenImageInput" name="profileImage"
						style="display: none" value="${user.profileImage}" />
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
					<button class="user-detail-delete submit" type="button">Delete</button>
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
			<div class="input-group" style="width: 100%">
				<label for="imageLink">Image URL:</label>
				<div class="input-field">
					<input type="text" name="image-url" id="imageLink" value=""
						placeholder="Enter Image Url" />
				</div>
			</div>
			<br>
			<p>Or</p>
			<div class="input-group" style="width: 100%">
				<label for="imageUpload">Upload Image:</label>
				<div class="input-field">
					<input type="file" id="imageUpload" accept="image/*"
						name="image-file" />
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="submit" class="modal-submit" id="applyImageBtn">Apply</button>
		</div>

	</div>


	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script type="text/javascript">
	// Declarations
	const profDisp = document.querySelector(".user-image");
	const dateOfBirth = document.getElementById("ud-dob");
	const udInput = document.querySelectorAll(".ud-input");
	const age = document.getElementById("ud-age");
	const profileEditBtn = document.querySelector(".user-image .bi-pencil-fill");
	const datePicker = document.querySelector(".datePicker");
	const minDate = moment().subtract(100, "year").format("YYYY-MM-DD");
	const maxDate = moment().subtract(10, "year").format("YYYY-MM-DD");
	const editBtn = document.querySelector(".user-detail-edit");
	const deleteBtn = document.querySelector(".user-detail-delete");
	const cancelBtn = document.querySelector(".user-detail-cancel");
	const saveBtn = document.querySelector(".user-detail-save");
	const modalCloseBtn = document.querySelector(".modal-close");
	const imageLinkInput = document.getElementById("imageLink");
	const imageUploadInput = document.getElementById("imageUpload");
	const applyImageBtn = document.getElementById("applyImageBtn");
	
	profDisp.style.background = `url(${user.profileImage}) no-repeat center center/cover`;
	age.value = moment().diff(dateOfBirth.value, "years");

	// Functions
	function setImageUrl(imageUrl) {
	    document.getElementById('hiddenImageInput').value = imageUrl;
	    document.querySelector(".user-image").style.background = 'url(' + imageUrl + ') no-repeat center center/cover';
	    alert("Image uploaded successfully");
	    closeBorrowModal();
	}

	function openBorrowModal() {
	    document.querySelector(".backdrop").classList.add("active");
	    document.querySelector(".modal").classList.add("active");
	}

	function closeBorrowModal() {
	    document.querySelector(".backdrop").classList.remove("active");
	    document.querySelector(".modal").classList.remove("active");
	}

	// Event Listeners
	editBtn.addEventListener("click", (e) => {
	    e.preventDefault();
	    udInput.forEach((i) => i.removeAttribute("disabled"));
	    editBtn.style.display = "none";
	    deleteBtn.style.display = "none";
	    cancelBtn.style.display = "block";
	    saveBtn.style.display = "block";
	    profileEditBtn.style.display = "block";
	});

	profileEditBtn.addEventListener("click",openBorrowModal);
	
	cancelBtn.addEventListener("click", (e) => {
	    e.preventDefault();
	    location.reload();
	});

	deleteBtn.addEventListener("click", function () {
	      if (window.confirm("Are you sure you want to delete this account?")) {
		        window.location.href = "../delete";
		  }
	  });

	modalCloseBtn.addEventListener("click", closeBorrowModal);

	applyImageBtn.addEventListener('click', function () {
	    const imageUrl = document.getElementById('imageLink').value;
	    const imageFile = document.getElementById('imageUpload').files[0];
	    const formData = new FormData();
	    if (imageUrl) {
	        setImageUrl(imageUrl);
	        return;
	    } else if (imageFile) {
	        formData.append('image-file', imageFile);
	    } else {
	        alert('Please provide an image URL or upload an image.');
	        return;
	    }
	    setLoader(true);
	    axios.post('../upload-image', formData)
	        .then(response => {
	            const imageUrl = response.data;
	            setImageUrl(imageUrl)
	        })
	        .catch(error => {
	            alert('Error uploading image:', error);
	            setLoader(false);
	        });
	});

	</script>
	
		<c:if test="${not empty successMessage}">
		<script>
	            showToastrMessage('${successMessage}', 'success');
		</script>
	</c:if>

	<c:if test="${not empty errorMessage}">
		<script>
	            showToastrMessage('${errorMessage}', 'error');
		</script>
	</c:if>
</body>
</html>
