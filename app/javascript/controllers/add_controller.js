import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add"
export default class extends Controller {
  static targets = ["form", "pageName"]

  connect() {
    this.load();
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

  load() {
      const currentPath = window.location.pathname;
      const pages = this.pageNameTargets;

      pages.forEach(page => {
        const pagePath = page.dataset.page;

        if (pagePath === currentPath) {
          page.classList.add("active-tab");
        }
        else {
          page.classList.remove("active-tab");
        }
      });
    }
}
