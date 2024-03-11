var map = L.map("map").setView([50, 20], 3); // Initial center and zoom level

L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
  attribution:
    '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
}).addTo(map);

var countriesLayer = L.geoJSON(countriesGeoJSON, {
  style: function (feature) {
    return {
      fillColor: "white",
      color: "white",
      weight: 1,
      fillOpacity: 0.6,
    };
  },
  onEachFeature: function (feature, layer) {
    layer.on({
      click: onCountryClick,
    });
  },
}).addTo(map);

function onCountryClick(e) {
  var layer = e.target;
  layer.setStyle({
    fillColor: "#FE5F55",
    color: "white",
    weight: 2,
    fillOpacity: 0.5,
  });
  var countryName = layer.feature.properties.name;
  alert("Clicked on " + countryName);
}
function onCountryClick(e) {
  var layer = e.target;
  layer.setStyle({
    fillColor: "#FE5F55",
    color: "white",
    weight: 2,
    fillOpacity: 0.5,
  });
  var countryName = layer.feature.properties.name;
  alert("Clicked on " + countryName);

  // Get the hidden field
  var destinationField = document.getElementById('destination-field');

  // If the hidden field already has a value, append the new country name with a comma
  if (destinationField.value) {
    destinationField.value += ', ' + countryName;
  } else {
    // If the hidden field doesn't have a value, set it to the clicked country name
    destinationField.value = countryName;
  }

  // Get the text field
  var destinationTextField = document.getElementById('destination-text-field');

  // Disable the text field
  destinationTextField.disabled = true;
}
