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
		 			//console.log(getDetail(service, results[i].place_id));
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
	        
	        let place_list_str = '';
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
					console.log(place.photos[0].getUrl());
					document.getElementsByClassName('map_img_img')[0].src = 'https://maps.googleapis.com/maps/api/place/js/PhotoService.GetPhoto?1sATtYBwKrVrro4L5CHRAgOuM7HXskl7-OKXyj7N3Ej0IpUCv1x-mY0oJnVazLKPcqyxgqGJup66fv2r4TUxG1rdkd9MnnFsdM2Zg9VuSXT8VqY3VFau2GknwN_ugIYW3D3fX7ujsoghiNmgvMmBCJCzL6N7GG3_saOOVjpkEqzOf-ya9Hn8JY&3u720&5m1&2e1&callback=none&key=AIzaSyDUBAs2Aoeh9UJxjarRyXFSvuBDE-BLFVM&token=119423';
					document.getElementsByClassName('content_img_img')[0].src = 'https://maps.googleapis.com/maps/api/place/js/PhotoService.GetPhoto?1sATtYBwKrVrro4L5CHRAgOuM7HXskl7-OKXyj7N3Ej0IpUCv1x-mY0oJnVazLKPcqyxgqGJup66fv2r4TUxG1rdkd9MnnFsdM2Zg9VuSXT8VqY3VFau2GknwN_ugIYW3D3fX7ujsoghiNmgvMmBCJCzL6N7GG3_saOOVjpkEqzOf-ya9Hn8JY&3u720&5m1&2e1&callback=none&key=AIzaSyDUBAs2Aoeh9UJxjarRyXFSvuBDE-BLFVM&token=119423';
					document.getElementsByClassName('content_img_img2')[0].src = 'https://maps.googleapis.com/maps/api/place/js/PhotoService.GetPhoto?1sATtYBwKrVrro4L5CHRAgOuM7HXskl7-OKXyj7N3Ej0IpUCv1x-mY0oJnVazLKPcqyxgqGJup66fv2r4TUxG1rdkd9MnnFsdM2Zg9VuSXT8VqY3VFau2GknwN_ugIYW3D3fX7ujsoghiNmgvMmBCJCzL6N7GG3_saOOVjpkEqzOf-ya9Hn8JY&3u720&5m1&2e1&callback=none&key=AIzaSyDUBAs2Aoeh9UJxjarRyXFSvuBDE-BLFVM&token=119423';
					place_list_str += '<li class="sidebar_li"><div class="map_img"><img alt="미리보기" class="map_img_img" src="';
					place_list_str += place.photos[0].getUrl();//image url
					place_list_str += '"></div><div class="content_review"><div class="content_header"><h2 class="content_title">';
					place_list_str += 'place.name'; //place name
					place_list_str += '</h2></div><hr><div class="content_detail"><div class="content_detail_star"><span><svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 20px; width: 20px; fill: currentcolor; color: #FF385C !important;"><path d="M15.094 1.579l-4.124 8.885-9.86 1.27a1 1 0 0 0-.542 1.736l7.293 6.565-1.965 9.852a1 1 0 0 0 1.483 1.061L16 25.951l8.625 4.997a1 1 0 0 0 1.482-1.06l-1.965-9.853 7.293-6.565a1 1 0 0 0-.541-1.735l-9.86-1.271-4.127-8.885a1 1 0 0 0-1.814 0z" fill-rule="evenodd"></path></svg></span><span>';
					place_list_str += '2.0'; //평균 별점
					place_list_str += '</span><span style="color: rgb(113, 113, 113) !important;">(후기';
					place_list_str += '';//후기 갯수 
					place_list_str += '개)</span></div><div class="content_bottom"><span>';
					place_list_str += 'place.주소'; //주소
					place_list_str += '</span><span>';
					place_list_str += '전화번호'; //전화번호
					place_list_str += '</span></div></div></div></li>';
				}
			}
			$("#places").append(place_list_str);
		}//add place after click to button

		 
		 function removeMarker(){
		 	for(let i=0; i<markers.length; i++){
		 		markers[i].setMap(null);
		 	}
		 	markers = [];
		}//remove marker

		 
		 
	}//initAutocomplete
	
	//get detail
	/*function getDetail(service, placeId){
		
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
	}*/
