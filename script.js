// GOOGLE MAP
var map;
var resultset = [];
function initMap() {

  // MAP
  map = new google.maps.Map(document.getElementById('map'), {
    center: { lat: 41.881832, lng: -87.623177 },
    zoom: 10
  });


  var locationInput = document.getElementById('ciudad');
  var autocomplete = new google.maps.places.Autocomplete(locationInput);
  autocomplete.bindTo('bounds', map);
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(locationInput);

  // MARKER
  var marker = new google.maps.Marker({
    map: map
  });


  var searchArea = '';

  // CIRCLE
  var circle = new google.maps.Circle({
    // center: searchArea,
    radius: parseFloat(document.getElementById("distance").value) * 1609.3, //convert miles to meters
    strokeColor: "#7ED9C3",
    strokeOpacity: 0.8,
    strokeWeight: 2,
    fillColor: '#7ED9C3',
    fillOpacity: 0.4
  });
  circle.setMap(null);

  // PLACE CHANGED FUNCTION
  autocomplete.addListener('place_changed',
    function() {
      var place = autocomplete.getPlace();
      if (!place.geometry) {
        return;
      }

      if (place.geometry.viewport) {
        map.fitBounds(place.geometry.viewport);
        map.setZoom(9);
      } else {
        map.setCenter(place.geometry.location);
        map.setZoom(9);
      }

      var service = new google.maps.places.PlacesService(map);

      // Set the position of the marker using the place ID and location.
      searchArea = place.geometry.location;
      marker.setPlace({
        placeId: place.place_id,
        location: place.geometry.location
      });

      // Coordinates
      var latLng = marker.getPlace().location;
      var lat = latLng.lat().toFixed(6);
      var lng = latLng.lng().toFixed(6);
      getCoords(lat, lng);


      // Clear last circle
      circle.setMap(null);

      // Draw a circle around the radius
      circle = new google.maps.Circle({
        center: searchArea,
        radius: parseFloat(document.getElementById("distance").value) * 1609.3, //convert miles to meters
        strokeColor: "#7ED9C3",
        strokeOpacity: 0.8,
        strokeWeight: 2,
        fillColor: '#7ED9C3',
        fillOpacity: 0.4
      });
      circle.setMap(map);

      // Perform search over radius
      var request = {
        location: searchArea,
        // radius: parseFloat(document.getElementById("distance").value) * 1609.3, //convert miles to meters
        keyword: "BestBuy",
        rankBy: google.maps.places.RankBy.DISTANCE
      };

      service.nearbySearch(request, callback);
    });

  // COORDINATES
  function getCoords(lat, lng) {

    // Reference input html element with id=”lat”.
    var coords_lat = document.getElementById('lat');

    // Update latitude text box.
    coords_lat.value = lat;

    // Reference input html element with id=”lng”.
    var coords_lng = document.getElementById('lng');

    // Update longitude text box.
    coords_lng.value = lng;
  }
}
google.maps.event.addDomListener(window, "load", initMap);

function callback(results, status) {
  if (status === google.maps.places.PlacesServiceStatus.OK) {
    for (var i = 0; i < results.length; i++) {
      createMarker(results[i],i);
    }
  }
}

function createMarker(place,i) {
  var placeLoc = place.geometry.location;
  console.log("address"+i);
  if (i<7){
      resultset.push(place.vicinity);
      document.getElementById("address"+i).innerHTML=place.vicinity
  }
  // document.getElementById("address"+i).innerHTML=place.vicinity
  var marker = new google.maps.Marker({
    map: map,
    position: place.geometry.location
  });

  var infowindow = new google.maps.InfoWindow({
    content: name
  });

  google.maps.event.addListener(marker, 'click', function() {
    infowindow.setContent(place.name);
    infowindow.open(map, marker);
  });
  
}

function change(x){
  console.log(x);
  document.getElementById("getdata").innerHTML=resultset[x];
}




// console.log(3+5);
// var map;
// // const NEW_ZEALAND_BOUNDS = {
// //     north: 41,
// //     south: -41,
// //     west: -87,
// //     east: 187,
// //   };
  
