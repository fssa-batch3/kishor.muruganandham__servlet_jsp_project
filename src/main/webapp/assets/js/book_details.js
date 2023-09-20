
let ratingValue;
let ratingId;
let thisRating;
function ratings() {
  getData("Ratings")
    .then((ratingList) => {
      thisRating = ratingList.find(
        (rating) => rating.user_id === thisUser.id && rating.book_id === bookId
      );
      if (thisRating) {
        ratingId = thisRating.rating_id;
        setRatingValue(thisRating.rating);
      } else {
        ratingId = generateGuid();
      }
      const thisBookRatings = ratingList.filter(
        (rating) => rating.book_id === bookId
      );
      const raters = thisBookRatings.length < 2 ? `${thisBookRatings.length} User` : `${thisBookRatings.length} Users`;
      document.querySelector('.raters').textContent = raters;
      const ratings = thisBookRatings.reduce((acc, obj) => acc + obj.rating, 0);
      const avgRating = Math.round(ratings / thisBookRatings.length);
      const starRatingElement = document.querySelector(".stars");
      starRatingElement.innerHTML = avgRating || 0;
    })
    .catch((error) => {
      console.error("An error occurred while fetching ratings:", error);
    });
}

ratings();





