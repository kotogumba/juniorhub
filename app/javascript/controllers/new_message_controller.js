import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-message"
export default class extends Controller {
  static targets = ["badge"]
  connect() {
    console.log("from connect")
    // this.updateBadge()
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
         //  location.reload()
        })
    }, 1000);
    //setInterval(() => this.updateBadge, 1000);
  }

  // updateBadge() {
  //   console.log('hello')
  //   fetch(`/new_messages`, {
  //    method: "GET",
  //    headers: { "Accept": "application/json"}
  //   })
  //    .then(response => response.json())
  //    .then((data) => {
  //      let messages = data[data.length - 1]
  //      this.badgeTarget.innerText = messages.length
  //     //  location.reload()
  //    })
  // }

}
