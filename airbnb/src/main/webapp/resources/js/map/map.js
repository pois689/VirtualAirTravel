/**
 * map
 * 
 */
function initAutocomplete() {
	//constant
		const JAPAN_BOUNDS ={
			north : 45.812933,
			south : 29.971335,
	  		west : 128.992627,
			east : 145.963931
   		};
   	  	const TOKYO = new google.maps.LatLng(35.67983368629576, 139.7692682680569);
   	  	let center = TOKYO;
   	  	//set map
       	let map = new google.maps.Map(document.getElementById("map"), {
       		center : TOKYO,
			zoom : 15,
			mapTypeId:"roadmap",
			mapTypeControl: false,
			streetViewControl: false,
			fullscreenControl: false,
			restriction: {
			    latLngBounds: JAPAN_BOUNDS,
				strictBounds: false
			}
       	});
       	
		//info window view
       	let infowindow = new google.maps.InfoWindow();
       	//service
		let service = new google.maps.places.PlacesService(map);
		//markers
		let markers = [];
/////////////////////////////////////////////////////////////////////////////////////////////////
       	//find Place
		const request = {
		    query: name,
		    fields: ["name","geometry"],
		};
		service.textSearch(request,(results,status) =>{
			if (status === google.maps.places.PlacesServiceStatus.OK && results) {
				results.forEach((result)  => {
					if (!result.geometry || !result.geometry.location) return;
					
					const icon = {
		             	size: new google.maps.Size(71, 71),
		             	origin: new google.maps.Point(0, 0),
		             	anchor: new google.maps.Point(17, 34),
		             	scaledSize: new google.maps.Size(25, 25),
					};
					
		           	// Create a marker for each place.
		           	markers.push(
						new google.maps.Marker({
			               	map : map,
			               	icon : icon,
			               	title: result.name,
			               	position: result.geometry.location,
		             	})
					);
			      });
				center = results[0].geometry.location; 
			    map.setCenter(center);
			    nearbySearch(map,service,center, travel+accommodation+restaurant+spot+traffic);
			}
		});//find place from query
		
////////////////////////////////////////////////////////////////////////////////////////////////////////

		// Create the search box and link it to the UI element.
		const input = document.getElementsByClassName("search__button").item(1);
		const options = {
	        bounds: JAPAN_BOUNDS,
	        componentRestrictions: { country: "jp" },
	        fields: ["address_components", "geometry", "icon", "name"],
	        origin: TOKYO,
	        strictBounds: false,
	        types: ["establishment"],
		};
		let autocomplete = new google.maps.places.Autocomplete(input, options);
	    let searchBox = new google.maps.places.SearchBox(input);

	    // Bias the SearchBox results towards current map's viewport.
	    map.addListener("bounds_changed", () => {
	    	searchBox.setBounds(map.getBounds());
		});

		 // more details for that place.
	    searchBox.addListener("places_changed", () => {
	    	emptyList();
	    	let places = searchBox.getPlaces();
	        if (places.length == 0) {
	        	return;
	        }
	        
	        // Clear out the old markers.
	        markers.forEach((marker) => {
	        	marker.setMap(null);
	        });
	        markers = [];
	        
	        // For each place, get the icon, name and location.
	        let bounds = new google.maps.LatLngBounds();
	        center = places[0].geometry.location;
	        places.forEach((place) => {
	           	if (!place.geometry || !place.geometry.location) {
					console.log("없다");
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
		               	map : map,
		               	icon : icon,
		               	title: place.name,
		               	position: place.geometry.location,
	             	})
				);
				console.log(markers);
	           	if (place.geometry.viewport) {
	            // Only geocodes have viewport.
	            	bounds.union(place.geometry.viewport);
	           	} else {
					bounds.extend(place.geometry.location);
				}
	           	nearbySearch(map, service,place.geometry.location, spot);
			});
			
	    	map.fitBounds(bounds);
	    	map.setCenter(center);
		});//searchbox -> place changed

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		 $(".dropdown-item").click(function(){
	    	emptyList();
	    	removeMarker();
	    	console.log(this.value);
	    	switch(this.value) {
			  case '여행지':
			  	selectCategory = travel;
			  	break;
			  case '숙소':
			  	selectCategory = accommodation;
			  	break;
			  case '맛집':
			  	selectCategory = restaurant;
			  	break;
			  case '볼거리':
			  	selectCategory = spot;
			  	break;
			  case '이동수단':
			  	selectCategory = traffic;
			  	break;
			  default:
			  	selectCategory = ['all'];
			  	break;
			}
			nearbySearch(map, service,center, selectCategory);
	    });
	}//initAutocomplete
	
	$(document).ready( function() {
	   
	});
	
	//get detail
	function getDetail(service, placeId){
		
		const request = {	
			placeId: placeId,
			fields: ['ALL'],
		};
		service.getDetails(request, (place, status) => {
			if (status === google.maps.places.PlacesServiceStatus.OK &&place &&place.geometry &&place.geometry.location) {
				return place;
			} else {
				return null;
			}
		});
	}
