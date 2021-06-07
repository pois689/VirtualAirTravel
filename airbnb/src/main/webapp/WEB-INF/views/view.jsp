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
								<span class="margins" aria-hidden="true"></span>
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
					<!-- 사진  -->
					<div class="item1">
						<img class="img" aria-hidden="true" alt="" id="FMP-target"
							src="https://a0.muscache.com/im/pictures/miso/Hosting-43261595/original/509bdd17-0b32-4f4a-8449-cfe8012162cf.jpeg?im_w=720">
					</div>
				</div>
				
			</div>
		</section>
		
		<hr>
		
		<!-- 상세 정보 -->
		<section>
			<div class="section_start">
				<span class="section_detail" id="type">쏼라쏼라 매장 정보 제공부분 가져오기(테이크아웃 or 매장내 식사가능 등)</span>
				<span class="section_detail" id="phone">쏼라쏼라 매장 정보 제공부분 가져오기(테이크아웃 or 매장내 식사가능 등)</span>
				<div class="section_detail_information">
					<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; width: 22px; fill: currentcolor;"><path d="M16 1C7.716 1 1 7.716 1 16s6.716 15 15 15 15-6.716 15-15S24.284 1 16 1zm7.895 22.954l-9.526-5.5a1.5 1.5 0 0 1-.743-1.154l-.007-.145v-11h3V16.29l8.776 5.067-1.5 2.598z"></path></svg>
					<div class="business_status">영업 여부</div>
					<span class="margins" aria-hidden="true"></span>
					<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; width: 24px; margin-left: 6px; fill: currentcolor;"><path d="M17.954 2.781l.175.164 13.072 12.842-1.402 1.426-1.8-1.768L28 29a2 2 0 0 1-1.85 1.994L26 31H6a2 2 0 0 1-1.995-1.85L4 29V15.446l-1.8 1.767-1.4-1.426L13.856 2.958a3 3 0 0 1 4.097-.177zm-2.586 1.503l-.096.088L6 13.48 6 29l5-.001V19a2 2 0 0 1 1.85-1.995L13 17h6a2 2 0 0 1 1.995 1.85L21 19v9.999h5V13.48l-9.3-9.135a1.001 1.001 0 0 0-1.332-.06zM19 19h-6v9.999h6z"></path></svg>
					<div id="adr"></div>
				</div>
			</div>

		</section>
		
		<hr>
		
		<!-- 댓글  -->
		<section>
			<div class="section_start">
				<h2 class="review">
					<span>
						<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 20px; width: 20px; fill: currentcolor; color: #FF385C !important;"><path d="M15.094 1.579l-4.124 8.885-9.86 1.27a1 1 0 0 0-.542 1.736l7.293 6.565-1.965 9.852a1 1 0 0 0 1.483 1.061L16 25.951l8.625 4.997a1 1 0 0 0 1.482-1.06l-1.965-9.853 7.293-6.565a1 1 0 0 0-.541-1.735l-9.86-1.271-4.127-8.885a1 1 0 0 0-1.814 0z" fill-rule="evenodd"></path></svg>
					</span>
					<span>4.5</span>
					<span>(후기 20개)</span>
				</h2>
				
				<div class="review_start">
					<div class="review_frame">
						<div class="review_box">
							<div class="review_header">
								<div class="review_id">ID
									<div class="review_date">2021년 6월 2일</div>
								</div>
							</div>
							
							<div class="review_text">
								<span>너무 좋앗어용</span>
							</div>
						</div>
					</div>
					
					<div class="review_frame">
						<div class="review_box">
							<div class="review_header">
								<div class="review_id">ID2
									<div class="review_date">2021년 6월 2일</div>
								</div>
							</div>
							
							<div class="review_text">
								<span>너무 좋앗어용너무 좋앗어용너무 좋앗어용너무 좋앗어용너무 좋앗어용너무 좋앗어용</span>
							</div>
						</div>
					</div>
					<div class="review_frame">
						<div class="review_box">
							<div class="review_header">
								<div class="review_id">ID2
									<div class="review_date">2021년 6월 2일</div>
								</div>
							</div>
							
							<div class="review_text">
								<span>너무 좋앗어용너무 좋앗어용너무 좋앗어용너무 좋앗어용너무 좋앗어용너무 좋앗어용</span>
							</div>
						</div>
					</div>
					<div class="review_frame">
						<div class="review_box">
							<div class="review_header">
								<div class="review_id">ID2
									<div class="review_date">2021년 6월 2일</div>
								</div>
							</div>
							
							<div class="review_text">
								<span>너무 좋앗어용너무 좋앗어용너무 좋앗어용너무 좋앗어용너무 좋앗어용너무 좋앗어용</span>
							</div>
						</div>
					</div>
					<div class="review_frame">
						<div class="review_box">
							<div class="review_header">
								<div class="review_id">ID2
									<div class="review_date">2021년 6월 2일</div>
								</div>
							</div>
							
							<div class="review_text">
								<span>너무 좋앗어용너무 좋앗어용너무 좋앗어용너무 좋앗어용너무 좋앗어용너무 좋앗어용</span>
							</div>
						</div>
					</div>
					<div class="review_frame">
						<div class="review_box">
							<div class="review_header">
								<div class="review_id">ID2
									<div class="review_date">2021년 6월 2일</div>
								</div>
							</div>
							
							<div class="review_text">
								<span>너무 좋앗어용너무 좋앗어용너무 좋앗어용너무 좋앗어용너무 좋앗어용너무 좋앗어용</span>
							</div>
						</div>
					</div>
					<div class="review_frame">
						<div class="review_box">
							<div class="review_header">
								<div class="review_id">ID2
									<div class="review_date">2021년 6월 2일</div>
								</div>
							</div>
							
							<div class="review_text">
								<span>너무 좋앗어용너무 좋앗어용너무 좋앗어용너무 좋앗어용너무 좋앗어용너무 좋앗어용</span>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 여기에 리플 붙이기 -->
				<input type="hidden" name="place_id" id="place_id" value="dasdf"><br>
				<input type="hidden" id="rno"><br>
				
				
				
		</div>
		</section>
		
		<hr>
		<!-- 맵 부분 -->
		<h2 class="review" style="margin-left: 300px !important; margin-right: 300px !important; margin: 50px 0px;">위치</h2>
		<div class="map_frame">
			<div id="map" class="map"></div>
		</div>
	</main>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script async
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD9Ipehrpor4GUgqPUAUI7sXldNenx5suo&region=JP&language=ko&libraries=places&callback=initMap">
</script>
<script type="text/javascript" src="/resources/css/reply/reply.js"></script>
<script>
let map;
let service;
let infowindow;
let temp_place_id;
let service_review;
let value_place = '';

