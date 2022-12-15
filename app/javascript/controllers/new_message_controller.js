import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="new-message"
export default class extends Controller {
  static targets = ["badge", "container"]
  static values = { id: Number}
  connect() {
    console.log("Connecting BADGE")
    this.channel = createConsumer().subscriptions.create(
      { channel: "MessageBadgeChannel" },
      { received: data => this.#insertBadge(data)}
    )
  }

  #insertBadge(data) {
    console.log(this.badgeTargets)
    this.badgeTargets.forEach((badge, id) => {
      console.log(badge, id)
      console.log(data)
      if (badge.dataset.id == data.id) {
        badge.innerText = data.length
        if (data.length > 0) {
          badge.classList.remove("d-none")
        } else {
          badge.classList.add("d-none")
        }
      }
    })
    // this.badgeTarget.innerText = data.length
    // if (data.length > 0) {
    //   this.containerTarget.classList.remove("d-none")
    // } else {
    //   this.containerTarget.classList.add("d-none")
    // }
  }
  // connect() {

  //   console.log(this.containerTarget)
  //   setInterval(() => {
  //     console.log("hello")
  //     fetch(`/new_messages`, {
  //       method: "GET",
  //       headers: { "Accept": "application/json"}
  //      })
  //       .then(response => response.json())
  //       .then((data) => {
  //         let messages = data[data.length - 1]
  //         this.badgeTarget.innerText = messages.length
  //         if (messages.length > 0) {
  //           this.containerTarget.classList.remove("d-none")
  //         } else {
  //           this.containerTarget.classList.add("d-none")
  //         }
  //       })
  //   }, 1000);
  // }
}
