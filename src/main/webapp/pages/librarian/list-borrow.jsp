<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Borrow List</title>
<link rel="icon" href="../assets/images/book-half.svg"
	type="image/x-icon" />
<link rel="stylesheet" href="../assets/css/main_page.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"
	integrity="sha512-42PE0rd+wZ2hNXftlM78BSehIGzezNeQuzihiBCvUEB3CVxHvsShF86wBWwQORNxNINlBPuq7rG4WWhNiTVHFg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="../assets/js/db.js"></script>
<script src="../assets/js/script.js"></script>
<script src="../assets/js/header.js" defer></script>
<script src="../assets/js/sidebar.js" defer></script>
<link
	href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"
	rel="stylesheet">
<style type="text/css">
.dataTables_wrapper .dataTables_filter {
	text-align: center;
}

#borrowTable a {
	text-decoration: underline;
	color: var(--primary-color);
}

#borrowTable .submit{
	text-decoration: none;
	color: white;
	padding: 10px 15px;
}
</style>
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
					</div> </a> <a href="#" class="nav-items active"><i
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
		<main class="history-container">
			<h3 id="history-table-heading">Borrow List</h3>
			<div class="history-table-wrapper">

				<table id="borrowTable" class="display">
					<thead>
						<tr>
							<th>S.No</th>
							<th>User Profile</th>
							<th>User Name</th>
							<th>Book Title</th>
							<th>Borrow Date</th>
							<th>Due Date</th>
							<th>Return Date</th>
							<th>Status</th>
							<th>Fine</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="borrow" items="${borrowList}" varStatus="loop">
							<tr>
								<td>${loop.index + 1}</td>
								<td><img src="${borrow.user.profileImage}"
									alt="Profile Image" width="50px" height="50px"
									style="border-radius: 50%"></td>
								<td><a href="borrow-list/user?userId=${borrow.user.userId}"
									target="_blank">${borrow.user.name}</a></td>
								<td><a href="borrow-list/book?bookId=${borrow.book.bookId}"
									target="_blank">${borrow.book.title}</a></td>
								<td><script>
				    document.write(moment(
					    "${borrow.borrowDate}").format(
					    "MMMM Do, YYYY"));
				</script></td>
								<td><script>
				    document.write(moment("${borrow.dueDate}")
					    .format("MMMM Do, YYYY"));
				</script></td>
								<td><script>
				    document
					    .write((moment("${borrow.returnDate}")
						    .isValid()) ? moment(
						    "${borrow.returnDate}")
						    .format("MMMM Do, YYYY")
						    : "-");
				</script></td>
								<td><c:choose>
										<c:when test="${borrow.returned}">
											<span class="borrow-status status completed">Returned</span>
										</c:when>
										<c:otherwise>
											<a href="borrow-list/return?borrowId=${borrow.borrowId}" class="submit">Return Book</a>
										</c:otherwise>
									</c:choose></td>
								<td>₹ ${borrow.fine}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</main>
	</section>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.datatables.net/v/dt/dt-1.13.6/datatables.min.js"></script>
	<script>
	$(document).ready(function() {
	    $('#borrowTable').DataTable();
	});
    </script>
</body>
</html>