function initMap() {
	let sydney = new google.maps.LatLng(-33.867, 151.195);

	map = new google.maps.Map(
	    document.getElementById('map'), {center: sydney, zoom: 15, disableDefaultUI: true});

	let request = {
		query: '<c:out value="${name}"></c:out>',
    	fields: ['place_id'],
	};

	let service = new google.maps.places.PlacesService(map);
  
  	service.findPlaceFromQuery(request, function(results, status) {
    	if (status === google.maps.places.PlacesServiceStatus.OK) {
    		request = {
    			placeId: results[0].place_id,
    			fields: ['name','photos','geometry','rating','reviews','adr_address','business_status','types','website','international_phone_number','reviews']
    		}
    		
    		console.log(results[0].place_id);
			
    		//place id 넣기
    		
    		value_place += results[0].place_id;
    		
    		$('#place_id').val(value_place);
    		
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
	    				/* console.log(detail_results);
	    				console.log(detail_results.photos);
	    				console.log(detail_results.photos[0].getUrl());
	    				console.log(detail_results.adr_address);
	    				console.log(detail_results.business_status);
	    				console.log(detail_results.types);
	    				console.log(detail_results.website);
	    				console.log(detail_results.international_phone_number);
	    				console.log("review",detail_results.reviews[2]);
	    				console.log(detail_results.geometry.location);
	    				
	    				console.log(new Date(detail_results.reviews[2].time*1000));
	    				
	    				console.log(detail_results.reviews[0].author_name);
	    				console.log(detail_results.reviews[0].rating);
	    				console.log(detail_results.reviews[0].text);
	    				console.log(new Date(detail_results.reviews[0].time*1000)); */

	    				
	    				// 주소 바꾸기.
	    				let adr='';
	    				adr += detail_results.adr_address;
	    				$('.title_information_first_address').html(adr);
	    				
	    				// 제목 바꾸기.
	    				let title='';

						title += '<h1>';

						title += detail_results.name;
						title += '</h1>';
						$('.section_main_title').html(title);
						
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
						

						// 장소의 공식 홈페이지 가 있을경우 홈페이지 주소 불러오기
						let web = '';
						if(detail_results.website !=null){
							web += '<a href=';
							web += detail_results.website;
							web += ' target="_blank">';
							web += detail_results.name;
							web += '</a>';
							$('#adr').html(web);
						}else{
							$('#adr').html('홈페이지가 존재하지 않습니다.');
						}
						
						// 검색한 장소의 유형 (갤러리, 관광장소 등등)
						for(let i = 0; i<3; i++){
							let type = '';
							type += detail_results.types[i];
							type += '&nbsp;&nbsp;';
							if(i == 0)
								$('#type').html(type);
							else
								$('#type').after(type);
						}
						
						// 국제 전화번호
						let phone = '';
						//let p = document.createElement("p");
						//p.append('국제 전화 번호 : ' + );
						phone += '<p>국제 전화번호 : ';
						phone += detail_results.international_phone_number;
						phone += '</p>'
						$('#phone').html(phone);
						
						
						// 리뷰 가져오기 만들어야함.
						/* for(let i = 0; i < 5; i++){
							console.log(detail_results.reviews[0].rating);
							let rev = '';	//review
							let star = '';	//star
							
							for(let j=0; j < detail_results.reviews[i].rating * 1; j++){
								star += '★';
							} for (let k=0; k<5-detail_results.reviews[i].rating*1; k++){
								star += '☆';
							}//star for
							
							rev += '<p> 작성자 : ' + detail_results.reviews[i].author_name + '</p>';
							rev += '<p> 평점 : ' + star + '</p>';
							rev += '<p> 내용 : ' + detail_results.reviews[i].text + '</p>';
							rev += '<p> 작성시간 : ' + new Date(detail_results.reviews[i].time*1000) + '</p>';
							if(i == 0)
								$('.review').html(rev);
							else
								$('.review').after(rev);
						} */

						
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

/* $(document).ready(function(){
	console.log(replyService);
}); */
window.onload = function(){
	console.log("=======================");
	console.log("JS TEST");
	
	console.log("place_id value : ",value_place);
	/* 리플 추가 테스트
	replyService.add(
		{content:"JS Test", name:"tester", place_id:pce},
			function(result){
				alert("RESULT : "+ result)
		}
	); */
	
	/* 리플 리스트 불러오기 테스트
	replyService.getList({place_id:value_place, page:1}, function(list){
		for(var i=0, len=list.length||0; i<len; i++){
			console.log(list[i]);
		}
	}); */
	
	/* 리플 삭제 테스트 
	replyService.remove(15,
			
	function(count){
		console.log(count);
		
		if(count == "success"){
			alert("REMOVED");
		}
	}, 
	
	function(err){
		alert('ERROR');
	});*/
	
	/* 리플 수정 테스트 */
	replyService.update({
		rno:5,
		place_id: "서울",
		content:"modify reply test",
	}, function(result){
		alert("수정완료");
	});
};
</script>
</html>
