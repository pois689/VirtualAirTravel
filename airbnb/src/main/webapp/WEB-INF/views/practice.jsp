<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
  <head>
    <title>Local Context Basic</title>
    <style type="text/css">
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html,
      body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
    <script>
      function initMap() {
        const localContextMapView =
          new google.maps.localContext.LocalContextMapView({
            element: document.getElementById("map"),
            placeTypePreferences: [
              "airport"
            ],
            maxPlaceCount: 12
          });
        let map = localContextMapView.map;
        map.setOptions({
          center: {lat:35.6785,lng:139.7922},
          zoom: 13,
        });
      }
    </script>
  </head>
  <body>
    <div id="map"></div>

    <!-- Async script executes immediately and must be after any DOM elements used in callback. -->
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD9Ipehrpor4GUgqPUAUI7sXldNenx5suo&region=JP&language=ko&callback=initMap&libraries=localContext&v=beta"
      async
    ></script>
  </body>
=======
>>>>>>> Stashed changes
<head>
<title>Simple Map</title>
<meta name="viewport" content="initial-scale=1.0">
<meta charset="utf-8">
<style>
#map {
	height: 100%;
}
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>
</head>
<body>
	<div id="map"></div>
	<script>
      var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 15
        });
      }
    </script>
	<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD9Ipehrpor4GUgqPUAUI7sXldNenx5suo"
		async defer></script>
</body>
<<<<<<< Updated upstream
=======
>>>>>>> 3f412ef2ae1488435504afdde2d1ba00cc49b71b
>>>>>>> Stashed changes
</html>