import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorite"
export default class extends Controller {
  static targets = ["bookmark", "text"]

  toggleFavorite () {
    this.bookmarkTarget.classList.toggle('red')

  //   if (this.textTarget.innerHTML === "Add to your favorites") {
  //     this.textTarget.innerHTML = "Added";
  //   } else {
  //     this.textTarget.innerHTML = "Add to your favorites"
  //   }
  }
}
