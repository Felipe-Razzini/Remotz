import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="alert"
export default class extends Controller {
  static targets = ["form"]
  
  connect() {
    console.log(this.formTarget);
  }

  displayForm(e) {
    e.preventDefault();

    this.formTarget.classList.remove('d-none');
  }
}
