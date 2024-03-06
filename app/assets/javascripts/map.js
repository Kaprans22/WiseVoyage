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
      fillOpacity: 1,
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
