import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-job-posting"
export default class extends Controller {
  static targets = ["infos","summary", "form", "title", "titleinfos", "formtitle", "content", "contentinfos", "formcontent", "salary", "salaryinfos", "formsalary", "location", "locationinfos", "formlocation"]

  // connect () {
  //   console.log(this.summaryTarget)
  // }

  displayForm() {
    this.infosTarget.classList.add("d-none")
    this.formTarget.classList.remove("d-none")
  }
  displayFormTitle() {
    this.titleinfosTarget.classList.add("d-none")
    this.formtitleTarget.classList.remove("d-none")
  }
  displayFormContent() {
    this.contentinfosTarget.classList.add("d-none")
    this.formcontentTarget.classList.remove("d-none")
  }

  displayFormSalary() {
    this.salaryinfosTarget.classList.add("d-none")
    this.formsalaryTarget.classList.remove("d-none")
  }

  displayFormLocation() {
    this.locationinfosTarget.classList.add("d-none")
    this.formlocationTarget.classList.remove("d-none")
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

  updateTitle(event) {
    event.preventDefault()
    const url = this.formtitleTarget.action
    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formtitleTarget)
    })
      .then(response => response.text())
      .then((data) => {
        this.titleTarget.outerHTML = data
      })
  }

  updateContent(event) {
    event.preventDefault()
    const url = this.formcontentTarget.action
    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formcontentTarget)
    })
      .then(response => response.text())
      .then((data) => {
        this.contentTarget.outerHTML = data
      })
  }

  updateSalary(event) {
    event.preventDefault()
    const url = this.formsalaryTarget.action
    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formsalaryTarget)
    })
      .then(response => response.text())
      .then((data) => {
        this.salaryTarget.outerHTML = data
      })
  }
  updateLocation(event) {
    event.preventDefault()
    const url = this.formlocationTarget.action
    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formlocationTarget)
    })
      .then(response => response.text())
      .then((data) => {
        this.locationTarget.outerHTML = data
      })
  }
}
