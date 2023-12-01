import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-task"
export default class extends Controller {
  static targets = ["info", "form", "input"]

  connect() {
    console.log(this.infoTargets);
    console.log(this.formTargets);
  }

  displayForm(e) {
    e.preventDefault()
    // let form = this.formTargets.find( (form) => form.dataset.id === e.target.dataset.id )

    this.infoTargets.forEach((info) => { info.classList.add("d-none") })
    this.inputTargets.forEach((input) => { input.classList.remove("d-none") })
  }
}
