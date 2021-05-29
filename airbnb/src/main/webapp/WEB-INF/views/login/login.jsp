<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="/resources/css/login/style2.css">
    <script src="/resources/js/jquery-3.6.0.min.js"></script>
    <script src="/resources/js/snowfall.jquery.js"></script>
</head>
<body>
${result }
	<section class="login-form">
		<h1>Virtual Air Travel</h1>
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
            <a href="#" id="btnLogin4">
            <img src="/resources/images/facebok.jpg" width="55" height="55" alt="facebok"></a>
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