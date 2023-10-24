<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
String userName = (String) session.getAttribute("userName");
String profileImage = (String) session.getAttribute("profileImage");
%>
<header class="top-header">
	<div class="left-header">
		<div class="side-toggle">
			<span class="menu-line"></span><span class="menu-line"></span><span
				class="menu-line"></span>
		</div>
		<div class="user-date">
			<h4 class="header-username">Hello</h4>
			<p class="greetings">Have a Great Day!</p>
		</div>
	</div>
	<div class="right-header">
		<div class="search-field">
			<label for="head-search"><i class="bi bi-search"></i></label><input
				type="search" name="head-search" id="head-search"
				placeholder="Search... [Ctrl + / ]" class="search-list-show" />
			<div class="focus-out"></div>
			<div class="search-list">
				<div class="search-result"><span class="no-result">Start typing to see results...</span></div>
				<a href="./book-list" class="show-all">Show
					All Books</a>
			</div>
		</div>
		<a href="profile"
			aria-label="profile-page" class="profile-area"><div
				class="profile-field"></div>
			<div class="tooltip" role="tooltip" data-popper-placement="top">
				User Profile
				<div class="arrow" data-popper-arrow=""></div>
			</div></a>
	</div>
</header>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>


//Keyboard shortcut for focusing the search bar
document.addEventListener("keydown", (e) => {
	if (e.ctrlKey && e.key === "/") {
		document.getElementById("head-search").focus();
	}
});

//Toggle sidebar
const sideToggle = document.querySelector(".side-toggle");
const sidebar = document.getElementById("sidebar");
const menuLines = document.querySelectorAll(".menu-line");

sideToggle.addEventListener("click", () => {
	sidebar.classList.toggle("active");
	menuLines.forEach((line) => line.classList.toggle("active"));
});



	const searchListShow = document.querySelector(".search-list-show");
	const searchList = document.querySelector(".search-list");
	const focusOut = document.querySelector(".focus-out");
	const searchInput = document.getElementById("head-search");

	searchInput?.removeEventListener("input", handleSearchInput);

	searchListShow?.addEventListener("focus", function () {
		searchList.classList.add("active");
		focusOut.classList.add("active");
	});

	focusOut.addEventListener("click", function () {
		searchList.classList.remove("active");
		focusOut.classList.remove("active");
	});

	searchInput?.addEventListener("input", handleSearchInput);

function handleSearchInput() {
	const searchValue = this.value.toLowerCase();
	const url = "../search-book?q=" + searchValue;

	axios.get(url)
		.then(response => {
			const books = response.data;
			createSearchItems(books);
		})
		.catch(error => {
			alert('Error retrieving books:', error);
		});
}


function displayUserData() {
	try {
		const nameDisplay = document.querySelector(".header-username");
		const greetings = document.querySelector(".greetings");
		const now = moment();
		if (
			now.isBetween(
				moment("05:00:00", "HH:mm:ss"),
				moment("12:00:00", "HH:mm:ss")
			)
		) {
			greetings.textContent = 'Good morning!';
		} else if (
			now.isBetween(
				moment("12:00:00", "HH:mm:ss"),
				moment("18:00:00", "HH:mm:ss")
			)
		) {
			greetings.textContent = 'Good afternoon!';
		} else {
			greetings.textContent = 'Good evening!';
		}
		const profileDisplay = document.querySelector(".profile-field");

		profileDisplay.addEventListener("mouseenter", () => {
			profileDisplay.nextElementSibling.style.display = "inline-block";
		});

		profileDisplay.addEventListener("mouseleave", () => {
			profileDisplay.nextElementSibling.style.display = "none";
		});
		nameDisplay.textContent = `Hello <%=userName%>`;
		profileDisplay.style.background = `url(<%=profileImage%>) center center/cover no-repeat`;
	} catch (error) {
		alert(`Error in displayUserData function: ${error}`);
	}
}
window.addEventListener("load", displayUserData);
function createSearchItems(books) {
  const searchResult = document.querySelector(".search-result");
  searchResult.innerHTML = '';
  if (!books || books.length === 0) {
      searchResult.innerHTML = '<span class="no-result">No Result Found</span>';
      return;
  }
 
  const searchItems = books.map((book) => {
    const searchItem = document.createElement("a");
    searchItem.classList.add("search-item");
    searchItem.dataset.id = book.bookId;
    searchItem.href = "./book/update?bookId="+ book.bookId;

    const searchImg = document.createElement("img");
    searchImg.classList.add("search-item-img");
    searchImg.src = book.coverImage;
    searchImg.alt = book.coverImage;
    searchImg.width = 70;
    searchItem.append(searchImg);

    const searchTitle = document.createElement("p");
    searchTitle.classList.add("search-item-title");
    searchTitle.textContent = book.title;
    searchItem.append(searchTitle);

    const searchArrow = document.createElement("i");
    searchArrow.classList.add("bi", "bi-caret-right-fill");
    searchItem.append(searchArrow);

    return searchItem;
  });

  searchResult.append(...searchItems);
}

</script>


