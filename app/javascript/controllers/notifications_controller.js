import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="notifications"
export default class extends Controller {
  static targets = ["wrapper"]
  connect() {
    console.log("Connecting to the notifications")
    this.channel = createConsumer().subscriptions.create(
      { channel: "NotificationsChannel" },
      { received: data => this.#insertNotification(data)}
    )
  }

  #insertNotification(data) {
    console.log(data)
    this.wrapperTarget.insertAdjacentHTML("beforeend", data)
  }
}
