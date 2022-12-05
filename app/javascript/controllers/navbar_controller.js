import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    console.log(event)
    // this.element.textContent = "Hello World!"
  }
  navSlide = () => {
    // turn these into data-targets
    const burger = document.querySelector('.burger');
    const nav = document.querySelector('.nav-links');
    const navLinks = document.querySelectorAll('.nav-links li');

    //turn eventListener into data-action
    // toggle navbar for mobile view
    burger.addEventListener('click', ()=>{
      nav.classList.toggle('nav-active');

      // Animate links
      navLinks.forEach((link, index) => {
        if (link.style.animation) {
          link.style.animation = '';
        } else {
          link.style.animation = `navLinkFade 0.5s ease forwards ${index / 7 + 0.5}s`;
        }
      });
      // burger menu animation
      burger.classList.toggle('toggle');
    });
  }
}
