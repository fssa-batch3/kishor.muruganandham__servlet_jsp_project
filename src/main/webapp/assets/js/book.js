// Get book ID from URL parameters
const urlParams = new URLSearchParams(window.location.search);
const bookId = urlParams.get("id");

function tagsToArray() {
  const tags = document.querySelector('input[name="input-custom-dropdown"]')
    .previousSibling.children;
  let str = "";
  for (let i = 0; i < tags.length - 1; i++) {
    const tag = tags[i].innerText;
    str += " " + tag.toLowerCase();
  }

  let stringArray = str.split(" ");
  let row = stringArray.filter((n) => n);
  return row;
}

async function showBookEditDetails() {
  // Store references to all relevant DOM elements
  const bookIdNo = document.getElementById("ed-book-id");
  const bookTitle = document.getElementById("ed-book-title");
  const bookAuthor = document.getElementById("ed-book-author");
  const bookLang = document.getElementById("ed-language");
  const bookPages = document.getElementById("ed-pages");
  const bookDesc = document.getElementById("ed-book-description");
  const bookImage = document.querySelector(".book-edit-image img");
  const bookAvailablity = document.getElementById("ed-book-available");
  const editBtn = document.querySelector(".book-edit.submit");
  const deleteBtn = document.querySelector(".book-delete.submit");
  const cancelBtn = document.querySelector(".book-cancel.submit");
  const saveBtn = document.querySelector(".book-save.submit");
  const imgEditBtn = document.querySelector(".bi-pencil-fill");
  const books = await getData("Books");
  const thisBook = books.find((book) => book.id === bookId);
  const tagsArray = await getBookGenres();
  const whitelist = Object.keys(tagsArray);
  const indexOfBook = books.indexOf(thisBook);
  const str = thisBook.tags.join(", ");
  const customInput = document.querySelector(
    'input[name="input-custom-dropdown"]'
  );
  customInput.value = str;

  // Set the values of form fields based on the data for the book
  bookIdNo.value = thisBook.id;
  bookTitle.value = thisBook.title;
  bookAuthor.value = thisBook.author;
  bookLang.value = thisBook.language;
  bookPages.value = thisBook.pages;
  bookDesc.value = thisBook.description;
  bookImage.src = thisBook.image.src;
  bookImage.alt = thisBook.title;
  bookAvailablity.value = JSON.stringify(thisBook.isBorrowable);
  bookImage.addEventListener("error", () => {
    bookImage.src =
      "https://via.placeholder.com/280x400/cccccc/3b3b3b.jpeg?text=Error+Loading+Image";
  });

  // Add event listener to Edit button to enable form fields for editing
  editBtn.addEventListener("click", function (e) {
    e.preventDefault();
    imgEditBtn.style.display = "block";
    const editable = document.querySelectorAll(".ed-input");
    editable.forEach((inp) => {
      inp.removeAttribute("disabled");
    });
    editBtn.style.display = "none";
    deleteBtn.style.display = "none";
    cancelBtn.style.display = "block";
    saveBtn.style.display = "block";
    const tagify = new Tagify(customInput, {
      maxTags: 5,
      dropdown: {
        maxItems: 20,
        classname: "tags-look",
        enabled: 0,
        closeOnSelect: false,
      },
    });
    tagify.whitelist = whitelist;
  });
  imgEditBtn.addEventListener("click", showUploadWidget);
  
  
  // Add event listener to Cancel button to reload the page and revert any unsaved changes
  cancelBtn.addEventListener("click", function () {
    location.reload();
  });
  
  

}



document.addEventListener("DOMContentLoaded", () => {
  if (window.location.pathname === "/pages/admin/book_edit.html") {
    showBookEditDetails()
      .then(() => {
        setLoader(false);
      })
      .catch((err) => {
        console.error(err);
      });
  } else if (window.location.pathname === "/pages/book_details.html") {
    showBookDetails();
    setLoader(false);
  }
});
