<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 : 회원가입</title>
<link rel="stylesheet" href="/resources/css/login/style2.css">
<script src="https://www.google.com/recaptcha/api.js"></script>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script src="/resources/js/snowfall.jquery.js"></script>
<!-- <script>
            function onSubmit(token) {
              document.getElementById("demo-form").submit();
            }
            function registerCheckFunction(){
                var userID = $('#id').val();
                $ajax({
                    url: './UserRegisterCheckServlet',
                    method: 'POST',
                    data: {userID: userID},
                    success: function(result){
                        if(result == 1){
                            $('#checkMessage').html('사용할수있는아이디입니다');
                            $('#checkType').attr('class', 'modal-content panel-success');
                        }
                        else{
                            $('#checkMessage').html('사용할수 없는 아이디입니다.');
                            $('#checkType').attr('class', 'modal-content panel-warning');
                        }
                        $('#checkModal').modal("show");
                    }
                });
            }
            function passwordCheckFunction(){
                var passwd1 = $('#pswd1').val();
                var passwd2 = $('#pswd2').val();
                if(passwd1 != passwd2){
                    $('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다');
                }else{
                    $('#passwordCheckMessage').html('');
                }
            }
          </script> -->
          
</head>
<body>
<%-- ${result } --%>
	<section class="login-form">
		<a href="/index"><h1>Virtual Air Travel</h1></a>
		<form action="/login/registerMember" method="post" accept-charset="UTF-8" >
			<div class="int-area">
				<input type="text" name="id" id="id"
				autocomplete="off" required="required">
				<label for="id">ID</label>
				<input type="button" value="ID 중복검사" onclick="checkId()" class="idcheck">		
            </div>
			<div class="int-area">
				<input type="text" name="pwd" id="pwd1"
				autocomplete="off" required="required">
				<label for="pwd1">PASSWORD</label>				
				<img src="/resources/images/key1.png" id="pswd1_img1" class="pswdImg">
            </div>
			<div class="int-area">
				<input type="text" name="pwd2" id="pwd2"
				autocomplete="off" required="required">
				<label for="pwd2">REPASSWORD</label>				
				<img src="/resources/images/key2.png" id="pswd2_img1" class="pswdImg">
            </div>
			<div class="int-area">
				<input type="text" name="name" id="name1"
				autocomplete="off" required="required">
				<label for="name1">NAME</label>				
            </div>
			<div class="int-area">
				<input type="email" name="email" id="email" class="email"
				autocomplete="off" required="required">
				<label for="email">E-MAIL</label>				
				<button class="sendMail" type="button">이메일 인증</button>
				<input type="text" placeholder="인증 키 입력" style="display: none;"
					class="compare">
					<span class="compare-text" style="display: none"></span>
            </div>
			<div class="int-area">
				<input type="tel" name="tel" id="tel"
				autocomplete="off" required="required">
				<label for="tel">PhoneNo</label>				
            </div>
            <div class="btn-area">
                <button id="btn" type="submit">LOGIN</button>
            </div>
        </form>
        <div class="caption">
            <p><a href="id_find" id="f1">Forgot ID?&nbsp;</a>
            <span>|</span>
            <a href="pwd_find" id="f2">Forgot Password?&nbsp;</a>
            <span>|</span>
            <a href="register" id="f3">회원가입하기</a></p>
        </div>

        <div class="tpa">
            <a href="${naver_url }" id="btnLogin1">
            <img src="/resources/images/naver.jpg" width="55" height="55" alt="naver"></a>
            <a href="${google_url }" id="btnLogin2">
            <img src="/resources/images/goggle.jpg" width="55" height="55" alt="goggle"></a>
            <a href="#" id="btnLogin3">
            <img src="/resources/images/apple.jpg" width="55" height="55" alt="apple"></a>
            <a href="#" id="btnLogin4">
            <img src="/resources/images/facebok.jpg" width="55" height="55" alt="facebok"></a>
        </div>
		
	</section>
	
<script type="text/javascript">
$(document).ready(
		function(){
				$(".sendMail").click(function() {// 메일 입력 유효성 검사
					var mail = $(".email").val(); //사용자의 이메일 입력값. 
					if (mail == "") {
						alert("메일 주소가 입력되지 않았습니다.");
					} else {
						 //셀렉트 박스에 @뒤 값들을 더함.
					$.ajax({
						type : 'post',
						url : '/CheckMail',
						data : {
							mail:mail
							},
						dataType :'json',
						success : function(data) {
							key = data.key;
						}

					});
						alert("인증번호가 전송되었습니다.") 
						$(".compare").css("display", "block");
						$(".compare-text").css("display", "block");
					}
				});
				
			    $(btn).on('click',function(){
				    let id = $('#id');
				    let pwd1 = $('#pwd1');
				    let pwd2 = $('#pwd2');
				    let btn = $('#btn');
				    
				    //정규식
				    //test함수는 문자열(t,f) search함수값 위치값(1,-1) replase함수는 교체(값)
					let regExPw = /^[a-zA-Z0-9]{8,20}$/;
					let chk_num = pw1.search(/[0-9]/g); //비밀번호와 숫자 인덱스 검색,숫자가 1개라도 있어야하고
					let chk_eng = pw1.search(/[a-zA-Z]/g); //비번 영문자의 인덱스 검색,문자가 하나라도 있어야함 
			    	
			        if($(id).val()==""){
			            $(id).next('label').addClass('warning');
			            setTimeout(function(){
			                $('label').removeClass('warning')
			            },1500)
			        }
			        else if($(pwd1).val()==""){
			            $(pwd1).next('label').addClass('warning');
			            setTimeout(function(){
			                $('label').removeClass('warning')
			            },1500)
			        }
			        else if($(pwd2).val()==""){
			            $(pwd2).next('label').addClass('warning');
			            setTimeout(function(){
			                $('label').removeClass('warning')
			            },1500)
			        }
			        else if($(pwd1).val()!=$(pwd2).val()){
			        	alert("비밀번호가 다릅니다")
			        	return false;
			        }
			        else if($(name1).val()==""){
			            $(name1).next('label').addClass('warning');
			            setTimeout(function(){
			                $('label').removeClass('warning')
			            },1500)
			        }
			        else if($(email).val()==""){
			            $(email).next('label').addClass('warning');
			            setTimeout(function(){
			                $('label').removeClass('warning')
			            },1500)
			        }
			        else if($(tel).val()==""){
			            $(tel).next('label').addClass('warning');
			            setTimeout(function(){
			                $('label').removeClass('warning')
			            },1500)
			        }
			        else if(($(".compare").val() == "")){
						alert("메일 인증이 완료되지 않았습니다.");
						return false;
					}
			        else if(($(".compare-text").text() == "인증 성공!")){
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
					} else {
						$(".compare-text").text("불일치!").css("color", "red");
					}
				});
				
				});
    

    $(document).snowfall({round : true, maxSize : 3});
</script>
</body>

</html>