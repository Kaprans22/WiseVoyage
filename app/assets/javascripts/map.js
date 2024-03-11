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
  var countryName = layer.feature.properties.name;

  // Get the hidden field
  var destinationField = document.getElementById("destination-field");
  // Get the text field
  var destinationTextField = document.getElementById("destination-text-field");

  // Check if the country is already selected
  var selectedCountries = destinationField.value.trim().split(/\s*,\s*/);
  var index = selectedCountries.indexOf(countryName);

  // If the country is already selected, remove it
  if (index !== -1) {
    selectedCountries.splice(index, 1);
    layer.setStyle({
      fillColor: "white",
      color: "white",
      weight: 1,
      fillOpacity: 0.6,
    });
  } else {
    // If the country is not selected, add it to the list
    selectedCountries.push(countryName);
    layer.setStyle({
      fillColor: "#FE5F55",
      color: "white",
      weight: 2,
      fillOpacity: 0.5,
    });
  }

  destinationField.value = selectedCountries.filter(Boolean).join(", ");

  // Enable/disable the text field based on the number of selected countries
  if (selectedCountries.length > 0) {
    destinationTextField.disabled = true;
  } else {
    destinationTextField.disabled = false;
  }
}
