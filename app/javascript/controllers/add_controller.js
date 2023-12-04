import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add"
export default class extends Controller {
  static targets = ["form", "tasks"]

  connect() {
    console.log(this.formTarget);
  }

  displayForm(e) {
    e.preventDefault(e);

    this.formTarget.classList.remove("d-none");
  }
}
