import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-job-posting"
export default class extends Controller {
  static targets = ["infos","summary", "form"]

  connect () {
    console.log(this.summaryTarget)
  }

  displayForm() {
    this.infosTarget.classList.add("d-none")
    this.formTarget.classList.remove("d-none")
  }


  updateSummary(event) {
    event.preventDefault()
    const url = this.formTarget.action
    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
        this.summaryTarget.outerHTML = data
      })
  }
}
