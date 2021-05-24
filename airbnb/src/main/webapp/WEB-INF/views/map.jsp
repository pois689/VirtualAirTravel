<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>My Google Map</title>
<style>
	#map{
		height:400px;
		width:100%;
	}
</style>
</head>
<body>
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
		
		//Add Marker Function
		function addMarker(props){
			var marker = new google.maps.Marker({
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
				var infoWindow = new google.maps.InfoWindow({
					content:props.content
				});
				
				marker.addListener('click',function(){
					infoWindow.open(map,marker);
				}); 

			}
		}
	}
</script>
<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD9Ipehrpor4GUgqPUAUI7sXldNenx5suo&callback=initMap"
		async defer></script>
</body>
</html>