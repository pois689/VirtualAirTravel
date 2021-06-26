<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/resources/css/styleindex.css">
    <link rel="stylesheet" href="/resources/css/slider.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<link rel = "preconnect"href = "https://fonts.gstatic.com">
	<title>Virtual Air Travel</title>
</head>
<body>
<div class="img"></div>
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
            <div class="hostbox">
            	<a class="hostbox-a">
		            <div class="hostbox-context">
		            	<span class="hostbox-context-title">새로운 여행에 도전하는 당신..</span>
		            	<span class="hostbox-context-content">구체적인 여행 계획을 세워보세요.</span>
		            	<div class="hostbox-context-divbox">
		            	<button class="hostbox-context-button">자세히 알아보기</button>
		            	</div>
		            </div>
	            </a>
            </div>
        </section>
        
        <!-- 여기부터 슬라이드 쇼 -->
        <section>
	        <ul class="slides">
			    <input type="radio" name="radio-btn" id="img-1" checked />
			    <li class="slide-container">
				    	<div class="slide">
				      		<img src="/resources/images/test2.jpg" />
				        	<span class="slide-text">1월의 행사</span>
				        </div>
					    <div class="nav">
					      <label for="img-12" class="prev">&#x2039;</label>
					      <label class="slide-link" style="width: 60%;" onclick="window.open('https://www.japan.travel/ko/guide/january/','window_name','width=1200,height=800,location=no,status=no,scrollbars=yes');"></label>
					      <label for="img-2" class="next">&#x203a;</label>
					    </div>
			    </li>
			
			    <input type="radio" name="radio-btn" id="img-2" />
			    <li class="slide-container">
				        <div class="slide">
				          <img src="/resources/images/Festival2.jpg" />
				          <span class="slide-text">2월의 행사</span>
				        </div>
					    <div class="nav">
					      <label for="img-1" class="prev">&#x2039;</label>
					      <label class="slide-link" style="width: 60%;" onclick="window.open('https://www.japan.travel/ko/guide/february/','window_name','width=1200,height=800,location=no,status=no,scrollbars=yes');"></label>
					      <label for="img-3" class="next">&#x203a;</label>
					    </div>
			    </li>
			
			    <input type="radio" name="radio-btn" id="img-3" />
			    <li class="slide-container">
				        <div class="slide">
				          <img src="/resources/images/Festival3.jpg" />
				          <span class="slide-text">3월의 행사</span>
				        </div>
					    <div class="nav">
					      <label for="img-2" class="prev">&#x2039;</label>
					      <label class="slide-link" style="width: 60%;" onclick="window.open('https://www.japan.travel/ko/guide/march/','window_name','width=1200,height=800,location=no,status=no,scrollbars=yes');"></label>
					      <label for="img-4" class="next">&#x203a;</label>
					    </div>
			    </li>
			
			    <input type="radio" name="radio-btn" id="img-4" />
			    <li class="slide-container">
				        <div class="slide">
				          <img src="/resources/images/Festival4.jpg" />
				          <span class="slide-text">4월의 행사</span>
				        </div>
					    <div class="nav">
					      <label for="img-3" class="prev">&#x2039;</label>
					      <label class="slide-link" style="width: 60%;" onclick="window.open('https://www.japan.travel/ko/guide/april/','window_name','width=1200,height=800,location=no,status=no,scrollbars=yes');"></label>
					      <label for="img-5" class="next">&#x203a;</label>
					    </div>
			    </li>
			
			    <input type="radio" name="radio-btn" id="img-5" />
			    <li class="slide-container">
				        <div class="slide">
				          <img src="/resources/images/Festival5.jpg" />
				          <span class="slide-text">5월의 행사</span>
				        </div>
					    <div class="nav">
					      <label for="img-4" class="prev">&#x2039;</label>
					      <label class="slide-link" style="width: 60%;" onclick="window.open('https://www.japan.travel/ko/guide/may/','window_name','width=1200,height=800,location=no,status=no,scrollbars=yes');"></label>
					      <label for="img-6" class="next">&#x203a;</label>
					    </div>
			    </li>
			
			    <input type="radio" name="radio-btn" id="img-6" />
			    <li class="slide-container">
				        <div class="slide">
				          <img src="/resources/images/Festival6.jpg" />
				          <span class="slide-text">6월의 행사</span>
				        </div>
					    <div class="nav">
					      <label for="img-5" class="prev">&#x2039;</label>
					      <label class="slide-link" style="width: 60%;" onclick="window.open('https://www.japan.travel/ko/guide/june/','window_name','width=1200,height=800,location=no,status=no,scrollbars=yes');"></label>
					      <label for="img-7" class="next">&#x203a;</label>
					    </div>
			    </li>
			    <input type="radio" name="radio-btn" id="img-7" />
			    <li class="slide-container">
					        <div class="slide">
					          <img src="/resources/images/Festival7.jpg" />
					          <span class="slide-text">7월의 행사</span>
					        </div>
					    <div class="nav">
					      <label for="img-6" class="prev">&#x2039;</label>
					      <label class="slide-link" style="width: 60%;" onclick="window.open('https://www.japan.travel/ko/guide/july/','window_name','width=1200,height=800,location=no,status=no,scrollbars=yes');"></label>
					      <label for="img-8" class="next">&#x203a;</label>
					    </div>
			    </li>
			    <input type="radio" name="radio-btn" id="img-8" />
			    <li class="slide-container">
				        <div class="slide">
				          <img src="/resources/images/Festival8.jpg" />
				          <span class="slide-text">8월의 행사</span>
				        </div>
					    <div class="nav">
					      <label for="img-7" class="prev">&#x2039;</label>
					      <label class="slide-link" style="width: 60%;" onclick="window.open('https://www.japan.travel/ko/guide/august/','window_name','width=1200,height=800,location=no,status=no,scrollbars=yes');"></label>
					      <label for="img-9" class="next">&#x203a;</label>
					    </div>
			    </li>
			    <input type="radio" name="radio-btn" id="img-9" />
			    <li class="slide-container">
				        <div class="slide">
				          <img src="/resources/images/sity1.jpg" />
				          <span class="slide-text">9월의 행사</span>
				        </div>
					    <div class="nav">
					      <label for="img-8" class="prev">&#x2039;</label>
					      <label class="slide-link" style="width: 60%;" onclick="window.open('https://www.japan.travel/ko/guide/september/','window_name','width=1200,height=800,location=no,status=no,scrollbars=yes');"></label>
					      <label for="img-10" class="next">&#x203a;</label>
					    </div>
			    </li>
			    <input type="radio" name="radio-btn" id="img-10" />
			    <li class="slide-container">
				        <div class="slide">
				          <img src="/resources/images/sity2.jpg" />
				          <span class="slide-text">10월의 행사</span>
				        </div>
					    <div class="nav">
					      <label for="img-9" class="prev">&#x2039;</label>
					      <label class="slide-link" style="width: 60%;" onclick="window.open('https://www.japan.travel/ko/guide/october/','window_name','width=1200,height=800,location=no,status=no,scrollbars=yes');"></label>
					      <label for="img-11" class="next">&#x203a;</label>
					    </div>
			    </li>
			    <input type="radio" name="radio-btn" id="img-11" />
			    <li class="slide-container">
					        <div class="slide">
					          <img src="/resources/images/sity3.jpg" />
					          <span class="slide-text">11월의 행사</span>
					        </div>
					    <div class="nav">
					      <label for="img-10" class="prev">&#x2039;</label>
					      <label class="slide-link" style="width: 60%;" onclick="window.open('https://www.japan.travel/ko/guide/november/','window_name','width=1200,height=800,location=no,status=no,scrollbars=yes');"></label>
					      <label for="img-12" class="next">&#x203a;</label>
					    </div>
			    </li>
			    <input type="radio" name="radio-btn" id="img-12" />
			    <li class="slide-container">
				        <div class="slide">
				          <img src="/resources/images/sity4.jpg" />
				          <span class="slide-text">12월의 행사</span>
				        </div>
					    <div class="nav">
					      <label for="img-11" class="prev">&#x2039;</label>
					      <label class="slide-link" style="width: 60%;" onclick="window.open('https://www.japan.travel/ko/guide/december/','window_name','width=1200,height=800,location=no,status=no,scrollbars=yes');"></label>
					      <label for="img-1" class="next">&#x203a;</label>
					    </div>
			    </li>
			
			    <li class="nav-dots">
			      <label for="img-1" class="nav-dot" id="img-dot-1"></label>
			      <label for="img-2" class="nav-dot" id="img-dot-2"></label>
			      <label for="img-3" class="nav-dot" id="img-dot-3"></label>
			      <label for="img-4" class="nav-dot" id="img-dot-4"></label>
			      <label for="img-5" class="nav-dot" id="img-dot-5"></label>
			      <label for="img-6" class="nav-dot" id="img-dot-6"></label>
			      <label for="img-7" class="nav-dot" id="img-dot-7"></label>
			      <label for="img-8" class="nav-dot" id="img-dot-8"></label>
			      <label for="img-9" class="nav-dot" id="img-dot-9"></label>
			      <label for="img-10" class="nav-dot" id="img-dot-10"></label>
			      <label for="img-11" class="nav-dot" id="img-dot-11"></label>
			      <label for="img-12" class="nav-dot" id="img-dot-12"></label>
			    </li>
			</ul>
		</section>
		<!-- 슬라이드 끝 -->

        <section>
            <div class="sec__title">유명 관광지</div>

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
                        <div class="info1">지역이름</div>
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
<script>

</script>
</html>