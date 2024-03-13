import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    console.log("connected")
  }
  fire(event) {
    event.preventDefault()

    fetch(event.currentTarget.dataset.path, {
      headers: { "Accept": "text/plain" }
    })
    .then(response => response.text())
    .then((data) => {
      this.element.outerHTML = data
    })

    // fetch(event.currentTarget.dataset.path, {
    //   headers: { "Accept": "application/json" }
    // })
    // .then(response => response.json())
    // .then((data) => {
    //   console.log(data)
    // })
  }
}
