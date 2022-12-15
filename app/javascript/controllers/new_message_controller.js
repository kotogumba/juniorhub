import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="new-message"
export default class extends Controller {
  static targets = ["badge", "container"]

  connect() {
    console.log("Connecting BADGE")
    this.channel = createConsumer().subscriptions.create(
      { channel: "MessageBadgeChannel" },
      { received: data => this.#insertBadge(data)}
    )
  }

  #insertBadge(data) {
    console.log(data)

    const count = {}
    data.forEach((message) => {
      count[message.user_id] = (count[message.user_id] || 0) + 1
    })

    this.badgeTargets.forEach((badge) => {
      console.log(badge.dataset.newMessageIdValue)

      // iterate array of messages with user_id from data and count number of messages from each user_id

      if (badge.dataset.newMessageIdValue in count) {
        if (count[badge.dataset.newMessageIdValue] > 0) {
          badge.innerText = count[badge.dataset.newMessageIdValue]
        }
      }

      if (badge.dataset.newMessageIdValue == 'main badge') {
        if (data.length > 0) {
          badge.innerText = data.length
        }
      }
    })

    this.containerTargets.forEach((container) => {
      console.log(container.dataset.newMessageIdValue)


      if (container.dataset.newMessageIdValue in count) {
        if (count[container.dataset.newMessageIdValue] > 0) {
          container.classList.remove("d-none")
        } else {
          container.classList.add("d-none")
        }
      } else {
        container.classList.add("d-none")
      }

      if (container.dataset.newMessageIdValue == 'main badge') {
        if (data.length > 0) {
          container.classList.remove("d-none")
        } else {
          container.classList.add("d-none")
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
