import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorite"
export default class extends Controller {
  static targets = ["bookmark"]

  var jobId = '<%= @job.id%>'
  function toggleLikeButton(jobId, innerHTML) {
    let likeButton = document.querySelector(`.like-icon[data-id='${jobId}']`)
    likeButton.classList.toggle('red');
  }
  toggleLikeButton(jobId);
}




// ToggleLikeButton ()
// thisbookmarkTarget
