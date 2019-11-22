<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
$(function(){
	$('.replyBtn').click(function(){
  	  	var vid = $(this).attr("id");
  	  	$(".replyTag"+vid).show();
 	 });
});

	window.onload = function () {
		$("[class^=replyTag]").hide();
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
   <style type="text/css">
      html, body {
         width: 100%;
         height: 100%;
      }
      
      .pagewrap{
         background-color: lightred;
         width: 100%;
         height: 100%;
      }
      .bodywrap{
         background-color: gray;
         width: 1900px;
         height: 100%;
         border: 1px solid red;
      }
      
      .left{
         background-color: lightblue;
         float: left;
         width: 19%;
         height: 100%;
         border: 1px solid blue;
      }
      #le {
      	background-color: skyblue;
      	width: 70%;
      	height: 100%;
      	margin : 10px 0 0 50px;
      
      }
      #f_img {
      	padding : 0 0 0 20px;
      }
      
      ul,li {margin:0; padding:0; font-size: 20px; list-style: none; }
      ol {
      	margin: 0 0 0 10px;
      	font-size: 15px;
      }
   
      .center{
         background-color: lightyellow;
         float: left;
         width: 60%;
         height: 100%;
         border: 1px solid yellow;
      }
      
      .right{
         background-color: lightgreen;
         float: left;
         width: 19%;
         height: 100%;
         border: 1px solid green;
      }
      
      #friendPage {
      	background-color: white;
      	width: 80%; height: 100%;
  		margin : 0 0 0 10%;
  		
      }
      
    <!-- 게시글 스타일 -->
    
    .postForm {
	height: 250px;
	font-size: 10px;
	}
	
	#profile {
		border-radius: 50%;
		-moz-border-radius: 50%;
		-khtml-border-radius: 50%;
		-webkit-border-radius: 50%;
		whdth: 60px; height: 60px;
	}
	#ta ,#hash{
	 border:0;
	 overflow-y:hidden;
	 background:clear;
	 width: 640px;
	 font-size: 14px;
	}
	
	#tit{
	 border:0;
	 overflow-y:hidden;
	 background:clear;
	 font-size: 14px;
	}
	td {
	font-size: 20px;
	
	}
	
	.replyBtn{
	   float:left; 
	   cursor:pointer; 
	   color: gray;
   }
   </style>
</head>
<body>
<div class="pagewrap">
<jsp:include page="/WEB-INF/views/header/my_header.jsp"/>
   <div class="bodywrap">	
      <div class="left">
         <div id="le">
         	<img id="f_img" src="https://img.icons8.com/officel/50/000000/user-group-man-woman.png">
         	<b style="font-size: 30px; position: absolute; left: 130px; top: 100px;">내 친구</b>
         		<ul>
	         		<c:forEach items="${flist}" var="list">
	         			<li><a style="color: black; border-bottom: 2px solid black;font-size: 25px; display:block; 
     						text-decoration:none;" href="u_page?u_id=${list.m_id}">
     						${ list.m_pic} : ${list.m_id }</a></li>
	         		</c:forEach>
         		</ul>
	         			
         </div>
      </div>
      <div class="center">
	   <div id="friendPage" align="center">
			<h1>친구 게시글만 보이는 부분!!</h1>
		 	<c:forEach var="fPosts" items="${ fPost}" varStatus="status">
		<table border="1"  class="postForm">
			<tr>
				<!-- 프로필 사진 부분 src경로 수정 -->
				<td align="center">이미지 경로 : ${fPosts.p_img }<br>
					${fPosts.m_id }</td>
				<td >${fPosts.p_title }</td>
 			</tr>
			<tr>
				<td colspan="3" width="500px">
					${fPosts.p_content }
				</td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td colspan="2">${fPosts.p_cat }</td>
			</tr>
			<tr>
				<td>태그</td>
				<td colspan="2">
					${fPosts.p_hash }
				</td>
			</tr>
			<tr>
				<td><input type="button" value="좋아요">
				<label id="likeCount">0</label></td>
				<td>
				<div class="replyBtn" id="${status.index }">댓글 <label id="replyCount">0</label>개 모두 보기</div>
				</td>
			</tr>
			<div class="replyTag${status.index }">
				<tr>
					<td>#사진 <b>#아이디</b></td>
					<td> #내용부분내용부분내용부분내용부분내용부분내용부분 내용부분내용부분내용부분내용부분</td>
				</tr>
				<tr>
					<td>#내사진 <b>#내아이디</b></td>
					<td><textarea onkeyup="adjustHeight();" id="ta" name="p_content" placeholder="댓글 달기..."></textarea></td>
				</tr>
			</div>
		</table>
		</c:forEach>
	  </div>
      </div>
      <div class="right">
         <h1>우측</h1>
      </div>
   </div>
</div>
</body>
</html>