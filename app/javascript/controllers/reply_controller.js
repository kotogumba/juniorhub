import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reply"
export default class extends Controller {
  static targets = ["form", "link"]

  connect() {
    console.log("reply controller")
  }

  show(event) {
    event.preventDefault()
    if (this.formTarget.classList.contains("d-none")) {
      this.showForm()
    } else {
      this.hideForm()
    }
  }

  hideForm() {
    this.formTarget.classList.add("d-none")
  }

  showForm() {
    this.formTarget.classList.remove("d-none")
  }
}
