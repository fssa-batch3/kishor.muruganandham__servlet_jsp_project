<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Create Book</title>
<link rel="stylesheet" href="../assets/css/main_page.css" />
<link rel="stylesheet" href="../assets/css/book-request.css" />
<link rel="stylesheet" href="../assets/css/admin_pages.css" />
<link rel="icon" href="../assets/images/book-half.svg"
	type="image/x-icon" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"
	integrity="sha512-42PE0rd+wZ2hNXftlM78BSehIGzezNeQuzihiBCvUEB3CVxHvsShF86wBWwQORNxNINlBPuq7rG4WWhNiTVHFg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css"
	rel="stylesheet" type="text/css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/tagify/4.17.8/tagify.min.js"
	integrity="sha512-7vyDVrzHbIl2MbbDj2lgeXUVSe4NSbY5jn030+QN321CTl8XEc3J5Qlq976YY5gs+Ifwff9Q2SrDXLPWxAp2oQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://upload-widget.cloudinary.com/global/all.js"
	type="text/javascript">
    
</script>
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
				 <a href="./book-list" class="nav-items"><i
					class="bi bi-building"></i>
					<p>Library</p>
					<div class="tooltip" role="tooltip" style="top: 140px"
						data-popper-placement="right">
						Library
						<div class="arrow" data-popper-arrow></div>
					</div> </a> <a href="./borrow-list" class="nav-items"><i
					class="bi bi-inboxes"></i>
					<p>Borrow List</p>
					<div class="tooltip" role="tooltip" style="top: 195px"
						data-popper-placement="right">
						Borrow List
						<div class="arrow" data-popper-arrow></div>
					</div> </a> <a href="#" class="nav-items active"><i
					class="bi bi-file-plus"></i>
					<p>Create Book</p>
					<div class="tooltip" role="tooltip" style="top: 255px"
						data-popper-placement="right">
						Create Book
						<div class="arrow" data-popper-arrow></div>
					</div> </a> <a href="./user-list" class="nav-items "><i
					class="bi bi-person-fill"></i>
					<p>User List</p>
					<div class="tooltip" role="tooltip" style="top: 310px"
						data-popper-placement="right">
						User List
						<div class="arrow" data-popper-arrow></div>
					</div> </a> <a href="./book-request" class="nav-items "><i
					class="bi bi-hdd-stack"></i>
					<p>Book Request List</p>
					<div class="tooltip" role="tooltip" style="top: 370px;"
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

		<jsp:include page="header.jsp"></jsp:include>

		<form action="create-book" method="post" class="book-edit-container">
			<div class="book-edit-left-wrap">
				<div class="book-edit-image">
					<img src="https://fakeimg.pl/400x600?text=Upload+Image" alt=""
						width="200px" /> <i class="bi bi-pencil-fill"
						style="display: block"></i> <input type="hidden" name="coverImage"
						id="ed-cover-image" value="${book.coverImage}"
						placeholder="Enter the" />
				</div>
				<div class="button-grp">
					<button class="book-save submit" type="submit">Create Book</button>
				</div>
			</div>
			<div class="book-edit-right-wrap">
		<div class="form-title">
					<h2>Create Book 📖</h2>
				</div>
				<div class="input-group">
					<label for="ed-book-title">Title : </label>
					<div class="input-field">
						<input type="text" name="title" id="ed-book-title"
							class="input ed-input" value="${book.title}"
							placeholder="Enter the Title" />
					</div>
				</div>
				<div class="input-group">
					<label for="ed-book-author">Author :</label>
					<div class="input-field">
						<input type="text" name="author" id="ed-book-author"
							class="input ed-input" value="${book.author}"
							placeholder="Enter the Author name" />
					</div>
				</div>
				<div class="input-group">
					<label for="ed-book-publisher">Publisher :</label>
					<div class="input-field">
						<input type="text" name="publisher" id="ed-book-publisher"
							class="input ed-input" value="${book.publisher}"
							placeholder="Enter the Publisher name" />
					</div>
				</div>
				<div class="input-group">
					<label for="ed-book-tags">Genre : </label>
					<div class="input-field" style="height: unset">
						<input name="genre" class="custom-tag ed-input"
							placeholder="Enter a custom Tag and Press Enter to Add."
							id="ed-book-tags" style="min-height: 55px"
							placeholder="Enter the Genres" />
					</div>
				</div>

				<div class="input-flex">
					<div class="input-group">
						<label for="ed-language">Language :</label>
						<div class="input-field">
							<select name="language" id="ed-language" class="input ed-input">
								<option value="" disabled selected>Select the book
									language</option>
								<option value="Assamese"
									${book.language == 'Assamese' ? 'selected' : ''}>Assamese</option>
								<option value="Bengali"
									${book.language == 'Bengali' ? 'selected' : ''}>Bengali</option>
								<option value="English"
									${book.language == 'English' ? 'selected' : ''}>English</option>
								<option value="Gujarati"
									${book.language == 'Gujarati' ? 'selected' : ''}>Gujarati</option>
								<option value="Hindi"
									${book.language == 'Hindi' ? 'selected' : ''}>Hindi</option>
								<option value="Kannada"
									${book.language == 'Kannada' ? 'selected' : ''}>Kannada</option>
								<option value="Kashmiri"
									${book.language == 'Kashmiri' ? 'selected' : ''}>Kashmiri</option>
								<option value="Konkani"
									${book.language == 'Konkani' ? 'selected' : ''}>Konkani</option>
								<option value="Maithili"
									${book.language == 'Maithili' ? 'selected' : ''}>Maithili</option>
								<option value="Malayalam"
									${book.language == 'Malayalam' ? 'selected' : ''}>Malayalam</option>
								<option value="Manipuri"
									${book.language == 'Manipuri' ? 'selected' : ''}>Manipuri</option>
								<option value="Marathi"
									${book.language == 'Marathi' ? 'selected' : ''}>Marathi</option>
								<option value="Nepali"
									${book.language == 'Nepali' ? 'selected' : ''}>Nepali</option>
								<option value="Oriya"
									${book.language == 'Oriya' ? 'selected' : ''}>Oriya</option>
								<option value="Punjabi"
									${book.language == 'Punjabi' ? 'selected' : ''}>Punjabi</option>
								<option value="Santali"
									${book.language == 'Santali' ? 'selected' : ''}>Santali</option>
								<option value="Sindhi"
									${book.language == 'Sindhi' ? 'selected' : ''}>Sindhi</option>
								<option value="Tamil"
									${book.language == 'Tamil' ? 'selected' : ''}>Tamil</option>
								<option value="Telugu"
									${book.language == 'Telugu' ? 'selected' : ''}>Telugu</option>
								<option value="Urdu"
									${book.language == 'Urdu' ? 'selected' : ''}>Urdu</option>
							</select>

						</div>
					</div>
					<div class="input-group">
						<label for="ed-pages">No of Pages :</label>
						<div class="input-field">
							<input type="number" name="pages" id="ed-pages"
								class="input ed-input" value="${book.pages}"
								placeholder="Enter the number of pages" />
						</div>
					</div>
				</div>
				<div class="input-group">
					<label for="ed-totalCopies">Total Copies :</label>
					<div class="input-field">
						<input type="number" name="totalCopies" id="ed-totalCopies"
							class="input ed-input" value="${book.totalCopies}"
							placeholder="Enter the total copies of book" /> <input
							type="number" name="availableCopies" id="ed-availableCopies"
							class="input ed-input" value="${book.availableCopies}"
							hidden="true" />
					</div>
				</div>


				<div class="input-group">
					<label for="ed-book-description">Description : </label>
					<div class="input-field">
						<textarea name="description" id="ed-book-description" cols="30"
							rows="6" class="input ed-input"
							placeholder="Enter the Description">${book.description}</textarea>
					</div>
				</div>
			</div>
		</form>
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
			<form id="saveForm">
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

	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script type="text/javascript">

	  const editBtn = document.querySelector(".book-edit.submit");
	  const imgEditBtn = document.querySelector(".bi-pencil-fill");
	  const bookImg = document.querySelector(".book-edit-image img");
	  const bookImgValue = document.querySelector("#ed-cover-image");
	  const genres = '${genreList}';

	  const customInput = document.querySelector('.custom-tag');

	  const tagify = new Tagify(customInput, {
	      maxTags: 5,
	      dropdown: {
	          enabled: true,  
	          closeOnSelect: true,  
	          maxItems: 20,
	          classname: "tags-look"
	      },
	      originalInputValueFormat: valuesArr => {
	          return valuesArr.map(item => item.value).join(', ');
	      },
	      
	      callbacks: {
	          add: () => {
	              customInput.value = tagify.value.map(tag => tag.value).join(', ');
	          },
	          remove: () => {
	              customInput.value = tagify.value.map(tag => tag.value).join(', ');
	          }
	      }
	  });
	  tagify.whitelist = genres;
  
	  
		const modalCloseBtn = document.querySelector(".modal-close");
		modalCloseBtn.addEventListener("click", closeImageModal);

		const imageLinkInput = document.getElementById("imageLink");
		const imageUploadInput = document.getElementById("imageUpload");
		const applyImageBtn = document.getElementById("applyImageBtn");
	  
	  imgEditBtn.addEventListener("click", () => {
	      openImageModal();
		});
		function openImageModal() {
			  document.querySelector(".backdrop").classList.add("active");
			  document.querySelector(".modal").classList.add("active");
			}
		

		function closeImageModal() {
		  document.querySelector(".backdrop").classList.remove("active");
		  document.querySelector(".modal").classList.remove("active");
		}

		const saveForm = document.getElementById('saveForm');
		saveForm.addEventListener('submit', function(event) {
		    event.preventDefault(); 

		    const imageLink = document.getElementById('imageLink').value;  
		    const imageFile = document.getElementById('imageUpload').files[0];

		    
		    const formData = new FormData();
		    if (imageLink) {
		        formData.append('image-url', imageLink);
		    } else if (imageFile) {
		        formData.append('image-file', imageFile);
		    }

		    axios.post('upload-image', formData)
		        .then(response => {
		            const imageUrl = response.data;  
		            console.log('Image URL:', imageUrl);
		            bookImg.src = imageUrl;
		            bookImgValue.value = imageUrl;
		            alert("Book image uploaded successfully");
		            closeImageModal();
		        })
		        .catch(error => {
		            console.error('Error sending image data:', error);
		        });
		});
	  </script>
</body>
</html>
