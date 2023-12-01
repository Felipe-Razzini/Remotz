import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-task"
export default class extends Controller {
  static targets = ["infos", "form"]

  connect() {
    console.log(this.infosTargets);
    console.log(this.formTargets);
  }

  displayForm(e) {
    e.preventDefault()
    let form = this.formTargets.find( (form) => form.dataset.id === e.target.dataset.id )

    this.infosTarget.classList.add("d-none")
    form.style.display("inline-block")
  }
}
