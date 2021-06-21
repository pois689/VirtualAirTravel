<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
<link rel="shortcut icon" sizes="76x76" type="image/x-icon"
        href="https://a0.muscache.com/airbnb/static/logotype_favicon-21cc8e6c6a2cca43f061d2dcabdf6e58.ico">
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
         <button type="button" onclick="history.go(-1);">뒤로가기</button>
         <input type="hidden" name="nowPage" value="${paging.nowPage}">
         <input type="hidden" name="cntPerPage" value="${paging.cntPerPage}"> 
<%--          	<div style="display: block; text-align: center;">		
				<c:if test="${paging.startPage != 1 }">
					<a href="/login/working/adminList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
						<button onclick="Ajax()">페이징 어렵다</button>
							<b>${p }</b>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<a href="/login/working/adminList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a href="/login/working/adminList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
				</c:if>
			</div> --%>
							      <!-- /.panel-heading -->
							      <table border="1" class="chat">        
							      
							        <!-- ./ end ul -->
							      </table>
							      <!-- /.panel .chat-panel -->
	</div>
<script>
	
	function Ajax(){
		$.ajax({
			url : "/login/working/adminList/"+ ${paging.nowPage} +'/'+ ${paging.cntPerPage},
			method : 'get',
			dataType : 'json',
			success : function(data){
				console.log(data);
				var htmlContent="";
				if(data.list != null){
					alert("success");
					$.each(data.list,function(index, item){ //item이름으로 정보 뺴오기, map에서 data.list사용
						htmlContent += 
							+ "<tr><td>" + item.uno + "</td></tr>"
							+ "<tr><td>" + item.id + "</td></tr>"
							+ "<tr><td>" + item.name + "</td></tr>"
							+ "<tr><td>" + item.email + "</td></tr>"
							+ "<tr><td>" + item.tel + "</td></tr>"
							+ "<tr><td>" + item.enabled + "</td></tr>"
						$(".chat").html(htmlContent);
					});
				}else{
					alert("입력중 오류가 발생했습니다");
				}
			}
		});
	}
	
</script>
</body>
</html>