import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static values = { privateChatroomId: Number }
  static targets = ["messages", "scroll"]

  connect() {
    // console.log("Connecting to the private chatroom")
    this.channel = createConsumer().subscriptions.create(
      { channel: "PrivateChatroomChannel", id: this.privateChatroomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data)}
    )
    // console.log(`Subscribed to the chatroom with the id ${this.privateChatroomIdValue}.`)
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.scrollTarget.scrollTo(0, this.scrollTarget.scrollHeight)
    // location.reload()
  }

  resetForm(event) {
    console.log("event")
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
