import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="update"
export default class extends Controller {
  static targets = ["togglableElement"]

    submitForm(event) {
      event.preventDefault();
      let form = event.target;
      let formData = new FormData(form);

      fetch(form.action, {
        method: form.method,
        body: formData,
        headers: {
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
        }
      })
      .then(response => response.json())
      .then(data => {
        console.log(data); // Handle successful response (e.g., hide modal)
        // Optionally, you can emit an event here to notify other parts of your application about the form submission success
      })
      .catch(error => {
        console.error(error); // Handle errors
      });
    }
  }


