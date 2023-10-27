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
<link rel="stylesheet" href="../assets/css/book_detail.css" />
<link rel="icon" href="../assets/images/book-half.svg"
	type="image/x-icon" />
<script src="../assets/js/script.js"></script>
<script src="../assets/js/borrow.js"></script>
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
						<c:choose>
							<c:when test="${ratingDetails.rating_count > 0}">
								<p>
									Overall Rating: <b class="stars">${ratingDetails.average_rating}</b>/5
									<br> Rated by <b class="raters">${ratingDetails.rating_count}
									</b>User
								</p>
							</c:when>
							<c:otherwise>
								<p>Be the first one to rate this book!!</p>
							</c:otherwise>
						</c:choose>

					</div>
					<div class="book-detail-borrow-now">
						<c:if test="${borrowed}">
							<p class="available-date">Book is already borrowed by you</p>
						</c:if>

						<c:if test="${book.availableCopies <= 0 && !borrowed}">
							<a href="view-borrow-list.jsp" class="status"
								style="display: flex; justify-content: center; font-size: 18px;">View
								when book <br> will be available
							</a>
						</c:if>

						<c:if test="${book.availableCopies > 0 && !borrowed}">
							<button id="borrow-now">Borrow Now</button>
						</c:if>
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
								<button class="bi bi-telegram" onclick="sendComment()"></button>
							</div>
						</div>
						<div class="trusted-container">
							<span class="trusted">Trusted</span>
							<p>- The Reader who comments after Reading the book in this
								library.</p>
						</div>
					</div>
					<div class="comments-container">
						<div class="book-detail-comments-wrap">
							<c:choose>
								<c:when test="${empty commentList}">
									<p class="no-comments">No comments found</p>
								</c:when>
								<c:otherwise>
									<c:forEach var="comment" items="${commentList}">
										<div class="book-detail-comment"
											id="comment-${comment.commentId}">
											<div class="comment-header">
												<div class="comment-profile">
													<img src="${comment.user.profileImage}"
														alt="${comment.user.name}" width="40">
													<p class="comment-username">${comment.user.name}
														<c:if test="${comment.trusted}">
															<span class="trusted">Trusted</span>
														</c:if>
													</p>
													<p class="comment-time">
														<script>document.write(dynamicTime('${comment.createdAt}'));</script>
													</p>
												</div>
												<c:if test="${comment.user.userId == sessionScope.userId}">
													<div class="comment-actions">
														<span class="bi bi-pencil-square"
															onclick="updateComment(${comment.commentId})">Edit</span>
														<span class="bi bi-trash"
															onclick="deleteComment(${comment.commentId})">Delete</span>
													</div>
												</c:if>
											</div>
											<div class="comment-body">
												<div class="comment-description">${comment.description}</div>
											</div>
											<div class="comment-footer">
												<div class="tooltip" role="tooltip"
													data-popper-placement="top">
													<script>document.write(dynamicTime('${comment.editedAt}'));</script>
												</div>
												<small class="comment-edited">${comment.edited ? '(edited)' : ''}</small>
											</div>
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
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
			<div class="modal-body">
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
				<div class="input-group"
					style="display: flex; justify-content: space-evenly; width: 100%;">
					<span class="status">Borrow At : <span
						class="full-borrow-date full-date" style="font-size: 18px;"></span>
					</span> <span class="status">Due till : <span
						class="full-due-date full-date" style="font-size: 18px;"></span></span>
				</div>
				<div class="input-group">
					<p style="margin-top: 15px;">
						Note : There will be a fine of 10 rupees per day for overdue
						borrows. <br> A user can borrow only 5 books at a time
					</p>
				</div>
			</div>
			<div class="modal-footer">
				<button class="modal-submit" type="button">Borrow Now</button>
			</div>
		</div>
	</section>
	<div id="loader-container"></div>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

	<script type="text/javascript">
	
	document.querySelector('.modal-submit').addEventListener('click', () => {
	    setLoader(true);
	    const dueDuration = document.getElementById('due-duration').value;


	    axios.post('borrow?days='+dueDuration+'&bookId='+'${book.bookId}')
	        .then(response => {
	            showToastrMessage('Borrow request successful!', 'success');
	            setLoader(false);
	            window.location.href = 'borrow-history'; 
	        })
	        .catch(error => {
	            setLoader(false);
	            console.log(error);
	            showToastrMessage('Error: ' + error.response.data,'error');
	        });
	});


	  const sendBtn = document.querySelector(".add-comment-container .bi-telegram");
	  const commentValue = document.querySelector("#add-comment");

	  commentValue.addEventListener("keydown", (event) => {
	    if (event.shiftKey && event.keyCode === 13) {
	      commentValue.insertAdjacentHTML("beforeend", "");
	    } else if (event.keyCode === 13) {
	      event.preventDefault();
	      sendBtn.click();
	    }
	  });
	const commentEditedElements = document.querySelectorAll('.comment-edited');

	commentEditedElements.forEach((commentEdited) => {
	  commentEdited.addEventListener('mouseover', () => {
	    const tooltip = commentEdited.parentElement.querySelector('.tooltip');
	    tooltip.style.display = 'block';
	  });

	  commentEdited.addEventListener('mouseout', () => {
	    const tooltip = commentEdited.parentElement.querySelector('.tooltip');
	    tooltip.style.display = 'none';
	  });
	});
	
	const ratingInputs = document.querySelectorAll('input[type="radio"]');

	const handleRatingClick = (input) => {
	  const ratingValue = +input.value;
	  
	  if (${rating} === ratingValue) {
	      showToastrMessage("Rating value same as previous",'warning');
	      setLoader(false);
	    return;
	  }
	  
	  const ratingObj = {
	    user_id: ${sessionScope.userId},
	    rating: ratingValue,
	    book_id: ${book.bookId},
	  };

	  axios.post('rating', ratingObj)
	    .then(response => {  
	      const pElement = document.createElement('p');
	      pElement.innerHTML = `Overall Rating: <b class="stars">`+ response.data.average_rating.toFixed(1) +`</b>/5
	        <br>Rated by <b class="raters">`+response.data.rating_count+`</b> User`;
	      const starRatingsElement = document.querySelector('.book-detail-star-ratings');
	      starRatingsElement.lastElementChild.remove();
	      starRatingsElement.appendChild(pElement);
	      setRatingValue(ratingValue);
	      showToastrMessage('Rating added successfully!','success');
	      setLoader(false);
	    })
	    .catch(error => { 
		showToastrMessage('Error sending rating'+ error,'error');
	    });
	};
	

	ratingInputs.forEach((input) => {
	  input.addEventListener("click", () => {
	      setLoader(true);
	    handleRatingClick(input);
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
	    const confirmed = confirm('Are you sure you want to delete this comment?');
	    if (confirmed) {
	      axios.delete("comment?commentId="+ id)
	        .then(response => {
	          const commentElement = document.getElementById("comment-"+id);
	          if (commentElement.parentElement.childElementCount == 1) {
	            commentElement.parentElement.innerHTML = '<p class="no-comments">No comments found</p>';
	            commentElement.remove();	
			} else{
	            commentElement.parentElement.removeChild(commentElement);				    
			}
	            showToastrMessage('Comment deleted successfully','success');
	         
	        })
	        .catch(error => {
	            showToastrMessage('Error deleting comment:'+ error,'error');
	        });
	    }
	  }
	
	function updateComment(id) {
	    const commentElement = document.getElementById("comment-"+id);
		const descriptionElement = commentElement.querySelector('.comment-description');
	    const timestampElement = commentElement.querySelector('.comment-footer .tooltip');
	    const editedElement = commentElement.querySelector('.comment-edited');
	    const updatedDescription = prompt('Enter the new description for the comment:',descriptionElement.innerText);
	    if (updatedDescription === null) {
	      return; 
	    }

	    const updatedComment = {
	      description: updatedDescription
	    };

	    axios.put("comment?commentId="+id, updatedComment)
	      .then(response => {
		  showToastrMessage('Comment updated successfully','success');
	        
	        if (commentElement) {
	          if (descriptionElement) {
	            descriptionElement.innerText = updatedDescription;
	          }
	          editedElement.innerText = "(edited)";
	          timestampElement.innerText = dynamicTime(moment().format());
	          
	        }
	      })
	      .catch(error => {
		  showToastrMessage('Error updating comment:'+ error,'error');
	      });
	  }
	
	function sendComment() {
	    setLoader(true);
	    let commentData = document.getElementById('add-comment');
	     if (commentData.value.trim().length === 0) {
		 showToastrMessage("Comment cannot be empty or contain only whitespace",'warning');
		    setLoader(false);
		    return;
		} 

		  const commentObj = {
			    userId: ${sessionScope.userId},
			    email: '${sessionScope.user}',
			    userName: '${sessionScope.userName}',
			    profileImage: '${sessionScope.profileImage}',
			    comment: commentData.value,
			    bookId: ${book.bookId},
			    bookTitle: `${book.title}`,
			    coverImage: '${book.coverImage}',
			  };

			// Usage
			axios.post('comment', commentObj)
			    .then(response => {
			        const commentElement = createCommentElement(response.data);
					commentData.value = '';
					showToastrMessage("Comment added successfully!!","success");
			        setLoader(false);
			        appendCommentToSection(commentElement);
			    })
			    .catch(error =>{ 
					setLoader(false);
					showToastrMessage('Error:'+ error,'error');
				});

	}

	// Function to create a comment element
	function createCommentElement(commentData) {
	    const commentContainer = document.createElement('div');
	    commentContainer.classList.add('book-detail-comment');
	    commentContainer.id = 'comment-'+commentData.commentId;

	    // Create the comment header
	    const commentHeader = document.createElement('div');
	    commentHeader.classList.add('comment-header');

	    // Create the comment profile section
	    const commentProfile = document.createElement('div');
	    commentProfile.classList.add('comment-profile');

	    const profileImage = document.createElement('img');
	    profileImage.src = commentData.user.profileImage;
	    profileImage.alt = commentData.user.name;
	    profileImage.width = '40';

	    const commentUsername = document.createElement('p');
	    commentUsername.classList.add('comment-username');
	    commentUsername.innerText = commentData.user.name;
	    
	    const commentCreatedAt = document.createElement('p');
	    commentCreatedAt.classList.add('comment-time');
	    commentCreatedAt.innerText = moment().startOf('second').fromNow();

	    if(commentData.trusted == true){
	    const trustedBadge = document.createElement('span');
	    trustedBadge.classList.add('trusted');
	    trustedBadge.innerText = 'Trusted';
	    commentUsername.appendChild(trustedBadge);
	    }

	    commentProfile.appendChild(profileImage);
	    commentProfile.appendChild(commentUsername);
	    commentProfile.appendChild(commentCreatedAt);

	    // Create the comment actions section
	    const commentActions = document.createElement('div');
	    commentActions.classList.add('comment-actions');

	    const editIcon = document.createElement('span');
	    editIcon.classList.add('bi', 'bi-pencil-square');
	    editIcon.innerText = 'Edit';
	    editIcon.setAttribute('onclick', 'updateComment(' + commentData.commentId + ')');

	    const deleteIcon = document.createElement('span');
	    deleteIcon.classList.add('bi', 'bi-trash');
	    deleteIcon.innerText = 'Delete';
	    deleteIcon.setAttribute('onclick', 'deleteComment(' + commentData.commentId + ')');


	    commentActions.appendChild(editIcon);
	    commentActions.appendChild(deleteIcon);

	    // Append comment profile and actions to the header
	    commentHeader.appendChild(commentProfile);
	    commentHeader.appendChild(commentActions);

	    // Create the comment body
	    const commentBody = document.createElement('div');
	    commentBody.classList.add('comment-body');

	    const commentDescription = document.createElement('div');
	    commentDescription.classList.add('comment-description');
	    commentDescription.innerText = commentData.description;

	 


	    // Create the comment footer
	    const commentFooter = document.createElement('div');
	    commentFooter.classList.add('comment-footer');

	 	// Create the tooltip
	    const tooltip = document.createElement('div');
	    tooltip.classList.add('tooltip');
	    tooltip.setAttribute('role', 'tooltip');
	    tooltip.setAttribute('data-popper-placement', 'top');

	    // Create the edited text
	    const editedText = document.createElement('small');
	    editedText.classList.add('comment-edited');
	    editedText.innerText = '';

	    // Append the tooltip and edited text to the footer
	    commentFooter.appendChild(tooltip);
	    commentFooter.appendChild(editedText);

	    commentBody.appendChild(commentDescription);
	    commentContainer.appendChild(commentHeader);
	    commentContainer.appendChild(commentBody);
	    commentContainer.appendChild(commentFooter);

	    return commentContainer;
	}

	// Function to append a comment to the comment section
	function appendCommentToSection(commentElement) {
	    const commentSection = document.querySelector('.book-detail-comments-wrap');
	    commentSection.appendChild(commentElement);
	}



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
