/**
 *  카테고리 기본값 및 파라미터 설정
 */
 var _showPage = function() {
	  var loader = $("div.loader");
	  var container = $("#container");
	  loader.remove();
	  container.css("display","flex");
};
 
let travel = ['aquarium','museum','zoo','campground'];//여행지
let accommodation = ['lodging']; //숙소
let restaurant = ['bar','cafe','restaurant'];//맛집
let spot = ['tourist_attraction']; //볼거리
let traffic = ['airport','subway_station','train_station','taxi_stand','bus_station']; //교통
let all = travel + accommodation + restaurant + spot + traffic;
let selectCategory = [];

let placesList = $('#places');//list 시작 부분