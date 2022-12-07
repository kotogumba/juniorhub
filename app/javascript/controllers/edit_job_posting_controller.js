import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-job-posting"
export default class extends Controller {
  static targets = ["description", "form"]

  displayForm() {
    this.descriptionTarget.classList.add("d-none")
    this.formTarget.classList.remove("d-none")
  }

  update(event) {
    event.preventDefault()
    const url = this.formTarget.action
    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
        console.log(data)
      })
  }

  static targets = ["description", "form", "descriptionbox"] // Add the new target

  update(event) {
    event.preventDefault()
    const url = this.formTarget.action
    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
        this.descriptionboxTarget.outerHTML = data
      })
}
}
