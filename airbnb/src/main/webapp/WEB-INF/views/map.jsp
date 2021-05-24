<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>practice</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD9Ipehrpor4GUgqPUAUI7sXldNenx5suo&region=JP&language=ko&map_ids=f6334ff90d430046&callback=initMap"></script>
<style>
#left{margin:0; padding:0;position:absolute; right: 0; width: 2000px; height: 100%;}
#map_ma {margin:0; padding:0; width:100%; height:99.5%; clear:both; border: 1px solid #ccc;}
.clickup-chrome-ext_installed{margin:0 !important;}
</style>
</head>
<body>
<form name="search" >
</form>
<div id="left">
	<div id="map_ma"></div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	var myLatlng = new google.maps.LatLng(37.4773667,126.8930453); // 위치값 위도 경도
	var Y_point			= 35.67924815290527;		// Y 좌표
	var X_point			= 139.76959571709027;		// X 좌표
	var zoomLevel		= 15;				// 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
	var markerTitle		= "도쿄";				// 현재 위치 마커에 마우스를 오버을때 나타나는 정보
	var markerMaxWidth	= 300;				// 마커를 클릭했을때 나타나는 말풍선의 최대 크기

// 말풍선 내용
	var contentString	= '<div><h2>역</h2><p>역</p></div>';
	var myLatlng = new google.maps.LatLng(Y_point, X_point);
	var mapOptions = {
						zoom: zoomLevel,
						center: myLatlng,
						mapTypeId: google.maps.MapTypeId.ROADMAP
					}
	var map = new google.maps.Map(document.getElementById('map_ma'), mapOptions);
	var marker = new google.maps.Marker({
											position: myLatlng,
											map: map,
											title: markerTitle
	});
	var infowindow = new google.maps.InfoWindow(
												{
													content: contentString,
													maxWizzzdth: markerMaxWidth
												}
			);
	google.maps.event.addListener(marker, 'click', function() {
		infowindow.open(map, marker);
	});
});
</script>
</body>
</html>