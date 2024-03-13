import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="collapsible"
export default class extends Controller {
  static targets = ["content"]

  toggle(e) {
    e.currentTarget.classList.toggle("active")

    if (this.contentTarget.style.maxHeight) {
      this.contentTarget.style.maxHeight = null;
    } else {
      this.contentTarget.style.maxHeight = this.contentTarget.scrollHeight + "px";
    }
  }
}
