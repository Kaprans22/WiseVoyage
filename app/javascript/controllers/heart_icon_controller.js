// import { Controller } from "@hotwired/stimulus"

// // Connects to data-controller="heart-icon"
// export default class extends Controller {
//   connect() {
//     console.log("Connected to heart icon controller")
//     document.getElementById('icon').addEventListener('mouseover', function() {
//       // this.children[0].className = "fa-solid fa-heart fa-beat fa-xl";
//       // this.children[0].style.color = "#fe5f55";
//       this.removeChild(this.children[0]);
//       const newHeart = document.createElement('i');
//       newHeart.className = "fa-solid fa-heart fa-beat fa-xl";
//       newHeart.style.color = "#fe5f55";
//       this.appendChild(newHeart);
//     });

//     document.getElementById('icon').addEventListener('mouseout', function() {
//       this.children[0].className = "fa-solid fa-heart fa-xl";
//       this.children[0].style.color = "#fe5f55";
//     });
//   }

// }
