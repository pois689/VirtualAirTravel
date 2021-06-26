<%@ page language="java" contentType="text/html; charset=EUC-KR"   pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 
<head>
    <script type="text/javascript" src="/resources/js/naveridlogin_js_sdk_2.0.2.js"></script>
    <script src="/resources/js/snowfall.jquery.js"></script>
</head>
 
<body>
    
</body>
<!-- NAVER API -->
<script type="text/javascript">
var naverLogin = new naver.LoginWithNaverId(
	{
		clientId: "E68ohfVFivN9KQZJTFIx",
		callbackUrl: "http://localhost:8090/login/callback",
		isPopup: true /* 팝업을 통한 연동처리 여부 */
	}		
);

naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var id			= naverLogin.user.getId();
			var nm			= naverLogin.user.getName();
			var gender		= naverLogin.user.getGender();
			var birthday	= naverLogin.user.getBirthday();
			var email		= naverLogin.user.getEmail();
			
			var isRequire = true;
			if(nm == 'undefined' || nm == null || nm == '') {
				alert('이름은 필수 정보입니다. 정보제공을 동의해주세요.');
				isRequire = false;
			} else if(email == 'undefined' || email == null || email == '') {
				alert('이메일은 필수 정보입니다. 정보제공을 동의해주세요.');
				isRequire = false;
			}
			
			if(isRequire == false) {
				naverLogin.reprompt(); // 필수정보를 얻지 못 했을 때 다시 정보제공 동의 화면으로 이동
				return;	
			}
			
			window.opener.document.loginForm.method = "post";
			window.opener.document.loginForm.action = "joinSimple.html"
			window.opener.document.loginForm.submit();
			window.close();
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});
});
</script>
</html>


