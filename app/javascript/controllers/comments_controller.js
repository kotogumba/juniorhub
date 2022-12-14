import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comments"
export default class extends Controller {
  static targets = [ "link", "comm" ]
  connect() {
    console.log("Comments controller connected")
    console.log(this.linkTarget)
    console.log(this.commTarget)
  }

  show(event) {
    event.preventDefault()
    if (this.commTarget.classList.contains("d-none")) {
      this.showForm()
    } else {
      this.hideForm()
    }
  }

  hideForm() {
    this.commTarget.classList.add("d-none")
  }

  showForm() {
    this.commTarget.classList.remove("d-none")
  }
}
