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
</head>
<body>
	<section class="login-form">
		<a href="/index"><h1>Virtual Air Travel</h1></a>
		<form action="/pwd_change" method="post">
			<div class="int-area">
				<input type="text" name="pwd" id="pwd"
				autocomplete="off" required="required">
				<label for="pwd">Existing PASSWORD</label>				
				<img src="/resources/images/key2.png" id="pswd1_img1" class="pswdImg">
            </div>
			<div class="int-area">
				<input type="text" name="repwd" id="repwd"
				autocomplete="off" required="required">
				<label for="pwdCheck">PASSWORD</label>				
				<img src="/resources/images/key1.png" id="pswd2_img1" class="pswdImg">
            </div>
			<div class="int-area">
				<input type="text" name="repwdCheck" id="repwdCheck"
				autocomplete="off" required="required">
				<label for="repwdCheck">REPASSWORD</label>				
				<img src="/resources/images/key2.png" id="pswd2_img1" class="pswdImg">
            </div>
            <div class="btn-area">
                <button id="btn" type="submit">비밀번호 변경하기</button>
            </div>
        </form>
		
	</section>
	
<script type="text/javascript">
$(document).ready(
		function(){
			
			$("input[name=pwd]").on("change", function(){
			var pw = $('#pwd').val();
			//ajax로 비밀번호 확인
			$.ajax({
				type : "POST",
				url :"/checkPwd",
				data : {
					pwd:pw
					},
				dataType :'json',
				success:function(result){
					if(result === "Success"){
						alert("성공");
					}else{
						alert("실패");
					}
				},
				error:function(error){
				}
			});
				
			});
			
			//비밀번호 변경
		
			    $(btn).on('click',function(){
				    let pwd = $('#pwd');
				    let repwd = $('#repwd');
				    let repwdCheck = $('#repwdCheck');
				    alert($(repwdCheck).val());
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
			    });
				
				});
    

    $(document).snowfall({round : true, maxSize : 3});
</script>
</body>

</html>