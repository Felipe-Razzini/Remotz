import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="projects"
export default class extends Controller {
  static targets = ["tagStart", "tagLeader", "tagDate", "leader", "date"]
  connect() {
  }

  displayLeader(e) {
    e.preventDefault()
    this.leaderTarget.checked = !this.leaderTarget.checked

    this.tagStartTarget.classList.toggle("d-none")
    this.tagLeaderTarget.classList.toggle("d-none")
  }

  displayDate(e) {
    e.preventDefault()
    this.dateTarget.checked = !this.dateTarget.checked

    this.tagStartTarget.classList.toggle("d-none")
    this.tagDateTarget.classList.toggle("d-none")
  }
}
