<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
<title>Places Search Box</title>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<style type="text/css">
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	height: 100%;
	width: 70%; 
}
#list{
	float:left;
	width: 30%;
	height: 100%;
}
/* Optional: Makes the sample page fill the window. */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#description {
	font-family: Roboto;
	font-size: 15px;
	font-weight: 300;
}

#infowindow-content .title {
	font-weight: bold;
}

#infowindow-content {
	display: none;
}

#map #infowindow-content {
	display: inline;
}

.pac-card {
	margin: 10px 10px 0 0;
	border-radius: 2px 0 0 2px;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	outline: none;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
	background-color: #fff;
	font-family: Roboto;
}

#pac-container {
	padding-bottom: 12px;
	margin-right: 12px;
}

.pac-controls {
	display: inline-block;
	padding: 5px 11px;
}

.pac-controls label {
	font-family: Roboto;
	font-size: 13px;
	font-weight: 300;
}

#pac-input {
	background-color: #fff;
	font-family: Roboto;
	font-size: 15px;
	font-weight: 300;
	margin-left: 12px;
	padding: 0 11px 0 13px;
	text-overflow: ellipsis;
	width: 400px;
}

#pac-input:focus {
	border-color: #4d90fe;
}

#title {
	color: #fff;
	background-color: #4d90fe;
	font-size: 25px;
	font-weight: 500;
	padding: 6px 12px;
}

#target {
	width: 345px;
}
</style>
<script>
    let travel = ['aquarium','museum','zoo','campground'];//여행지
    /* let fete = [];//행사 */
    let accommodation = ['lodging']; //숙소
    let restaurant = ['bar','cafe','restaurant'];//맛집
    let spot = ['tourist_attraction']; //볼거리
    let traffic = ['airport','subway_station','train_station','taxi_stand','bus_station']; //교통
</script>
<script>
	function initAutocomplete() {
		const JAPAN_BOUNDS ={
			north : 45.812933,
			south : 29.971335,
	  		west : 128.992627,
			east : 145.963931
   		};
		const JAPAN_MID = new google.maps.LatLng(37.892134,137.478279);
   	  	const TOKYO = new google.maps.LatLng(35.6785,139.7922);
		let category = '<c:out value="${category}"/>';
		let temp_center = '<c:out value="${name}"/>';
       	const map = new google.maps.Map(document.getElementById("map"), {
       		center : TOKYO,
			zoom : 13,
			mapTypeId:"roadmap",
			mapTypeControl: false,
			streetViewControl: false,
			fullscreenControl: false,
			restriction: {
			    latLngBounds: JAPAN_BOUNDS,
				strictBounds: false
			}
       	});
       // Create the search box and link it to the UI element.
       const input = document.getElementById("pac-input");
       const options = {
         bounds: JAPAN_BOUNDS,
         componentRestrictions: { country: "jp" },
         fields: ["address_components", "geometry", "icon", "name"],
         origin: TOKYO,
         strictBounds: false,
         types: ["establishment"],
       };
       const autocomplete = new google.maps.places.Autocomplete(input, options);
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
     }
   </script>
</head>
<body>
	<div id="list">
		<input id="pac-input" class="controls" type="text"
			placeholder="Search Box"
		/>
	</div>
	<div id="map"></div>

	<!-- Async script executes immediately and must be after any DOM elements used in callback. -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD9Ipehrpor4GUgqPUAUI7sXldNenx5suo&callback=initAutocomplete&libraries=places&v=weekly"
		async
	></script>
</body>
</html>