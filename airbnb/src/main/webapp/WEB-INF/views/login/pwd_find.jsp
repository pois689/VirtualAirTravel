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
    <script src="/resources/js/ljk_snowfall.jquery.js"></script>
</head>
<body>
	<section class="login-form">
		<a href="/index"><h1>비밀번호 찾기</h1></a>
		<form action="/login/mail" method="post">
			<div class="int-area">
				<input type="text" name="id" id="id"
				autocomplete="off" required="required">
				<label for="id">ID</label>				
            </div>
			<div class="int-area">
				<input type="email" name="email" id="email"
				autocomplete="off" required="required">
				<label for="email">E-MAIL</label>				
            </div>
			<div class="int-area">
				<input type="text" name="name" id="name"
				autocomplete="off" required="required">
				<label for="name">이름</label>				
            </div>
            <div class="btn-area">
                <button id="btn" type="submit">임시 이메일 보내기</button>
            </div>
        </form>
        <div class="caption">
            <p><a href="id_find" id="f1">Forgot ID?&nbsp;</a>
            <span>|</span>
            <a href="pwd_find" id="f2">Forgot Password?&nbsp;</a>
            <span>|</span>
            <a href="register.html" id="f3">회원가입하기</a></p>
        </div>

        <div class="tpa">
            <a href="#" id="btnLogin1">
            <img src="/resources/images/naver.jpg" width="55" height="55" alt="naver"></a>
            <a href="#" id="btnLogin2">
            <img src="/resources/images/goggle.jpg" width="55" height="55" alt="goggle"></a>
        </div>

	</section>
<script>
    let id = $('#id');
    let email = $('#email');
    let name = $('#name');
    let btn = $('#btn');

    $(btn).on('click',function(){
        if($(id).val()==""){
            $(id).next('label').addClass('warning');
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
        else if($(name).val()==""){
            $(name).next('label').addClass('warning');
            setTimeout(function(){
                $('label').removeClass('warning')
            },1500)
        }
    });

    $(document).snowfall({round : true, maxSize : 3});

</script>



</body>
</html>