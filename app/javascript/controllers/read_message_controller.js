import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="read-message"
export default class extends Controller {
  static targets = ["name"]
  static values = { id: Number, privateChatroomId: Number }
  connect() {

  }

  readMessage() {
    console.log("Read message controller connected")

    fetch(`/read_messages?id=${this.idValue}&chat=${this.privateChatroomIdValue}`,
    {
      method: "GET",
      headers: { "Accept": "application/json"}
    })
  }
}
