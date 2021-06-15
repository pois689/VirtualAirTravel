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
		<form action="/login/registerMember" method="post">
			<div class="int-area">
				<input type="text" name="id" id="id"
				autocomplete="off" required="required" maxlength="20">
				<label for="id">ID</label>
				<input type="button" value="ID 중복검사" id="idCheck" class="idcheck">		
            </div>
			<div class="int-area">
				<input type="text" name="pwd" id="pwd"
				autocomplete="off" required="required" maxlength="20" oninput="checkPwd()">
				<label for="pwd">PASSWORD</label>				
				<img src="/resources/images/key1.png" id="pswd1_img1" class="pswdImg1">
            </div>
			<div class="int-area">
				<input type="text" name="pwdCheck" id="pwdCheck"
				autocomplete="off" required="required" maxlength="20" oninput="checkPwd()">
				<label for="pwdCheck">REPASSWORD</label>				
				<img src="/resources/images/key2.png" id="pswd1_img2" class="pswdImg2">
            </div>
			<div class="int-area">
				<input type="text" name="name" id="name"
				autocomplete="off" required="required" maxlength="20">
				<label for="name">NAME</label>				
            </div>
			<div class="int-area">
				<input type="email" name="email" id="email" class="email"
				autocomplete="off" required="required">
				<label for="email">E-MAIL</label>				
				<button class="sendMail" type="button">이메일 인증</button>
				<input type="text" placeholder="인증 키 입력" style="display: none;"
					class="compare" maxlength="100" name="compare">
					<span class="compare-text" style="display: none"></span>
            </div>
			<div class="int-area">
				<input type="tel" name="tel" id="tel"
				autocomplete="off" required="required" maxlength="16">
				<label for="tel">PhoneNo</label>				
            </div>
            <div class="btn-area">
                <button id="btn" type="submit">회원 가입</button>
            </div>
        </form>
        <div class="caption">
            <p><a href="id_find" id="f1">Forgot ID?&nbsp;</a>
            <span>|</span>
            <a href="pwd_find" id="f2">Forgot Password?&nbsp;</a>
            <span>|</span>
            <a href="register" id="f3">회원가입하기</a></p>
        </div>
		
	</section>
	
<script type="text/javascript">
$(document).ready(
		function(){
			
			$("input[name=id]").on("change",function(){
				$("input[name=id]").prop("dataValue",false);
				$("input[name=id]").attr("dataValue",false);
			});
			$("#idCheck").on("click", function(){
				let idd = $("input[name=id]").val();
				$.ajax({
					url : '/checkId/' + idd,
					method : 'get',
					dataType : 'json',
					success : function(data){
						//이미 등록된 아이디인 경우
						if(!data){
							alert("이미 등록된 아이디 입니다.")
							$("input[name=id]").css("background-color", "#FFCECE");
						}else{
							alert("등록 가능한 아이디 입니다.")
							//회원가입버특클릭시 중복처리 했다고 알림
							//속성값을 추가 해보자
							$("input[name=id]").prop("dataValue",true);
							$("input[name=id]").css("background-color", "#4CAF50");
						}
						//등록 가능한 아이디인 경우
					},
					error : function(){
						console.log('error');
					}
				});
				$("input[name=id]").prop("dataValue",false);
			});
			
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
							if(data.key == "return"){
								alert("이미 가입한 이메일이있습니다")
							}else{
							console.log("data",data.key);
							key = data.key;
							alert("인증번호가 전송되었습니다.") 
							$(".compare").css("display", "block");
							$(".compare-text").css("display", "block");
							}
						}
					});
					}
				});
				
			    $(btn).on('click',function(){
			    	let reg2 = /^[a-zA-Z0-9]{8,20}$/;
				    let id = $('#id');
				    let pwd1 = $('#pwd');
				    let pwd2 = $('#pwdCheck');
				    let btn = $('#btn');
				    let name = $('#name');
				    let email = $('#email');
				    let tel = $('#tel');
				    
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
			        else if($(pwdCheck).val()==""){
			            $(pwdCheck).next('label').addClass('warning');
			            setTimeout(function(){
			                $('label').removeClass('warning')
			            },1500)
			        }
			        else if($(pwd).val()!=$(pwdCheck).val()){
			        	alert("비밀번호가 다릅니다")
			        	return false;
			        }
			        else if(!reg2.test(pwd)){
			        	alert("비밀번호는 8자리이상이여야합니다")
			        	return false;
			        }
			        else if($(name).val()==""){
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
			        else if($(tel).val()==""){
			            $(tel).next('label').addClass('warning');
			            setTimeout(function(){
			                $('label').removeClass('warning')
			            },1500)
			        }
			        else if(!$("input[name=id]").prop("dataValue")){
			        	alert("ID 중복검사가 완료되지 않았습니다.");
						return false;
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
			            $("input[name=compare]").css("background-color", "#B0F6AC");
					} else {
						$(".compare-text").text("불일치!").css("color", "red");
			            $("input[name=compare]").css("background-color", "#FFCECE");						
					}
				});
				
				});
				
				function checkPwd(){
					var reg = /^[a-zA-Z0-9]{8,20}$/;
			        var inputed = $('#pwd').val();
			        var reinputed = $('#pwdCheck').val();
			        var	img1 = document.getElementById('pswd1_img1');
			        var	img2 = document.getElementById('pswd1_img2');
			        if(!reg.test(inputed) && reinputed=="" && (inputed != reinputed || inputed == reinputed)){ //초기화면
			        	img1.src="/resources/images/key4.png";
			        	img2.src="/resources/images/key2.png";
			            $("input[name=pwd]").css("background-color", "#aaaaaa");
			            $("input[name=pwdCheck]").css("background-color", "#FFCECE");
			            console.log("실1행");
			        }else if(reg.test(inputed) && (inputed == reinputed)) { //pwd1이 유효성검사했을때 틀리면
			        	img1.src="/resources/images/key5.png";
			        	img2.src="/resources/images/key3.png";
			            $("input[name=pwd]").css("background-color", "#B0F6AC");
			            $("input[name=pwdCheck]").css("background-color", "#B0F6AC");

			            console.log("실2행");
			        }else if (!reg.test(inputed) && inputed == reinputed) { //pwd1이 유효성검사했을때 틀리면
			        	img1.src="/resources/images/key4.png";
			        	img2.src="/resources/images/key3.png";
			            $("input[name=pwd]").css("background-color", "#aaaaaa");
			            $("input[name=pwdCheck]").css("background-color", "#B0F6AC");
			            console.log("실3행");
			        }else if (reg.test(inputed) && inputed != reinputed) { //pwd1이 유효성검사했을때 틀리면
			        	img1.src="/resources/images/key5.png";
			        	img2.src="/resources/images/key2.png";
			            $("input[name=pwd]").css("background-color", "#B0F6AC");
			            $("input[name=pwdCheck]").css("background-color", "#FFCECE");
			            console.log("실3행");
			        }else if (!reg.test(inputed) && inputed != reinputed) {
			        	img1.src="/resources/images/key4.png";
			        	img2.src="/resources/images/key2.png";
			            $("input[name=pwd]").css("background-color", "#aaaaaa");
			            $("input[name=pwdCheck]").css("background-color", "#FFCECE");
			            console.log("실4행");
			        }
				}
    

    $(document).snowfall({round : true, maxSize : 3});
</script>
</body>

</html>