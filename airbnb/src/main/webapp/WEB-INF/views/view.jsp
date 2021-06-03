<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>상세 페이지</title>
<style type="text/css">
.flex_container {
	display: flex;
	flex-direction: row;
	align-items: center;
}
.flex {
	display: flex;
	flex-direction: row;
	align-items: center;
}

.item {
	text-align: center;
	display: table;
	width: 200px;
	height: 400px;
}

.pic {
	display: table-cell;
	vertical-align: middle;
	flex-direction: column;
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	width: 200px;
	height: 200px;
}

.img {
	max-width: 200px;
	max-height: 200px;
}

#map {
	width: 400px;
	height: 350px;
}

#detail {
	width: 400px;
	height: 350px;
}
</style>
</head>
<body>
	<div>
		<div class="_1gw6tte">
			<div style="-gp-section-max-width: 1128px;">
				<div class="_le6wlg">
					<div class="_4i7tcd"
						style="max-width: var(- -gp-section-max-width, 1128px);">
						<div data-plugin-in-point-id="TITLE_DEFAULT"
							data-section-id="TITLE_DEFAULT" style="padding-top: 24px;">
							<section>
								<div id="title">
									<span class="_9cqu50">
										<h1 tabindex="-1" class="_fecoyn4">{Cloud 9./1호}
											정면바다뷰/연박할인多/일출/도보1분/깔끔/넷플릭스/오픈베란다</h1>
									</span>
								</div>
								<!-- 게시글 제목 -->
								<div class="_1qdp1ym">
									<div id="adr">
										<span class="_ngrlha"> <span class="_169len4r">
												Yeongok-myeon, Gangneung, 강원도, 한국</span>
										</span>
										<!-- 주소 표시 -->
									</div>
								</div>
							</section>
						</div>
						<!-- div data-plugin-in-point-id="TITLE_DEFAULT" -->
					</div>
				</div>
			</div>
		</div>
		<div class="flex_container">
			<!-- 사진 전체 div -->
			<div class="item1">
				<img class="img" aria-hidden="true" alt="" id="FMP-target"
					src="https://a0.muscache.com/im/pictures/miso/Hosting-43261595/original/509bdd17-0b32-4f4a-8449-cfe8012162cf.jpeg?im_w=720"
					style="object-fit: cover; vertical-align: bottom;">
			</div>
			<!-- <div class="item2">
				3,4번 사진
				<img class="img" aria-hidden="true" alt=""
					src="https://a0.muscache.com/im/pictures/7462044d-110c-4916-853c-a7f746d3e7d7.jpg?im_w=720"
					data-original-uri="https://a0.muscache.com/pictures/7462044d-110c-4916-853c-a7f746d3e7d7.jpg"
					style="object-fit: cover; vertical-align: bottom;">
			</div>
			<div class="item3">
				5,6 번 사진
				<img class="img" aria-hidden="true" alt=""
					src="https://a0.muscache.com/im/pictures/miso/Hosting-43261595/original/2733e046-ef2f-4275-ba46-9d28d105698d.jpeg?im_w=720"
					data-original-uri="https://a0.muscache.com/pictures/miso/Hosting-43261595/original/2733e046-ef2f-4275-ba46-9d28d105698d.jpeg"
					style="object-fit: cover; vertical-align: bottom;">
			</div> -->
		</div>
	</div>

	<div style="-gp-section-max-width: 1128px;">
		<div data-plugin-in-point-id="OVERVIEW_DEFAULT"
			data-section-id="OVERVIEW_DEFAULT"
			style="padding-top: 20px; padding-bottom: 20px;">
			<div class="business_status"></div>
		</div>
	</div>

	<div class="flex_container">
		<div style="-gp-section-max-width: 1128px;">
			<div class="_npr0qi" style="border-top-color: rgb(221, 221, 221);"></div>
			<div data-plugin-in-point-id="HIGHLIGHTS_DEFAULT"
				data-section-id="HIGHLIGHTS_DEFAULT"
				style="padding-top: 32px; padding-bottom: 32px;">
				<div class="_1vjikx5">
					<div class="_1t2btyf">
						<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"
							aria-hidden="true" role="presentation" focusable="false"
							style="display: block; height: 24px; width: 24px; fill: currentcolor;">
							<path
								d="M17.954 2.781l.175.164 13.072 12.842-1.402 1.426-1.8-1.768L28 29a2 2 0 0 1-1.85 1.994L26 31H6a2 2 0 0 1-1.995-1.85L4 29V15.446l-1.8 1.767-1.4-1.426L13.856 2.958a3 3 0 0 1 4.097-.177zm-2.586 1.503l-.096.088L6 13.48 6 29l5-.001V19a2 2 0 0 1 1.85-1.995L13 17h6a2 2 0 0 1 1.995 1.85L21 19v9.999h5V13.48l-9.3-9.135a1.001 1.001 0 0 0-1.332-.06zM19 19h-6v9.999h6z"></path></svg>
					</div>
					<div class="_1mqc21n">
						<div class="homepage"></div>
						<div class="detail"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- <div data-plugin-in-point-id="DESCRIPTION_DEFAULT"
		data-section-id="DESCRIPTION_DEFAULT"
		style="padding-top: 32px; padding-bottom: 48px;">
		<div>
			<span><div class="_1ojpw5l">
					<div class="_1d784e5">직접 작성한 상세 내용 들어가는 자리</div>
				</div> </span>
		</div>
	</div> -->

	<!-- 댓글 붙여넣을 자리 -->
	<jsp:include page="comment.jsp"/>
	<div id="map"></div>
	<div id="detail"></div>
	<c:out value=""></c:out>
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
    			fields: ['name','photos','geometry','rating','reviews','adr_address','business_status','types','website','international_phone_number','reviews']
    		}
    		
    		console.log(results[0].place_id);
    		
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
	    				map.setCenter(detail_results.geometry.location);
	    				console.log(detail_results);
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
	    				console.log(new Date(detail_results.reviews[0].time*1000));

	    				
	    				// 주소 바꾸기.
	    				let adr='';
	    				adr += detail_results.adr_address;
	    				$('#adr').html(adr);
	    				
	    				// 제목 바꾸기.
	    				let title='';
						title += '<h1>';
						title += detail_results.name;
						title += '</h1>';
						$('#title').html(title);
						
						// 이미지 바꾸기
						for (let i = 0; i < 3; i++) {
			    			let temp = '';
							temp += '<img class="img" aria-hidden="true" alt="" id="FMP-target" src=';
							temp += detail_results.photos[i].getUrl();
							temp += ' style="object-fit: cover; vertical-align: bottom;"/>';
							if(i == 0)
								$('.item1').html(temp);
							/* else if(i == 1)
								$('.item2').html(temp);
							else if(i == 2)
								$('.item3').html(temp); */
							else
								$('.item1').after(temp);
						}

						
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
						web += '<a href=';
						web += detail_results.website;
						web += ' target="_blank">';
						web += detail_results.name;
						web += '</a>';
						$('.homepage').html(web);
						
						// 검색한 장소의 유형 (갤러리, 관광장소 등등)
						for(let i = 0; i<3; i++){
							let type = '';
							type += detail_results.types[i];
							type += '<br>';
							if(i == 0)
								$('.detail').html(type);
							else
								$('.detail').after(type);
						}
						
						// 국제 전화번호
						let phone = '';
						phone += '<p>국제 전화번호 : ';
						phone += detail_results.international_phone_number;
						phone += '</p>'
						$('.homepage').after(phone);
						
						
						// 리뷰 가져오기 만들어야함.
						for(let i = 0; i < 5; i++){
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
						}
						
    			}else {
	    			for (let i = 0; i < detail_results.length; i++) {
	    				console.log("error");
	    				history.go(-1);
	    				}
    				  }
     			}
    	    });
      	/* for (let i = 0; i < results.length; i++) {
    			let temp = '';
    			temp += results[i].name+'<br>';
    			temp += results[i].photos+'<br>';
				let temp_place_id = results[i].place_id;    	
    			console.log(results[i].geometry);
    			console.log(results[i].geometry.viewport);
    			console.log(results[i].photos[0].html_attributions.toString());
        		$('#detail').after(results[i].photos[0].html_attributions.toString());
			} 
      		$('#detail').html(temp);*/
		}
	});

  	
}
</script>
</html>
