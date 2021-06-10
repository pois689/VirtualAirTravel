'use strict';

bdApp.controller('bdController', bdController);

bdController.$inject = ['$rootScope', '$scope', 'bdService'];

//게시글 리스트 보기
//팩토리 패턴,다형성이용
function bdController($rootScope, $scope, bdService){
	$scope.isBtnClick = false;
	
	$scope.initBoardList = function(){
		bdService.selectBoardList().then(function(res){ 
			$scope.boardList = res;
		});
	}
	
	//게시글 등록하기
	//보드 리스트 초기화(동기화,싱글페이지방식의 단점)
	//결과값에 대한 처리
	$scope.addBoard = function(){
		console.log("boardForm :" ,$scope.boardForm);
		
		bdService.addBoard($scope.boardForm).then(function(res){
			
			if(res.result == 'ok'){
				$scope.initBoardList(); 
			}
			else{
				alert("게시글 등록에 실패했습니다.");
			}
		});
	}
	
	//게시글 상세보기
	$scope.detailBoardView = function(uno){
		console.log("1:" ,uno);
		console.log("2:" ,$scope.boardList[0].uno);
		console.log("3:" ,$scope.boardList);
		$scope.isBtnClick = !$scope.isBtnClick;
		
/*		for(var i in $scope.boardList[i].no===no){
			$scope.detail = $scope.boardList[i];
		}*/
		
		for(var i=0; i < $scope.boardList.length; i++){
			if($scope.boardList[i].uno == uno){
				$scope.detail = {
					uno			: $scope.boardList[i].uno
					,id			: $scope.boardList[i].id
					,name		: $scope.boardList[i].name
					,email		: $scope.boardList[i].email
					,tel		: $scope.boardList[i].tel
					,enabled	: $scope.boardList[i].enabled
					,jip		: $scope.boardList[i].jip
					,address	: $scope.boardList[i].address
					,dtaddress	: $scope.boardList[i].dtaddress
				};
			}
		}
	}
	
	//글 수정하기 - 데이터를 가지고 팩토리 서비스로 데이터를 받아서 then 결과값을 받기 
	//팩토리가 요청을 처리하고.then(그후) 결과값받기
	 //보드 리스트 초기화(동기화,싱글페이지방식의 단점)
	$scope.updateBoard = function(uno){
		console.log("$scope.detail:" ,$scope.detail);
		var param = $scope.detail;
		
		bdService.updateBoard(param).then(function(res){
			//결과값에 대한 처리
			if(res.result == 'ok'){
				$scope.initBoardList();
			}
			else{
				alert("게시글 수정에 실패했습니다.");
			}
		});
	}
	
	//게시글 삭제
	//보드 리스트 초기화(동기화,싱글페이지방식의 단점)
	$scope.removeBoard = function(detail){
		var param = detail;
		bdService.removeBoard(param).then(function(res){
			//결과값에 대한 처리
			if(res.result == 'ok'){
				$scope.initBoardList(); 
			}
			else{
				alert("게시글 등록에 실패했습니다.");
			}
		});
	}
	
	
}