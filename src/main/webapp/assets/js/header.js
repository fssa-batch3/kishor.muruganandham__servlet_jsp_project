// Keyboard shortcut for focusing the search bar
document.addEventListener("keydown", (e) => {
  if (e.ctrlKey && e.key === "/") {
    document.getElementById("head-search").focus();
  }
});



// Toggle sidebar
const sideToggle = document.querySelector(".side-toggle");
const sidebar = document.getElementById("sidebar");
const menuLines = document.querySelectorAll(".menu-line");

sideToggle.addEventListener("click", () => {
	console.log("hi");
  sidebar.classList.toggle("active");
  menuLines.forEach((line) => line.classList.toggle("active"));
});
// Display user name and profile picture


function createSearchItems(books, currentUser) {
  const searchResult = document.querySelector(".search-result");
  if (!searchResult) {
    return;
  }
  const searchItems = books.map((book) => {
    const searchItem = document.createElement("a");
    searchItem.classList.add("search-item");
    searchItem.dataset.id = book.id;
    searchItem.href = `../../pages/${
      currentUser.role === "admin"
        ? "admin/book_edit.html"
        : "book_details.html"
    }?id=${book.id}`;

    const searchImg = document.createElement("img");
    searchImg.classList.add("search-item-img");
    searchImg.src = book.image.src;
    searchImg.alt = book.image.alt;
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

/*addSearchResults();
*/
function addSearchListEventListeners() {
  const searchListShow = document.querySelector(".search-list-show");
  const searchList = document.querySelector(".search-list");
  const focusOut = document.querySelector(".focus-out");
  const searchInput = document.getElementById("head-search");
  searchListShow?.addEventListener("focus", function () {
    searchList.classList.add("active");
    focusOut.classList.add("active");
  });

  focusOut.addEventListener("click", function () {
    searchList.classList.remove("active");
    focusOut.classList.remove("active");
  });

  searchInput?.addEventListener("input", function () {
    const searchValue = searchInput?.value.toLowerCase();
    const books = document.getElementsByClassName("search-item");

    for (const book of books) {
      const title = book
        .querySelector(".search-item-title")
        .innerText.toLowerCase();
      book.style.display = title.includes(searchValue) ? "flex" : "none";
    }
  });
}
