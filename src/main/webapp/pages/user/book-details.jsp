<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Book Detail</title>
<link rel="stylesheet" href="../assets/css/main_page.css" />
<link rel="stylesheet" href="../assets/css/book-request.css" />
<link rel="stylesheet" href="../assets/css/book_detail.css" />
<link rel="icon" href="../assets/images/book-half.svg"
	type="image/x-icon" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"
	integrity="sha512-42PE0rd+wZ2hNXftlM78BSehIGzezNeQuzihiBCvUEB3CVxHvsShF86wBWwQORNxNINlBPuq7rG4WWhNiTVHFg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="../assets/js/db.js"></script>
<script src="../assets/js/script.js"></script>
<script src="../assets/js/header.js" defer></script>
<!-- <script src="../assets/js/comment.js" defer></script> -->
<script src="../assets/js/book.js" defer></script>
<script src="../assets/js/borrow.js" defer></script>
<!-- <script src="../assets/js/book_details.js" defer></script> -->
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
				<a href="./user/homepage.html" class="nav-items"><i
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
					</div> </a> <a href="/LibraryManagement-web/logout" class="nav-items"
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
		<main class="book-detail-container">
			<div class="book-detail-left-wrap">
				<div class="book-detail-sticky-div">
					<div class="book-detail-image">
						<img src="${book.coverImage}" alt="" width="250px" />
					</div>
					<div class="book-detail-info">
						<div class="book-detail-info-one info-row">
							<span>Pages : <br /> <span class="book-detail-pages-info">${book.pages}</span></span>
							<span>Language : <br /> <span
								class="book-detail-language-info">${book.language}</span>
							</span>
						</div>
					</div>
					<div class="book-detail-star-ratings">
						<div class="rating">
							<input type="radio" name="rating" id="rating-5" value="5" /> <label
								for="rating-5"></label> <input type="radio" name="rating"
								id="rating-4" value="4" /> <label for="rating-4"></label> <input
								type="radio" name="rating" id="rating-3" value="3" /> <label
								for="rating-3"></label> <input type="radio" name="rating"
								id="rating-2" value="2" /> <label for="rating-2"></label> <input
								type="radio" name="rating" id="rating-1" value="1" /> <label
								for="rating-1"></label>
						</div>
						<p>
							Average Rating <b class="stars">${ratingDetails.average_rating}</b>
							of 5 <br /> from <b class="raters">${ratingDetails.rating_count}
								User</b>
						</p>
					</div>
					<div class="book-detail-borrow-now">
						<c:choose>
							<c:when test="${borrowed}">
								<a href="view-borrow-list.jsp">Book Already Borrowed By You</a>
							</c:when>
							<c:otherwise>
								<button id="borrow-now">Borrow Now</button>
							</c:otherwise>
						</c:choose>

					</div>
				</div>
			</div>
			<div class="book-detail-right-wrap">
				<div class="book-detail-header">
					<h2>${book.title}</h2>
					<p>
						<b>Written by :</b> ${book.author}
					</p>
					<p>
						<b>Published by :</b> ${book.publisher}
					</p>
					<div class="book-detail-tags-list">
						<c:forEach items="${fn:split(book.genre,'[, ]')}" var="genre">
							<span class="book-detail-tags">${genre}</span>
						</c:forEach>
					</div>
					<div class="book-viewer-container">
						No of Available Copies : <span class="book-views status completed">
							${ book.availableCopies }</span>
					</div>
				</div>
				<div class="book-detail-description">
					<h3>Description</h3>
					<p>${book.description}</p>
				</div>
				<div class="book-detail-comments-container">
					<h4>Comments</h4>
					<div class="add-comment-container">
						<div class="input-group">
							<label for="add-comment">Add a Comment :</label>
							<div class="input-field">
								<textarea name="add-comment" id="add-comment"
									placeholder="Write your thoughts here....[Shift+Enter for New Line][max characters : 230]"
									class="input" maxlength="300"></textarea>
								<button class="bi bi-telegram"></button>
							</div>
						</div>
						<div class="trusted-container">
							<span class="trusted">Trusted</span>
							<p>- The Reader who comments after Reading the book.</p>
						</div>
					</div>
					<div class="comments-container">
						<div class="book-detail-comments-wrap">
							<c:forEach var="comment" items="${commentList}">
								<div class="book-detail-comment" id="comment-${comment.commentId}">
									<div class="comment-header">
										<div class="comment-profile">
											<img src="${comment.user.profileImage}"
												alt="${comment.user.name}" width="40">
											<p class="comment-username">${comment.user.name}<span
													class="trusted">Trusted</span>
											</p>
											<p class="comment-time">${comment.createdAt}</p>
										</div>
										<div class="comment-actions">
											<span class="comment-like"> <i
												class="bi bi-heart-fill"></i>
												<p class="comment-like-number">5</p>
												<div class="tooltip" role="tooltip"
													data-popper-placement="top">Like Members</div>
											</span> <span class="bi bi-pencil-square" onclick="updateComment(${comment.commentId})">Edit</span> <span
												class="bi bi-trash" onclick="deleteComment(${comment.commentId})">Delete</span>
										</div>
									</div>
									<div class="comment-body">
										<span class="bi bi-check-circle-fill" style="display: none;"></span>
										<div class="comment-description">${comment.description}</div>
									</div>
									<div class="comment-footer">
										<div class="tooltip" role="tooltip"
											data-popper-placement="top">${comment.editedAt}</div>
										<small class="comment-edited">${comment.edited ? '(edited)' : ''}</small>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
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
			<form class="modal-body" action="borrow" method="post">
				<div class="input-group" style="width: 100%">
					<label for="book-title">Book Name :</label>
					<div class="input-field">
						<input type="text" name="book-title" id="book-title"
							value="${book.title}" disabled /> <input type="text"
							name="bookId" value="${book.bookId}" hidden="true" />
					</div>
				</div>
				<div class="input-group" style="width: 100%">
					<label for="due-duration">Borrow Days :</label>
					<div class="input-field">
						<select name="days" id="due-duration">
							<option value="5">5 Days</option>
							<option value="15" selected>15 Days</option>
							<option value="20">20 Days</option>
							<option value="30">30 Days</option>
						</select>
					</div>
				</div>
				<div class="input-group" style="flex: 1; margin-right: 20px">
					<label for="borrow-date">Borrow Date :</label>
					<div class="input-field">
						<input type="date" name="borrow-date" id="borrow-date" required
							disabled /> <br /> <span class="status">Borrow At : <span
							class="full-borrow-date full-date"></span>
						</span>
					</div>
				</div>
				<div class="input-group" style="flex: 1; min-width: 300px">
					<label for="due-date">Due Date : </label>
					<div class="input-field">
						<input type="date" name="due-date" id="due-date" required disabled />
						<br /> <span class="status">Due till : <span
							class="full-due-date full-date"></span></span>
					</div>
				</div>
				<div class="input-group">
					<p style="margin-top: 15px;">Please note, there will be a fine
						of 10 rupees per day for overdue borrows.</p>
				</div>
				<div class="modal-footer">
					<button class="modal-submit" type="submit">Borrow Now</button>
				</div>
			</form>
		</div>
	</section>
	<!-- Include Axios from CDN -->
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

	<script type="text/javascript">
	const ratingInputs = document.querySelectorAll('input[type="radio"]');
	ratingInputs.forEach((input) => {
	  input.addEventListener("click", () => {
	    const ratingValue = +input.value;
	    if (${rating} === ratingValue) {
	      return;
	    }
	    const ratingObj = {
	      user_id: ${sessionScope.userId},
	      rating: ratingValue,
	      book_id: ${book.bookId},
	    };

	    axios.post('rating', ratingObj)
	      .then(response => {
	        console.log('Rating sent successfully:', response.data);
	      })
	      .catch(error => {
	        console.error('Error sending rating:', error);
	      });
	  });
	});

	function setRatingValue(data) {
	    let radioButtons = document.getElementsByName("rating");
	    for (const radioButton of radioButtons) {
	      if (radioButton.id === "rating-" + data) {
	        radioButton.checked = true;
	        break;
	      }
	    }
	  }
	setRatingValue(${rating});
	
	
	function deleteComment(id) {
	    console.log(id);
	    const confirmed = confirm('Are you sure you want to delete this comment?');
	    if (confirmed) {
	      axios.delete("comment?commentId="+ id)
	        .then(response => {
	          alert('Comment deleted successfully');
	          const commentElement = document.getElementById("comment-"+id);
	          if (commentElement) {
	            commentElement.parentElement.removeChild(commentElement);
	          }
	        })
	        .catch(error => {
	          console.error('Error deleting comment:', error);
	        });
	    }
	  }
	
	function updateComment(id) {
	    const updatedDescription = prompt('Enter the new description for the comment:');
	    if (updatedDescription === null) {
	      return; 
	    }

	    const updatedComment = {
	      description: updatedDescription
	    };

	    axios.put("comment?commentId="+id, updatedComment)
	      .then(response => {
	        alert('Comment updated successfully');
	        const commentElement = document.getElementById("comment-"+id);
	        if (commentElement) {
	          const descriptionElement = commentElement.querySelector('.comment-description');
	          if (descriptionElement) {
	            descriptionElement.innerText = updatedDescription;
	          }
	        }
	      })
	      .catch(error => {
	        console.error('Error updating comment:', error);
	      });
	  }

	</script>
</body>
</html>
