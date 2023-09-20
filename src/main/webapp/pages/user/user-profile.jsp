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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.1.1/crypto-js.min.js"
	integrity="sha512-E8QSvWZ0eCLGk4km3hxSsNmGWbLtSCSUcewDQPQWZF6pEU8GlT8a5fF32wOl1i8ftdMhssTrF/OhyGWwonTcXA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="../../assets/js/db.js"></script>
<script src="../../assets/js/user/script.js"></script>
<script src="../../assets/js/user/header.js" defer></script>
<script src="../../assets/js/user/user_profile.js" defer></script>
<script src="../../assets/js/user/sidebar.js" defer></script>
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
				<a href="./user/homepage.html" class="nav-items"><i
					class="bi bi-house"></i>
					<p>Home</p>
					<div class="tooltip" role="tooltip" data-popper-placement="right">
						Home
						<div class="arrow" data-popper-arrow></div>
					</div> </a> <a href="./library.html" class="nav-items"><i
					class="bi bi-building"></i>
					<p>Library</p>
					<div class="tooltip" role="tooltip" style="top: 195px"
						data-popper-placement="right">
						Library
						<div class="arrow" data-popper-arrow></div>
					</div> </a> <a href="./user/history.html" class="nav-items"><i
					class="bi bi-hourglass"></i>
					<p>History</p>
					<div class="tooltip" role="tooltip" style="top: 255px"
						data-popper-placement="right">
						History
						<div class="arrow" data-popper-arrow></div>
					</div> </a> <a href="./user/favourites.html" class="nav-items"><i
					class="bi bi-bookmark-heart"></i>
					<p>Favourites</p>
					<div class="tooltip" role="tooltip" style="top: 315px"
						data-popper-placement="right">
						Favourites
						<div class="arrow" data-popper-arrow></div>
					</div> </a> <a href="./user/book-request.html" class="nav-items"><i
					class="bi bi-file-earmark-text"></i>
					<p>Request Book</p>
					<div class="tooltip" role="tooltip" style="top: 370px"
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
					</div> </a> <a href="#" class="nav-items" id="sign-out"><i
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
		<main class="user-detail-container">
			<form action="" class="user-detail-form">
				<div class="form-title">
					<h2>User-Profile</h2>
				</div>
				<div class="user-image">
					<i class="bi bi-pencil-fill"></i>
				</div>
				<div class="input-flex-grp">
					<div class="input-group">
						<label for="ud-first-name">First Name : </label>
						<div class="input-field">
							<input type="text" name="ud-first-name" id="ud-first-name"
								class="input ud-input"
								value="<c:out value="${sessionScope.userName}" />" disabled />
						</div>
					</div>
					<div class="input-group">
						<label for="ud-last-name">Last Name :</label>
						<div class="input-field">
							<input type="text" name="ud-last-name" id="ud-last-name"
								class="input ud-input" value="Last Name" disabled />
						</div>
					</div>
					<div class="input-group">
						<label for="ud-display-name">Display Name :</label>
						<div class="input-field">
							<input type="text" name="ud-display-name" id="ud-display-name"
								class="input ud-input" value="Display name" disabled />
						</div>
					</div>
					<div class="input-group">
						<label for="ud-dob">Date of Birth :</label>
						<div class="input-field">
							<input type="date" name="ud-dob" id="ud-dob"
								class="input ud-input datePicker" value="Date of Birth"
								placeholder="YYYY-MM-DD" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}"
								disabled required />
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
								class="input ud-input" value="1234567898" disabled />
						</div>
					</div>

					<div class="input-group">
						<label for="ud-email">Email address :</label>
						<div class="input-field">
							<input type="email" name="ud-email" id="ud-email" class="input"
								value="example@gmail.com" disabled />
						</div>
					</div>
				</div>
				<div class="input-group"
					style="display: flex; margin: auto; gap: 20px; max-width: 500px">
					<button class="user-detail-edit submit">Edit</button>
					<button class="user-detail-delete submit">Delete</button>
					<button class="user-detail-save submit">Save Changes</button>
					<button class="user-detail-cancel submit">Cancel</button>
				</div>
			</form>
		</main>
	</section>
</body>
</html>
