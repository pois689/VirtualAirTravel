/**
 * 	map에 사용되는 function
 */
function setTravel(){
	

}
function setAccommodation(){
	

}
function setRestaurant(){
	

}
function setSpot(){
	

}
function setTraffic(){
	

}

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
 
 function removeMarker(){
 	for(let i=0; i<markers.length; i++){
 		markers[i].setMap(null);
 	}
 	markers = [];
}//remove marker

//near by Search
function nearbySearch(map, service, location, type){
	let getNextPage;
	const moreButton = document.getElementById("more");
	
	moreButton.onclick = function () {
		moreButton.disabled = true;

	    if (getNextPage) {
	    	getNextPage();
	    }//if exists?
	};
	// Perform a nearby search.
	service.nearbySearch( { location: location, radius: 1000, type: type }, (results, status, pagination) => {
		let places=[];
		addPlaces(results, map);
		for(let i=0; i<results.length; i++){
			console.log(getDetail(service, results[i].place_id));
			/* places.push(getDetail(service, results[i].place_id)); */
		}
		console.log(results[0].place_id);
		if (status !== "OK" || !results) {return;}
		
		moreButton.disabled = (!pagination || !pagination.hasNextPage);
		
	    if (pagination && pagination.hasNextPage) {
	       	getNextPage = () => {
				// Note: nextPage will call the same handler function as the initial call
	        	pagination.nextPage();
	       	};
	    }
	});
}

//add place
function addPlaces(places, map) {
	console.log(places[0]);
	for (let place of places) {
		if (place.geometry && place.geometry.location) {
			const image = {
	            url: place.icon,
	            size: new google.maps.Size(71, 71),
	            origin: new google.maps.Point(0, 0),
	            anchor: new google.maps.Point(17, 34),
	            scaledSize: new google.maps.Size(25, 25),
			};
			new google.maps.Marker({
				map: map,
	            icon: image,
	            title: place.name,
	            position: place.geometry.location,
			});
			const HR = document.createElement('hr');
			const BR = document.createElement('br');
			let span = document.createElement('span');
			
			//img
			let img = document.createElement('img');
			img.setAttribute("src",place.photos[0].getUrl());
			
			//본문 div
			 ///img
			let img_div = document.createElement('div');
			img_div.setAttribute("class",'map_img');
			img_div.append(img);
			
			 ///content
			let content_div = document.createElement('div');
			content_div.setAttribute("class",'content');
			
			content_div.append(place.name);//이름
			content_div.append(HR);//hr
			if(place.rating != null){
				content_div.append(place.rating);//rating
				content_div.append(BR);//hr
			}
			
			if(place.opening_hours != null){
				content_div.append(place.opening_hours.toString());
			}
			
			//type
			let p = document.createElement('p');
			p.append(place.types[0]);//
			content_div.append(p);//
			
			//li
			let li = document.createElement('li');
			li.append(img_div);
			li.append(content_div);
			
			
			let placesList = document.getElementById("places");
			placesList.append(li);
			
			
			li.addEventListener("click", () => {
				location.href = '/view?name='+place.name;
			});
		}
	}
}//add place after click to button

function emptyList(){
	$("#places").empty();
}
