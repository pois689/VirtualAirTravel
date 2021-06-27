<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Places Search Box</title>
<link rel="stylesheet" href="/resources/css/map/map.css">
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
								<div class="content_bottom_address">
									<span>주소</span>
								</div>
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
</body>
<script src="/resources/js/reply/reply.js"></script>
<script src="/resources/js/map/mapConstant.js"></script>
<script type="text/javascript">
	let name = "<c:out value='${name}'/>" || "도쿄역";
	let query_category = "<c:out value='${category}'/>" || "";
	document.getElementById("search_category").value = query_category;
	let category = "";
	let mapID = '';
	switch(query_category) {
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
	  	break;
	}
</script>
<script
	src="https://maps.googleapis.com/maps/api/js?
	key=AIzaSyBGO9draDsIXDmO64Q-bGg04FQVfGDrlSw
	&region=JP
	&language=ko
	&callback=initAutocomplete
	&libraries=places
	&v=weekly"
	async
></script>
<script src="/resources/js/map/map.js"></script>
<script src="/resources/js/map/mapFunction.js"></script>
</html>