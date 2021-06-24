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
	href="https://a0.muscache.com/airbnb/static/logotype_favicon-21cc8e6c6a2cca43f061d2dcabdf6e58.ico"
>
<link href="https://unpkg.com/tailwindcss@2.0.2/dist/tailwind.min.css"
	rel="stylesheet"
>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous"
>
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

.header__search {
	flex-grow: 1;
}

.list {
	background-color: #f1f1f1;
	padding: 10px;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	font-size: 1.25rem;
	cursor: pointer;
	width: 100%;
	display: flex;
	flex-direction: row;
}

.list:nth-child(odd) {
	background-color: #fcfcfc;
}

.img {
	border-radius: 20px;
	position: relative;
	height: 100%;
	width: 300px;
}

.img img {
	position: absolute;
	top: 50%;
	margin-top: 15px;
	width: 300px;
	height: 200px;
	border-radius: 20px;
}

.content {
	margin: 16px;
	height: 200px;
}

hr {
	width: 32px;
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"
></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"
></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
	integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
	crossorigin="anonymous"
></script>

</head>
<body>
	<div id="container">
		<div id="sidebar">
			<ul id="places">
				<li class="sidebar_li">
					<div class="map_img">
						<img alt="미리보기" class="map_img_img">
					</div>
					<div class="content_review">
						<div class="content_header">
							<h2 class="content_title">제목</h2>
						</div>
						<hr>
						<div class="content_detail">
							<div class="content_detail_star">
								<span>
									<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 20px; width: 20px; fill: currentcolor; color: #FF385C !important;"><path d="M15.094 1.579l-4.124 8.885-9.86 1.27a1 1 0 0 0-.542 1.736l7.293 6.565-1.965 9.852a1 1 0 0 0 1.483 1.061L16 25.951l8.625 4.997a1 1 0 0 0 1.482-1.06l-1.965-9.853 7.293-6.565a1 1 0 0 0-.541-1.735l-9.86-1.271-4.127-8.885a1 1 0 0 0-1.814 0z" fill-rule="evenodd"></path></svg>
								</span>
								<span>2.0</span>
								<span style="color: rgb(113, 113, 113) !important;">(후기xx개)</span>
							</div>
							<div class="content_bottom">
								<span>주소</span>
								<span>전화번호</span>
							</div>
							<div class="content_img">
								<img alt="여분 사진 미리보기" class="content_img_img">
								<img alt="여분 사진 미리보기" class="content_img_img2">
							</div>
						</div>
					</div>
				</li>
			</ul>
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
<script>
	/* 카테고리 선택 */
	$(document).ready( function() {
	    $(".dropdown-item").click(function(){
	    	var category = this.value;
	    	document.getElementById("category").value = category;
	    });
	    $(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
			 var scrolltop = $(document).scrollTop();
		        console.log(scrolltop);
		        var height = $(document).height();
		        console.log(height);
		        var height_win = $(window).height();
		        console.log(height_win);
			if($(window).scrollTop() >= $(document).height() - $(window).height()){
		    	if (getNextPage) {
					getNextPage();
				}//if exists?
		    } 
			
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
		const input = document.getElementsByClassName("search__button").item(1);
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
	           	nearbySearch(map, service,place.geometry.location, restaurant);
			});
	    map.fitBounds(bounds);
		});//searchbox -> place changed
	    
		map.addListener("center_changed",() => {
			
			markers.forEach((marker) => {
	        	marker.setMap(null);
	        });
	    	markers = [];
	    	
			nearbySearch(map, service, map.getCenter(), restaurant);
			
		});
		
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
			let places=[];
			addPlaces(results, map);
			for(let i=0; i<results.length; i++){
				/* places.push(getDetail(service, results[i].place_id)); */
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
				const HR = document.createElement('hr');
				const BR = document.createElement('br');
				let span = document.createElement('span');
				
				//img
				let img = document.createElement('img');
				img.setAttribute("src",place.photos[0].getUrl());
				
				//본문 div
				 ///img
				let img_div = document.createElement('div');
				img_div.setAttribute("class",'img');
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
				li.setAttribute("class",'list');
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
	}//initAutocomplete
</script>
<script
	src="https://maps.googleapis.com/maps/api/js?
	key=AIzaSyDUBAs2Aoeh9UJxjarRyXFSvuBDE-BLFVM
	&region=JP
	&language=ko
	&callback=initAutocomplete
	&libraries=places
	&v=weekly"
	async
></script>
<script src="/resources/js/map/mapConstant.js"></script>
<script src="/resources/js/map/map.js"></script>
<script src="/resources/js/map/mapFunction.js"></script>
</html>