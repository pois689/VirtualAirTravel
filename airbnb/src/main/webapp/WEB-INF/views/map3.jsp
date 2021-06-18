<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Places Search Box</title>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<link rel="stylesheet" href="/resources/css/styleindex.css">
<!-- 파비콘 링크  / 없으면 아이콘 안뜸-->
<link rel="shortcut icon" sizes="76x76" type="image/x-icon"
	href="https://a0.muscache.com/airbnb/static/logotype_favicon-21cc8e6c6a2cca43f061d2dcabdf6e58.ico">
<link href="https://unpkg.com/tailwindcss@2.0.2/dist/tailwind.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<style type="text/css">
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */

/* Optional: Makes the sample page fill the window. */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#container {
	display: flex;
	height: 100%;
}

.sidebar {
	flex-basis: 5rem;
	flex-grow: 1;
	padding: 1rem;
	max-width: 30rem;
	height: 100%;
	box-sizing: border-box;
	display: flex;
}

#map {
	flex-basis: 0;
	flex-grow: 3;
	height: 100%;
}

#sidebar {
	display: flex;
	width: 840px;
	flex-direction: column;
}

ul {
	list-style-type: none;
	padding: 0;
	margin: 0;
	overflow-y: scroll;
	flex-grow: 1;
}

li {
	background-color: #f1f1f1;
	padding: 10px;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	font-size: 1.25rem;
	cursor: pointer;
}

li:nth-child(odd) {
	background-color: #fcfcfc;
}

li>img{
	width: 
}

button {
	width: 100%;
	padding: 1rem;
	flex-grow: 0;
	cursor: pointer;
	background: #1a73e8;
	font-size: 1.5rem;
	color: white;
	border: none;
}

button:hover {
	color: #c5d4f0;
}

