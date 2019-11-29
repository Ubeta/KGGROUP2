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
	      	padding: 20px;
	      	margin-left: 10px;
	      	margin-right: 10px;
	      	border-top: 1px solid black;
	      }
	      .write_board{
	      	margin: 10px;
	      	padding: 10px;
	      	text-align: center;
	      	border-top: 1px solid black;
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
	      .board_table{
			text-align: center;
			width: 100%;
			height: 300px;
			font-size: 0.3em;
			border-top: 1px solid black;
			margin-bottom: 50px;
	      }
	      .reply_table{
			width: 100%;
			background-color: gray;
			height: 100px;
			font-size: 0.3em;
			border-top: 1px solid black;
			margin-bottom: 50px;
	      }
	      
	</style>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<jsp:useBean id="dao" class="com.care.modelDAO.ModelDAO"/>
	
	<script type="text/javascript">
		//윈도우 열림
		window.onload = function(){
			setTimeout (function(){
			scrollTo(0,0);
			},100);
		}	
	
		//내정보 버튼 보여주기 숨기기
		$(document).ready(function() {
		       $('.my_info_btn').show(); 
		       $('.my_info').hide(); 
		       $('.my_info_btn').click(function(){ 
		       $ ('.my_info_btn').hide(); 
		       $ ('.my_info').show();
		       return false;
		     }); 
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
					console.log(data)
					console.log(data.chk)
					if(data.chk == 0){
						alert("없는 아이디 입니다.")
					}else if (data.chk == 1){
						$('#td_id').text(data.dto.m_id);
						$('#td_name').text(data.dto.m_name);
						$('#td_tel').text(data.dto.m_tel);
					}
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
			var session_id = '${mid}';
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
		
		 $(window).scroll(function () {
		    	if ($(window).scrollTop() == $(document).height() - $(window).height()) {
		        	$.ajax({
						url:"boardlist",
						type:"POST",
						dataType: "json",
						cache 	: false,
						success: function(data){
							
							if(data.chk=="true"){
								
						    var id = data.boardlist.m_id;
					    	var title = data.boardlist.p_title;
					    	var cat = data.boardlist.p_cat;
					    	var hash = data.boardlist.p_hash;
					    	var content = data.boardlist.p_content;
					    	var img = data.boardlist.p_img;
					    	var date = data.boardlist.p_date;
					    	var like = data.boardlist.p_like;
					    	var idgroup = data.boardlist.p_idgroup;
					    	console.log(idgroup)
							
					    	$(".post").append(
					    			"<table class='board_table' border='1'>"+
					    			"<tr><td>아이디</td><td>"+id+"</td></tr>"+
					    			"<tr><td>제목</td><td>"+title+"</td></tr>"+
					    			"<tr><td>카테고리</td><td>"+cat+"</td></tr>"+
					    			"<tr><td>해시</td><td>"+hash+"</td></tr>"+
					    			"<tr><td>내용</td><td>"+content+"</td></tr>"+
					    			"<tr><td>사진</td><td>"+img+"</td></tr>"+
					    			"<tr><td>작성날자</td><td>"+date+"</td></tr>"+
					    			"<tr><td>좋아요</td><td>"+like+"</td></tr>"+
					    			"<tr><td>아이디그룹</td><td>"+idgroup+"</td></tr>"+
					    			"<tr><td colspan='2'><input type='button' class='show_reply' onclick='reply_test("+idgroup+")' value='show_reply'></td></tr>"+
					    			"<tr><td colspan='2'><div class='reply_add"+idgroup+"'></div></td></tr>"+
					    			"</table>"
					    			);
							}else if(data.chk=="false"){
								
							}else if(data.chk=="non"){
								alert("읽어올 글이 없습니다.")
							}
						},
						error:function(){
							alert("에러.")
						}
					});
		          
		
		        }
		    });
		
		var cnt=0;
		function reply_test(p_idgroup) {
				num = p_idgroup;
				console.log(num)

				var form = {
						p_idgroup : p_idgroup
				}
				var lists = new Array();
				console.log(cnt)
				if((cnt%2)==0){
					$.ajax({
						url:"replylist",
						type:"POST",
						data: form,
						cache 	: false,
						dataType: "json",
						success: function(data){
							console.log(data)
							lists=data.replylist_1;
							for(var i=0; i<lists.length; i++){
								$(".reply_add"+num).append(
									"<table border='1' class='reply_table"+num+"'>"+
									"<tr><td>"+lists[i].m_id+"</td></tr>"+
									"<tr><td>"+lists[i].r_idgroup+"</td></tr>"+
									"<tr><td>"+lists[i].r_content+"</td></tr>"+
									"<tr><td>"+lists[i].r_date+"</td><td>"+lists[i].r_like+"</td></tr>"+
									"</table>"
							    );
							}
								$(".reply_add"+num).append(
									"<table class='reply_table_w"+num+"'>"+
									"<tr><td>글작성</td></tr>"+
									"<tr><td><input class='w_re"+num+"' type='text' placeholder='댓글작성'></td></tr>"+
									"<tr><td><input type='button' onclick='reply_write("+num+")' value='add' ></td></tr>"+
									"</table>"
							    );
						},
					error:function(){
						alert("문제가 발생 하였습니다.")
					}
					});
					cnt++;
				}else if((cnt%2)!=0){
					$(".reply_table"+num).remove();
					$(".reply_table_w"+num).remove();
					cnt++;
				}
		}
		
		function reply_write(num) {
			var id = '${mid}';
			var idgroup = num;
			var content = $(".w_re"+num).val();
			var like = 0;
			console.log(content)
			
			if(content==""){
				alert('댓글 내용을 입력하세요')
			}else{
			
				var r_dto = {
						m_id : id,
						r_idgroup : idgroup,
						r_content : content,
						r_like : like
				}
				
				$.ajax({
					url:"reply_write",
					type:"POST",
					data: r_dto,
					success: function(data){
						alert("댓글 등록 완료.")	
						reply_test(num);
						reply_test(num);
					},
					 error:function(){
						 alert("문제가 발생 하였습니다.")
					}
				});
			}
		}
		
		function like(p_idgroup){
			var id = "${mid}";
			var idgroup = p_idgroup
			var p_dto = {
					m_id : id,
					p_idgroup : idgroup
			}
			
			$.ajax({
				url:"like_up",
				type:"POST",
				data: p_dto,
				dataType: "json",
				success: function(data){
					if(data.chk==0){
						alert("좋아요 올리기 성공.")
						location.href='mypage';
					}else if(data.chk==1){
						alert("좋아요 취소.")
						location.href='mypage';
					}else if(data.chk==2){
						alert("좋아요 초기 올리기 성공.")
						location.href='mypage';
					}
				},
				 error:function(){
					 alert("문제가 발생 하였습니다.")
				}
			});
		}
		
	</script>
</head>
<body>
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
      </div>
      <div class="center">
         <div class="w_board">
         	<div class="write_board" >
         		<table border="1">
					<tr>
						<td style="font-size: 0.5em;">제목</td><td colspan="3"><input type="text" id="p_title" style="width: 500px; height: 40px;"></td>
					</tr>
					<tr>
						<td colspan="4"><input type="text" id="p_content" placeholder="글내용" style="width: 700px; height: 200px;"></td>
					</tr>
					<tr>
						<td colspan="4"><input type="button" id="p_img" value="사진첨부"></td>
					</tr>
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
						<td>
							<select id="p_scope" name="scope"><option value="" selected data-defaul>공개범위</option><option value="0">나만보기</option><option value="1">친구공개</option><option value="2">전체공개</option></select>
						</td>
						<td colspan="1">해시태그<input type="text" id="p_hash" placeholder="해시태그 입력" style="width:350px; height: 40px;"></td>
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
	         			<div class="post">
			         		<c:if test="${boardlist.size() ne 0 }">
			         			<c:set var="list" value="${boardlist.get(0) }"/>
			         			<table class="board_table" border='1'>
						    			<tr><td style="width: 50px;">작성자</td><td>${list.m_id }</td>  <td>카테고리</td><td>${list.p_cat }</td>  <td>해시</td><td>${list.p_hash }</td></tr>
						    			<tr><td colspan="2">제목</td><td colspan="4">${list.p_title }</td></tr>
						    			<tr><td colspan="6" style="height: 100px;">${list.p_content }</td></tr>
						    			<tr><td colspan="6">${list.p_img }</td></tr>
						    			<tr><td colspan="2">작성날자</td><td >${list.p_date }</td><td colspan="2"><button onclick="like(${list.p_idgroup })">좋아요</button></td><td >${list.p_like }</td></tr>
						    			<tr><td colspan="6">${list.p_idgroup }</td></tr>
						    			<tr><td colspan="6"><input type="button" class="show_reply" onclick="reply_test(${list.p_idgroup })" value="show_reply"></td></tr>
						    			<tr><td colspan="6"><div class="reply_add${list.p_idgroup }" ></div></td></tr>
						    	</table>
			         		</c:if>
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