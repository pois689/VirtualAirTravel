<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/resources/header/topnav.jsp"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 : 회원가입</title>
<link rel="stylesheet" href="/resources/css/style2.css">
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
		<h1>Virtual Air Travel</h1>
		<form action="/login/registerMember" method="post" accept-charset="UTF-8" >
			<div class="int-area">
				<input type="text" name="id" id="id"
				autocomplete="off" required="required">
				<label for="id">ID</label>
				<input type="button" value="ID 중복검사" onclick="checkId()" class="idcheck">		
            </div>
			<div class="int-area">
				<input type="text" name="pwd1" id="pwd1"
				autocomplete="off" required="required">
				<label for="pwd1">PASSWORD</label>				
				<img src="/resources/image/key1.png" id="pswd1_img1" class="pswdImg">
            </div>
			<div class="int-area">
				<input type="text" name="pwd" id="pwd2"
				autocomplete="off" required="required">
				<label for="pwd2">REPASSWORD</label>				
				<img src="/resources/image/key2.png" id="pswd2_img1" class="pswdImg">
            </div>
			<div class="int-area">
				<input type="text" name="name" id="name1"
				autocomplete="off" required="required">
				<label for="name1">NAME</label>				
            </div>
			<div class="int-area">
				<input type="email" name="email" id="email"
				autocomplete="off" required="required">
				<label for="email">E-MAIL</label>				
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
            <img src="/resources/image/naver.jpg" width="55" height="55" alt="naver"></a>
            <a href="${google_url }" id="btnLogin2">
            <img src="/resources/image/goggle.jpg" width="55" height="55" alt="goggle"></a>
            <a href="#" id="btnLogin3">
            <img src="/resources/image/apple.jpg" width="55" height="55" alt="apple"></a>
            <a href="#" id="btnLogin4">
            <img src="/resources/image/facebok.jpg" width="55" height="55" alt="facebok"></a>
        </div>
		
	</section>
	
<script>
    let id = $('#id');
    let pwd = $('#pwd');
    let btn = $('#btn');

    $(btn).on('click',function(){
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
    });

    $(document).snowfall({round : true, maxSize : 3});
</script>
</body>

</html>