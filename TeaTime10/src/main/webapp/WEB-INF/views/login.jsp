<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8;" />
<title>TeaTime</title>
<spring:url value="/resources/images/naver.png" var="naver" />
<spring:url value="/resources/images/KakaoTalk_loginbutton.png"   var="kakao" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="stylesheet">
<style>
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
   background-image: url("https://cdn.clien.net/web/api/file/F01/4046296/33b72a4420a04067bca.JPG");
   background-size: 400px;
   background-repeat: repeat;
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

body .container .tabs2 {
	width: 100%;
	margin-bottom: 29px;
	border-bottom: 1px solid #d9d9d9;
}

body .container .tabs2 .tab2 {
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

body .container .tabs2 .tab2 a {
	font-size: 11px;
	text-decoration: none;
	text-transform: uppercase;
	color: #d9d9d9;
	transition: all 0.1s ease-in-out;
}

body .container .tabs2 .tab2.active a, body .container .tabs .tab:hover a
	{
	color: #263238;
}

body .container .tabs2 .tab2.active {
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

body .container .content .find-cont{
	display : none;
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

#register2 {
	display: none;
}

#cat{
	display: none;
}
</style>
<script type='text/javascript'>
window.onload = function () {
	$("#m_id").focus();
	  $("#cat").hide();
}

	function next1() {
		var id = document.getElementById("m_id").value;
		var pw = document.getElementById("m_pw").value;
		var pwchk = document.getElementById("m_pwchk").value;
		var name = document.getElementById("m_name").value;
		var idnum = document.getElementById("m_idnum").value;
		if(!(id==null || id=='')){
			if(pw!=null && pw!=""){
				if(pw==pwchk){
					if(name!=null && name!=""){
						if(idnum!=null && idnum!=""){
							if(idnum.length==6){
								document.getElementById("register1").style.display = "none";
								document.getElementById("register2").style.display = "block"; 
							}else{
								document.getElementById("m_idnum").value="";
								alert("please birthdate input YYMMDD");
							}
						}else{
							alert("please birthdate input YYMMDD");
						}
					}else{
						alert("please name input");
					}
				}else{
					document.getElementById("m_pw").value="";
					document.getElementById("m_pwchk").value="";
					alert("not equals password");
				}
			}else{
				alert("please input password");
			}	
		}else{
			alert("please input id");
		}
	}

	function next2() {
		var gender = $(":input:radio[name=m_gender]:checked").val();
		var tel = document.getElementById("m_tel").value;
		var mail = document.getElementById("m_mail").value;
		var aa = '@';
		
		if(gender!=null && gender!=""){
			if(tel!=null && tel!=""){
				if(mail!=null && mail!=""){
					if(mail.indexOf(aa)!=-1){
						document.getElementById("cat").style.display = "block";
						document.getElementById("register2").style.display = "none";
						$("#cat").show();
					}else{
						alert("not is not a valid email address")
					}
					
				}else{
					alert("please mail input");
				}
			}else{
				alert("please tel input");
			}
		}else{
			alert("please choice gender");
		}
		
		
	}
	
	function pre1() {
		document.getElementById("register1").style.display="block";
		document.getElementById("register2").style.display="none";
		$("#cat").hide();
	}
	function pre2() {
		document.getElementById("register2").style.display="block";
		document.getElementById("register1").style.display="none";
		$("#cat").hide();
	}
	
	function idchk() {
		var idchk = {m_id : $('#m_id').val()}
			$.ajax({
				url:"idchk",
				type:"POST",
				data:idchk,
				dataType: "json",
				cache 	: false,
				success: function(data){
					if (data.result=='ok') {
						if (confirm('Username is available. Do you want to use it?')) {
							
						}else{
							document.getElementById("m_id").value="";
							document.getElementById("m_id").focus();
						}
					}else{
						alert("This ID is already registered.")
						document.getElementById("m_id").value="";
						document.getElementById("m_id").focus();
					}					
				}
		});
	}
	
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
      	 <c:if test="${pwchangeresult=='ok' }">
      	 	<script charset="UTF-8">
      	 		alert("Password Change Success!! Login please!");
      	 	</script>
      	 </c:if>
         <c:if test="${not empty cookie.rememberId  }"><c:set value="checked" var="remember"/> </c:if>
         <section class="container">
            <article class="half">
               <h1>TeaTime</h1>
               <div class="tabs">
                  <span class="tab signin active"><a href="#signin">Sign in</a></span> 
                  <span class="tab signup"><a href="#signup">Sign up</a></span>
                  <span class="tab find"><a href="#find"> Find ID or PW</a></span>
               </div>
               
               <div class="content">
               
                  <div class="signin-cont cont">
                     <form action="loginchk" method="post" name="frm">
                        <label for="email">Your ID</label> 
                        <input type="text" name="id"  class="inpt"
                           required="required" placeholder="Your id" value="${cookie.rememberId.value }"><!-- 12-01추가  -->
                        <label for="password">Your Password</label> 
                        <input type="password" name="pw" id="password" class="inpt" required="required"
                           placeholder="Your password"> 
                        <input type="checkbox" id="remember" class="checkbox" name="remember" ${remember }> <!-- 12-01추가  -->
                        <label for="remember">Remember me</label>
                        <div class="submit-wrap">
                           <input type="submit" value="Sign in" class="submit"> 
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

                  <!-- @@시작@@시작@@시작@@시작@@시작@@시작@@시작@@시작@@시작@@시작@@시작@@시작@@시작@@시작@@시작@@시작@@시작@@시작 -->
                  <div class="signup-cont cont">
					<form action="register_chk" onsubmit="return check_form(this)" id="regform" method="post" enctype="multipart/form-data">
					 	<div id="register1">	
					 		<label for="text">Your ID</label> 
                      		<input type="text" name="m_id" id="m_id" required="required" placeholder="ID Input" class="inpt" onchange="idchk()"> 
                      		<label for="password">Your Password</label> 
                      		<input type="password" name="m_pw" id="m_pw" required="required" placeholder="Password Input" class="inpt"> 
                      		<label for="password">Check Password</label> 
                      		<input type="password" name="m_pkchk" id="m_pwchk" required="required" placeholder="Check Password" class="inpt"> 
                      		<label for="text">Your Name</label> 
                      		<input type="text" name="m_name" id="m_name" required="required" placeholder="Name Input" class="inpt"> 
                      		<label for="text">Your Birthdate</label> 
                      		<input type="text" name="m_idnum" id="m_idnum" required="required" placeholder="ex) 190101" class="inpt"> 
                      		<input type="button" value="Next" onclick="next1()">
                      		
                      	</div>	
                      	<div id="register2">
                      		<label for="text">Your Gender</label><br>
                      		Man<input type="radio" name="m_gender" id="m_gender" value="1" checked="checked">&nbsp;&nbsp;&nbsp;
                      		Woman<input type="radio" name="m_gender" id="m_gender" value="0"><br><br>
                      		<label for="text">Your Tel</label> 
                      		<input type="text" name="m_tel" id="m_tel" placeholder="ex)010-1234-5678" required="required" class="inpt"> 
                      		<label for="email">Your Email</label> 
                      		<input type="email" name="m_mail" id="m_mail" placeholder="ex)abc@teatime.com" required="required" class="inpt"> 
                      		<label for="text">Your Profile Picture</label>
                      		<input type="file" id="profilePic" name="profilePic">
                      		<img id="previewPic" src="${placeholder }" width="50px" height="50px">
                      		<br>
                      		<input type="button" value="Pre" name="pre" onclick="pre1()" >
                      		<input type="button" value="Next" name="next" onclick="next2()" >
                      	</div>	
                      	<div style="overflow: auto; width: 270px; height: 350px;">
							<table class="table2" id="cat" border="1">
								<tr>
									<td>News<br><input type="checkbox" class="check_cate" name="c_news" ></td>
									<td>Sports<br><input type="checkbox" class="check_cate" name="c_sports" ></td>
									<td>Food<br><input type="checkbox" class="check_cate" name="c_food" ></td>
								</tr>
								
								<tr>
									<td>Language<br><input type="checkbox" class="check_cate" name="c_language" ></td>
									<td>People<br><input type="checkbox" class="check_cate" name="c_people" ></td>
									<td>Animal<br><input type="checkbox" class="check_cate" name="c_animal" ></td>
								</tr>
						
								<tr>
									<td>Fashion<br><input type="checkbox" class="check_cate" name="c_fashion" ></td>
									<td>Love<br><input type="checkbox" class="check_cate" name="c_love" ></td>
									<td>Movie<br><input type="checkbox" class="check_cate" name="c_movie" ></td>
								</tr>
								
								<tr>
									<td>Religion<br><input type="checkbox" class="check_cate" name="c_religion" ></td>
									<td>Knowledge<br><input type="checkbox" class="check_cate" name="c_knowledge" ></td>
									<td>Travel<br><input type="checkbox" class="check_cate" name="c_travel" ></td>
								</tr>
								<tr>
									<td>Cartoon<br><input type="checkbox" class="check_cate" name="c_cartoon" ></td>
									<td>Game<br><input type="checkbox" class="check_cate" name="c_game" ></td>
									<td>IT<br><input type="checkbox" class="check_cate" name="c_it" ></td>
								</tr>
								<tr>
									<td>Weather<br><input type="checkbox" class="check_cate" name="c_weather" ></td>
									<td>Music<br><input type="checkbox" class="check_cate" name="c_music" ></td>
									<td>Car<br><input type="checkbox" class="check_cate" name="c_car" ></td>
								</tr>
								<tr>
									<td>Economy<br><input type="checkbox" class="check_cate" name="c_economy" ></td>
									<td>Etc<br><input type="checkbox" class="check_cate" name="c_etc" ></td>
									<td>Job<br><input type="checkbox" class="check_cate" name="c_job" ></td>
								</tr>
								<tr>
									<td>Living<br><input type="checkbox" class="check_cate" name="c_living" ></td>
									<td>Book<br><input type="checkbox" class="check_cate" name="c_book" ></td>
									<td>Festival<br><input type="checkbox" class="check_cate" name="c_festival" ></td>
								</tr>
								<tr>
									<td>Health<br><input type="checkbox" class="check_cate" name="c_health" ></td>
								</tr>
							</table>
						</div>
						<input type="button" value="Pre" name="pre" onclick="pre2()" >
						<input class="regButton" type="submit" name="sub" value="Register">
					</form>
		
                  </div>
                  <!-- @@끝@@끝@@끝@@끝@@끝@@끝@@끝@@끝@@끝@@끝@@끝@@끝@@끝@@끝@@끝@@끝@@끝@@끝@@끝@@끝@@끝@@끝@@끝@@끝@@끝@@끝 -->

                  <div class="find-cont cont" id="find-cont cont">
					
					<div class="tabs2">
						<span class="tab2 idfind active"><a href="#idfinddiv">ID Search</a></span>
						<span class="tab2 pwfind"><a href="#pwfinddiv">password Search</a></span>
					</div>
					
					<div>
						<div class="idfind cont2" id="aaa">
							<form method="post" id="idfind" action="idfind">
								<label for="m_name">Your name</label>
								<input type="text" name="m_name" placeholder="Your name" class="inpt">
								<label for="m_tel">Your tel</label>
								<input type="text" name="m_tel" placeholder="Your phone number or tel" class="inpt">
								<input type="submit" value="Find" class="submit">
							</form>
						</div>
						
						<div class="pwfind cont2" id="bbb">
							<form method="post" id="pwfind" action="pwfind">
								<label for="m_main">Your ID</label>
								<input type="text" name="m_id" placeholder="Your ID" class="inpt">
								<label for="m_main">Your email</label>
								<input type="text" name="m_mail" placeholder="Your email" class="inpt">
								<input type="submit" value="Find" class="submit">
							</form>
						</div>
					</div>	
					
				</div>
               </div> <!-- content div -->
            </article>
            <div class="half bg"></div>
         </section>
      </c:otherwise>
   </c:choose>

<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script type="text/javascript">
$('.tabs .tab').click(function(){
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
    if ($(this).hasClass('find')) {
    	$('.tabs .tab').removeClass('active');
    	$(this).addClass('active');
    	$('.cont').hide();
    	$('.find-cont').show();
    }
});

$('.tabs2 .tab2').click(function(){
	if($(this).hasClass('idfind')) {
	   $('.tabs2 .tab2').removeClass('active');
	   $(this).addClass('active');
	   $('.cont2').hide();
	   $('.idfind').show();
	}	
	if($(this).hasClass('pwfind')) {
	   $('.tabs2 .tab2').removeClass('active');
	   $(this).addClass('active');
	   $('.cont2').hide();
	   $('.pwfind').show();
	}	
});

$('.container .bg').mousemove(function(e){
    var amountMovedX = (e.pageX * -1 / 30);
    var amountMovedY = (e.pageY * -1 / 9);
    $(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
});


$(function() {
    $("#profilePic").on('change', function(){
        
        readURL(this);
    });
});


function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
            $('#previewPic').attr('src', e.target.result);
        }
      reader.readAsDataURL(input.files[0]);
    }
}

function check_form() {
    $(".check_cate").each(function () {
        if ($(this).is(":checked")) {
            $(this).val("Y");
        }else{
        		var cat_name = $(this).attr("name");
     	   $("#regform").append("<input type='hidden' name='"+cat_name+"' value='N'>");
     	  // console.log(cat_name);
        }
    	});
 	//실행할때 지우기
}


</script>
</body>
</html>