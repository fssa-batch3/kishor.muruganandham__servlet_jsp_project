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
<link rel="icon" href="../assets/images/book-half.svg"
	type="image/x-icon" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
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
					</div> </a> <a href="./admin_library.html" class="nav-items"><i
					class="bi bi-building"></i>
					<p>Library</p>
					<div class="tooltip" role="tooltip" style="top: 195px"
						data-popper-placement="right">
						Library
						<div class="arrow" data-popper-arrow></div>
					</div> </a> <a href="./borrow-list" class="nav-items"><i
					class="bi bi-inboxes"></i>
					<p>Borrow List</p>
					<div class="tooltip" role="tooltip" style="top: 255px"
						data-popper-placement="right">
						Borrow List
						<div class="arrow" data-popper-arrow></div>
					</div> </a> <a href="#" class="nav-items active"><i
					class="bi bi-file-plus-fill"></i>
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
					</div> </a> <a href="./bookrequest_list.html" class="nav-items"><i
					class="bi bi-hdd-stack"></i>
					<p>Book Request List</p>
					<div class="tooltip" role="tooltip" style="top: 430px"
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
					</div> </a> <a href="../logout" class="nav-items" id="sign-out"><i
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
		<main class="create-book-container">
			<form id="create-book" action="create-book" method="post">
				<div class="title" style="text-align: center">
					<h1>Create Book</h1>
				</div>


				<div class="input-group">
					<label for="title">Title :<sup>*</sup></label>
					<div class="input-field">
						<input type="text" name="title" id="Title"
							placeholder="Enter the title name" class="input" required />
					</div>
				</div>
				<div class="input-group">
					<label for="author">Author Name :<sup>*</sup></label>
					<div class="input-field">
						<input type="text" name="author" id="author"
							placeholder="Enter the Authorname" class="input" required />
					</div>
				</div>
				<div class="input-group">
					<label for="publisher">Publisher :<sup>*</sup></label>
					<div class="input-field">
						<input type="text" name="publisher" id="publisher"
							placeholder="Enter the Publisher name" class="input" required />
					</div>
				</div>
				<div class="input-group">
					<label for="tags">Genre :<sup>*</sup></label>
					<div class="input-field" style="height: unset">
						<input name="input-custom-dropdown" class="custom-tag"
							placeholder="Enter a custom Tag and Press Enter to Add."
							id="choice-js" />
					</div>
				</div>
				<div class="input-group">
					<label for="page">Page :<sup>*</sup></label>
					<div class="input-field">
						<input type="number" name="page" id="page"
							placeholder="Enter Number of Pages" class="input" required />
					</div>
				</div>
				<div class="input-group">
					<label for="copies">Number of Copies :<sup>*</sup></label>
					<div class="input-field">
						<input type="number" name="copies" id="copies" class="input" placeholder="Enter Number of copies"
							required />
					</div>
				</div>
				<div class="input-group">
					<label for="image">Image URL :<sup>*</sup></label>
					<div class="input-field">
						<input type="url" name="image" id="Image"
							placeholder="Enter image URL" class="input" required />
					</div>
				</div>
				<div class="input-group">
					<label for="description">Description :<sup>*</sup></label>
					<div class="input-field">
						<textarea name="description" id="Description"></textarea>
					</div>
				</div>
				<div class="input-group">
					<button type="submit" class="submit">Submit</button>
				</div>
			</form>
		</main>


	</section>
</body>

<script type="module">
    const tagsArray = await getBookGenres();
    const whitelist = Object.keys(tagsArray);
    const customInput = document.querySelector(
      'input[name="input-custom-dropdown"]'
    );
    const tagify = new Tagify(customInput, {
      whitelist,
      maxTags: 5,
      dropdown: {
        maxItems: 20,
        classname: "tags-look",
        enabled: 0,
        closeOnSelect: false,
      },
    });

    function tagsToArray() {
      const tags =
        document.getElementById("choice-js").previousSibling.children;
      let str = "";
      for (let i = 0; i < tags.length - 1; i++) {
        const tag = tags[i].__tagifyTagData?.value;
        console.log(tag);
        str += " " + tag.toLowerCase();
      }

      let stringArray = str.split(" ");
      let row = stringArray.filter((n) => n);
      return row;
    }

  </script>
</html>
