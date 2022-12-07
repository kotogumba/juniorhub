import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-message"
export default class extends Controller {
  static targets = ["badge", "container"]
  connect() {
    console.log(this.containerTarget)
    setInterval(() => {
      console.log("hello")
      fetch(`/new_messages`, {
        method: "GET",
        headers: { "Accept": "application/json"}
       })
        .then(response => response.json())
        .then((data) => {
          let messages = data[data.length - 1]
          this.badgeTarget.innerText = messages.length
          if (messages.length > 0) {
            this.containerTarget.classList.remove("d-none")
          } else {
            this.containerTarget.classList.add("d-none")
          }
        })
    }, 1000);
  }
}
