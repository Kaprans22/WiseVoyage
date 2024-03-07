import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {

  connect() {}

  scroll() {
    if (window.scrollY > 20) {
      this.element.classList.add("solid")
      this.element.classList.remove("faded")
    } else {
      this.element.classList.remove("solid")
      this.element.classList.add("faded")
    }
  }
}
