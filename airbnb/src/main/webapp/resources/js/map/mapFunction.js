/**
 * 	map에 사용되는 function
 */
function createMarker(place) {
	if (!place.geometry || !place.geometry.location) return;
	const marker = new google.maps.Marker({
	    map: map,
	    position: place.geometry.location,
	});
	google.maps.event.addListener(marker, "click", () => {
		infowindow.setContent(place.name || "");
	    infowindow.open(map);
	});
}//create marker
function emptyList(){
	$("#places").empty();
}
