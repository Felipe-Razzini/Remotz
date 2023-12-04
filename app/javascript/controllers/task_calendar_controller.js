import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="task-calendar"
export default class extends Controller {
  static targets =["week","month","alltasks", "link"]
  connect() {
    // console.log(this.weekTarget);
  }

  switchToMonth(e) {

    e.preventDefault();
    this.monthTarget.classList.remove("d-none");
    this.weekTarget.classList.add("d-none");
    this.alltasksTarget.classList.add("d-none");

  }

  switchToWeek(e) {
    e.preventDefault();
    this.weekTarget.classList.remove("d-none");
    this.monthTarget.classList.add("d-none");
    this.alltasksTarget.classList.add("d-none");

  }

  switchToAllTasks(e){
    e.preventDefault();
    this.weekTarget.classList.add("d-none");
    this.monthTarget.classList.add("d-none");
    this.alltasksTarget.classList.remove("d-none");

  }

  
}
