import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorite"
export default class extends Controller {
  static targets = ["bookmark"]

  toggleFavorite () {
    this.bookmarkTarget.classList.toggle('red')
  }
}
