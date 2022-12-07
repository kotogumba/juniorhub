import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="read-message"
export default class extends Controller {
  static targets = ["name"]
  static values = { id: Number, privateChatroomId: Number }
  connect() {

  }

  readMessage() {
    console.log("Read message controller connected")
    // console.log(this.nameTarget)
    // console.log(this.idValue)
    // console.log(this.privateChatroomIdValue)
    // fetch(`/new_messages`, {
    //   method: "GET",
    //   headers: { "Accept": "application/json"}
    //  })
    //   .then(response => response.json())
    //   .then((data) => {
    //     console.log("read message after get")
    //     let messages = data[data.length - 1]

    //   })


    fetch(`/read_messages?id=${this.idValue}&chat=${this.privateChatroomIdValue}`,
    {
      method: "GET",
      headers: { "Accept": "application/json"}
    })
    .then(response => response.json())
    .then((data) => {
      console.log(data)
    })

    // fetch(`/read_messages`, {
    //   method: "POST",
    //   headers: { "Accept": "application/json"},
    //   body: JSON.stringify({id: this.idValue})
    //   })
    //   .then(response => response.json())
    //   .then((data) => {
    //     console.log(data.new_messages)
    //     this.badgeTarget.innerText = data
    //   })
  }

  unreadMessage() {
    fetch(`/read_messages?id=${idValue}&chat=${privateChatroomIdValue}`)
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
    }

}
