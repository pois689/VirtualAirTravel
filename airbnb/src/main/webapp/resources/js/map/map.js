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
       		center : center,
			zoom : 17,
			mapTypeId:"roadmap",
			mapId: mapID,
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
		
		
		let cityCircle = new google.maps.Circle({
			strokeColor: "#FF0000",
			strokeOpacity: 0.8,
			strokeWeight: 1,
			fillColor: "#FF0000",
			fillOpacity: 0.15,
			map: map,
			center: center,
			radius: 300,
		});		
/////////////////////////////////////////////////////////////////////////////////////////////////
       	//find Place
		const request = {
		    query: name,
		    fields: ["name","geometry","place_id","icon"],
		};
		service.textSearch(request,(results,status) =>{
			if (status === google.maps.places.PlacesServiceStatus.OK && results) {
				results.forEach((result)  => {
					if (!result.geometry || !result.geometry.location) return;
					
					const icon = {
						url: result.icon,
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
				service.getDetails({placeId: results[0].place_id, fields: ['name','photos','geometry','rating','reviews','adr_address','business_status','types','website','international_phone_number','reviews']},(main_results, status) => {
					$('.map_img_img').attr('src',main_results.photos[0].getUrl());
					$('.content_title').html(main_results.name);
					$('.content_bottom').children().eq(0).html(main_results.adr_address);
					$('.content_bottom').children().eq(1).html('국제 전화번호 : ' + main_results.international_phone_number);
					$('.content_img_img').attr('src',main_results.photos[1].getUrl());
					$('.content_img_img2').attr('src',main_results.photos[2].getUrl());
				});
				center = results[0].geometry.location; 
			    map.setCenter(center);
				cityCircle.setCenter(results[0].geometry.location);    
			   //
			   	let getNextPage;
		 		const moreButton = document.getElementById("more");
		 	
		 		moreButton.onclick = function () {
		 			moreButton.disabled = true;

		 	    	if (getNextPage) {
		 	    		$("#places").html("");
		 	    		getNextPage();
		 	    	}//if exists?
		 		};
		 		
		 		// Perform a nearby search.
		 		service.nearbySearch( { location: center, radius: 290, rankby: 'distance' , type: category }, (results, status, pagination) => {
		 			markers.forEach((marker) => {
		        		marker.setMap(null);
		        	});
		        	markers = [];
		 			for(let i=0; i<results.length; i++){
		 				setTimeout(() => {
			 				service.getDetails({placeId: results[i].place_id,fields: ['name','photos','geometry','rating','reviews','adr_address','business_status','types','website','international_phone_number','reviews']},(detail_results, status) => {
		 						let place_list_str = '';
			 					const image = {
									url: results[i].icon,
									size: new google.maps.Size(71, 71),
									origin: new google.maps.Point(0, 0),
									anchor: new google.maps.Point(17, 34),
									scaledSize: new google.maps.Size(25, 25),
								};
							
								markers.push(
									new google.maps.Marker({
										map : map,
						               	icon : image,
						               	title: results[i].name,
						               	position: results[i].geometry.location,
					             	})
								);
			 					
			 					place_list_str += '<li class="sidebar_li"><div class="map_img"><img alt="미리보기" class="map_img_img" src="';
			 					
			 					if(detail_results.photos != null && detail_results.photos[0] != null){
									place_list_str += detail_results.photos[0].getUrl();//image url
								} else {
									let temp = Math.floor(Math.random() * 8) + 1;
									place_list_str += "/resources/images/Festival"+ temp +".jpg";
								}
								
								place_list_str += '"></div><div class="content_review"><div class="content_header"><h2 class="content_title">';
								place_list_str += detail_results.name; //place name
								place_list_str += '</h2></div><hr><div class="content_detail"><div class="content_detail_header"><div class="content_detail_star"><span><svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 20px; width: 20px; fill: currentcolor; color: #FF385C !important;"><path d="M15.094 1.579l-4.124 8.885-9.86 1.27a1 1 0 0 0-.542 1.736l7.293 6.565-1.965 9.852a1 1 0 0 0 1.483 1.061L16 25.951l8.625 4.997a1 1 0 0 0 1.482-1.06l-1.965-9.853 7.293-6.565a1 1 0 0 0-.541-1.735l-9.86-1.271-4.127-8.885a1 1 0 0 0-1.814 0z" fill-rule="evenodd"></path></svg></span><span>';
								
								
								replyService.getList({place_id:results[i].place_id, page: page||1}, function(map){
									let avgStar = map['avgStar'];
									place_list_str += avgStar;
								},function(er){//error
									if(detail_results.rating == 'undefined'){
										place_list_str += '1.0';
									} else {
										place_list_str += detail_results.rating; //평균 별점
									}
								}); 
								
								
								place_list_str += '1.0';
								place_list_str += '</span><span style="color: rgb(113, 113, 113) !important;">(후기';
								
								
								replyService.getList({place_id:results[i].place_id, page: page||1}, function(map){
									place_list_str += map['ReplyCnt'] || 5
								}); 
								
								
								place_list_str += '개)</span></div><div class="content_bottom"><div class="content_bottom_address">';
								place_list_str += detail_results.adr_address; //주소
								place_list_str += '</div><span>';
								
								if(detail_results.international_phone_number == null){
									place_list_str += '국제 전화번호 : 존재하지 않습니다.';
								}else{
									place_list_str += '국제 전화번호 : ';
									place_list_str += detail_results.international_phone_number;
								}
								
								place_list_str += '</span></div></div><div class="content_img"><img alt="여분 사진 미리보기" class="content_img_img" src="';
								
								if(detail_results.photos != null && detail_results.photos[1] != null){
									place_list_str += detail_results.photos[1].getUrl();//image url
								} else {
									let temp = Math.floor(Math.random() * 8) + 1;
									place_list_str += "/resources/images/Festival"+ temp +".jpg";
								}
								
								place_list_str += '"><img alt="여분 사진 미리보기" class="content_img_img2" src="';
								
								if(detail_results.photos != null && detail_results.photos[2] != null){
									place_list_str += detail_results.photos[2].getUrl();//image url
								} else {
									let temp = Math.floor(Math.random() * 8) + 1;
									place_list_str += "/resources/images/Festival"+ temp +".jpg";
								}
								
								place_list_str += '"></div></div></div></li>';
		 						$("#places").append(place_list_str);
			 			});
			 		 }, i * 400);
		 		}
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
	           	nearbySearch(map, service,place.geometry.location, category);
			});
			
	    	map.fitBounds(bounds);
	    	map.setCenter(center);
	    	cityCircle.setCenter(center); 
		});//searchbox -> place changed

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		 $(".dropdown-item").click(function(){
	    	emptyList();
	    	switch(this.value) {
			  case '여행지':
				  category = travel;
				  mapID = 'a4c6e0373ad662f7';
			  	break;
			  case '숙소':
				  category = accommodation;
				  mapID = '34393134cd5b68b8';
			  	break;
			  case '맛집':
				  category = restaurant;
				  mapID = 'b41de41db9489cf6';
			  	break;
			  case '볼거리':
				  category = spot;
				  mapID = 'a4c6e0373ad662f7';
			  	break;
			  case '이동수단':
				  category = traffic;
				  mapID = '53e516a24415efd6';
			  	break;
			  default:
				  category = travel+accommodation+restaurant+spot+traffic;
			  	  mapID = '';
			  	break;
					}
			map = new google.maps.Map(document.getElementById("map"), {
	       		center : center,
				zoom : 18,
				mapTypeId:"roadmap",
				mapId: mapID,
				mapTypeControl: false,
				streetViewControl: false,
				fullscreenControl: false,
				restriction: {
				    latLngBounds: JAPAN_BOUNDS,
					strictBounds: false
				}
	       	});
	       	cityCircle.setCenter(center);
			nearbySearch(map, service,center, category);
	    });
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		 
		 map.addListener('dragend',function(){
			 center = map.getCenter();
			 cityCircle.setCenter(center);
			 emptyList();
			  // Clear out the old markers.
		        markers.forEach((marker) => {
		        	marker.setMap(null);
		        });
		        markers = [];
			 nearbySearch(map, service,center, category);
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
		 	service.nearbySearch( { location: location, radius: 290, type: type }, (results, status, pagination) => {
		 		for(let i=0; i<results.length; i++){
	 				setTimeout(() => {
		 				service.getDetails({placeId: results[i].place_id,fields: ['name','photos','geometry','rating','reviews','adr_address','business_status','types','website','international_phone_number','reviews']},(detail_results, status) => {
	 						let place_list_str = '';
		 					const image = {
					            url: results[i].icon,
					            size: new google.maps.Size(71, 71),
					            origin: new google.maps.Point(0, 0),
					            anchor: new google.maps.Point(17, 34),
					            scaledSize: new google.maps.Size(25, 25),
							};
						
							markers.push(
								new google.maps.Marker({
					               	map : map,
					               	icon : image,
					               	title: results[i].name,
					               	position: results[i].geometry.location,
				             	})
							);
		 					
		 					place_list_str += '<li class="sidebar_li"><div class="map_img"><img alt="미리보기" class="map_img_img" src="';
			 					
			 					if(detail_results.photos != null && detail_results.photos[0] != null){
									place_list_str += detail_results.photos[0].getUrl();//image url
								} else {
									let temp = Math.floor(Math.random() * 8) + 1;
									place_list_str += "/resources/images/Festival"+ temp +".jpg";
								}
								
								place_list_str += '"></div><div class="content_review"><div class="content_header"><h2 class="content_title">';
								place_list_str += detail_results.name; //place name
								place_list_str += '</h2></div><hr><div class="content_detail"><div class="content_detail_header"><div class="content_detail_star"><span><svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 20px; width: 20px; fill: currentcolor; color: #FF385C !important;"><path d="M15.094 1.579l-4.124 8.885-9.86 1.27a1 1 0 0 0-.542 1.736l7.293 6.565-1.965 9.852a1 1 0 0 0 1.483 1.061L16 25.951l8.625 4.997a1 1 0 0 0 1.482-1.06l-1.965-9.853 7.293-6.565a1 1 0 0 0-.541-1.735l-9.86-1.271-4.127-8.885a1 1 0 0 0-1.814 0z" fill-rule="evenodd"></path></svg></span><span>';
								
								
								replyService.getList({place_id:results[i].place_id, page: page||1}, function(map){
									let avgStar = map['avgStar'];
									place_list_str += avgStar;
								},function(er){//error
									if(detail_results.rating == 'undefined'){
										place_list_str += '1.0';
									} else {
										place_list_str += detail_results.rating; //평균 별점
									}
								}); 
								
								
								place_list_str += '1.0';
								place_list_str += '</span><span style="color: rgb(113, 113, 113) !important;">(후기';
								
								
								replyService.getList({place_id:results[i].place_id, page: page||1}, function(map){
									place_list_str += map['ReplyCnt'] || 5
								}); 
								
								
								place_list_str += '개)</span></div><div class="content_bottom"><div class="content_bottom_address">';
								place_list_str += detail_results.adr_address; //주소
								place_list_str += '</div><span>';
								
								if(detail_results.international_phone_number == null){
									place_list_str += '국제 전화번호 : 존재하지 않습니다.';
								}else{
									place_list_str += '국제 전화번호 : ';
									place_list_str += detail_results.international_phone_number;
								}
								
								place_list_str += '</span></div></div><div class="content_img"><img alt="여분 사진 미리보기" class="content_img_img" src="';
								
								if(detail_results.photos != null && detail_results.photos[1] != null){
									place_list_str += detail_results.photos[1].getUrl();//image url
								} else {
									let temp = Math.floor(Math.random() * 8) + 1;
									place_list_str += "/resources/images/Festival"+ temp +".jpg";
								}
								
								place_list_str += '"><img alt="여분 사진 미리보기" class="content_img_img2" src="';
								
								if(detail_results.photos != null && detail_results.photos[2] != null){
									place_list_str += detail_results.photos[2].getUrl();//image url
								} else {
									let temp = Math.floor(Math.random() * 8) + 1;
									place_list_str += "/resources/images/Festival"+ temp +".jpg";
								}
								
								place_list_str += '"></div></div></div></li>';
		 						$("#places").append(place_list_str);
		 				});
			 		 }, i * 200);
		 		}
		 		if (status !== "OK" || !results) {return;}
		 		
		 		moreButton.disabled = (!pagination || !pagination.hasNextPage);
		 		
		 	    if (pagination && pagination.hasNextPage) {
		 	       	getNextPage = () => {
		 	        	pagination.nextPage();
		 	       	};
		 	    }
		 	});
		 }
		 
		 
		 function removeMarker(){
		 	for(let i=0; i<markers.length; i++){
		 		markers[i].setMap(null);
		 	}
		 	markers = [];
		}//remove marker

		
		$('#places').on("click","li",function(){
			let query_name = ($(this).find('.content_title').html());
			location.href = '/view?name='+ query_name + '&mapid='+mapID;
		});
			 
		 
		 
	}//initAutocomplete