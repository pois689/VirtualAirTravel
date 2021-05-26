<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/slider.css">
    <!-- 파비콘 링크  / 없으면 아이콘 안뜸-->
    <link rel="shortcut icon" sizes="76x76" type="image/x-icon"
        href="https://a0.muscache.com/airbnb/static/logotype_favicon-21cc8e6c6a2cca43f061d2dcabdf6e58.ico">
	<link href="https://unpkg.com/tailwindcss@2.0.2/dist/tailwind.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>

<body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
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
					<div style="font-weight: 800">카테고리</div>
					<input class="button__value" placeholder="미입력" readonly="readonly">
				</div>
				<!-- 카테고리 -->
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton1" style="border-radius: 2.5rem; text-align: center; min-width: 12rem;">
				    <button class="dropdown-item">여행지</button>
				    <button class="dropdown-item">행사</button>
				    <button class="dropdown-item">숙소</button>
				    <button class="dropdown-item">맛집</button>
				</div>
				
			<span class="search__span"></span>
			<!-- 검색어 -->
			<input class="search__button" placeholder="검색">
			<span class="search__span"></span>
			<!-- 검색 아이콘 -->
			<button class="flex items-center justify-center relative  h-8 w-8 rounded-full" type="submit" style="padding-right: 7px; width: 150px; outline: none;">
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
			                                overflow: visible;
			                            "
			                        >
			                            <g fill="none">
			                                <path
			                                    d="m13 24c6.0751322 0 11-4.9248678 11-11 0-6.07513225-4.9248678-11-11-11-6.07513225 0-11 4.92486775-11 11 0 6.0751322 4.92486775 11 11 11zm8-3 9 9"
			                                ></path>
			                            </g>
			                        </svg>
			                    </button>
        </div>
		    <!-- end search bar -->
		    <!-- login -->
		    <div class="flex-initial">
		      <div class="flex justify-end items-center relative">
		       
		        <div class="flex mr-4 items-center">
		          <a class="inline-block py-2 px-3 hover:bg-gray-200 rounded-full" href="#" style="text-decoration: none;">
		            <div class="flex items-center relative cursor-pointer whitespace-nowrap" style="color: rgb(34, 34, 34);">호스팅 신청</div>
		          </a>
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
						    <li><a class="dropdown-item" href="#">회원 가입</a></li>
						    <li><a class="dropdown-item" href="#">로그인</a></li>
						    <li><a class="dropdown-item" href="#">마이페이지</a></li>
						</ul>
		            </div>
		        </div>
		      </div>
		    </div>
		    <!-- end login -->
		</nav>
    	
    </header>

    <main>
        <section>
            <div class="sec__title">둘러보기</div>
            <div class="card__box">
                <div class="card__box_1">
                    <div class="card__img1 card__img"></div>
                    <div class="card__content">숙소</div>
                </div>
                <div class="card__box_1">
                    <div class="card__img2 card__img"></div>
                    <div class="card__content">축제</div>
                </div>
                <div class="card__box_1">
                    <div class="card__img3 card__img"></div>
                    <div class="card__content">관광지</div>
                </div>
                <div class="card__box_1">
                    <div class="card__img4 card__img"></div>
                    <div class="card__content">맛집</div>
                </div>
            </div>
        </section>

        <section>
            <div class="ad1"></div>
        </section>
        
        <div class="mod-calendar__header">
        	<div class="mod-calendar__header-inner">
        		<h2 class="mod-calendar__heading">여행 하이라이트</h2>
        	</div>
        </div>
        <!-- 여기부터 슬라이드 쇼 -->
        <div class="mod-calendar__body">
        	<div class="mod-calendar__body-inner">
        		<div class="mod-calendar__slider-overlay mod-calendar__slider-overlay--left"></div>
        		<div class="mod-calender__slider-wrapper">
        			<div class="mod-calender__slider slick-initialized slick-slider">
        				<button type="button" class="slick-prev slick-arrow">
        					<span>Previous</span>
        				</button>
        				<div class="slick-list draggable">
        					<div class="slick-track" style="opacity: 1; width: 120000px; transform: translate3d(-3393px, 0px, 0px);">
        						<div class="mod-calendar__item slick-slide slick-cloned" data-slick-index="-4" id aria-hidden="true" tabindex="-1">
        							<a href="#" class="mod-calendar__item-inner" tabindex="-1">
        								<div class="mod-calendar_image">
        									<img src="https://res-1.cloudinary.com/jnto/image/upload/w_450,h_670,c_fill,f_auto,fl_lossy,q_auto/v1514196556/nagano/Nagano2474_17" data-src="https://res-1.cloudinary.com/jnto/image/upload/w_450,h_670,c_fill,f_auto,fl_lossy,q_auto/v1514196556/nagano/Nagano2474_17" alt="Seasonal Highlights Hakuba Ski Resorts" class=" lazyloaded">
        								</div>
        								<span class="mod-calendar__text">1월의 일본</span>
        							</a>
        						</div>
        					</div>
        				</div>
        				<button class="slick-next slick-arrow">
        					<span>Next</span>
        				</button>
        			</div>
        		</div>
        		<div class="mod-calendar__slider-overlay mod-calendar__slider-overlay--right"></div>
        	</div>
        </div>

        <section>
            <div class="sec__title">추천 여행지</div>
            <div class="choo__box">
            	<div class="choo">
	                <div class="choo_img1"></div>
	                <div class="info2" style="text-align: center;">훗카이도</div>
	            </div>
	            <div class="choo">
	                <div class="choo_img2"></div>
	                <div class="info2" style="text-align: center;">도쿄</div>
	            </div>
	            <div class="choo">
	                <div class="choo_img3"></div>
	                <div class="info2" style="text-align: center;">간사이</div>
	            </div>
	            <div class="choo">
	                <div class="choo_img4"> </div>
	                <div class="info2" style="text-align: center;">규슈</div>
	            </div>
	            <div class="choo">
	                <div class="choo_img5"></div>
	                <div class="info2" style="text-align: center;">도호쿠</div>
	            </div>
	        </div>
        </section>

        <section>
            <div class="sec__title">진행중인 축제</div>

            <div class="home__box">
                <div class="home">
                    <div class="home__img1"></div>
                    <div class="home__info">
                        <div class="info1">지역이름</div>
                        <div class="info2">축제이름</div>
                        <div class="info3">
                            <span class="star">★★★★★</span>
                            <span class="count">185</span>
                            <span class="type">호스트</span>
                        </div>
                    </div>
                </div>

                <div class="home">
                    <div class="home__img2"></div>
                    <div class="home__info">
                        <div class="info1">지역이름</div>
                        <div class="info2">축제이름</div>
                        <div class="info3">
                            <span class="star">★★★★★</span>
                            <span class="count">188</span>
                            <span class="type">호스트</span>
                        </div>
                    </div>
                </div>

                <div class="home">
                    <div class="home__img3"></div>
                    <div class="home__info">
                        <div class="info1">지역이름</div>
                        <div class="info2">축제이름</div>
                        <div class="info3">
                            <span class="star">★★★★★</span>
                            <span class="count">367</span>
                            <span class="type">호스트</span>
                        </div>
                    </div>
                </div>

                <div class="home">
                    <div class="home__img4"></div>
                    <div class="home__info">
                        <div class="info1">지역이름</div>
                        <div class="info2">축제이름</div>
                        <div class="info3">
                            <span class="star">★★★★★</span>
                            <span class="count">177</span>
                            <span class="type">호스트</span>
                        </div>
                    </div>
                </div>

                <div class="home">
                    <div class="home__img5"></div>
                    <div class="home__info">
                        <div class="info1">지역이름</div>
                        <div class="info2">축제이름</div>
                        <div class="info3">
                            <span class="star">★★★★★</span>
                            <span class="count">459</span>
                            <span class="type">호스트</span>
                        </div>
                    </div>
                </div>

                <div class="home">
                    <div class="home__img6"></div>
                    <div class="home__info">
                        <div class="info1">지역이름</div>
                        <div class="info2">불꽃축제</div>
                        <div class="info3">
                            <span class="star">★★★★★</span>
                            <span class="count">119</span>
                            <span class="type">호스트</span>
                        </div>
                    </div>
                </div>

                <div class="home">
                    <div class="home__img7"></div>
                    <div class="home__info">
                        <div class="info1">지역이름</div>
                        <div class="info2">축제이름</div>
                        <div class="info3">
                            <span class="star">★★★★★</span>
                            <span class="count">559</span>
                            <span class="type">호스트</span>
                        </div>
                    </div>
                </div>

                <div class="home">
                    <div class="home__img8"></div>
                    <div class="home__info">
                        <div class="info1">게지역이름</div>
                        <div class="info2">지역이름</div>
                        <div class="info3">
                            <span class="star">★★★★★</span>
                            <span class="count">170</span>
                            <span class="type">호스트</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</body>
</html>