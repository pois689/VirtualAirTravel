<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link rel="stylesheet" href="/resources/css/detail/detail.css">
<!-- 파비콘 링크  / 없으면 아이콘 안뜸-->
<link rel="shortcut icon" sizes="76x76" type="image/x-icon" href="https://a0.muscache.com/airbnb/static/logotype_favicon-21cc8e6c6a2cca43f061d2dcabdf6e58.ico">
</head>
<body>
	<div class="loader">
	</div>
	
	<main class="izxcuioww" style="display:none;">
	<section>
		<div class="section_start">
			<!-- logo -->
		    <div class="logo">
		    	<a href="/index" style="color: rgb(34, 34, 34);">
                <svg viewBox="0 0 1000 1000" role="presentation" aria-hidden="true" focusable="false"
                    style="height: 1em; width: 1em; fill: currentcolor;">
                    <path
                        d="m499.3 736.7c-51-64-81-120.1-91-168.1-10-39-6-70 11-93 18-27 45-40 80-40s62 13 80 40c17 23 21 54 11 93-11 49-41 105-91 168.1zm362.2 43c-7 47-39 86-83 105-85 37-169.1-22-241.1-102 119.1-149.1 141.1-265.1 90-340.2-30-43-73-64-128.1-64-111 0-172.1 94-148.1 203.1 14 59 51 126.1 110 201.1-37 41-72 70-103 88-24 13-47 21-69 23-101 15-180.1-83-144.1-184.1 5-13 15-37 32-74l1-2c55-120.1 122.1-256.1 199.1-407.2l2-5 22-42c17-31 24-45 51-62 13-8 29-12 47-12 36 0 64 21 76 38 6 9 13 21 22 36l21 41 3 6c77 151.1 144.1 287.1 199.1 407.2l1 1 20 46 12 29c9.2 23.1 11.2 46.1 8.2 70.1zm46-90.1c-7-22-19-48-34-79v-1c-71-151.1-137.1-287.1-200.1-409.2l-4-6c-45-92-77-147.1-170.1-147.1-92 0-131.1 64-171.1 147.1l-3 6c-63 122.1-129.1 258.1-200.1 409.2v2l-21 46c-8 19-12 29-13 32-51 140.1 54 263.1 181.1 263.1 1 0 5 0 10-1h14c66-8 134.1-50 203.1-125.1 69 75 137.1 117.1 203.1 125.1h14c5 1 9 1 10 1 127.1.1 232.1-123 181.1-263.1z">
                    </path>
                </svg>
                </a>
            </div>
			<!-- 제목 부분 -->
			<div class="main_title">
				<div>
					<h1 class="section_main_title"></h1>
					<div class="section_main_title_information">
						<div class="title_information_first">
							<span> <svg viewBox="0 0 32 32"
									xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
									role="presentation" focusable="false"
									style="display: block; height: 14px; width: 14px; fill: currentcolor; color: #FF385C !important;">
									<path
										d="M15.094 1.579l-4.124 8.885-9.86 1.27a1 1 0 0 0-.542 1.736l7.293 6.565-1.965 9.852a1 1 0 0 0 1.483 1.061L16 25.951l8.625 4.997a1 1 0 0 0 1.482-1.06l-1.965-9.853 7.293-6.565a1 1 0 0 0-.541-1.735l-9.86-1.271-4.127-8.885a1 1 0 0 0-1.814 0z"
										fill-rule="evenodd"></path></svg>
							</span>
							<span class="avgStar">4.5</span>
							<span class="reply_cnt"
								style="color: rgb(113, 113, 113) !important;">댓글 갯수</span>
						</div>
						<div class="title_information_first">
							<span class="margins" aria-hidden="true"></span>
						</div>
						<div class="title_information_first">
							<span class="title_information_first_address">주소</span>
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
			<span class="section_detail" id="type">카테고리</span>
			<span class="section_detail" id="phone">번호</span>
			<div class="section_detail_information">
				<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"
					aria-hidden="true" role="presentation" focusable="false"
					style="display: block; width: 22px; fill: currentcolor;">
					<path
						d="M16 1C7.716 1 1 7.716 1 16s6.716 15 15 15 15-6.716 15-15S24.284 1 16 1zm7.895 22.954l-9.526-5.5a1.5 1.5 0 0 1-.743-1.154l-.007-.145v-11h3V16.29l8.776 5.067-1.5 2.598z"></path></svg>
				<div class="business_status">영업 여부</div>
				<span class="margins" aria-hidden="true"></span>
				<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"
					aria-hidden="true" role="presentation" focusable="false"
					style="display: block; width: 24px; margin-left: 6px; fill: currentcolor;">
					<path
						d="M17.954 2.781l.175.164 13.072 12.842-1.402 1.426-1.8-1.768L28 29a2 2 0 0 1-1.85 1.994L26 31H6a2 2 0 0 1-1.995-1.85L4 29V15.446l-1.8 1.767-1.4-1.426L13.856 2.958a3 3 0 0 1 4.097-.177zm-2.586 1.503l-.096.088L6 13.48 6 29l5-.001V19a2 2 0 0 1 1.85-1.995L13 17h6a2 2 0 0 1 1.995 1.85L21 19v9.999h5V13.48l-9.3-9.135a1.001 1.001 0 0 0-1.332-.06zM19 19h-6v9.999h6z"></path></svg>
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
					<span class="avgStar">0</span>
					<span class="reply_cnt">(후기 0개)</span>
					<!-- 로그인 안했으면 댓글 작성 불가 -->
					<c:choose>
	                	<c:when test="${sessionScope.user.id == null }">
	                	</c:when>
	                	<c:otherwise>
	                		<button type="button" class="ml-2 btn btn-primary btn-lg" id='addReplyBtn'>댓글 작성</button>
	                	</c:otherwise>
	                </c:choose>
				</h2>
				
				<div class="review_start">
					<!-- <div class="review_frame">
						<div class="review_box">
							<div class="review_header">
								<img class="review_insert_image" src="/resources/images/profile.png" alt="프로필사진">
								<div class="review_id">ID
									<div class="review_date">2021년 6월 2일</div>
								</div>
							</div>
							
							<div class="review_text">
								<span>너무 좋앗어용</span>
							</div>
						</div>

						<div class="review_text">
							<span>너무 좋앗어용</span>
						</div>
					</div>
				  </div> -->
			    </div>
			<!-- 댓글 더 보기 -->
			<div class="review_more">
				<!-- <button class="review_more_button">댓글 더 보기</button> -->
			</div>
		</section>
		
		<hr>
		<!-- 맵 부분 -->
		<h2 class="map_title">위치</h2>
		<div class="map_frame">
			<div id="map" class="map"></div>
		</div>

	</main>
	
	<!-- Modal -->
	<div style="display:none;" class="izxcuioww modal fade " id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">댓글 작성</h4>
				</div>
				<!-- modal_textArea -->
				<div class="modal-body">
					<!-- star_jquery -->
					<select id="example">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
					<input type="hidden" id="star">
					
					<!-- text -->
					<ul class="list-group list-group-flush">
						<li class="list-group-item">
							<input type="text" class="form-control ml-2" placeholder="${sessionScope.user.id}" id="user" value="${sessionScope.user.id}" readonly>
						</li>
						<li class="list-group-item">
							<textarea class="form-control" id="content" placeholder="content" rows="3" maxlength="2000"></textarea>
						</li>
					</ul>
				</div>
				
				<!-- modal_button -->
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" data-dismiss="modal"
						id="modalModBtn">Modify</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal"
						id="modalRemoveBtn">Remove</button>
					<button type="button" class="btn btn-primary" id="modalRegisterBtn">Save</button>
					<button type="button" class="btn btn-default" id="modalCloseBtn"
						data-dismiss="modal">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</body>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script async
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBGO9draDsIXDmO64Q-bGg04FQVfGDrlSw&region=JP&language=ko&libraries=places&callback=initMap">
</script>
<script type="text/javascript" src="/resources/js/reply/reply.js"></script>
<!-- bar-rating -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/reply/fontawesome-stars.css">
<script type="text/javascript" src="/resources/js/reply/jquery.barrating.min.js"></script>
<script>
var _showPage = function() {
	  var loader = $("div.loader");
	  var container = $("main.izxcuioww");
	  loader.css("display","none");
	  container.css("display","block");
};
let map;
let service;
let infowindow;
let temp_place_id;
let service_review;
let value_place = '';
let google_star='';
let google_review;

