<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Dashboard</title>

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
				<a href="#" class="nav-items active"><i class="bi bi-house"></i>
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
					</div> </a> <a href="./borrow-history" class="nav-items "><i
					class="bi bi-hourglass-split"></i>
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
		<main class="main-section">
			<section class="card-section">
				<div class="user-info-container">
					<canvas id="chart"></canvas>
				</div>

				<div class="instructions">
					<h3>Instructions</h3>
					<ul>
						<li>Please handle library materials with care and respect to
							ensure their longevity and availability for future users.</li>
						<li>Please return borrowed materials on time to avoid late
							fees and to make the materials available to other users.</li>
						<li>Please report any damages or issues with borrowed
							materials to library staff as soon as possible.</li>
					</ul>
				</div>
			</section>

			<section class="hero-section hero-interseting">
				<div class="books-content">
					<h3>
						CAN BE <br /> <span>INTERESTING</span>
					</h3>
					<p>Check this list of books,picked up by us and choose
						something new!</p>
					<a href="./book-list">See Full List</a>
				</div>
				<div class="book-wrap generated-books interesting-books">
					<c:forEach items="${bookList}" var="book">
						<div data-id="${book.bookId}" class="book">
							<a class="book-cover" href="book-details?bookId=${book.bookId}"
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
			</section>
		</main>
	</section>

	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script>
	

	const ctx = document.getElementById('chart').getContext('2d');
	const chart = new Chart(ctx, {
	    type : 'doughnut',
	    data : {
		labels : [ 'Books in Library', 'Books Borrowed',
			'Ratings Given', 'Comments Written' ],
		datasets : [ {
		    label : 'Counts',
		    data : [ ${booksInLibrary}, ${booksBorrowed}, ${ratingsGiven},
			${commentsWritten} ],
		    backgroundColor : [ 'rgba(54, 162, 235)',
			    'rgba(255, 99, 132 )',
			    'rgba(75, 192, 192)',
			    'rgba(255, 206, 86)' ],
		    borderWidth : 1
		} ]
	    },
          
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
