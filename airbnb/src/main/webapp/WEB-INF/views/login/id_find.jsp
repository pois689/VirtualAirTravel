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
    <link rel="shortcut icon" sizes="76x76" type="image/x-icon"
        href="https://a0.muscache.com/airbnb/static/logotype_favicon-21cc8e6c6a2cca43f061d2dcabdf6e58.ico">
    <script src="/resources/js/jquery-3.6.0.min.js"></script>
    <script src="/resources/js/ljk_snowfall.jquery.js"></script>
</head>
<body>
	<section class="login-form">
		<a href="/index"><h1>아이디 찾기</h1></a>
		<form action="/login/id_finded" method="post">
			<div class="int-area">
				<input type="text" name="name" id="name"
				autocomplete="off" required="required">
				<label for="name">NAME</label>				
            </div>
			<div class="int-area">
				<input type="email" name="email" id="email"
				autocomplete="off" required="required">
				<label for="email">E-MAIL</label>				
            </div>
            <div class="btn-area">
                <button id="btn" type="submit">찾기</button>
            </div>
        </form>
        <div class="caption">
            <p><a href="id_find" id="f1">Forgot ID?&nbsp;</a>
            <span>|</span>
            <a href="pwd_find" id="f2">Forgot Password?&nbsp;</a>
            <span>|</span>
            <a href="register.html" id="f3">회원가입하기</a></p>
        </div>

        <div class="item">
            <button  onclick="location.href='/login/login'" class="item_btn">로그인</button>
        </div>

	</section>
<script>
    let name = $('#name');
    let email = $('#email');
    let btn = $('#btn');

    $(btn).on('click',function(){
        if($(name).val()==""){
            $(name).next('label').addClass('warning');
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
    });

    $(document).snowfall({round : true, maxSize : 3});

</script>



</body>
</html>