//   var locations = [
//     ['Bondi Beach', 41.825777,-87.625479, 4],
//     ['Coogee Beach', 41.791383,-87.591399, 5],
//     ['Cronulla Beach', 42.087216,-87.755754, 3],
//     ['Manly Beach', 41.790154,-87.651177, 2],
//     ['Maroubra Beach', 41.883161,-87.728682, 1],
//     ['X', 41.952546,-87.751496, 1],
//     ['y',42.009611,-87.669326]
//   ];




// function createMap () {
//   var options = {
//     center: { lat: 41.881832, lng: -87.623177 },
//     // restriction: {
//     //     latLngBounds: NEW_ZEALAND_BOUNDS,
//     //     strictBounds: false,
//     //   },
//     zoom: 10
//   };

//   map = new google.maps.Map(document.getElementById('map'), options);


//   var input = document.getElementById('search');
  
//   var searchBox = new google.maps.places.SearchBox(input);


//   map.addListener('bounds_changed', function() {
//     searchBox.setBounds(map.getBounds());
//   });

//   var markers = [];
//   // console.log(searchBox);
//   searchBox.addListener('places_changed', function () {
//     var places = searchBox.getPlaces();

//     if (places.length == 0)
//       return;

//     markers.forEach(function (m) { m.setMap(null); });
//     // console.log("these are markers"+m)
//     markers = [];

//     var bounds = new google.maps.LatLngBounds();
//     console.log(bounds);
//     console.log("bounds"+bounds)
//     places.forEach(function(p) {
//       if (!p.geometry)
//         return;

//       markers.push(new google.maps.Marker({
//         map: map,
//         title: p.name,
//         position: p.geometry.location
//       }));

//       if (p.geometry.viewport)
//         bounds.union(p.geometry.viewport);
//       else
//         bounds.extend(p.geometry.location);
//     });
//     console.log(bounds);
//     map.fitBounds(bounds);
//   });
//   // var marker, i;

// //   for (i = 0; i < locations.length; i++) {  
// //     marker = new google.maps.Marker({
// //       // position: new google.maps.LatLng(locations[i][1], locations[i][2]),
// //       map: map
// //     });
// // }
// }

// var position = { lat: 41.881832, lng: -87.623177 }
// var closestMarker = find_closest_marker (position);
// console.log(closestMarker);





// function rad(x) {
//    return x * Math.PI / 180;
// }

// function find_closest_marker(position) {
//   var lat = position.lat;
//   var lng = position.lng;
//   console.log(lat,lng);
//   var R = 6371; // radius of earth in km
//   var distances = [];
//   var closest = -1;
  
//   const gmarkers = [{
//     position: new google.maps.LatLng(-33.91721, 151.2263),
//     type: "info",
//   },
//   {
//     position: new google.maps.LatLng(-33.91539, 151.2282),
//     type: "info",
//   },
//   {
//     position: new google.maps.LatLng(-33.91747, 151.22912),
//     type: "info",
//   },
//   {
//     position: new google.maps.LatLng(-33.9191, 151.22907),
//     type: "info",
//   },
//   {
//     position: new google.maps.LatLng(-33.91725, 151.23011),
//     type: "info",
//   }];

//   for ( let i = 0; i < gmarkers.length; i++) {
//       gmarkers = new google.maps.Marker
//       console.log(gmarkers[i].position.lat())
//       // if (gmarkers[i]) {
//       //     var mlat = gmarkers[i].position.lat();
//       //     var mlng = gmarkers[i].position.lng();
//       //     var dLat = rad(mlat - lat);
//       //     var dLong = rad(mlng - lng);
//       //     var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
//       //         Math.cos(rad(lat)) * Math.cos(rad(lat)) * Math.sin(dLong / 2) * Math.sin(dLong / 2);
//       //     var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
//       //     var d = R * c;
//       //     distances[i] = d;
//       //     if (closest == -1 || d < distances[closest]) {
//       //         closest = i;

//       //     }
//       // }
//   }

//   return (closest);
// }












// // var geocoder = null;
// // var map = null;
// // var customerMarker = null;
// // var gmarkers = [];
// // var closest = [];

// // function initialize() {
// //   // alert("init");
// //   geocoder = new google.maps.Geocoder();
// //   map = new google.maps.Map(document.getElementById('map'), {
// //     zoom: 10,
// //     center: new google.maps.LatLng(41.881832, -87.623177),
// //     mapTypeId: google.maps.MapTypeId.ROADMAP
// //   });

