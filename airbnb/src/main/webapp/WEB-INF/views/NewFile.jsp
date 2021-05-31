<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Map Bounds Restriction</title>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
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
      let map;
      const JAPAN_BOUNDS ={
			north : 45.812933,
			south : 29.971335,
  		    west : 128.992627,
  		    east : 145.963931
  		};

      function initMap() {
		const JAPAN_MID = new google.maps.LatLng(37.892134,137.478279);
        map = new google.maps.Map(document.getElementById("map"), {
          center: JAPAN_MID,
          restriction: {
            latLngBounds: JAPAN_BOUNDS,
            strictBounds: false,
          },
          zoom: 5,
        });
      }
    </script>
  </head>
  <body>
    <div id="map"></div>

    <!-- Async script executes immediately and must be after any DOM elements used in callback. -->
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD9Ipehrpor4GUgqPUAUI7sXldNenx5suo&callback=initMap&libraries=&v=weekly"
      async
    ></script>
  </body>
</html>