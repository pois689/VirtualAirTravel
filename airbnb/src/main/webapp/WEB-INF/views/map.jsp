<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Local Context Basic</title>
		<style type="text/css">
			html, body {
				height: 100%;
				margin: 0;
				padding: 0;
			}
			#map {
				height: 100%;
			}
			#pac-input{
				
			}
		</style>
	</head>
	
	<body>
		<input id="pac-input" class="controls" type="text" placeholder="Search Box" />
		<div id="map"> </div>
	
	</body>
	
		<script src="https://maps.googleapis.com/maps/api/js?
			key=AIzaSyD9Ipehrpor4GUgqPUAUI7sXldNenx5suo
			&region=JP
			&language=ko
			&libraries=localContext,places
			&v=beta
			&callback=initMap"
			async></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script>
			const tokyo = {lat:35.6785,lng:139.7922};
			let category = '<c:out value="${category}"/>';
			let name = '<c:out value="${name}"/>';
			let place = ('<c:out value="${location}"/>'=='')? tokyo:'<c:out value="${location}"/>';
			const input = document.getElementById("pac-input");
			const searchBox = new google.maps.places.SearchBox(input);
			 map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
			  // Bias the SearchBox results towards current map's viewport.
			  map.addListener("bounds_changed", () => {
			    searchBox.setBounds(map.getBounds());
			  });
			  let markers = [];
			  // Listen for the event fired when the user selects a prediction and retrieve
			  // more details for that place.
			  searchBox.addListener("places_changed", () => {
			    const places = searchBox.getPlaces();

			    if (places.length == 0) {
			      return;
			    }
			    // Clear out the old markers.
			    markers.forEach((marker) => {
			      marker.setMap(null);
			    });
			    markers = [];
			    // For each place, get the icon, name and location.
			    const bounds = new google.maps.LatLngBounds();
			    places.forEach((place) => {
			      if (!place.geometry || !place.geometry.location) {
			        console.log("Returned place contains no geometry");
			        return;
			      }
			      const icon = {
			        url: place.icon,
			        size: new google.maps.Size(71, 71),
			        origin: new google.maps.Point(0, 0),
			        anchor: new google.maps.Point(17, 34),
			        scaledSize: new google.maps.Size(25, 25),
			      };
			      // Create a marker for each place.
			      markers.push(
			        new google.maps.Marker({
			          map,
			          icon,
			          title: place.name,
			          position: place.geometry.location,
			        })
			      );

			      if (place.geometry.viewport) {
			        // Only geocodes have viewport.
			        bounds.union(place.geometry.viewport);
			      } else {
			        bounds.extend(place.geometry.location);
			      }
			    });
			    map.fitBounds(bounds);
			  });
			console.log(input);			
			function initMap(center) {
				const localContextMapView = new google.maps.localContext.LocalContextMapView({
					element : document.getElementById("map"),
					placeTypePreferences : [ 
						{ type: "bakery", weight: 1 },
					    { type: "park", weight: 2 },
					    { type: "restaurant", weight: 3 },
					    { type: "shopping_mall", weight: 1 },
					    { type: "tourist_attraction", weight: 3 }, 
					],
					maxPlaceCount : 18,
					placeChooserViewSetup: ({defaultLayoutMode}) => {
						if (defaultLayoutMode === 'SHEET') {
							return {position: 'INLINE_START'};
						}
					},
					placeDetailsViewSetup: ({defaultLayoutMode}) => {
						if (defaultLayoutMode === 'SHEET') {
							return {position: 'INLINE_START'};
						}
					}
				});
				let map = localContextMapView.map;
				map.setOptions({
					center : tokyo,
					zoom : 13,
					mapTypeId:"roadmap",
					mapTypeControl: false,
					streetViewControl: false,
					fullscreenControl: false
				});
			/* google.maps.event.addListener(map, 'click', function() {
				  alert('You clicked the map.');
				});*/
			} //initMap
			
			
		
		</script>
</html>