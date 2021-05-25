<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
=======
>>>>>>> 3f412ef2ae1488435504afdde2d1ba00cc49b71b
>>>>>>> Stashed changes
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>My Google Map</title>
<style>
<<<<<<< Updated upstream
	#map{
		height:400px;
		width:100%;
=======
<<<<<<< HEAD
	html, body {
	    margin: 0;
	    height: 100%;
	    overflow: hidden;
	    position: relative;
	}
	#map{
		position:absolute;
		right:0px;
		width:70%;
		height:100%;
	}
	#floating-panel{
		position:absolute;
		top:20px;
		left:100px;
=======
	#map{
		height:400px;
		width:100%;
>>>>>>> 3f412ef2ae1488435504afdde2d1ba00cc49b71b
>>>>>>> Stashed changes
	}
</style>
</head>
<body>
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
<!-- <div id="floating-panel">
      <input id="latlng" type="text" value="40.714224,-73.961452" />
      <input id="submit" type="button" value="Reverse Geocode" />
</div> -->
<div id="floating-panel">
      <input id="address" type="text" value="" autofocus="autofocus"/>
      <input id="submit" type="button" value="Geocode" />
    </div>
<div id="map"></div>
<script>
const tokyo = {lat:35.6785,lng:139.7922};

let place = 
	('<c:out value="${location}"/>'=='')? tokyo:'<c:out value="${location}"/>';
	
function CenterControl(controlDiv, map) {
	  // Set CSS for the control border.
	  const controlUI = document.createElement("div");
	  controlUI.style.backgroundColor = "#fff";
	  controlUI.style.border = "2px solid #fff";
	  controlUI.style.borderRadius = "3px";
	  controlUI.style.boxShadow = "0 2px 6px rgba(0,0,0,.3)";
	  controlUI.style.cursor = "pointer";
	  controlUI.style.marginTop = "8px";
	  controlUI.style.marginBottom = "22px";
	  controlUI.style.textAlign = "center";
	  controlUI.title = "Click to recenter the map";
	  controlDiv.appendChild(controlUI);
	  // Set CSS for the control interior.
	  const controlText = document.createElement("div");
	  controlText.style.color = "rgb(25,25,25)";
	  controlText.style.fontFamily = "Roboto,Arial,sans-serif";
	  controlText.style.fontSize = "16px";
	  controlText.style.lineHeight = "38px";
	  controlText.style.paddingLeft = "5px";
	  controlText.style.paddingRight = "5px";
	  controlText.innerHTML = "Center Map";
	  controlUI.appendChild(controlText);
	  // Setup the click event listeners: simply set the map to Chicago.
	  controlUI.addEventListener("click", () => {
		  map.setCenter(place);
	  });
	};
	
	function initMap(){
		//Map options
		const options = {
			zoom:12,
			center:tokyo,
			mapTypeControl: false,
			streetViewControl: false,
			fullscreenControl: false
		}
		//New map
		const map = new google.maps.Map(document.getElementById('map'),options);
		const geocoder = new google.maps.Geocoder();
		
		document.getElementById("submit").addEventListener("click", () => {
		    geocodeAddress(geocoder, map);
		  });
		
		// Create the DIV to hold the control and call the CenterControl()
		// constructor passing in this DIV.
		const centerControlDiv = document.createElement("div");
		CenterControl(centerControlDiv, map);
		map.controls[google.maps.ControlPosition.TOP_CENTER].push(centerControlDiv);
		
		
		//Listen for click on map
		google.maps.event.addListener(map,'click',function(e){
			addMarker({
				coords:e.latLng,
				content:'<h1>'+e.latLng+'</h1>'
				});
			
		});
		
		
=======
>>>>>>> Stashed changes
<h1>My Google Map</h1>
<div id="map"></div>
<script>
	function initMap(){
		//Map options
		var options = {
			zoom:8,
			center:{lat:42.3601,lng:-71.0589}
		}
		//New map
		var map = new 
		google.maps.Map(document.getElementById('map'),options);
<<<<<<< Updated upstream
=======
>>>>>>> 3f412ef2ae1488435504afdde2d1ba00cc49b71b
>>>>>>> Stashed changes
		
		/* 
		//Add marker
		var marker = new google.maps.Marker({
			position:{lat:42.4668,lng:-70.9495},
			map:map,
			icon:'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png'
		});
		
		//
		var infoWindow = new google.maps.InfoWindow({
			content:'<h1>Lynn MA</h1>'
		});
		
		marker.addListener('click',function(){
			infoWindow.open(map,marker);
		}); 
		*/
		
		addMarker({
			coords:{lat:42.4668,lng:-70.9495},
			iconImage:'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png',
			content:'<h1>Lynn MA</h1>'	
		});
		addMarker({coords:{lat:42.8584,lng:-70.9300}});
		addMarker({coords:{lat:42.7762,lng:-71.0773}});
		//db -> {for}
		
<<<<<<< Updated upstream
		//Add Marker Function
		function addMarker(props){
			var marker = new google.maps.Marker({
=======
<<<<<<< HEAD
		//검색
		function geocodeAddress(geocoder, resultsMap) {
		  const address = document.getElementById("address").value;
		  geocoder.geocode({ address: address }, (results, status) => {
		    if (status === "OK") {
		      resultsMap.setCenter(results[0].geometry.location);
		      new google.maps.Marker({
		        map: resultsMap,
		        position: results[0].geometry.location,
		      });
		    } else {
		      alert("Geocode was not successful for the following reason: " + status);
		    }
		  });
		}
		
		//Add Marker Function
		function addMarker(props){
			let marker = new google.maps.Marker({
=======
		//Add Marker Function
		function addMarker(props){
			var marker = new google.maps.Marker({
>>>>>>> 3f412ef2ae1488435504afdde2d1ba00cc49b71b
>>>>>>> Stashed changes
				position:props.coords,
				map:map,
				//icon:props.iconImage
			});
			
			//Check for customicon
			if(props.iconImage){
				//Set icon image
				marker.setIcon(props.iconImage);
			}
			
			//Check content
			if(props.content){
<<<<<<< Updated upstream
				var infoWindow = new google.maps.InfoWindow({
=======
<<<<<<< HEAD
				let infoWindow = new google.maps.InfoWindow({
=======
				var infoWindow = new google.maps.InfoWindow({
>>>>>>> 3f412ef2ae1488435504afdde2d1ba00cc49b71b
>>>>>>> Stashed changes
					content:props.content
				});
				
				marker.addListener('click',function(){
					infoWindow.open(map,marker);
				}); 
<<<<<<< Updated upstream

=======
<<<<<<< HEAD
=======

>>>>>>> 3f412ef2ae1488435504afdde2d1ba00cc49b71b
>>>>>>> Stashed changes
			}
		}
	}
</script>
<<<<<<< Updated upstream
<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD9Ipehrpor4GUgqPUAUI7sXldNenx5suo&callback=initMap"
=======
<<<<<<< HEAD
<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD9Ipehrpor4GUgqPUAUI7sXldNenx5suo&region=JP&language=ko&callback=initMap"
=======
<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD9Ipehrpor4GUgqPUAUI7sXldNenx5suo&callback=initMap"
>>>>>>> 3f412ef2ae1488435504afdde2d1ba00cc49b71b
>>>>>>> Stashed changes
		async defer></script>
</body>
</html>