<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Library</title>
<link rel="stylesheet" href="../assets/css/main_page.css" />
<link rel="icon" href="../assets/images/book-half.svg"
	type="image/x-icon" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"
	integrity="sha512-42PE0rd+wZ2hNXftlM78BSehIGzezNeQuzihiBCvUEB3CVxHvsShF86wBWwQORNxNINlBPuq7rG4WWhNiTVHFg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
					</div> </a> <a href="#" class="nav-items active"><i
					class="bi bi-building"></i>
					<p>Library</p>
					<div class="tooltip" role="tooltip" style="top: 195px"
						data-popper-placement="right">
						Library
						<div class="arrow" data-popper-arrow></div>
					</div> </a> <a href="./borrow-list" class="nav-items "><i
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
					</div> </a> <a href="<%=request.getContextPath()%>/logout"
					class="nav-items" id="sign-out"><i class="bi bi-box-arrow-left"></i>
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
		<main class="library-container" style="height: 100%">
			<div class="library-tags">
				<button onclick="tagFilterBooks('All')" class="active">All</button>
				<c:forEach var="genre" items="${genreList}">
					<button onclick="tagFilterBooks('${genre}')">${genre}</button>
				</c:forEach>
			</div>
			<div class="library-section generated-books books-section-style">
				<c:forEach items="${bookList}" var="book">
					<div data-id="${book.bookId}" class="book">
						<a class="book-cover" href="book/update?bookId=${book.bookId}"
							data-filter-tag="${book.genre}"> <img
							src="${book.coverImage}" alt="${book.title}" width="150px">
						</a>
						<div class="book-title">
							<h4>${book.title}</h4>
							<p>${book.author}</p>
						</div>

					</div>
				</c:forEach>
			</div>
		</main>

		<div class="backdrop"></div>
		<div class="modal">
			<div class="modal-header">
				<h3 class="modal-title">Borrow-Book</h3>
				<div class="modal-close">
					<i class="bi bi-x-lg"></i>
				</div>
			</div>
			<div class="modal-body">
				<div class="input-group" style="width: 100%">
					<label for="book-title">Book Name :</label>
					<div class="input-field">
						<input type="text" name="book-title" id="book-title" value=""
							readonly />
					</div>
				</div>
				<div class="input-group" style="flex: 1">
					<label for="borrow-date">Borrow Date :</label>
					<div class="input-field">
						<input type="date" name="borrow-date" id="borrow-date" required />
					</div>
				</div>
				<div class="input-group" style="flex: 1">
					<label for="due-date">Due Date :</label>
					<div class="input-field">
						<input type="date" name="due-date" id="due-date" required />
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button class="modal-submit">Borrow Now</button>
			</div>
		</div>
	</section>

	<script>
	
	   function tagFilterBooks(value) {
	     const btns = document.querySelectorAll(".library-tags button");
	     btns.forEach((btn) => {
	       if (value.toLowerCase() == btn.innerHTML.toLowerCase().trim()) {
	         btn.classList.add("active");
	      } else {
	         btn.classList.remove("active");
	       }
	     });
	     const books = document.querySelectorAll(".book-cover");
	     books.forEach((book) => {
	       const bookTag = book.dataset.filterTag.toLowerCase();
	       book.parentElement.style.display =
	        value.toLowerCase() == "all" ||
	         bookTag.includes(value.toLowerCase())
	          ? "block"
	           : "none";
	     });
	   }

	   tagFilterBooks("All");
    </script>
</body>
</html>


