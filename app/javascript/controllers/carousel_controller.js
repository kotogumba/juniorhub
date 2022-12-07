// import { Controller } from "@hotwired/stimulus"

// // Connects to data-controller="carousel"
// export default class extends Controller {
//   static targets = ["buttonB"]
//   connect() {
//   console.log("controller connected")
//   }

//   carouselTurnB() {
//     this.buttonBTarget.addEventListener('click', ()=>{
//       console.log("next");
//       carousel__item.classList.remove("carousel__item--selected");
//       carousel__item.classList.add("carousel__item--selected");
//     });
//   };

//   carouselTurnA() {
//     buttonA.addEventListener('click', ()=>{
//       console.log("previous");
//       carousel__item.classList.remove("carousel__item--selected");
//       carousel__item.classList.add("carousel__item--selected");
//     });
//   };
// }

// <div class="carousel-container" data-controller="carousel">
/* <div class="buttonA" data-controller="carousel" data-action="click->carousel#carouselTurn">
<div class="b-t">Previous</div>
</div>
<div class="carousel__item" data-controller="carousel">
<%# Job card start %>
<div class="job-card-car">
  <div class="job-card-text">
    <div class="company_details">
      <%= image_tag "logo_placeholder.png", class:"logo", alt:"logo" %>
      <h6>Company Name</h6>
    </div>
    <div>
      <h4><%= Job.all.last.title %></h4>
    </div>
    <div>
      <h5>Location: <%= Job.all.last.location %></h5>
    </div>
    <div>
      <h5>Start Date: <%= Job.all.last.created_at.strftime("%m/%d/%Y") %></h5>
    </div>
  </div>
</div>
<%# Job card end %>
</div>
<div class="carousel__item carousel__item--selected" data-controller="carousel">
<%# Job card start %>
<div class="job-card-car">
  <div class="job-card-text">
    <div class="company_details">
      <%= image_tag "logo_placeholder.png", class:"logo", alt:"logo" %>
      <h6>Company Name</h6>
    </div>
    <div>
      <h4><%= Job.all[-2].title %></h4>
    </div>
    <div>
      <h5>Location: <%= Job.all[-2].location %></h5>
    </div>
    <div>
      <h5>Start Date: <%= Job.all[-2].created_at.strftime("%m/%d/%Y") %></h5>
    </div>
  </div>
</div>
<%# Job card end %>
</div>
<div class="carousel__item" data-controller="carousel">
<%# Job card start %>
<div class="job-card-car">
  <div class="job-card-text">
    <div class="company_details">
      <%= image_tag "logo_placeholder.png", class:"logo", alt:"logo" %>
      <h6>Company Name</h6>
    </div>
    <div>
      <h4><%= Job.all[-3].title %></h4>
    </div>
    <div>
      <h5>Location: <%= Job.all[-3].location %></h5>
    </div>
    <div>
      <h5>Start Date: <%= Job.all[-3].created_at.strftime("%m/%d/%Y") %></h5>
    </div>
  </div>
</div>
<%# Job card end %>
</div>
<div class="buttonB" data-controller="carousel" data-action="click->carousel#carouselTurn">
<div class="b-t">Next</div>
</div>
<%# Job preview carousel %>
<%# Carousel start %>
<%# Job card start %>
<%# Job card end %>
</div> */