// //   var infowindow = new google.maps.InfoWindow();
// //   var marker, i;
// //   var bounds = new google.maps.LatLngBounds();
// //   // document.getElementById('info').innerHTML = "found " + locations.length + " locations<br>";
// //   for (i = 0; i < locations.length; i++) {
// //     var coordStr = locations[i][4];
// //     var coords = coordStr.split(",");
// //     var pt = new google.maps.LatLng(parseFloat(coords[0]), parseFloat(coords[1]));
// //     bounds.extend(pt);
// //     marker = new google.maps.Marker({
// //       position: pt,
// //       map: map,
// //       icon: locations[i][5],
// //       address: locations[i][2],
// //       title: locations[i][0],
// //       html: locations[i][0] + "<br>" + locations[i][2]
// //     });
// //     gmarkers.push(marker);
// //     google.maps.event.addListener(marker, 'click', (function(marker, i) {
// //         return function() {
// //           infowindow.setContent(marker.html);
// //           infowindow.open(map, marker);
// //         }
// //       })
// //       (marker, i));
// //   }
// //   map.fitBounds(bounds);

// // }

// // function codeAddress() {
// //   var numberOfResults = 25;
// //   var numberOfDrivingResults = 5;
// //   var address = document.getElementById('address').value;
// //   geocoder.geocode({
// //     'address': address
// //   }, function(results, status) {
// //     if (status == google.maps.GeocoderStatus.OK) {
// //       map.setCenter(results[0].geometry.location);
// //       if (customerMarker) customerMarker.setMap(null);
// //       customerMarker = new google.maps.Marker({
// //         map: map,
// //         position: results[0].geometry.location
// //       });
// //       closest = findClosestN(results[0].geometry.location, numberOfResults);
// //       // get driving distance
// //       closest = closest.splice(0, numberOfResults);
// //       calculateDistances(results[0].geometry.location, closest, numberOfDrivingResults);
// //     } else {
// //       alert('Geocode was not successful for the following reason: ' + status);
// //     }
// //   });
// // }

// // function findClosestN(pt, numberOfResults) {
// //   var closest = [];
// //   document.getElementById('info').innerHTML += "processing " + gmarkers.length + "<br>";
// //   for (var i = 0; i < gmarkers.length; i++) {
// //     gmarkers[i].distance = google.maps.geometry.spherical.computeDistanceBetween(pt, gmarkers[i].getPosition());
// //     document.getElementById('info').innerHTML += "process " + i + ":" + gmarkers[i].getPosition().toUrlValue(6) + ":" + gmarkers[i].distance.toFixed(2) + "<br>";
// //     gmarkers[i].setMap(null);
// //     closest.push(gmarkers[i]);
// //   }
// //   closest.sort(sortByDist);
// //   return closest;
// // }

// // function sortByDist(a, b) {
// //   return (a.distance - b.distance)
// // }

// // function calculateDistances(pt, closest, numberOfResults) {
// //   var service = new google.maps.DistanceMatrixService();
// //   var request = {
// //     origins: [pt],
// //     destinations: [],
// //     travelMode: google.maps.TravelMode.DRIVING,
// //     unitSystem: google.maps.UnitSystem.METRIC,
// //     avoidHighways: false,
// //     avoidTolls: false
// //   };
// //   for (var i = 0; i < closest.length; i++) {
// //     request.destinations.push(closest[i].getPosition());
// //   }
// //   service.getDistanceMatrix(request, function(response, status) {
// //     if (status != google.maps.DistanceMatrixStatus.OK) {
// //       alert('Error was: ' + status);
// //     } else {
// //       var origins = response.originAddresses;
// //       var destinations = response.destinationAddresses;
// //       var outputDiv = document.getElementById('side_bar');
// //       outputDiv.innerHTML = '';

// //       var results = response.rows[0].elements;
// //       // save title and address in record for sorting
// //       for (var i = 0; i < closest.length; i++) {
// //         results[i].title = closest[i].title;
// //         results[i].address = closest[i].address;
// //         results[i].idx_closestMark = i;
// //       }
// //       results.sort(sortByDistDM);
// //       for (var i = 0;
// //         ((i < numberOfResults) && (i < closest.length)); i++) {
// //         closest[i].setMap(map);
// //         outputDiv.innerHTML += "<a href='javascript:google.maps.event.trigger(closest[" + results[i].idx_closestMark + "],\"click\");'>" + results[i].title + '</a><br>' + results[i].address + "<br>" + results[i].distance.text + ' appoximately ' + results[i].duration.text + '<br><hr>';
// //       }
// //     }
// //   });
// // }

