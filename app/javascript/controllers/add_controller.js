import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add"
export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log(this.formTarget);
  }

  displayForm(e) {
    e.preventDefault(e);

    this.formTarget.classList.remove("d-none");
  }

  hideForm(e) {
    e.preventDefault()

    this.formTarget.classList.add('d-none')
  }
}
