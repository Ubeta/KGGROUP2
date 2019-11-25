<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
	      body {
	      	overFlow : auto;
	         width: 100%;
	         height: 100%;
	         margin: 0px;
	         padding: 0px;
	      }
	      
	      .pagewrap{
	         width: 100%;
	         height: 100%;
	      }
	      .bodywrap{
	         width: 1900px;
	         height: 1000px;
	         border: 1px solid red;
	      }
	      .left{
	         float: left;
	         width: 19%;
	         height: 100%;
	         border: 1px solid blue;
	      }
	      .center{
	         float: left;
	         width: 60%;
	         height: 100%;
	         border: 1px solid yellow;
	         margin-bottom: 30px;
	      }
	      .right{
	         float: left;
	         width: 19%;
	         height: 100%;
	         border: 1px solid green;
	      }
	      .my_info_btn{
	      	background-color: red;
	      	margin-left: 20px;
	      	margin-top: 30px;
	      	margin-right: 20px;
	      	text-align: center;
	      }
	      
	      .my_info_btn button{
	      	width: 300px;
	      	height: 30px;
	      }
	      
	      .my_info{
	      	background-color: lightgreen;
	      	margin-left: 20px;
	      	margin-top: 30px;
	      	margin-right: 20px;
	      	text-align: center;
	      }
	      .my_info input[type="text"] {
	      	width: 300px;
	      	height: 30px;
	      }
	      
	      .my_cat{
	      	background-color: lightgreen;
	      	margin-left: 20px;
	      	margin-top: 30px;
	      	margin-right: 20px;
	      	text-align: center;
	      }
	      .my_cat table{
	      	margin-left: auto;
	      	margin-right: auto;
	      	margin-bottom: 20px;
	      }
	      
	      .f_find{
	      	background-color: lightblue;
	      	margin-left: 10px;
	      	margin-top: 20px;
	      	margin-right: 10px;
	      	text-align: center;
	      }
	      
	      .f_info{
	      	background-color: lightblue;
	      	text-align: center;
	      }
	      
	      
	      .w_board{
	      	background-color: green;
	      	margin-left: 10px;
	      	margin-right: 10px;
	      }
	      .write_board{
	      	background-color: lightblue;
	      	margin: 10px;
	      	text-align: center;
	      }
	      .write_board table{
	      	margin-left: auto;
	      	margin-right: auto;
	      }
	      
	      .board{
	      	background-color: lightyellow;
	      	height: 650px;
	      	margin-left: 10px;
	      	margin-right: 10px;
	      	margin-bottom: 50px;
	      }
	      .board table{
	      	margin-left: auto;
	      	margin-right: auto;
	      	margin-bottom: 50px;
	      }
	      .add{
		      width: 100%;
		      background-color: gray;
		      height: 400px;
		      border-top: 1px solid black;
		      margin-bottom: 50px;
	      }
	      .add table{
		      width: 100%;
		      background-color: gray;
		      height: 300px;
		      border-top: 1px solid black;
		      margin-bottom: 50px;
	      }
	      
	</style>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<jsp:useBean id="dao" class="com.care.modelDAO.ModelDAO"/>
	
	<script type="text/javascript">
		window.onload = function(){
			setTimeout (function(){
				scrollTo(0,0);
			},100);
		}	
	
	
		$(document).ready(function() {
		       $('.my_info_btn').show(); 
		       $('.my_info').hide(); 
		       $('.my_info_btn').click(function(){ 
		       $ ('.my_info_btn').hide(); 
		       $ ('.my_info').show();
		       return false;
		     }); 
		});
		
	    $(window).scroll(function() {
	    	if ($(window).scrollTop() == $(document).height() - $(window).height()) {
	        	$.ajax({
					url:"boardlist",
					type:"POST",
					dataType: "json",
					cache 	: false,
					success: function(data){
						console.log(data);
						if(data.chk=="true"){
							
					    var id = data.boardlist.m_id;
				    	var title = data.boardlist.p_title;
				    	var cat = data.boardlist.p_cat;
				    	var hash = data.boardlist.p_hash;
				    	var content = data.boardlist.p_content;
				    	var img = data.boardlist.p_img;
				    	var date = data.boardlist.p_date;
				    	
				    	$(".add").append("<table border='1'>"+
				    			"<tr><td>아이디</td><td>"+id+"</td></tr>"+
				    			"<tr><td>제목</td><td>"+title+"</td></tr>"+
				    			"<tr><td>카테고리</td><td>"+cat+"</td></tr>"+
				    			"<tr><td>해시</td><td>"+hash+"</td></tr>"+
				    			"<tr><td>내용</td><td>"+content+"</td></tr>"+
				    			"<tr><td>사진</td><td>"+img+"</td></tr>"+
				    			"<tr><td>작성날자</td><td>"+date+"</td></tr>"+
				    			"</table>");
						
						}else if(data.chk=="false"){
							alert("마지막 글입니다.")
						}
					},
					error:function(){
						alert("에러.")
					}
				});
	          
	
	        }
	    });
	    
	    
	    function my_info(){
			$.ajax({
				url:"my_info",
				type:"POST",
				dataType: "json",
				cache 	: false,
				success: function(data){
					$('#my_id').val(data.memdto.m_id);
					$('#my_name').val(data.memdto.m_name);
					$('#my_idnum').val(data.memdto.m_idnum);
					var gender=null;
					if(data.memdto.m_gender==1){
						gender="남자";
					}else{
						gender="여자";
					}
					$('#my_gender').val(gender);
					$('#my_tel').val(data.memdto.m_tel);
					$('#my_mail').val(data.memdto.m_mail);
				},
				error:function(){
					alert("문제가 발생 하였습니다.")
				}
			});
		}
		
		function user_find(){
			var m_id = $('#m_id').val();
			var form = {
					m_id : m_id
			}
			$.ajax({
				url:"user_find",
				type:"POST",
				data: form,
				dataType: "json",
				cache 	: false,
				success: function(data){
					$('#td_id').text(data.dto.m_id);
					$('#td_name').text(data.dto.m_name);
					$('#td_tel').text(data.dto.m_tel);
					
				},
				error:function(){
					alert("문제가 발생 하였습니다.")
				}
			});
		}
		function enter(){
			$('.user_find').keypress(function(e) { 
				if (e.keyCode == 13){
					user_find();
			    }    
			});
		}
		
		function friend_add(){
			var f_id = $('#td_id').text();
			var form = {
					f_id : f_id
			}
			console.log(form);
			$.ajax({
				url:"friend_add",
				type:"POST",
				data: form,
				cache 	: false,
				dataType: "json",
				success: function(data){
					console.log(data)
					if(data.chk == 0){
						alert("이미 친구목록에 있는 아이디 입니다.")
					}else if(data.chk == 1){
						alert("자기 자신은 추가 할 수 없습니다.")
					}else if(data.chk == 2){
						alert("친구 추가 성공.")	
					}
					
				},
				error:function(){
					alert("문제가 발생 하였습니다.")
				}
			});
		}
		
		function write_board(){
			var session_id = "1";
			var p_cat = $("#p_cat option:selected").val();
			var p_hash = $('#p_hash').val();
			var p_title = $('#p_title').val();
			var p_content =  $('#p_content').val();
			var p_img = $('#p_img').val();
			var p_scope = $('#p_scope').val();
			var form = {
					m_id : session_id,
					p_cat : p_cat,
					p_hash : p_hash,
					p_title : p_title,
					p_content : p_content,
					p_img : p_img,
					p_scope : p_scope,
			}
			console.log(form);
			$.ajax({
				url:"write_board",
				type:"POST",
				data: form,
				cache 	: false,
				success: function(data){
					alert("글 작성 완료.")
					location.href='mypage';
				},
				error:function(){
					alert("문제가 발생 하였습니다.")
				}
			});
		}
		
	</script>
