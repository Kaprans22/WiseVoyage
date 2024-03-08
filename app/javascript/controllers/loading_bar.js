// app/assets/javascripts/loading_bar.js

document.addEventListener("turbolinks:request-start", function () {
  document.getElementById("loading-overlay").style.display = "block";
  document.querySelector(".loading-bar-container").style.display = "block";
});

document.addEventListener("turbolinks:load", function () {
  document.getElementById("loading-overlay").style.display = "none";
  document.querySelector(".loading-bar-container").style.display = "none";
});
