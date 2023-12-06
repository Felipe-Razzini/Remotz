import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="alert"
export default class extends Controller {
  static targets = ["overlay"]

  connect() {
    console.log(this.formTarget);
  }

  // displayForm(e) {
  //   e.preventDefault();

  //   this.formTarget.classList.remove('d-none');
  // }


  displayAlert() {
    this.overlayTarget.classList.remove("d-none")
    this.overlayTarget.classList.add("animate__animated", "animate__bounceInRight")

      setTimeout(() => {
        this.overlayTarget.classList.remove("animate__bounceInRight")
        this.overlayTarget.classList.add("hidden")
    }, 5000);
  }

  // displayAlert() {
  //   this.overlayTarget.classList.remove("hidden")

  //   setTimeout(() => {
  //     this.overlayTarget.classList.add("hidden")
  //   }, 4000);
  // }
}
