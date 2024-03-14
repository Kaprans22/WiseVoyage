import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="average-cost"
export default class extends Controller {
  connect() {
    parsedData = this.element.appendChild(document.createElement("div"))
    parsedData.innerHTML = content
  }
}
