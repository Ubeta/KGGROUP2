<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>TeaTime</title>
<spring:url value="/resources/images/naver.png" var="naver" />
<spring:url value="/resources/images/KakaoTalk_loginbutton.png"   var="kakao" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style rel="stylesheet">
@charset "UTF-8";

@import url(https://fonts.googleapis.com/css?family=Lato:400,700);

* {
   -moz-box-sizing: border-box;
   -webkit-box-sizing: border-box;
   box-sizing: border-box;
}

body {
   font-family: 'Lato', sans-serif;
   background-color: #f8f8f8;
}

body .container {
   position: relative;
   overflow: hidden;
   width: 700px;
   height: 600px;
   margin: 80px auto 0;
   background-color: #ffffff;
   -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
   -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
   box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
}

body .container .half {
   float: left;
   width: 50%;
   height: 100%;
   padding: 58px 40px 0;
}

body .container .half.bg {
   background-image: url("http://www.blueb.co.kr/SRC2/_image/v01.jpg");
   background-size: 500px;
   background-repeat: no-repeat;
}

body .container h1 {
   font-size: 18px;
   font-weight: 700;
   margin-bottom: 23px;
   text-align: center;
   text-indent: 6px;
   letter-spacing: 7px;
   text-transform: uppercase;
   color: #263238;
}

body .container .tabs {
   width: 100%;
   margin-bottom: 29px;
   border-bottom: 1px solid #d9d9d9;
}

body .container .tabs .tab {
   display: inline-block;
   margin-bottom: -1px;
   padding: 20px 15px 10px;
   cursor: pointer;
   letter-spacing: 0;
   border-bottom: 1px solid #d9d9d9;
   -moz-user-select: -moz-none;
   -ms-user-select: none;
   -webkit-user-select: none;
   user-select: none;
   transition: all 0.1s ease-in-out;
}

body .container .tabs .tab a {
   font-size: 11px;
   text-decoration: none;
   text-transform: uppercase;
   color: #d9d9d9;
   transition: all 0.1s ease-in-out;
}

body .container .tabs .tab.active a, body .container .tabs .tab:hover a
   {
   color: #263238;
}

body .container .tabs .tab.active {
   border-bottom: 1px solid #263238;
}

body .container .content form {
   position: relative;
   height: 600px;
}

body .container .content label:first-of-type, body .container .content input:first-of-type,
   body .container .content .more:first-of-type {
   -moz-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
   -webkit-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
   animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
}

body .container .content label:nth-of-type(2), body .container .content input:nth-of-type(2),
   body .container .content .more:nth-of-type(2) {
   -moz-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
   -webkit-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
   animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
}

body .container .content label:nth-of-type(3), body .container .content input:nth-of-type(3),
   body .container .content .more:nth-of-type(3) {
   -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
   -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
   animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}

body .container .content label {
   font-size: 12px;
   color: #263238;
   -moz-user-select: -moz-none;
   -ms-user-select: none;
   -webkit-user-select: none;
   user-select: none;
}

body .container .content label:not
([for='remember'])
{display:none;}
body .container .content input.inpt {
   font-size: 14px;
   display: block;
   width: 100%;
   height: 42px;
   margin-bottom: 12px;
   padding: 16px 13px;
   color: #999999;
   border: 1px solid #d9d9d9;
   background: transparent;
   -moz-border-radius: 2px;
   -webkit-border-radius: 2px;
   border-radius: 2px;
}

body .container .content input.inpt::-webkit-input-placeholder {
   font-size: 14px;
   color: #999999;
   font-family: 'Lato', sans-serif;
}

body .container .content input.inpt:-moz-placeholder {
   font-size: 14px;
   color: #999999;
   font-family: 'Lato', sans-serif;
}

body .container .content input.inpt::-moz-placeholder {
   font-size: 14px;
   color: #999999;
   font-family: 'Lato', sans-serif;
}

body .container .content input.inpt:-ms-input-placeholder {
   font-size: 14px;
   color: #999999;
   font-family: 'Lato', sans-serif;
}

body .container .content input.inpt:focus {
   border-color: #999999;
}

body .container .content input.submit {
   font-size: 12px;
   line-height: 42px;
   display: block;
   width: 100%;
   height: 42px;
   cursor: pointer;
   vertical-align: middle;
   letter-spacing: 2px;
   text-transform: uppercase;
   color: #263238;
   border: 1px solid #263238;
   background: transparent;
   -moz-border-radius: 2px;
   -webkit-border-radius: 2px;
   border-radius: 2px;
}

body .container .content input.submit:hover {
   background-color: #263238;
   color: #ffffff;
   -moz-transition: all 0.2s;
   -o-transition: all 0.2s;
   -webkit-transition: all 0.2s;
   transition: all 0.2s;
}

body .container .content input:focus {
   outline: none;
}

body .container .content .checkbox {
  margin-top: 4px;
  overflow: hidden;
  clip: rect(0 0 0 0);
  width: 0;
  height: 0;
  margin: 17px -1px;
  padding: 0;
  border: 0;
}
body .container .content .checkbox + label {
  vertical-align: middle;
  display: inline-block;
  width: 50%;
}
body .container .content .checkbox + label:before {
  content: "\A";
  color: #999999;
  font-family: Verdana;
  font-weight: bold;
  font-size: 8px;
  line-height: 10px;
  text-align: center;
  display: inline-block;
  vertical-align: middle;
  position: relative;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  background: transparent;
  border: 1px solid #d9d9d9;
  width: 11px;
  height: 11px;
  margin: -2px 8px 0 0;
}
body .container .content .checkbox:checked + label:before {
  content: "V";
}

body .container .content .submit-wrap {
   width: 100%;
}

body .container .content .submit-wrap a {
   font-size: 12px;
   display: block;
   margin-top: 20px;
   text-align: center;
   text-decoration: none;
   color: #999999;
}

body .container .content .submit-wrap a:hover {
   text-decoration: underline;
}

body .container .content .signup-cont {
   display: none;
}

@
keyframes slideIn { 0% {
   filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
   opacity: 0;
   margin-left: -320px;
}

100%
{
filter




:


 


progid




:DXImageTransform




.Microsoft




.Alpha




(
enabled


=
false
);



    


opacity




:


 


1;
margin-left




:


 


0
px




;
}
}
@
-webkit-keyframes slideIn { 0% {
   filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
   opacity: 0;
   margin-left: -320px;
}

100%
{
filter




:


 


progid




:DXImageTransform




.Microsoft




.Alpha




(
enabled


=
false
);



    


opacity




:


 


1;
margin-left




:


 


0
px




;
}
}
.credits {
   display: block;
   position: absolute;
   right: 0;
   bottom: 0;
   color: #999999;
   font-size: 14px;
   margin: 0 10px 10px 0;
}

.credits a {
   filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=80);
   opacity: 0.8;
   color: inherit;
   font-weight: 700;
   text-decoration: none;
}
</style>
<script type='text/javascript'>
   function kakaologin() {

      //<![CDATA[
      // 사용할 앱의 JavaScript 키를 설정해 주세요.
      var id = null;
      var nickname = null;
      Kakao.init('b650720b5095783f10df72e812329f99');
      Kakao.Auth.loginForm({
         success : function(authObj) {
            Kakao.API.request({
               url : '/v2/user/me',
               success : function(res) {
                  aaa = JSON.stringify(res);
                  id = res.id;
                  nickname = res.properties.nickname;
                  location.href = "kakao_loginchk?id=" + id;
               },
               fail : function(errorObj) {
                  alert(JSON.stringify(error));
               }
            })
         }

      });
   }
