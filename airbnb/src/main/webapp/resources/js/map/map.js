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
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		 
		 map.addListener('dragend',function(){
			 center = map.getCenter();
			 console.log(center);
			 emptyList();
			 nearbySearch(map, service,center, selectCategory);
		 });
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
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
			// Clear out the old markers.
	        markers.forEach((marker) => {
	        	marker.setMap(null);
	        });
	        markers = [];
	        
			for (let place of places) {
				if (place.geometry && place.geometry.location) {
					const image = {
			            url: place.icon,
			            size: new google.maps.Size(71, 71),
			            origin: new google.maps.Point(0, 0),
			            anchor: new google.maps.Point(17, 34),
			            scaledSize: new google.maps.Size(25, 25),
					};
					
					markers.push(
						new google.maps.Marker({
			               	map : map,
			               	icon : image,
			               	title: place.name,
			               	position: place.geometry.location,
		             	})
					);
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
					
					let content_review_div = document.createElement('div');
					content_review_div.setAttribute("class",'content_review');
					content_review_div.append('별점');
					content_review_div.append('리뷰 개수');
					/*content_detail_div.append('주소');
					content_detail_div.append('번호');*/
					
					content_div.append(content_review_div);
					
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

		 
		 function removeMarker(){
		 	for(let i=0; i<markers.length; i++){
		 		markers[i].setMap(null);
		 	}
		 	markers = [];
		}//remove marker

		 
		 
	}//initAutocomplete
	
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
