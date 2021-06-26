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
<!-- <script src="/resources/js/reply/reply.js"></script> -->
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
	key=AIzaSyDUBAs2Aoeh9UJxjarRyXFSvuBDE-BLFVM
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