import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="blog-filter"
export default class extends Controller {
  static targets = ["filter"]

  show() {
    this.filterTarget.classList.toggle("visible")
  };

  //connect() {
    //console.log("lego")
  //}

}
