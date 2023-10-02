<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Book Request Form</title>

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
<link rel="stylesheet" href="../assets/css/book-request.css" />
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
				<a href="./dashboard" class="nav-items"><i
					class="bi bi-house"></i>
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
					</div> </a> <a href="#" class="nav-items active"><i
					class="bi bi-file-earmark-text-fill"></i>
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
		<main class="request-section">
			<form action="request-book" method="post" class="book-request">
				<div class="form-title">
					<h2>Request a Book</h2>
				</div>
				<div class="input-group">
					<label for="book-name">Book-name : <sup>*</sup></label>
					<div class="input-field">
						<input type="text" name="book-name" id="book-name"
							placeholder="Enter the book-name" class="input" required />
					</div>
				</div>
				<div class="input-group">
					<label for="author-name">Author-name :<sup>*</sup>
					</label>
					<div class="input-field">
						<input type="text" name="author-name" id="author-name"
							placeholder="Enter the author-name" class="input" required />
					</div>
				</div>
				<div class="input-group">
					<label for="source-link">Source Link :<sup
						style="color: var(--font-black)">(optional)</sup></label>
					<div class="input-field">
						<input type="url" name="source-link" id="source-link"
							placeholder="Enter the source-link" class="input" maxlength="4" />
					</div>
				</div>
				<div class="input-group">
					<label for="description">Why this Book? :<sup>*</sup></label>
					<div class="input-field">
						<textarea name="description" id="description" maxlength="300"
							placeholder="Give us a small description why this book is needed for our library (Max Characters : 300)"></textarea>
					</div>
				</div>
				<div class="input-group">
					<button class="submit">Submit</button>
				</div>
			</form>
		</main>
	</section>

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
