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
                    <a href="/index"><h1>개인정보 수정</h1></a>
                </div>

                <form action="/login/member_edit" name="regForm" method="POST">
                <!-- ID -->
                <div>
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" name="id" id="id" class="int" maxlength="20" value="${user.id}">
                        <input type="button" value="수정" onclick="checkId()" class="checkid">
                        <span class="step_url"></span>
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" name="name" class="int" maxlength="20" value="${user.name}">
                        <input type="button" value="수정" onclick="checkId()" class="checkid">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- EMAIL -->
                <div>
                    <h3 class="join_title"><label for="email">본인확인 이메일<span class="optional">(중요)</span></label></h3>
                    <span class="box int_email">
                        <input type="text" name="email" id="email" class="int" maxlength="100" placeholder="필수입력" value="${user.email}">
                        <input type="button" value="수정" onclick="checkId()" class="checkid">
                    </span>
                    <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>    
                </div>

                <!-- MOBILE -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" id="mobile" class="int" maxlength="16" placeholder="전화번호 입력" value="${user.tel}">
                        <input type="button" value="수정" onclick="checkId()" class="checkid">
                    </span>
                    <span class="error_next_box"></span>    
                </div>
                
                <!-- 주소 -->
                <div>
                    <h3 class="join_title"><label for="address">주소</label></h3>
                    <span class="box int_mobile">
                        <input type="text" id="address" class="int" maxlength="16" placeholder="주소입력">
                        <input type="button" value="수정" onclick="checkId()" class="checkid">
                    </span>
                    <span class="error_next_box"></span>    
                </div>
                <!-- <button class="g-recaptcha" 
                data-sitekey="reCAPTCHA_site_key" 
                data-callback='onSubmit' 
                data-action='submit'>Submit</button> -->

                <!-- JOIN BTN-->
                <div class="btn_area">
                    <button type="button" id="btnJoin" onclick="checkId()">
                        <span>수정하기</span>
                    </button>
                     <button type="button" id="btnJoin2" onclick="checkId()">
                        <span>비밀번호 변경하기</span>
                    </button>
                </div>
                </form>
                

            </div> 
            <!-- content-->

        </div> 
        <!-- wrapper -->
        
    <script>
        $(document).snowfall({round : true, maxSize : 3});
    </script>
    
    </body>
</html>