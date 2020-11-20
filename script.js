
var map;
const NEW_ZEALAND_BOUNDS = {
    north: 41,
    south: -41,
    west: -87,
    east: -87,
  };
  
  var locations = [
    ['Bondi Beach', 41.825777,-87.625479, 4],
    ['Coogee Beach', 41.791383,-87.591399, 5],
    ['Cronulla Beach', 42.087216,-87.755754, 3],
    ['Manly Beach', 41.790154,-87.651177, 2],
    ['Maroubra Beach', 41.883161,-87.728682, 1],
    ['X', 41.952546,-87.751496, 1],
    ['y',42.009611,-87.669326]
  ];

function createMap () {
  var options = {
    center: { lat: 41.881832, lng: -87.623177 },
    restriction: {
        latLngBounds: NEW_ZEALAND_BOUNDS,
        strictBounds: false,
      },
    zoom: 10
  };

  map = new google.maps.Map(document.getElementById('map'), options);

  var input = document.getElementById('search');
  var searchBox = new google.maps.places.SearchBox(input);

  map.addListener('bounds_changed', function() {
    searchBox.setBounds(map.getBounds());
  });

  var markers = [];

  searchBox.addListener('places_changed', function () {
    var places = searchBox.getPlaces();

    if (places.length == 0)
      return;

    markers.forEach(function (m) { m.setMap(null); });
    markers = [];

    var bounds = new google.maps.LatLngBounds();
    places.forEach(function(p) {
      if (!p.geometry)
        return;

      markers.push(new google.maps.Marker({
        map: map,
        title: p.name,
        position: p.geometry.location
      }));

      if (p.geometry.viewport)
        bounds.union(p.geometry.viewport);
      else
        bounds.extend(p.geometry.location);
    });
    
    map.fitBounds(bounds);
  });
  var marker, i;

  for (i = 0; i < locations.length; i++) {  
    marker = new google.maps.Marker({
      position: new google.maps.LatLng(locations[i][1], locations[i][2]),
      map: map
    });
}
}