function initMap() {
	let sydney = new google.maps.LatLng(-33.867, 151.195);
	
	map = new google.maps.Map(document.getElementById('map'), {
		  center: sydney,
		  zoom: 19,
		  disableDefaultUI: true,
		  mapId: '<c:out value="${mapid}"></c:out>'
	});
	
	let request = {
		query: '<c:out value="${name}"></c:out>',
    	fields: ['place_id'],
	};

	let service = new google.maps.places.PlacesService(map);
  
  	service.textSearch(request, function(results, status) {
    	if (status === google.maps.places.PlacesServiceStatus.OK) {
    		request = {
    			placeId: results[0].place_id,
    			fields: ['name','photos','geometry','rating','reviews','adr_address','business_status','types','website','international_phone_number','reviews']
    		}
    		
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
	  						map: map,
	  						title: detail_results.name,
  						});
    					map.setZoom(15);
	    				map.setCenter(detail_results.geometry.location);
	    				

	    				
	    				// 주소 바꾸기.
	    				let adr='';
	    				adr += detail_results.adr_address;
	    				$('.title_information_first_address').html(adr);
	    				
	    				// 제목 바꾸기.
	    				let title='';
						title += detail_results.name;
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
						else
							$('.business_status').html('관계없음');
						

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
						if(detail_results.types[0] != null){
							let type = '[';
							type += translate(detail_results.types[0]);
							type += ']&nbsp;&nbsp;';
							$('.section_main_title h1').prepend(type);
							$('#type').html(type);
						}
						
						// 국제 전화번호
						let phone = '';
						if(detail_results.international_phone_number == null){
							phone += '<p>국제 전화번호 : 존재하지 않습니다.';
						}else{
							phone += '<p>국제 전화번호 : ';
							phone += detail_results.international_phone_number;
							phone += '</p>'
						}
						$('#phone').html(phone);
						
						google_star=detail_results.rating;
						google_review=detail_results.reviews;
						
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


window.onload = function(){
	
	_showPage();
	var replyUL = $(".review_start");
		
	showList(1);
	
	function showList(page){
		replyService.getList({place_id:value_place, page: page||1}, function(map){
			var str="";
			if(map['List'] == null || map['List'].length==0){
				map.set('List',google_review); 
				console.log(map['List']);
				$(".review_start").html("");
				return;
			}
			for(var i=0, len=map['List'].length||0; i<len; i++){
				str += "<div class='review_frame' data-rno='"+map['List'][i].rno+"'><div class='review_box'><div class='review_header'><img class='review_insert_image' src='/resources/images/profile.png' alt='프로필사진'>";
				str += "<div class='review_id'>"+map['List'][i].name;
				str += '<select class="example_'+ i +'"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option></select>';
				str += "<div class='review_date'>"+map['List'][i].replyDate+"</div></div></div>";
				str += "<div class='review_text'><span data-rno='"+map['List'][i].rno+"'>";
				str += map['List'][i].content+"</span></div></div></div>";
				
			}
			$(".review_start").html(str);
			for(let i=0; i<map['List'].length; i++){
				$('.example_'+i).barrating({
			      theme: 'fontawesome-stars',
			      initialRating: map['List'][i].star,
			      readonly:true
			    });
			}
			var cnt = "후기 "+map['ReplyCnt']+"개";
				
			var avg_star = map['avgStar'];
			$(".avgStar").html(avg_star);
			$(".reply_cnt").html(cnt);
			
			$('.review_frame:gt(9)').hide();
			$('.review_more').html(
				$('<button />').addClass('review_more_button').text('댓글 더 보기').click(function(){
				    var a = this;
				    $('.review_frame:not(:visible):lt(10)').fadeIn(function(){
				     if ($('.review_frame:not(:visible)').length == 0) $(a).remove();   
				    }); return false;
				})
			);
			
		},function(er){
			if(google_review != null || google_review.length != 0){
				map.set('List',google_review); 
				console.log(map['List']);
				$(".avgStar").html(google_star);
				let str='';
				for(var i=0, len=map['List'].length||0; i<len; i++){
					str += "<div class='review_frame'><div class='review_box'><div class='review_header'><img class='review_insert_image' src='/resources/images/profile.png' alt='프로필사진'>";
					str += "<div class='review_id'>"+map['List'][i].author_name;
					str += '<select class="example_'+ i +'"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option></select>';
					str += "<div class='review_date'>"+map['List'][i].relative_time_description+"</div></div></div>";
					str += "<div class='review_text'><span>";
					str += map['List'][i].text+"</span></div></div></div>";
				}
				$(".review_start").html(str);
				//jquery-bar-rating
				for(let i=0; i<map['List'].length; i++){
					$('.example_'+i).barrating({
				      theme: 'fontawesome-stars',
				      initialRating: map['List'][i].rating,
				      readonly:true
				    });
				}
				var cnt = "후기 5개";
				$(".reply_cnt").html(cnt);
			}
		}); // end function
		
	} // end showList
	
	var modal = $(".modal");
	
	var modalModBtn = $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalRegisterBtn = $("#modalRegisterBtn");
	
	$("#addReplyBtn").on("click", function(e){
		$('#example').barrating('set', 1);
		modal.find("input").val("");
		modal.find("button[id !='modalCloseBtn']").hide();
		content:$("#content").val("");
		name:$("#user").val("");
		modalRegisterBtn.show();
		$(".modal").modal("show");
	});
	
	// 새로운 댓글 추가 처리
	modalRegisterBtn.on("click",function(e){
		var reply = {
				content:$("#content").val()
				,name:"${sessionScope.user.id}"
				,place_id:value_place
				,star:$('#star').val()
		};
		replyService.add(reply, function(result){
			console.log(result);
			modal.find("input").val("");
			modal.modal("hide");
			
			showList(1);
		});
	});
	

		// 모달로 상세보기 불러오기 작성자와 session id
		$(".review_start").on("click",".review_frame",function(e){
			var rno = $(this).data("rno");
			
			replyService.get(rno,function(reply){
				$("#content").val(reply.content);
				let name = $("#user").val(reply.name);
				$("#star").val(reply.star);
		 		$('#example').barrating('set', reply.star);
				modal.data("rno",reply.rno);
				
				modal.find("button[id!='modalCloseBtn']").hide();
				modalModBtn.show();
				modalRemoveBtn.show();
				
				if('${sessionScope.user.id}' == reply.name){
					$(".modal").modal("show");
				}
			});
		});
	
	// 댓글 수정
	modalModBtn.on("click", function(e){
		
		var reply = {rno:modal.data("rno"), content:$("#content").val(), star:$("#star").val()};
		
		replyService.update(reply, function(result){
			console.log(result);
			modal.modal("hide");
			showList(1);
		});
	});
	
	// 댓글 삭제
	modalRemoveBtn.on("click", function(e){
		
		var rno = modal.data("rno");
		
		replyService.remove(rno, function(result){
			console.log(result);
			modal.modal("hide");
			showList(1);
		});
	});
	
	$('select').barrating({
	     theme: 'fontawesome-stars'
	   	 , onSelect: function(value, text, event){
	   			$('#star').val(value);
	   		}
	});
};

function translate(str){
	let trans = '';
	switch(str){
		case 'aquarium':
			trans = '여행지';
			break;
		case 'museum' :
			trans = '여행지';
			break;
		case 'zoo' :
			trans = '여행지';
			break;
		case 'campground' :
			trans = '여행지';
			break;
		case 'lodging':
			trans = '숙소';
			break;
		case 'bar':
			trans = '맛집';
			break;
		case 'cafe':
			trans = '맛집';
			break;
		case 'restaurant':
			trans = '맛집';
			break;
		case 'tourist_attraction':
			trans = '볼거리';
			break;
		case 'taxi_stand':
			trans = '교통';
			break;
		case 'train_station':
			trans = '교통';
			break;
		case 'subway_station':
			trans = '교통';
			break;
		case 'bus_station':
			trans = '교통';
			break;
		case 'airport':
			trans = '교통';
			break;
		case 'locality':
			trans = '지역';
			break;
		default :
			trans = '';
	}
	return trans;
}

</script>
</html>