button:disabled {
	background-color: #9fc1ee;
	color: #c5d4f0;
	cursor: auto;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
<script>
	/* 카테고리 선택 */
	$(document).ready( function() {
	    $(".dropdown-item").click(function(){
	    	var category = this.value;
	    	document.getElementById("category").value = category;
	    });
	
	});

    let travel = ['aquarium','museum','zoo','campground'];//여행지
    /* let fete = [];//행사 */
    let accommodation = ['lodging']; //숙소
    let restaurant = ['bar','cafe','restaurant'];//맛집
    let spot = ['tourist_attraction']; //볼거리
    let traffic = ['airport','subway_station','train_station','taxi_stand','bus_station']; //교통
	let category = '<c:out value="${category}"/>';
    let name = ('<c:out value="${name}"/>'=='')? '도쿄' : '<c:out value="${name}"/>';
    /* let regexp = /^[가-힣]+$/; */
    
	function initAutocomplete() {
		//constant
		const JAPAN_BOUNDS ={
			north : 45.812933,
			south : 29.971335,
	  		west : 128.992627,
			east : 145.963931
   		};
		const JAPAN_MID = new google.maps.LatLng(37.892134,137.478279);
   	  	const TOKYO = new google.maps.LatLng(35.6785,139.7922);
   	  	let center = TOKYO;
   	  	
   	  	//set map
       	let map = new google.maps.Map(document.getElementById("map"), {
       		center : TOKYO,
			zoom : 12,
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
		
       	//find Place
		findPlaceFromQuery(map,service,name);
		
		// Paging process
		nearbySearch(map, service, center, restaurant);
		
		// Create the search box and link it to the UI element.
		const input = document.getElementById("search__button");
		const options = {
	        bounds: JAPAN_BOUNDS,
	        componentRestrictions: { country: "jp" },
	        fields: ["address_components", "geometry", "icon", "name"],
	        origin: TOKYO,
	        strictBounds: false,
	        types: ["establishment"],
		};
		const autocomplete = new google.maps.places.Autocomplete(input, options);
	    const searchBox = new google.maps.places.SearchBox(input);
	    /* map.controls[google.maps.ControlPosition.TOP_LEFT].push(input); */
	    // Bias the SearchBox results towards current map's viewport.
	    map.addListener("bounds_changed", () => {
	    	searchBox.setBounds(map.getBounds());
		});
		let markers = [];
	    // Listen for the event fired when the user selects a prediction and retrieve
	    
	    // more details for that place.
	    searchBox.addListener("places_changed", () => {
	    	const places = searchBox.getPlaces();
	        if (places.length == 0) {
	        	return;
	        }
	        // Clear out the old markers.
	        markers.forEach((marker) => {
	        	marker.setMap(null);
	        });
	        markers = [];
	        // For each place, get the icon, name and location.
	        const bounds = new google.maps.LatLngBounds();
	        places.forEach((place) => {
	        	console.log(place);
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
	           	console.log(place);
	           	center = place.geometry.location;
	           	markers.push(
					new google.maps.Marker({
		               	map,
		               	icon,
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
			});
	    map.fitBounds(bounds);
		});//searchbox -> place changed
	    
	}//initAutocomplete
	
	//html query
	function findPlaceFromQuery(map,service,name){
		const request = {
		    query: name,
		    fields: ["name","geometry"],
		};
		service.findPlaceFromQuery(request,(results,status) =>{
			if (status === google.maps.places.PlacesServiceStatus.OK && results) {
				for (let i = 0; i < results.length; i++) {
					if (!results[i].geometry || !results[i].geometry.location) return;
			        createMarker(results[i]);
			      }
				map.setZoom(15);
				center = results[0].geometry.location; 
			    map.setCenter(results[0].geometry.location);
			}
		});//find place from query
		
	}
	
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
			if (status !== "OK" || !results) {return;}
			
			addPlaces(results, map);
			moreButton.disabled = (!pagination || !pagination.hasNextPage);
			
		    if (pagination && pagination.hasNextPage) {
		       	getNextPage = () => {
					// Note: nextPage will call the same handler function as the initial call
		        	pagination.nextPage();
		       	};
		    }
		});
	}
	
	//create marker
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

	//add place
	function addPlaces(places, map) {
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
				let img = document.createElement('img');
				img.setAttribute("src",place.photos[0].getUrl());
				
				let li = document.createElement('li');
				li.append(img);
				li.append(place.name);
				let placesList = document.getElementById("places");
				placesList.append(li);
				
				
				li.addEventListener("click", () => {
					location.href = '/view?name='+place.name;
				});
			}
		}
	}//add place after click to button
</script>
</head>
<body>
<div id="container">
	<div id="sidebar">
		<div class="header__search">
			<div class="search__button" style="padding-left: 24px; outline: none;"
				role="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
				aria-expanded="false">
				<div style="font-weight: 800">카테고리</div>
				<input class="button__value" id="category" placeholder="미입력" readonly="readonly">
			</div>
			<!-- 카테고리 -->
			<div class="dropdown-menu" aria-labelledby="dropdownMenuButton1"
				style="border-radius: 2.5rem; text-align: center; min-width: 12rem;">
				<button class="dropdown-item" value="여행지">여행지</button>
				<button class="dropdown-item" value="행사">행사</button>
				<button class="dropdown-item" value="숙소">숙소</button>
				<button class="dropdown-item" value="맛집">맛집</button>
				<button class="dropdown-item" value="볼거리">볼거리</button>
				<button class="dropdown-item" value="이동수단">교통</button>
			</div>
	
			<span class="search__span"></span>
			<!-- 검색어 -->
			<input id="search__button" class="controls" type="text" placeholder="Search Box"/>
			<span class="search__span"></span>
		</div>
		<ul id="places"></ul>
		<button id="more">Load more results</button>
	</div>
	<div id="map"></div>
</div>
	<!-- Async script executes immediately and must be after any DOM elements used in callback. -->
	<script
		src="https://maps.googleapis.com/maps/api/js?
		key=AIzaSyD9Ipehrpor4GUgqPUAUI7sXldNenx5suo
		&region=JP
		&language=ko
		&callback=initAutocomplete
		&libraries=places
		&v=weekly"
		async
	></script>
</body>
</html>