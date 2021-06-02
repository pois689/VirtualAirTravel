<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Local Context Basic</title>
		 <script src="https://polyfill.io/v3/polyfill.js?features=default"></script>
		<style type="text/css">
			html, body {
				height: 100%;
				margin: 0;
				padding: 0;
			}
			#map {
				width: 70%;
				height: 100%;
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
			function initMap() {
				//infowindow setting
				let infowindow = new google.maps.InfoWindow();
				
				//context map component				
				const localContextMapView = new google.maps.localContext.LocalContextMapView({
					//insert position
					element : document.getElementById("map"),
					//category setting
					placeTypePreferences : [ 
						{ type: "bakery", weight: 1 },
					    { type: "park", weight: 2 },
					    { type: "restaurant", weight: 3 },
					    { type: "shopping_mall", weight: 1 },
					    { type: "tourist_attraction", weight: 3 }, 
					],
					//view count
					maxPlaceCount : 18,
					
					/* placeChooserViewSetup: ({defaultLayoutMode}) => {
						if (defaultLayoutMode === 'SHEET') {
							return {position: 'INLINE_START'};
						}
					},
					placeDetailsViewSetup: ({defaultLayoutMode}) => {
						if (defaultLayoutMode === 'SHEET') {
							return {position: 'INLINE_START'};
						}
					} */
				});
				
				//map initializing
				let map = localContextMapView.map;
				let name = '<c:out value="${name}"/>';
				//places service
				if(name != null){
					let service = new google.maps.places.PlacesService(map);
					const request = {
					    query: name,
					    fields: ["name", "geometry"],
					};
					service.findPlaceFromQuery(request,(results,status) =>{
						if (status === google.maps.places.PlacesServiceStatus.OK && results) {
							for (let i = 0; i < results.length; i++) {
								createMarker(results[i]);
							}
							let temp_center = results[0].geometry.location;
							map.setCenter(results[0].geometry.location);
						}
					});
					
					function createMarker(place){
						if (!place.geometry || !place.geometry.location) return;
						const marker = new google.maps.Marker({
							map,
							position: place.geometry.location,
						});
	  					google.maps.event.addListener(marker, "click", () => {
	    					infowindow.setContent(place.name || "");
	    					infowindow.open(map,marker);
	  					});
					}
				}
				
				//map center Lat&Lng
				const tokyo = new google.maps.LatLng(35.6785,139.7922);
				let category = '<c:out value="${category}"/>';
				let temp_center = '<c:out value="${name}"/>';
				let place = (temp_center=='')? tokyo:temp_center;
				
				//map component setting
				map.setOptions({
					center : place,
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











 	
       
       