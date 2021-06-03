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
	<section class="login-form">
		<a href="/index"><h1>${ res }</h1></a>
            <div class="btn-area">
                <button id="btn" onclick="location.href='/login/login'" type="button">로그인창으로</button>
            </div>
        <div class="caption">
            <p><a href="id_find" id="f1">Forgot ID?&nbsp;</a>
            <span>|</span>
            <a href="pwd_find" id="f2">Forgot Password?&nbsp;</a>
            <span>|</span>
            <a href="register.html" id="f3">회원가입하기</a></p>
        </div>


	</section>
<script>

    $(document).snowfall({round : true, maxSize : 3});

</script>



</body>
</html>