<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 : 회원가입</title>
<link rel="stylesheet" href="/resources/css/login/new_reg2.css">
<link rel="shortcut icon" sizes="76x76" type="image/x-icon"
        href="https://a0.muscache.com/airbnb/static/logotype_favicon-21cc8e6c6a2cca43f061d2dcabdf6e58.ico">
<script src="https://www.google.com/recaptcha/api.js"></script>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script src="/resources/js/ljk_snowfall.jquery.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>    
</head>
    <body>

         <!-- header -->
         <div id="header">

        </div>

        <!-- wrapper -->
        <div id="wrapper">

            <!-- content-->
            <div id="content">
                
                
                <div id="logo">
                    <a href="/index"><h1>개인정보 수정</h1></a>
                </div>

                <form action="/login/member_edit" name="regForm" method="POST">
                <!-- ID -->
                <div>
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" name="id" id="id" class="int" maxlength="20" value="${user.id}" required="required">
                        <span class="step_url"></span>
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" name="name" class="int" maxlength="20" value="${user.name}" required="required">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- EMAIL -->
                <div>
                    <h3 class="join_title"><label for="email">본인확인 이메일<span class="optional">(중요)</span></label></h3>
                    <span class="box int_email">
                        <input type="text" name="email" id="email" class="int" maxlength="100" placeholder="필수입력" value="${user.email}" readonly="readonly">
                    </span>
                    <!-- <button class="sendMail" type="button">이메일 인증</button>
					<input type="text" placeholder="인증 키 입력" style="display: none;"
					class="compare" maxlength="100" name="compare">
					<span class="compare-text" style="display: none"></span> -->
                    <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>    
                </div>

                <!-- MOBILE -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" name="tel" id="mobile" class="int" maxlength="16" placeholder="전화번호 입력" value="${user.tel}" required="required">
                        <input type="hidden" name="uno" id="uno" value="${user.uno }">
                    </span>
                    <span class="error_next_box"></span>    
                </div>
                
                <!-- 주소 -->
                <div>
                    <h3 class="join_title"><label for="address">주소</label></h3>
                    <span class="address">
                        <input id="member_post" name="jip" onclick="findAddr()" type="text" placeholder="우편 번호" readonly value="${user.jip }">
                        <input id="member_addr" name="address" type="text" placeholder="주소 입력" readonly value="${user.address }">
                        <input id="detail_addr" name="dtaddress" type="text" placeholder="상세 주소" value="${user.dtaddress }">
                        <input type="button" value="입력" onclick="findAddr()" class="checkid">
                    </span>
                    <span class="error_next_box"></span>    
                </div>
                <!-- <button class="g-recaptcha" 
                data-sitekey="reCAPTCHA_site_key" 
                data-callback='onSubmit' 
                data-action='submit'>Submit</button> -->

                <!-- JOIN BTN-->
                <div class="btn_area">
                    <button type="submit" id="btnJoin">
                        <span>수정하기</span>
                    </button>
                     <button onclick="move()" type="button" id="btnJoin2">
                        <span>비밀번호 변경하기</span>
                    </button>
                     <button onclick="del()" type="button" id="btnJoin3">
                        <span>회원 탈퇴하기</span>
                    </button>
                </div>
                </form>
                

            </div> 
            <!-- content-->

        </div> 
        <!-- wrapper -->
<script type="text/javascript">
    $(document).ready(
    		function(){
    			
    	$(".int_email").css("background-color","#d2d2d2");		
    	$("#email").css("background-color","#d2d2d2");		
    			
    			
	    $(".sendMail").click(function() {// 메일 입력 유효성 검사
			var mail = $("#email").val(); //사용자의 이메일 입력값. 
			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; 
			
			if (mail == "") {
				alert("메일 주소가 입력되지 않았습니다.");
			}
			else if(mail.match(regExp) == null){
				alert('이메일형식에 맞게 입력해주세요'); 
			}
			else {
				 //셀렉트 박스에 @뒤 값들을 더함.
			$.ajax({
				type : 'post',
				url : '/CheckMail',
				data : {
					mail:mail
					},
				dataType :'json',
				success : function(data) {
					if(data.key == "return"){
						alert("이미 가입한 이메일이있습니다")
					}else{
					console.log("data",data.key);
					key = data.key;
					alert("인증번호가 전송되었습니다.") 
					$(".compare").css("display", "block");
					$(".compare-text").text("불일치!").css("color", "red");
					}
				}
			});
			}
		});
	    
	    $("#email").change(function() {
	    	
	    });

	    
	    $(btnJoin).on('click',function(){
	    	if(($(".compare-text").text() == "인증 성공!")){
	        	return true;
	        }
	        else if(($(".compare-text").text() == "불일치!")){
	        	alert("인증에 실패하셨습니다.");
	        	return false;
	        }
	    });
	    
	    
		$(".compare").on("propertychange change keyup paste input", function() {
			if ($(".compare").val() == key) {   //인증 키 값을 비교를 위해 텍스트인풋과 벨류를 비교
				$(".compare-text").text("인증 성공!").css("color", "black");
	            $("input[name=compare]").css("background-color", "#B0F6AC");
			} else {
				$(".compare-text").text("불일치!").css("color", "red");
	            $("input[name=compare]").css("background-color", "#FFCECE");						
			}
		});
    });
    
    
    function move(){
    location.href="updatePwd";

    }
    
    function del() {
    	  if (confirm("정말 탈퇴하시겠습니까?")){
    		  alert("탈퇴되었습니다")
    		  location.href="deleteuser";
    	  }
    	 }
    
    function findAddr(){
    	new daum.Postcode({
            oncomplete: function(data) {
            	
            	console.log(data);
            	
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var jibunAddr = data.jibunAddress; // 지번 주소 변수
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('member_post').value = data.zonecode;
                if(roadAddr !== ''){
                    document.getElementById("member_addr").value = roadAddr;
                } 
                else if(jibunAddr !== ''){
                    document.getElementById("member_addr").value = jibunAddr;
                }
            }
        }).open();
    }
    
        $(document).snowfall({round : true, maxSize : 3});
</script>
    
    </body>
</html>