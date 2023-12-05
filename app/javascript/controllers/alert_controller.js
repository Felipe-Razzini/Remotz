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
    this.overlayTarget.classList.add("fadeIn")
    this.overlayTarget.classList.remove("hidden")

    setTimeout(() => {
      this.overlayTarget.classList.add("fadeOut")
      this.overlayTarget.classList.add("hidden")
    }, 4000);
  }
}
