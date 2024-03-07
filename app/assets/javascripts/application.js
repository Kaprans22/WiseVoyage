// app/assets/javascripts/application.js
document.addEventListener("DOMContentLoaded", function () {
  function showLoadingBar() {
    document.getElementById("loading-bar").style.display = "block";
  }

  function hideLoadingBar() {
    document.getElementById("loading-bar").style.display = "none";
  }

  window.addEventListener("beforeunload", showLoadingBar);
  window.addEventListener("load", hideLoadingBar);
});
