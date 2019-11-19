<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <spring:url value="/resources/images/placeholder.jpg" var="placeholder" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<style>
#cat {
	text-align: center;
  	animation-duration: 0.8s;
  	animation-name: slidein;
	}

@keyframes slidein {
  from {
    margin-left: 200px;
    opacity: 0;
   
  }

  to {
    margin-left: -250px;
    opacity: 1;
  }
}

<%--###########################--%>
 
   .table2{
   	border:1px solid #fff;
   	  border-radius: 10%;
      position:absolute;
      top:55%;
      left:50%;
      width:700px;
      height:700px;
      
      margin-top: -350px;
      margin-left: -350px;
   }
   .table2 td{
   	border-radius: 10%;
   	 width:200px;
   	background-color: white;
   }
   
   
   .div	{
	height: 1000px;
   }
  
   .table1{
      position:absolute;
      top:55%;
      left:50%;
      width:700px;
      height:700px;
      margin-top: -350px;
      margin-left: -350px;
   }
   
   tr{
     
      width: 500px; height: 70px;
   }
   
   
   .regButton {
   	width:400px;
   	height:60px;
	box-shadow: 0px 10px 14px -7px #3e7327;
	background:linear-gradient(to bottom, #77b55a 5%, #72b352 100%);
	background-color: #86E57F;
	border-radius:4px;
	border:1px solid #4b8f29;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:13px;
	font-weight:bold;
	padding:6px 12px;
	text-decoration:none;
	text-shadow:0px 1px 0px #5b8a3c;
	}
	.regButton:hover {
		background:linear-gradient(to bottom, #72b352 5%, #77b55a 100%);
		background-color:#72b352;
	}
	.regButton:active {
		position:relative;
		top:1px;
	}
	   
</style>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<c:set var="list" value="${id_list }"/>
<jsp:useBean id="dao" class="com.care.modelDAO.ModelDAO"/>
<script type="text/javascript">
	window.onload = function () {
		$("#m_id").focus();
		  $("#cat").hide();
	}
	
	function reg_chk(){
		
		var id = document.getElementById("m_id").value;
		var pw = document.getElementById("m_pw").value;
		var pwchk = document.getElementById("m_pwchk").value;
		var name = document.getElementById("m_name").value;
		var idnum = document.getElementById("m_idnum").value;
		var gender = $(":input:radio[name=m_gender]:checked").val();
		var tel = document.getElementById("m_tel").value;
		var mail = document.getElementById("m_mail").value;
		
				
		if(!(id==null || id=='')){
					if(pw!=null && pw!=""){
						if(pw==pwchk){
							if(name!=null && name!=""){
								if(idnum!=null && idnum!=""){
									if(idnum.length==6){
										if(gender!=null && gender!=""){
											if(tel!=null && tel!=""){
												if(mail!=null && mail!=""){
													$("#meminfo").hide();
													$("#cat").show();
												}else{
													alert("메일주소를 입력하세요");
												}
											}else{
												alert("전화번호를 입력하세요");
											}
										}else{
											alert("성별을 입력하세요");
										}
									}else{
										document.getElementById("m_idnum").value="";
										alert("주민등록번호 앞 6자리를 정확하게 입력하세요");
									}
								}else{
									alert("생년월일을 입력하세요");
								}
							}else{
								alert("이름을 입력하세요");
							}
						}else{
							document.getElementById("m_pw").value="";
							document.getElementById("m_pwchk").value="";
							alert("비밀번호가 일치하지 않습니다.");
						}
					}else{
						alert("비밀번호를 입력하세요");
					}	
		}else{
			alert("아이디를 입력하세요");
		}
	}
	
	
</script>

<script type="text/javascript">
    
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
    </script>

</head>
<body>
<jsp:include page="/WEB-INF/views/header/l_header.jsp"/>
<div>
	<form action="register_chk" onsubmit="return check_form(this)" id="regform" method="post" enctype="multipart/form-data">
		<div class="div">
			<table border="1" class="table1" id="meminfo">
				<tr>
					<td><font size="4em">아이디</font></td><th><input type="text" name="m_id" id="m_id" placeholder="아이디를 입력하세요" style="width: 300px; height: 60px;"></th>
				</tr>
				<tr>
					<td><font size="4em">비밀번호</font></td><th><input type="password" name="m_pw" id="m_pw" placeholder="비밀번호를 입력하세요" style="width: 300px; height: 60px;"></th>
				</tr>
				<tr>
					<td><font size="4em">비밀번호 확인</font></td><th><input type="password" name="m_pkchk" id="m_pwchk" placeholder="비밀번호를 다시입력하세요" style="width: 300px; height: 60px;"></th>
				</tr>
				<tr>
					<td><font size="4em">이름</font></td><th><input type="text" name="m_name" id="m_name" placeholder="이름을 입력하세요" style="width: 300px; height: 60px;"></th>
				</tr>
				<tr>
					<td><font size="4em">생년월일</font></td><th><input type="text" name="m_idnum" id="m_idnum" placeholder="주민번호 앞 6자리를 입력하세요" style="width: 300px; height: 60px;"></th>
				</tr>
				<tr>
					<td><font size="4em">성별</font></td><td align="center"><font size="3em">남성</font><input type="radio" name="m_gender" id="m_gender" value="1"><font size="3em">여성</font><input type="radio" name="m_gender" id="m_gender" value="0"></td>
				</tr>
				<tr>
					<td><font size="4em">전화번호</font></td><th><input type="text" name="m_tel" id="m_tel" placeholder="전화번호를 입력하세요" style="width: 300px; height: 60px;"></th>
				</tr>
				<tr>
					<td><font size="4em">이메일</font></td><th><input type="text" name="m_mail" id="m_mail" placeholder="이메일을 입력하세요" style="width: 300px; height: 60px;"></th>
				</tr>
				<tr>
					<td align="center"><font size="4em">프로필 사진</font><br><input type="file" id="profilePic" name="profilePic"></td>
					<td align="center"><img id="previewPic" src="${placeholder }" width="300px" height="300px"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center "><input class="regButton" type="button" value="다음" name="next" onclick="reg_chk()" ></td>
				</tr>
			</table>
		</div>
		
		<table class="table2" id="cat" border="1">
			<tr>
				<td>뉴스<br><input type="checkbox" class="check_cate" name="c_news" ></td>
				<td>스포츠<br><input type="checkbox" class="check_cate" name="c_sports" ></td>
				<td>음식<br><input type="checkbox" class="check_cate" name="c_food" ></td>
				<td>언어<br><input type="checkbox" class="check_cate" name="c_language" ></td>
				<td>인물<br><input type="checkbox" class="check_cate" name="c_people" ></td>
			</tr>
			
			<tr>
				<td>동물<br><input type="checkbox" class="check_cate" name="c_animal" ></td>
				<td>패션<br><input type="checkbox" class="check_cate" name="c_fashion" ></td>
				<td>연애<br><input type="checkbox" class="check_cate" name="c_love" ></td>
				<td>영화<br><input type="checkbox" class="check_cate" name="c_movie" ></td>
				<td>종교<br><input type="checkbox" class="check_cate" name="c_religion" ></td>
			</tr>
	
			<tr>
				<td>지식<br><input type="checkbox" class="check_cate" name="c_knowledge" ></td>
				<td>여행<br><input type="checkbox" class="check_cate" name="c_travel" ></td>
				<td>만화<br><input type="checkbox" class="check_cate" name="c_cartoon" ></td>
				<td>게임<br><input type="checkbox" class="check_cate" name="c_game" ></td>
				<td>IT<br><input type="checkbox" class="check_cate" name="c_it" ></td>
			</tr>
			
			<tr>
				<td>날씨<br><input type="checkbox" class="check_cate" name="c_weather" ></td>
				<td>음악<br><input type="checkbox" class="check_cate" name="c_music" ></td>
				<td>자동차<br><input type="checkbox" class="check_cate" name="c_car" ></td>
				<td>경제<br><input type="checkbox" class="check_cate" name="c_economy" ></td>
				<td>기타<br><input type="checkbox" class="check_cate" name="c_etc" ></td>
			</tr>
			
			<tr>
				<td>Job<br><input type="checkbox" class="check_cate" name="c_job" ></td>
				<td>리빙<br><input type="checkbox" class="check_cate" name="c_living" ></td>
				<td>도서<br><input type="checkbox" class="check_cate" name="c_book" ></td>
				<td>축제<br><input type="checkbox" class="check_cate" name="c_festival" ></td>
				<td>건강<br><input type="checkbox" class="check_cate" name="c_health" ></td>
			</tr>
			<tr>
				<td colspan="5" style="text-align: center;">
				<input class="regButton" type="submit" name="sub" value="회원가입">
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
<script>
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
</html>