</script>
</head>
<body>
   <c:choose>
      <c:when test="${mid != null}">
         <script>
            location.href = "main";
         </script>
      </c:when>
      <c:otherwise>
      <!-- 12-01추가  -->
         <c:if test="${not empty cookie.rememberId  }"><c:set value="checked" var="remember"/> </c:if>
         <section class="container">
            <article class="half">
               <h1>TeaTime</h1>
               <div class="tabs">
                  <span class="tab signin active"><a href="#signin">Sign
                        in</a></span> <span class="tab signup"><a href="register">Sign
                        up</a></span>
               </div>
               <div class="content">
                  <div class="signin-cont cont">
                     <form action="loginchk" method="post" name="frm">
                        <label for="email">Your ID</label> 
                        <input type="text" name="id" id="email" class="inpt"
                           required="required" placeholder="Your id" value="${cookie.rememberId.value }"><!-- 12-01추가  -->
                        <label for="password">Your Password</label> 
                        <input type="password" name="pw" id="password" class="inpt" required="required"
                           placeholder="Your password"> 
                        <input type="checkbox" id="remember" class="checkbox" name="remember" ${remember }> <!-- 12-01추가  -->
                        <label for="remember">Remember me</label>
                        <div class="submit-wrap">
                           <input type="submit" value="Sign in" class="submit"> 
                              <a href="#" class="more">Forgot your password?</a> //<!-- 패스워드 찾기   -->
                        </div>
                        <br>
                        <div id="naver_id_login">
                           <a href="${url}"> <img width="270" height="42"
                              src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
                        </div>
                        <div>
                           <a href="javascript:kakaologin();"><img width="270" height="42"
                              src="${kakao }"></a>
                        </div>
                     </form>
                  </div>
                  <div class="signup-cont cont"></div>
               </div>
            </article>
            <div class="half bg"></div>
         </section>
      </c:otherwise>
   </c:choose>

<script
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
   <script type="text/javascript">
      $('.tabs .tab').click(function() {
         if ($(this).hasClass('signin')) {
            $('.tabs .tab').removeClass('active');
            $(this).addClass('active');
            $('.cont').hide();
            $('.signin-cont').show();
         }
         if ($(this).hasClass('signup')) {
            $('.tabs .tab').removeClass('active');
            $(this).addClass('active');
            $('.cont').hide();
            $('.signup-cont').show();
         }
      });
      $('.container .bg').mousemove(
            function(e) {
               var amountMovedX = (e.pageX * -1 / 30);
               var amountMovedY = (e.pageY * -1 / 9);
               $(this).css('background-position',
                     amountMovedX + 'px ' + amountMovedY + 'px');
            });
   </script>
</body>
</html>