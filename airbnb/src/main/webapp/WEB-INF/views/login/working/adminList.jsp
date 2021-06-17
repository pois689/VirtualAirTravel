<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
<script src="/resources/js/jquery-3.4.1.js"></script>
<script src="/resources/js/angular.min.js"></script>
<script src="/resources/js/ljk_bdApp.js"></script>
<script src="/resources/js/ljk_bdController.js"></script>
</head>
<body> <!-- bdapp : 앱구현  -->
	<div ng-app="ljk_bdApp" ng-controller="ljk_bdController" 
		ng-init="initBoardList();"> <!-- Initialize 초기화 -->
		<form ng-submit="addBoard()"> <!-- ng-submit ng-컨트롤러로 폼을보냄 -->
			아이디: <input type="text" ng-model="boardForm.id"> 
				<br /> 
			비번 : <input type="text" ng-model="boardForm.pwd"> 
				<br /> 
			이름 : <input type="text" ng-model="boardForm.name"> 
				<br />
			이메일 : <input type="text" ng-model="boardForm.email"> 
				<br />
			전화번호 : <input type="text" ng-model="boardForm.tel"> 
				<br />
			<button type="submit">추가</button>
		</form>
		<table border="1">
			<tr>
                <td style="width : 50px">UNo.</td>
                <td style="width: 200px">id</td>
                <td style="width: 200px">이름</td>
                <td style="width: 80px">이메일</td>
                <td style="width : 200px">전화번호</td>
				<td style="width: 50px">사용여부</td>
				<td style="width: 50px">우편번호</td>
				<td style="width: 50px">주소</td>
				<td style="width: 50px">상세주소</td>
			</tr>
			<tr ng-repeat="item in boardList"> <!-- ng-repeat 반복문  -->
				<td style="width: 50px">{{item.uno}}</td>
				<td style="width : 200px">{{item.id}}</td>
                <td style="width : 50px">{{item.name}}</td>
                <td style="width : 50px">{{item.email}}</td>
                <td style="width : 200px">{{item.tel}}</td>
                <td style="width : 50px">{{item.enabled}}</td>
                <td style="width : 50px">{{item.jip}}</td>
                <td style="width : 50px">{{item.address}}</td>
                <td style="width : 50px">{{item.dtaddress}}</td>
				<td style="width: 50px">
					<button type="button" ng-click="detailBoardView(item.uno)">
						상세보기</button>
				</td>
				<td style="width: 50px">
					<button type="button" ng-click="removeBoard(item)">삭제</button> <!-- ng-click 클릭  -->
				</td>
			</tr>
		</table>

		<table border="1" ng-show="isBtnClick" ng-model="detail">
                <tr>
                    <td style="width : 50px">UNo</td>
                    <td style="width : 400px"><input data-ng-model="detail.uno" readonly></td>
                </tr>
                <tr>
                    <td style="width : 50px">아이디</td>
                    <td style="width : 400px"><input data-ng-model="detail.id"></td>
                </tr>
                <tr>
                    <td style="width : 50px">이름</td>
                    <td style="width : 400px"><input data-ng-model="detail.name"></td>
                </tr>
                <tr>
                    <td style="width : 50px">이메일</td>
                    <td style="width : 400px"><input data-ng-model="detail.email"></td>
                </tr>
                <tr>
                    <td style="width : 50px">전화번호</td>
                    <td style="width : 400px"><input data-ng-model="detail.tel"></td>
                </tr>
                <tr>
                    <td style="width : 50px">사용여부</td>
                    <td style="width : 400px">
                    <!-- <input data-ng-model="detail.enabled"></td> -->
                    <input type="radio" id="1" name="enabled" value="1" data-ng-model="detail.enabled">
                    <label for="1">1</label>
                    <input type="radio" id="0" name="enabled" value="0" data-ng-model="detail.enabled">
                    <label for="0">0</label>
                    </td>
                </tr>
                <tr>
                    <td style="width : 50px">우편번호</td>
                    <td style="width : 400px"><input data-ng-model="detail.jip"></td>
                </tr>
                <tr>
                    <td style="width : 50px">주소</td>
                    <td style="width : 400px"><input data-ng-model="detail.address"></td>
                </tr>
                <tr>
                    <td style="width : 50px">상세주소</td>
                    <td style="width : 400px"><input data-ng-model="detail.dtaddress"></td>
                </tr>
         </table>
         <button type="button" data-ng-click="updateBoard(detail.uno);">수정하기</button>
	</div>
</body>
</html>