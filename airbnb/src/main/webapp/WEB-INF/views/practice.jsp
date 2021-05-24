<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
</html>