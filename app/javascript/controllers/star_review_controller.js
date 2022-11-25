import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="star-review"
export default class extends Controller {
  static targets = ["star", "input"]
  connect() {
    console.log(this.starTargets)
    console.log(this.inputTarget)

  }

  updateRatingInputForm(rating) {
    this.inputTarget.value = rating
  }

  toggleColorStars(stars, rating) {
    stars.forEach((star) => {
      if (star.id <= rating) {
        star.className = "review-rating fas fa-star"
      } else {
        star.className = "review-rating far fa-star"
      }
    });
  };

  rate(event) {
    console.log("hello")
    const rating = event.currentTarget.id
    this.updateRatingInputForm(rating);
    this.toggleColorStars(this.starTargets, rating);
    event.currentTarget.classList.add("selected")

  }

  hoveri(event) {
    const rating = event.currentTarget.id
    if (!(document.querySelector(".selected"))) {
      this.toggleColorStars(this.starTargets, rating);
    }

  }
  hovero(event) {
    if (!(document.querySelector(".selected"))) {
      this.starTargets.forEach((star) => {
        star.className = "review-rating far fa-star"
      });
    }
  }

}
