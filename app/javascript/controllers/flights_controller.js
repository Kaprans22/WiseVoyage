import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flights"
export default class extends Controller {
  static targets = ["results", "input"]

  generate(event) {
    event.preventDefault()

    fetch(event.currentTarget.action, {
      headers: { "Accept": "text/plain" },
      method: "POST",
      body: new FormData(event.currentTarget)
    })
    .then(response => response.text())
    .then((data) => {

      this.resultsTarget.innerHTML = data
    })
  }
}