</head>
<body>
<c:set var="my_catlist" value="${mycat }"/>
<div class="pagewrap">
<jsp:include page="/WEB-INF/views/header/my_header.jsp"/>
   <div class="bodywrap">
      <div class="left">
      	<div class="my_info_btn">
      		<button onclick="my_info()">내 정보 확인 및 수정</button>
      	</div>
         <div class="my_info">
         	<h3>내정보 수정</h3>
         	<form action="fix_myinfo" method="post">
         		<input type="hidden" id="my_id" name="my_id" ><br>
	         	<img alt="my_pic" src=""><br>
	         	<input type="text" id="my_name" name="my_name" ><br>
	         	<input type="text" id="my_tel" name="my_tel" ><br>
	         	<input type="text" id="my_mail" name="my_mail" ><br>
	         	<input type="submit" value="Fix" style="width: 200px; height: 40px;">
         	</form>
         </div>
         <div class="my_cat">
         	<h3>내 카테고리 리스트</h3>
         	<table border="1">
         		<tr>
         			<td>테스트</td>
         			<td>${my_catlist.c_sports }</td>
         		</tr>
         	</table>
         </div>
      </div>
      <div class="center">
         <div class="w_board">
         	<h4>게시글 작성</h4>
         	<div class="write_board">
         		<table border="1">
					<tr>
						<td>
							<select id="p_cat" name="category">
								<option value="" selected data-defaul>카테고리선택</option>
							    <option value="news">뉴스</option>		<option value="sports">스포츠</option>	<option value="food">음식</option>	<option value="language">언어</option>	<option value="people">인물</option>
								<option value="animal">동물</option>		<option value="fashion">패션</option>		<option value="love">연애</option>	<option value="movie">영화</option>		<option value="religion">종교</option>
								<option value="knowledge">지식</option>	<option value="travel">여행</option>		<option value="cartoon">만화</option>	<option value="game">게임</option>		<option value="it">IT</option>
								<option value="weather">날씨</option>		<option value="music">음악</option>		<option value="car">자동차</option>	<option value="economy">경제</option>		<option value="etc">기타</option>
							    <option value="job">직업</option>			<option value="living">리빙</option>   	<option value="book">도서</option>	<option value="festival">축제</option>	<option value="health">건강</option>
							</select>
						</td>
						<td>해시태그</td><td colspan="2"><input type="text" id="p_hash" placeholder="해시태그 입력"></td>
					</tr>
					<tr>
						<td>제목</td><td colspan="3"><input type="text" id="p_title"></td>
					</tr>
					<tr>
						<td colspan="4"><input type="text" id="p_content" placeholder="글내용"></td>
					</tr>
					<tr>
						<td><input type="button" id="p_img" value="사진첨부"></td><td colspan="3">공개범위<select id="p_scope" name="scope"><option value="0">나만보기</option><option value="1">친구공개</option><option value="2">전체공개</option></select></td>
					</tr>
					<tr>
						<td colspan="4"><input type="button" value="작성완료" onclick="write_board()"></td>
					</tr>
				</table>
         	</div>
         </div>
         <hr>
         <div class="board">
         	<h4>게시글 </h4>
	         		<div class="add">
	         		<c:set var="list" value="${boardlist.get(0) }"/>
	         			<table border='1'>
				    			<tr><td>아이디</td><td>${list.m_id }</td></tr>
				    			<tr><td>제목</td><td>${list.p_title }</td></tr>
				    			<tr><td>카테고리</td><td>${list.p_cat }</td></tr>
				    			<tr><td>해시</td><td>${list.p_hash }</td></tr>
				    			<tr><td>내용</td><td>${list.p_content }</td></tr>
				    			<tr><td>사진</td><td>${list.p_img }</td></tr>
				    			<tr><td>작성날자</td><td>${list.p_date }</td></tr>
				    	</table>
	         		</div>
         </div>
      </div>
      <div class="right">
         <div class="f_find">
         	<h4>친구 찾기</h4>
         	<div class="u_find">
		       	<input type="text" class="user_find" onkeypress="enter()" name="m_id" id="m_id" placeholder="찾을 친구의 이름을 입력하세요." style="width: 200px; height: 40px;">
		       	<input type="button" value="Find" onclick="user_find()">
	        </div>
         </div>
         <div class="f_info">
         	<h3>친구 찾기 성공</h3>
	        <table border="1">
	        	<tr>
	        		<td>아이디</td>
	        		<td id="td_id"></td>
	        	</tr>
	        	<tr>
	        		<td>이름</td>
	        		<td id="td_name"></td>
	        	</tr>
	        	<tr>
	        		<td>전화</td>
	        		<td id="td_tel"></td>
	        	</tr>
	        	<tr>
	        		<td>친구 추가</td>
	        		<td><input type="button" value="friend_add" onclick="friend_add()"></td>
	        	</tr>
	        </table>
         </div>
      </div>
   </div>
</div>
</body>
</html>