mapboxgl.accessToken =
  "pk.eyJ1IjoicHVudGl0byIsImEiOiJjbHMwczlnNncwNDQyMnFudTE2OWl3azR4In0.nxBUfn_fgBl2GC_cgsK5ZA";

const map = new mapboxgl.Map({
  container: "map",
  style: "mapbox://styles/mapbox/streets-v12",
  center: [-87.69539502540738, 41.90259597685963], // Coordenadas [lng, lat]
  zoom: 13,
});

const logoMarker = document.createElement("div");
logoMarker.className =
  "w-[68px] h-[68px] rounded-full overflow-hidden border-4 border-white shadow-lg";

logoMarker.innerHTML = `<img src="./img/sc-logo.jpg" class="w-full h-full object-cover rounded-full" />`;

new mapboxgl.Marker({
  element: logoMarker,
  anchor: "bottom",
})
  .setLngLat([-87.69539502540738, 41.90259597685963])
  .addTo(map);
