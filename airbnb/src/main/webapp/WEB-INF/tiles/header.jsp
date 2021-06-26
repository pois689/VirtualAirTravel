<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/resources/css/styleindex.css">
    <!-- 파비콘 링크  / 없으면 아이콘 안뜸-->
    <link rel="shortcut icon" sizes="76x76" type="image/x-icon"
        href="https://a0.muscache.com/airbnb/static/logotype_favicon-21cc8e6c6a2cca43f061d2dcabdf6e58.ico">
	<link href="https://unpkg.com/tailwindcss@2.0.2/dist/tailwind.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>

<body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
<script type="text/javascript">
	/* 이름 및 카테고리 선택 */
	let search_name = '';
	let search_category = '';
	
	$(document).ready( function() {
	
		// 카테고리
	    $(".dropdown-item").click(function(){
	    	search_category = this.value;
	    	document.getElementById("search_category").value = search_category;
	    });
		//검색
	    $('#search_button_dd').on("click",function(e){
			search_name = document.getElementById('search_name');
			location.href='/map?search_name='+search_name.value+'&search_category='+search_category;
	    });
	});
	
</script>
${sessionScope.user }
${sessionScope.snsUser }
${sessionScope.user.userRole.indexOf('ROLE_ADMIN')}
    <header>
    	<nav class=" bg-white w-full flex relative justify-between items-center mx-auto px-8 h-20">
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
		    
		    <!-- 검색 bar -->
		    <div class="header__search">
				<div class="search__button" style="padding-left: 24px; outline: none;" role="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
					<div class="search__category">카테고리</div>
					<input class="button__value" id="search_category" placeholder="미입력" readonly="readonly">
				</div>
				<!-- 카테고리 -->
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton1" style="border-radius: 2rem; text-align: center; min-width: 12rem;">
				    <button class="dropdown-item" value="여행지">여행지</button>
				    <button class="dropdown-item" value="숙소">숙소</button>
				    <button class="dropdown-item" value="맛집">맛집</button>
				    <button class="dropdown-item" value="볼거리">볼거리</button>
				    <button class="dropdown-item" value="이동수단">교통</button>
				</div>
				
			<span class="search__span"></span>
			<!-- 검색어 -->
			<input class="search__button" placeholder="검색" id="search_name">
			<span class="search__span"></span>
			<!-- 검색 아이콘 -->
			<div class="search__submit__button">
				<button id="search_button_dd" class="flex items-center justify-center relative  h-8 w-8 rounded-full" type="submit" style="width: -webkit-fill-available; height: -webkit-fill-available;">
				                        <svg
				                            viewBox="0 0 32 32"
				                            xmlns="http://www.w3.org/2000/svg"
				                            aria-hidden="true"
				                            role="presentation"
				                            focusable="false"
				                            style="
				                                display: block;
				                                fill: none;
				                                height: 20px;
				                                width: 50px;
				                                stroke: currentcolor;
				                                stroke-width: 5.33333;
				                                overflow: visible;">
				                            <g fill="none">
				                                <path
				                                    d="m13 24c6.0751322 0 11-4.9248678 11-11 0-6.07513225-4.9248678-11-11-11-6.07513225 0-11 4.92486775-11 11 0 6.0751322 4.92486775 11 11 11zm8-3 9 9"
				                                ></path>
				                            </g>
				                        </svg>
				 </button>
			 </div>
        	</div>
		    <!-- end search bar -->
		    <!-- login -->
		    <div class="flex-initial" style="margin-right: 30px;">
		      <div class="flex justify-end items-center relative">
		       
		        <div class="flex mr-4 items-center">
		          <div class="block relative">
		            <button type="button" class="inline-block py-2 px-3 hover:bg-gray-200 rounded-full relative ">
		              <div class="flex items-center h-5">
		                <div class="_xpkakx">
		                  <svg viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 16px; width: 16px; fill: currentcolor;"><path d="m8.002.25a7.77 7.77 0 0 1 7.748 7.776 7.75 7.75 0 0 1 -7.521 7.72l-.246.004a7.75 7.75 0 0 1 -7.73-7.513l-.003-.245a7.75 7.75 0 0 1 7.752-7.742zm1.949 8.5h-3.903c.155 2.897 1.176 5.343 1.886 5.493l.068.007c.68-.002 1.72-2.365 1.932-5.23zm4.255 0h-2.752c-.091 1.96-.53 3.783-1.188 5.076a6.257 6.257 0 0 0 3.905-4.829zm-9.661 0h-2.75a6.257 6.257 0 0 0 3.934 5.075c-.615-1.208-1.036-2.875-1.162-4.686l-.022-.39zm1.188-6.576-.115.046a6.257 6.257 0 0 0 -3.823 5.03h2.75c.085-1.83.471-3.54 1.059-4.81zm2.262-.424c-.702.002-1.784 2.512-1.947 5.5h3.904c-.156-2.903-1.178-5.343-1.892-5.494l-.065-.007zm2.28.432.023.05c.643 1.288 1.069 3.084 1.157 5.018h2.748a6.275 6.275 0 0 0 -3.929-5.068z"></path></svg>
		                </div>
		              </div>
		            </button>
		          </div>
		        </div>
		
		        <div class="block">
		            <div class="inline relative">
		            	<!-- 로그인 탭 -->
		                <button type="button" class="inline-flex items-center relative px-2 border rounded-full hover:shadow-lg" id="dropdownRoginButton" data-bs-toggle="dropdown" aria-expanded="false">
		                    <div class="pl-1">
		                        <svg
		                            viewBox="0 0 32 32"
		                            xmlns="http://www.w3.org/2000/svg"
		                            aria-hidden="true"
		                            role="presentation"
		                            focusable="false"
		                            style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible;"
		                        >
		                            <g fill="none" fill-rule="nonzero">
		                                <path d="m2 16h28"></path>
		                                <path d="m2 24h28"></path>
		                                <path d="m2 8h28"></path>
		                            </g>
		                        </svg>
		                    </div>
		
		                    <div class="block flex-grow-0 flex-shrink-0 h-10 w-12 pl-5">
		                        <svg
		                            viewBox="0 0 32 32"
		                            xmlns="http://www.w3.org/2000/svg"
		                            aria-hidden="true"
		                            role="presentation"
		                            focusable="false"
		                            style="display: block; height: 100%; width: 100%; fill: currentcolor;"
		                        >
		                            <path d="m16 .7c-8.437 0-15.3 6.863-15.3 15.3s6.863 15.3 15.3 15.3 15.3-6.863 15.3-15.3-6.863-15.3-15.3-15.3zm0 28c-4.021 0-7.605-1.884-9.933-4.81a12.425 12.425 0 0 1 6.451-4.4 6.507 6.507 0 0 1 -3.018-5.49c0-3.584 2.916-6.5 6.5-6.5s6.5 2.916 6.5 6.5a6.513 6.513 0 0 1 -3.019 5.491 12.42 12.42 0 0 1 6.452 4.4c-2.328 2.925-5.912 4.809-9.933 4.809z"></path>
		                        </svg>
		                    </div>
		                </button>

		                <!-- 로그인 메뉴 -->
		                <ul class="dropdown-menu" aria-labelledby="dropdownRoginButton" style="border-radius: 2.5rem; text-align: center; min-width: 12rem;">
		                <!--로그인한 사용자인 경우 로그아웃 처리 로그인전 이면 로그인 처리-->
	                        <c:choose>
	                        	<c:when test="${sessionScope.user.email == null }">
	                        		<li><a class="dropdown-item" href="/login/register">회원 가입</a></li>
			                        <li><a class="dropdown-item" href="/login/login">로그인</a></li>
	                        	</c:when>
	                        	<c:when test="${sessionScope.user.uno == 0 }">
	                        	<li><a class="dropdown-item" href="/login/logout">로그아웃</a></li>
	                        	</c:when>
	                        	<c:otherwise>
	        		                <li><a class="dropdown-item" href="/login/logout">로그아웃</a></li>
	        		                <li><a class="dropdown-item" href="/login/member_edit">마이페이지</a></li>
	                        	</c:otherwise>
	                        </c:choose>
	                        <c:if test="${sessionScope.user.userRole.indexOf('ROLE_ADMIN') >= 0}">
	                        <li><a class="dropdown-item" href="/login/working/adminList">관리자페이지</a></li>
	                        </c:if>
<!-- 						    <li><a class="dropdown-item" href="/login/register">회원 가입</a></li>
						    <li><a class="dropdown-item" href="/login/login">로그인</a></li>
						    <li><a class="dropdown-item" href="/login/member_edit">마이페이지</a></li> -->
						</ul>
		            </div>
		        </div>
		      </div>
		    </div>
		    <!-- end login -->
		</nav>
    	
    </header>
</body>
</html>