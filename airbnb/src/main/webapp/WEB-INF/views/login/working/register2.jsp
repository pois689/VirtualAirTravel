<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 : 회원가입</title>
<link rel="stylesheet" href="/resources/css/login/new_reg2.css">
<script src="https://www.google.com/recaptcha/api.js"></script>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script src="/resources/js/snowfall.jquery.js"></script>
<script>
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
            

            
          </script>
</head>
<body>
 <!-- header -->
         <div id="header">

        </div>

        <!-- wrapper -->
        <div id="wrapper">

            <!-- content-->
            <div id="content">
                
                
                <div id="logo">
                    <h1>Virtual Air Travel</h1>
                </div>

                <form action="/login/registerMember" class="join_form" name="regForm" method="post">
                <!-- ID -->
                <div>
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" name="id" id="id" class="int" maxlength="20">
                        <input type="button" value="ID 중복검사" onclick="checkId()" class="checkid">
                        <span class="step_url"></span>
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="text" name="pswd1" id="pswd1" class="int" maxlength="20">
                        <span id="alertTxt">사용불가</span>
                        <img src="/resources/image/key1.png" id="pswd1_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box" ></span>
                </div>

                <!-- PW2 -->
                <div>
                    <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="text" name="pwd" id="pswd2" class="int" maxlength="20">
                        
                        <img src="/resources/image/key2.png" id="pswd2_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" name="name" id="name" class="int" maxlength="20">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- EMAIL -->
                <div>
                    <h3 class="join_title"><label for="email">본인확인 이메일<span class="optional">(중요)</span></label></h3>
                    <span class="box int_email">
                        <input type="text" name="email" id="email" class="int" maxlength="100" placeholder="필수입력">
                    </span>
                    <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>    
                </div>

                <!-- MOBILE -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" name="tel" id="tel" class="int" maxlength="16" placeholder="전화번호 입력">
                    </span>
                    <span class="error_next_box"></span>    
                </div>
                <!-- <button class="g-recaptcha" 
                data-sitekey="reCAPTCHA_site_key" 
                data-callback='onSubmit' 
                data-action='submit'>Submit</button> -->

                <!-- JOIN BTN-->
                <div class="btn_area">
                    <button type="submit" id="btnJoin">
                        <span>가입하기</span>
                    </button>
        
                </div>
                </form>
                <button class="btn-toggle">Toggle Dark-Mode</button>

            </div> 
            <!-- content-->

        </div> 
        <!-- wrapper -->
    <script src="/resources/js/main.js"></script>
    <script>
        $(document).snowfall({round : true, maxSize : 3});
        
        const btn = document.querySelector(".btn-toggle");

        const currentTheme = localStorage.getItem("theme");
        if (currentTheme == "dark") {
          document.body.classList.add("dark-theme");
        }

        btn.addEventListener("click", function () {
          document.body.classList.toggle("dark-theme");

          let theme = "light";
          if (document.body.classList.contains("dark-theme")) {
            theme = "dark";
          }
          localStorage.setItem("theme", theme);
        });
    </script>
</body>
</html>