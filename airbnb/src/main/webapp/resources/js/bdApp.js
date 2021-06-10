'use strict';

var bdApp = angular.module("bdApp", []);

// 팩토리 정의
bdApp.factory("bdService", function($http){
	//앞에거는 불러올것, 뒤에것은 구현할것
	var service = {		
		//게시글 리스트
		selectBoardList : selectBoardListAjax 
		
		//게시글 등록
		,addBoard : addBoardAjax
		
		//게시글 수정
		,updateBoard : updateBoardAjax
		
		//게시글 삭제
		,removeBoard : removeBoardAjax
	};
	
	return service;
	//리스트 ajax,  ajax실행후 성공시(리턴데이터), 에러(석세스/메세지에러)
	function selectBoardListAjax(){
		return $http.post("/board/selectBoardList").then(handleSuccess,handleError);
	}
	//등록 ajax , 페이지,매개변수,데이터타입(기본 context)
	function addBoardAjax(param){
		return $http.post("/board/addBoard", param).then(handleSuccess,handleError);
	}
	//수정 ajax
	function updateBoardAjax(param){
		return $http.post("/board/updateBoard",param).then(handleSuccess,handleError);
	}
	//삭제 ajax
	function removeBoardAjax(param){
		return $http.post("/board/removeBoard",param).then(handleSuccess,handleError);
	}
	
	
	//ag컨트롤러1 -> ag팩토리2 -> 메인컨트롤러(값 반환) -> dao -> 
	
	//////////////////////////////////////////////////////////////////////////
	
	// private functions
	function handleSuccess(res){
		return res.data;
	}
	
	function handleError(error){
		return function(){
			return {success: false, message: error};
		};
	}	
});