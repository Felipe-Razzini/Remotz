import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="projects"
export default class extends Controller {
  static targets = ["tagStart", "tagLeader", "tagDate"]
  connect() {
  }

  displayLeader(e) {
    e.preventDefault()

    this.tagStartValue.classList.add("d-none")
    this.tagLeaderValue.classList.remove("d-none")
  }
}
