let map = L.map("map", {
  tap: false,
}); // tap: false is used for Safari because leaflet has a bug that cancels onclick events

let tiles = L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png");
map.addLayer(tiles);
map.locate({ setView: true, maxZoom: 13 });
lc = L.control.locate({ initialZoomLevel: 14, flyTo: true }).addTo(map);
