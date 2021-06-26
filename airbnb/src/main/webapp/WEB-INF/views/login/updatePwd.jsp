<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 : 회원가입</title>
<link rel="stylesheet" href="/resources/css/login/style2.css">
<link rel="shortcut icon" sizes="76x76" type="image/x-icon"
        href="https://a0.muscache.com/airbnb/static/logotype_favicon-21cc8e6c6a2cca43f061d2dcabdf6e58.ico">
<script src="https://www.google.com/recaptcha/api.js"></script>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script src="/resources/js/ljk_snowfall.jquery.js"></script>
</head>
<body>
	<section class="login-form">
		<a href="/index"><h1>Virtual Air Travel</h1></a>
		<form action="/pwd_change" method="post">
		<input type="hidden" name="email" id="email" value ="${user.email }" readonly="readonly">
		<input type="hidden" name="name" id="name" value ="${user.name }" readonly="readonly">
		<input type="hidden" name="id" id="id" value ="${user.id }" readonly="readonly">
			<div class="int-area">
				<input type="text" name="pwd" id="pwd"
				autocomplete="off" required="required" maxlength="20">
				<label for="pwd">Existing(기존) PASSWORD</label>				
            </div>
			<div class="int-area">
				<input type="text" name="repwd" id="repwd"
				autocomplete="off" required="required" oninput="checkPwd()">
				<label for="pwdCheck">PASSWORD</label>				
				<img src="/resources/images/key1.png" maxlength="20" id="pswd1_img1" class="pswdImg1">
            </div>
			<div class="int-area">
				<input type="text" name="repwdCheck" id="repwdCheck"
				autocomplete="off" required="required" maxlength="20" oninput="checkPwd()">
				<label for="repwdCheck">REPASSWORD</label>				
				<img src="/resources/images/key2.png" id="pswd1_img2" class="pswdImg2">
            </div>
            <div class="btn-area">
                <button id="btn" type="button">비밀번호 변경하기</button>
            </div>
        </form>
		
	</section>
	
<script type="text/javascript">
$(document).ready(
		function(){
			
			//비밀번호 변경
			    $(btn).on('click',function(){
				    let pwd = $('#pwd');
				    let repwd = $('#repwd');
				    let repwdCheck = $('#repwdCheck');
				    let check1 = null;
			    	let regExPw = /^[a-zA-Z0-9]{8,20}$/;
			    	let chk_num = $(pwd).val().search(/[0-9]/g); //비밀번호와 숫자 인덱스 검색,숫자가 1개라도 있어야하고
			    	let chk_eng = $(pwd).val().search(/[a-zA-Z]/g); //비번 영문자의 인덱스 검색,문자가 하나라도 있어야함
			        if($(pwd).val()==""){
			            $(pwd).next('label').addClass('warning');
			            setTimeout(function(){
			                $('label').removeClass('warning')
			            },1500)
			        }
			        else if($(repwd).val()==""){
			            $(repwd).next('label').addClass('warning');
			            setTimeout(function(){
			                $('label').removeClass('warning')
			            },1500)
			        }
			        else if($(repwdCheck).val()==""){
			            $(repwdCheck).next('label').addClass('warning');
			            setTimeout(function(){
			                $('label').removeClass('warning')
			            },1500)
			        }
			        else if($(repwd).val()!=$(repwdCheck).val()){
			        	alert("비밀번호가 다릅니다")
			        	return false;
			        }
			        else if(!regExPw.test($(pwd).val()) || chk_num < 0 || chk_eng < 0){
			        	alert("비밀번호는 영문자와 숫자 조합으로 8~20자까지 가능합니다 한글x")
			        	return false;
			        }
			        else if(check1 == null){ //체크확인,기존비밀번호확인
			        	var pw = $('#pwd').val();
			        	alert("변경비밀번호:"+$(repwdCheck).val());
			        	alert("기존비밀번호:"+pw);
			    		//ajax로 기존비밀번호 확인
			    		$.ajax({
			    			type : "POST",
			    			url :"/checkPwd",
			    			data : {pw:pw},
			    			dataType :'text',
			    			success:function(result){
			    				if(result == "Success"){
			    					alert("기존비밀번호가 맞습니다");
			    					check1 = "ok";
			    					ok();
			    				}else{
			    					alert("기존비밀번호를 다시 확인해주세요");
			    				}
			    			},
			    			error:function(error){
			    				console.log("error:" + error);
			    			}
			    		});
			        	
			        }
			    });
				
				});
    

	function ok(){
    	var user = {
    			email : $("#email").val(),
    			name : $("#name").val(),
    			id : $("#id").val(),
    			pwd : $("#repwd").val()};
        $.ajax({
        	type:'post',
        	url:'/pwd_change',
        	dataType:'json',
        	data:JSON.stringify(user),
        	contentType : 'application/json; charset=UTF-8',
        	success : function(data){
        		if(data.result === "Success"){
        			alert("비밀번호가 변경되었습니다 \n변경된 비밀번호로 다시로그인해주세요");
        			location.href = "/login/login";
        		}else{
        			alert("비밀번호 변경에 실패하셨습니다");
        		}
        	}
        	
        });
	}
	
	function checkPwd(){
		var reg = /^[a-zA-Z0-9]{8,20}$/;
		var chk_num = $('#repwd').val().search(/[0-9]/g); //비밀번호와 숫자 인덱스 검색,숫자가 1개라도 있어야하고
    	var chk_eng = $('#repwd').val().search(/[a-zA-Z]/g); //비번 영문자의 인덱스 검색,문자가 하나라도 있어야함
        var inp = $('#pwd').val();
        var inputed = $('#repwd').val();
        var reinputed = $('#repwdCheck').val();
        var	img1 = document.getElementById('pswd1_img1');
        var	img2 = document.getElementById('pswd1_img2');
        if(!reg.test(inputed) && reinputed=="" && (inputed != reinputed || inputed == reinputed)){ //초기화면
        	img1.src="/resources/images/key4.png";
        	img2.src="/resources/images/key2.png";
            console.log("실1행");
        }else if(reg.test(inputed) && (chk_num > 0 || chk_eng > 0) && (inputed == reinputed)) { //pwd1이 유효성검사했을때 틀리면
        	img1.src="/resources/images/key5.png";
        	img2.src="/resources/images/key3.png";

            console.log("실2행");
        }else if (!reg.test(inputed) && (chk_num < 0 || chk_eng < 0) && inputed == reinputed) { //pwd1이 유효성검사했을때 틀리면
        	img1.src="/resources/images/key4.png";
        	img2.src="/resources/images/key3.png";
            console.log("실3행");
        }else if (reg.test(inputed) && (chk_num > 0 || chk_eng > 0) && inputed != reinputed) { //pwd1이 유효성검사했을때 틀리면
        	img1.src="/resources/images/key5.png";
        	img2.src="/resources/images/key2.png";
            console.log("실4행");
        }else if (!reg.test(inputed) && (chk_num < 0 || chk_eng < 0) && inputed != reinputed) {
        	img1.src="/resources/images/key4.png";
        	img2.src="/resources/images/key2.png";
            console.log("실5행");
        }
	}

	

    $(document).snowfall({round : true, maxSize : 3});
</script>
</body>

</html>