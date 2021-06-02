<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link rel="stylesheet" href="/resources/css/detail/detail.css">
</head>
<body>
	<main>
		<section>
			<div class="section_start">
				<!-- 제목 부분 -->
				<div class="main_title">
					<div>
						<h1 class="section_main_title">{Cloud 9./1호} 정면바다뷰/연박할인多/일출/도보1분/깔끔/넷플릭스/오픈베란다</h1>
						<div class="section_main_title_information">
							<div class="title_information_first">
								<span>
									<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 14px; width: 14px; fill: currentcolor; color: #FF385C !important;"><path d="M15.094 1.579l-4.124 8.885-9.86 1.27a1 1 0 0 0-.542 1.736l7.293 6.565-1.965 9.852a1 1 0 0 0 1.483 1.061L16 25.951l8.625 4.997a1 1 0 0 0 1.482-1.06l-1.965-9.853 7.293-6.565a1 1 0 0 0-.541-1.735l-9.86-1.271-4.127-8.885a1 1 0 0 0-1.814 0z" fill-rule="evenodd"></path></svg>
								</span>
								<span>4.5</span>
								<span style="color: rgb(113, 113, 113) !important;">(후기xx개)</span>
							</div>
							<div class="title_information_first">
								<span class="margins" aria-hidden="true">·</span>
							</div>
							<div class="title_information_first">
								<span class="title_information_first_address">경기도 광명시 광명7동</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section>
			<div class="section_img">
				<div class="main_img">
					<!-- 사진 전체 div -->
					<div class="item1">
						<img class="img" aria-hidden="true" alt="" id="FMP-target"
							src="https://a0.muscache.com/im/pictures/miso/Hosting-43261595/original/509bdd17-0b32-4f4a-8449-cfe8012162cf.jpeg?im_w=720">
					</div>
				</div>
			</div>
		</section>
		<div class="business_status">매장 정보 제공부분 가져오기(테이크아웃 or 매장내 식사가능 등)</div>
	
		<!-- 댓글 붙여넣을 자리 -->
							
		<div id="map" class="map"></div>
	</main>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script async
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD9Ipehrpor4GUgqPUAUI7sXldNenx5suo&region=JP&language=ko&libraries=places&callback=initMap">
</script>
<script>
let map;
let service;
let infowindow;
let temp_place_id;
let service_review;

function initMap() {
	let sydney = new google.maps.LatLng(-33.867, 151.195);

	map = new google.maps.Map(
	    document.getElementById('map'), {center: sydney, zoom: 15, disableDefaultUI: true});

	let request = {
		query: '<c:out value="${name}"></c:out>'||'Museum of Contemporary Art Australia',
    	fields: ['place_id'],
	};

	let service = new google.maps.places.PlacesService(map);
  
  	service.findPlaceFromQuery(request, function(results, status) {
    	if (status === google.maps.places.PlacesServiceStatus.OK) {
    		request = {
    			placeId: results[0].place_id,
    			fields: ['name','photos','geometry','rating','reviews','adr_address','business_status','types']
    		}
    		service.getDetails(request,function(detail_results, status){
    			let temp = '';
    		 	if (status === google.maps.places.PlacesServiceStatus.OK) {
    				if(detail_results.length == null){
    				//marker
    					new google.maps.Marker({
	   						position: detail_results.geometry.location,
	  						map,
	  						title: detail_results.name,
  						});
    					map.setZoom(18);
	    				map.setCenter(detail_results.geometry.location);
	    				console.log(detail_results);
	    				console.log(detail_results.photos);
	    				console.log(detail_results.photos[0].getUrl());
	    				console.log(detail_results.adr_address);
	    				console.log(detail_results.business_status);
	    				console.log(detail_results.types);
	    				
	    				// 주소 바꾸기.
	    				let adr='';
	    				adr += detail_results.adr_address;
	    				$('#adr').html(adr);
	    				
	    				// 제목 바꾸기.
	    				let title='';
	    				title += '<span class="_9cqu50">';
						title += '<h1 class="_fecoyn4">';
						title += detail_results.name;
						title += '</h1></span>';
						$('#title').html(title);
						
						let temp = '';
						
						// 이미지 바꾸기
						for (let i = 0; i < 3; i++) {
							
							temp += '<img class="img" id="FMP-target" src=';
							temp += detail_results.photos[i].getUrl();
							temp += '"/>';
							
						}
						
						$('.item1').html(temp);

						// 영업중인가 임시휴업인가 폐업인가 상태 표시
						let open = '';
						open = detail_results.business_status;
						if(open == 'OPERATIONAL')
							$('.business_status').html('영업중');
						else if(open == 'CLOSED_TEMPORARILY')
							$('.business_status').html('임시 휴업');
						else if(open == 'CLOSED_TEMPORARILY')
							$('.business_status').html('폐업');
						
						
    			}else {
	    			for (let i = 0; i < detail_results.length; i++) {
	    				console.log("error");
	    				history.go(-1);
	    				}
    				  }
     			}
    	    });
      
		}
	});

  	
}
</script>
</html>