// // function sortByDistDM(a, b) {
// //   return (a.distance.value - b.distance.value)
// // }

// // google.maps.event.addDomListener(window, 'load', initialize);
// // // Store Name[0],delivery[1],Address[2],Delivery Zone[3],Coordinates[4] data from FusionTables pizza stores example
// // var locations = [
// //   ["John's Pizza", "no", "400 University Ave, Palo Alto, CA", "<Polygon><outerBoundaryIs><LinearRing><coordinates>-122.121277,37.386799,0 -122.158012,37.4168,0 -122.158012,37.448151,0 -122.142906,37.456055,0 -122.118874,37.45224,0 -122.107544,37.437793,0 -122.102737,37.422526,0 -122.113037,37.414618,0 -122.121277,37.386799,0   </coordinates></LinearRing></outerBoundaryIs></Polygon>", "37.447038,-122.160575", "http://maps.google.com/mapfiles/ms/icons/blue.png"],
// //   ["JJs Express", "yes", "1000 Santa Cruz Ave, Menlo Park, CA", "<Polygon><outerBoundaryIs><LinearRing><coordinates>-122.200928,37.438611,0 -122.158012,37.4168,0 -122.158012,37.448151,0 -122.142906,37.456055,0 -122.144623,37.475948,0 -122.164192,37.481125,0 -122.189255,37.478673,0 -122.208481,37.468319,0 -122.201271,37.438338,0 </coordinates></LinearRing></outerBoundaryIs></Polygon>", "37.448638,-122.187176", "http://maps.google.com/mapfiles/ms/icons/green.png"],
// //   ["John Paul's Pizzeria", "no", "1100 El Camino Real, Belmont, CA", "<Polygon><outerBoundaryIs><LinearRing><coordinates>-122.304268,37.516534,0 -122.300835,37.505096,0 -122.262383,37.481669,0 -122.242813,37.502917,0 -122.244186,37.534232,0 -122.269249,37.550021,0 -122.291222,37.545122,0 -122.302895,37.537499,0 -122.304268,37.516534,0 </coordinates></LinearRing></outerBoundaryIs></Polygon>", "37.520436,-122.275978", "http://maps.google.com/mapfiles/ms/icons/red.png"],
// //   ["JJs Express", "yes", "300 E 4th Ave, San Mateo, CA", "<Polygon><outerBoundaryIs><LinearRing><coordinates>-122.304268,37.516534,0 -122.348557,37.538044,0 -122.359886,37.56363,0 -122.364006,37.582405,0 -122.33654,37.589207,0 -122.281609,37.570433,0 -122.291222,37.545122,0 -122.302895,37.537499,0 -122.304268,37.516534,0 </coordinates></LinearRing></outerBoundaryIs></Polygon>", "37.564435,-122.322080", "http://maps.google.com/mapfiles/ms/icons/green.png"],
// //   ["John's Pizza", "yes", "1400 Broadway Ave, Burlingame, CA", "<Polygon><outerBoundaryIs><LinearRing><coordinates>-122.374306,37.548933,0 -122.348557,37.538044,0 -122.359886,37.56363,0 -122.364006,37.582405,0 -122.33654,37.589207,0 -122.359543,37.59764,0 -122.372246,37.604712,0 -122.417564,37.594648,0 -122.374306,37.548933,0 </coordinates></LinearRing></outerBoundaryIs></Polygon>", "37.584935,-122.366182", "http://maps.google.com/mapfiles/ms/icons/blue.png"],
// //   ["JJs Express", "yes", "700 San Bruno Ave, San Bruno, CA", "<Polygon><outerBoundaryIs><LinearRing><coordinates>-122.462883,37.628916,0 -122.445374,37.639247,0 -122.426147,37.648762,0 -122.405205,37.642238,0 -122.400055,37.628644,0 -122.392159,37.610696,0 -122.372246,37.604712,0 -122.417564,37.594648,0 -122.462196,37.628644,0  </coordinates></LinearRing></outerBoundaryIs></Polygon>", "37.630934,-122.406883", "http://maps.google.com/mapfiles/ms/icons/green.png"],
// //   ["JJs Express", "yes", "300 Beach St, San Francisco, CA", "<Polygon><outerBoundaryIs><LinearRing><coordinates>-122.43576,37.790795,0 -122.449493,37.801646,0 -122.425461,37.809784,0 -122.402115,37.811411,0 -122.390442,37.794593,0 -122.408295,37.79188,0 -122.434387,37.789167,0 </coordinates></LinearRing></outerBoundaryIs></Polygon>", "37.807628,-122.413782", "http://maps.google.com/mapfiles/ms/icons/green.png"],
// //   ["JJs Express", "yes", "1400 Haight St, San Francisco, CA", "<Polygon><outerBoundaryIs><LinearRing><coordinates>-122.463398,37.760266,0 -122.477349,37.774785,0 -122.427349,37.774785,0 -122.429237,37.763658,0 -122.46357,37.760808,0</coordinates></LinearRing></outerBoundaryIs></Polygon>", "37.770129,-122.445082", "http://maps.google.com/mapfiles/ms/icons/green.png"],
// //   ["JJs Express", "yes", "2400 Mission St, San Francisco, CA", "<Polygon><outerBoundaryIs><LinearRing><coordinates>-122.418766,37.747779,0 -122.425289,37.768951,0 -122.406063,37.769901,0 -122.406063,37.749679,0 -122.418251,37.747508,0 </coordinates></LinearRing></outerBoundaryIs></Polygon>", "37.758630,-122.419082", "http://maps.google.com/mapfiles/ms/icons/green.png"],
// //   ["JJs Express", "yes", "500 Castro St, Mountain View, CA", "<Polygon><outerBoundaryIs><LinearRing><coordinates>-122.121277,37.386799,0 -122.108917,37.362244,0 -122.077675,37.3385,0 -122.064285,37.378615,0 -122.069778,37.3898,0 -122.076645,37.402619,0 -122.078705,37.411619,0 -122.113037,37.414618,0 -122.121277,37.386799,0  </coordinates></LinearRing></outerBoundaryIs></Polygon>", "37.390040,-122.081573", "http://maps.google.com/mapfiles/ms/icons/green.png"],
// //   ["John's Pizza", "no", "100 S Murphy Ave, Sunnyvale, CA", "<Polygon><outerBoundaryIs><LinearRing><coordinates>-122.047119,37.33113,0 -122.065315,37.332495,0 -122.077675,37.3385,0 -122.064285,37.378615,0 -122.036819,37.385162,0 -122.006607,37.382162,0 -122.00386,37.342048,0 -122.047119,37.331403,0  </coordinates></LinearRing></outerBoundaryIs></Polygon>", "37.377441,-122.030071", "http://maps.google.com/mapfiles/ms/icons/blue.png"],
// //   ["John's Pizza", "no", "1200 Curtner Ave, San Jose, CA", "<Polygon><outerBoundaryIs><LinearRing><coordinates>-121.935196,37.345051,0 -121.931076,37.294267,0 -121.871338,37.293721,0 -121.806793,37.293174,0 -121.798553,37.361426,0 -121.879578,37.36088,0 -121.934509,37.345597,0 -121.935196,37.345051,0 </coordinates></LinearRing></outerBoundaryIs></Polygon>", "37.288742,-121.890765", "http://maps.google.com/mapfiles/ms/icons/blue.png"],
// //   ["John's Pizza", "yes", "700 Blossom Hill Rd, San Jose, CA", "<Polygon><outerBoundaryIs><LinearRing><coordinates>-121.935883,37.253287,0 -121.931076,37.294267,0 -121.871338,37.293721,0 -121.806793,37.293174,0 -121.790657,37.234702,0 -121.852455,37.223221,0 -121.935539,37.253014,0 </coordinates></LinearRing></outerBoundaryIs></Polygon>", "37.250543,-121.846563", "http://maps.google.com/mapfiles/ms/icons/blue.png"],
// //   ["John's Pizza", "yes", "100 N Milpitas Blvd, Milpitas, CA", "<Polygon><outerBoundaryIs><LinearRing><coordinates>-121.947556,37.435612,0 -121.934509,37.476493,0 -121.893311,37.469409,0 -121.852798,37.429615,0 -121.843872,37.400165,0 -121.887817,37.3898,0 -121.959915,37.420345,0 -121.959915,37.427979,0 -121.948929,37.435612,0 -121.947556,37.435612,0</coordinates></LinearRing></outerBoundaryIs></Polygon>", "37.434113,-121.901139", "http://maps.google.com/mapfiles/ms/icons/blue.png"],
// //   ["John's Pizza", "yes", "3300 Mowry Blvd, Fremont, CA", "<Polygon><outerBoundaryIs><LinearRing><coordinates>-122.02343,37.52198,0 -122.023773,37.558731,0 -121.989784,37.573426,0 -121.959572,37.566351,0 -121.944466,37.544305,0 -121.967125,37.520891,0 -122.023087,37.522525,0</coordinates></LinearRing></outerBoundaryIs></Polygon>", "37.552773,-121.985153", "http://maps.google.com/mapfiles/ms/icons/blue.png"],
// //   //New York, NY, USA (40.7127837, -74.00594130000002)  
// //   ["New York, NY, USA", "no", "New York City Hall, New York, NY 10007, USA", "<Polygon><outerBoundaryIs><LinearRing><coordinates>-122.02343,37.52198,0 -122.023773,37.558731,0 -121.989784,37.573426,0 -121.959572,37.566351,0 -121.944466,37.544305,0 -121.967125,37.520891,0 -122.023087,37.522525,0</coordinates></LinearRing></outerBoundaryIs></Polygon>", "40.7127837, -74.0059413", "http://maps.google.com/mapfiles/ms/icons/yellow.png"],
// //   // Newark, NJ, USA (40.735657, -74.1723667)  
// //   ["Newark, NJ, USA", "no", "169 Market St, Newark, NJ 07102, USA", "<Polygon><outerBoundaryIs><LinearRing><coordinates>-122.02343,37.52198,0 -122.023773,37.558731,0 -121.989784,37.573426,0 -121.959572,37.566351,0 -121.944466,37.544305,0 -121.967125,37.520891,0 -122.023087,37.522525,0</coordinates></LinearRing></outerBoundaryIs></Polygon>", "40.735657, -74.1723667", "http://maps.google.com/mapfiles/ms/icons/yellow.png"],
// //   // Baltimore, MD, USA (39.2903848, -76.6121893
// //   ["Baltimore, MD, USA", "no", "201-211 E Fayette St, Baltimore, MD 21202, USA", "<Polygon><outerBoundaryIs><LinearRing><coordinates>-122.02343,37.52198,0 -122.023773,37.558731,0 -121.989784,37.573426,0 -121.959572,37.566351,0 -121.944466,37.544305,0 -121.967125,37.520891,0 -122.023087,37.522525,0</coordinates></LinearRing></outerBoundaryIs></Polygon>", "39.2903848, -76.6121893", "http://maps.google.com/mapfiles/ms/icons/yellow.png"],
// //   // Boston, MA, USA (42.3600825, -71.05888
// //   ["Boston, MA, USA", "no", "City Hall Plaza, Boston, MA 02203, USA", "<Polygon><outerBoundaryIs><LinearRing><coordinates>-122.02343,37.52198,0 -122.023773,37.558731,0 -121.989784,37.573426,0 -121.959572,37.566351,0 -121.944466,37.544305,0 -121.967125,37.520891,0 -122.023087,37.522525,0</coordinates></LinearRing></outerBoundaryIs></Polygon>", "42.3600825, -71.05888", "http://maps.google.com/mapfiles/ms/icons/yellow.png"],
// //   // Philadelphia, PA, USA (39.9525839, -75.16522150000003)
// //   ["Philadelphia, PA, USA", "no", "1414 PA-611, Philadelphia, PA 19102, USA", "<Polygon><outerBoundaryIs><LinearRing><coordinates>-122.02343,37.52198,0 -122.023773,37.558731,0 -121.989784,37.573426,0 -121.959572,37.566351,0 -121.944466,37.544305,0 -121.967125,37.520891,0 -122.023087,37.522525,0</coordinates></LinearRing></outerBoundaryIs></Polygon>", "39.9525839, -75.1652215", "http://maps.google.com/mapfiles/ms/icons/yellow.png"]
// // ];