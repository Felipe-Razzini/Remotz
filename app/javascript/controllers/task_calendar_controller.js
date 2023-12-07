import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["week", "month", "alltasks", "link"];

  connect() {
    // console.log("Yo!");
  }

  switchToView(e, viewTarget) {
    e.preventDefault();
    this.hideAllViews();
    viewTarget.classList.remove("d-none");
    this.setActiveLink(e.currentTarget);
  }

  switchToMonth(e) {
    this.switchToView(e, this.monthTarget);
  }

  switchToWeek(e) {
    this.switchToView(e, this.weekTarget);
  }

  switchToAllTasks(e) {
    this.switchToView(e, this.alltasksTarget);
  }

  hideAllViews() {
    [this.weekTarget, this.monthTarget, this.alltasksTarget].forEach((view) =>
      view.classList.add("d-none")
      // console.log(view)
    );
  }

  setActiveLink(link) {
    this.linkTargets.forEach((el) => el.classList.remove("active"));
    link.classList.add("active");
  }
}
