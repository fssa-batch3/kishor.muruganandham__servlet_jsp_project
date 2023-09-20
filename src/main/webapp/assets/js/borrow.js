const modalCloseBtn = document.querySelector(".modal-close");
const borrowBtn = document.getElementById("borrow-now");
const borrowBtnElement = document.querySelector(".book-detail-borrow-now");

function openBorrowModal() {
  const borrowNowBtn = document.querySelector(".modal-submit");
  const borrowDateInput = document.getElementById("borrow-date");
  const dueDateInput = document.getElementById("due-date");
  const dueDurationInput = document.getElementById("due-duration");
  const fullBorrowDate = document.querySelector(".full-borrow-date");
  const fullDueDate = document.querySelector(".full-due-date");

      document.querySelector(".backdrop").classList.add("active");
      document.querySelector(".modal").classList.add("active");
      const durationDate = moment().format("YYYY-MM-DD");
      let dueDateCalculated = moment(durationDate)
        .add(15, "days")
        .format("YYYY-MM-DD");
      borrowDateInput.value = durationDate;
      dueDateInput.value = dueDateCalculated;
      fullBorrowDate.innerText = moment().format("MMMM Do YYYY");
      fullDueDate.innerText = moment(dueDateCalculated).format("MMMM Do YYYY");

      dueDurationInput.addEventListener("change", () => {
        dueDateCalculated = moment(durationDate)
          .add(dueDurationInput.value, "days")
          .format("YYYY-MM-DD");
        dueDateInput.value = dueDateCalculated;
        fullDueDate.innerText =
          moment(dueDateCalculated).format("MMMM Do YYYY");
      });

}

function closeBorrowModal() {
  document.querySelector(".backdrop").classList.remove("active");
  document.querySelector(".modal").classList.remove("active");
}

document.addEventListener("DOMContentLoaded", () => {
  const borrowBtn = document.getElementById("borrow-now");
  const modalCloseBtn = document.querySelector(".modal-close");
  modalCloseBtn.addEventListener("click", closeBorrowModal);
  borrowBtn.addEventListener("click", openBorrowModal);
});
