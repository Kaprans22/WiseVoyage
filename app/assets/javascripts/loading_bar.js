document.addEventListener("turbolinks:load", function () {
  var loader = document.querySelector(".svg-calLoader");
  if (loader) {
    loader.style.display = "block"; // Show the loading bar when the page starts loading
    setTimeout(function () {
      loader.style.display = "none"; // Hide the loading bar when the page finishes loading
    }, 2000); // Adjust the timeout as needed
  }
});
