import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="update"
export default class extends Controller {
  static targets = ["togglableElement"]

      connect() {
        console.log("connected update")
      }
      fire() {
        this.togglableElementTarget.classList.toggle("d-none");
      }

}
