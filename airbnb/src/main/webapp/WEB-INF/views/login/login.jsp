<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="google-signin-clinet_id" content="955391422565-88sjfl4ah16hpav3acqreemhkosvg5cd.apps.googleusercontent.com">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="/resources/css/login/style2.css">
    <script src="/resources/js/jquery-3.6.0.min.js"></script>
    <script src="/resources/js/snowfall.jquery.js"></script>
    <!-- <script type="text/javascript" src="/resources/js/naveridlogin_js_sdk_2.0.2.js"></script> -->
	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
</head>
<body>
${result }
	<section class="login-form">
		<a href="/index"><h1>Virtual Air Travel</h1></a>
		<form action="/login/loginProcess" method="post">
			<div class="int-area">
				<input type="text" name="id" id="id"
				autocomplete="off" required="required">
				<label for="id">USER NAME</label>				
            </div>
			<div class="int-area">
				<input type="text" name="pwd" id="pwd"
				autocomplete="off" required="required">
				<label for="pwd">PASSWORD</label>				
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
        </div>
	</section>
<script>
//처음 실행하는 함수
function init() {
	gapi.load('auth2', function() {
		gapi.auth2.init();
		options = new gapi.auth2.SigninOptionsBuilder();
		options.setPrompt('select_account');
        // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
		options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
        // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
		gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
	})
}

function onSignIn(googleUser){
	var profile = googleUser.getBasicProfile();
}
/* -----------------------------------------------------  */

/* 	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "E68ohfVFivN9KQZJTFIx",
			callbackUrl: "http://localhost:8090/login/callback2",
			isPopup: true, //팝업을 통한 연동처리 여부, true 면 팝업
			loginButton: {color: "green", type: 3, height: 47} // 로그인 버튼의 타입을 지정
		}		
	);
	naverLogin.init(); */

	function onSignIn(googleUser){
		var profile = googleUser.getBaicProfile();
	}


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
        else if($(pwd).val()==""){
            $(pwd).next('label').addClass('warning');
            setTimeout(function(){
                $('label').removeClass('warning')
            },1500)
        }
    });

    $(document).snowfall({round : true, maxSize : 3});

</script>



</body>
</html>