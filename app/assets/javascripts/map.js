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
      fillOpacity: 0.2,
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

  var destinationField = document.getElementById("destination-field");
  var destinationTextField = document.getElementById("destination-text-field");

  var selectedCountries = destinationField.value.trim().split(/\s*,\s*/);
  var index = selectedCountries.indexOf(countryName);

  if (index !== -1) {
    selectedCountries.splice(index, 1);
    layer.setStyle({
      fillColor: "white",
      color: "white",
      weight: 1,
      fillOpacity: 0.6,
    });
  } else {
    selectedCountries.push(countryName);
    layer.setStyle({
      fillColor: "#FE5F55",
      color: "white",
      weight: 2,
      fillOpacity: 0.5,
    });
  }

  destinationField.value = selectedCountries.filter(Boolean).join(", ");
  if (selectedCountries.length > 0) {
    destinationTextField.disabled = true;
  } else {
    destinationTextField.disabled = false;
  }
}
