<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/images/placeholder.jpg" var="placeholder" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tea Time</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
.replyList {
	position: fixed;
	font-family: Arial, Helvetica, sans-serif;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background: rgba(0,0,0,0.8);
	z-index: 99999;
	opacity:0;
	-webkit-transition: opacity 400ms ease-in;
	-moz-transition: opacity 400ms ease-in;
	transition: opacity 400ms ease-in;
	pointer-events: none;
	
	}
   
    .replyList:target {
	opacity:1;
	pointer-events: auto;
	}

	.replyList > div.test {
	width: 400px;
	position: relative;
	margin: 10% auto;
	padding: 5px 20px 13px 20px;
	border-radius: 10px;
	background: #fff;
	background: -moz-linear-gradient(#fff, #999);
	background: -webkit-linear-gradient(#fff, #999);
	background: -o-linear-gradient(#fff, #999);
	}  
	.close {
	background: #606061;
	color: #FFFFFF;
	line-height: 25px;
	position: absolute;
	right: -12px;
	text-align: center;
	top: -10px;
	width: 24px;
	text-decoration: none;
	font-weight: bold;
	-webkit-border-radius: 12px;
	-moz-border-radius: 12px;
	border-radius: 12px;
	-moz-box-shadow: 1px 1px 3px #000;
	-webkit-box-shadow: 1px 1px 3px #000;
	box-shadow: 1px 1px 3px #000;
	}

	.close:hover { background: #00d9ff; }
	
	.repliesTable {
		width: 100%;
		overflow: auto;
	}
	
	.replyButtonsTable .table2{
		height: 20px;
	}
	#reply-list-container {
		
		display: block;
		overflow: auto;
		height: 200px;
		width: 100%;
		
	}
	#reply-list-container th, #reply-list-container td, #reply-list-container tr {
		text-align: center;
	}
	.repliesTable .table1 {
		text-align: center;
		margin: 0 auto;
	}
	.reply-list-big-container {
		text-align: center;
		margin: 0 auto;
	}
	.appendedTr {
		text-align: center;
	}
	.appendedTd {
		text-align: center;
	}
	
body {
	width: 1950px;
	height: 100%;
	overflow: auto;
}

.wrapper {
	width: 100%;
	height: 100%;
}

.main-wrapper {
	width: 100%;
	height: 100%;
	display: flex;
	flex-flow: row;
}

.info-container {
	order: 1;
	display: flex;
	flex-flow: column;
	width: 20%;
	background-color: #E6E6E6;
	text-align: center;
	border-right-style: solid;
	border-right-width: 5px;
	border-color: #CCCCCC;
}

.user-name {
	margin-top: 10%;
}
.info-member-name {
	width: 6em;
}
.member-name {
	width: 5em;
}
.profile-pic {
	margin-top: 10%;
	display: block;
	margin-left: auto;
	margin-right: auto;
	width: 80%;
	height: 25%;
	border: 1px solid #2F4F4F;
}

.user-info {
	margin-top: 20%;
}

.user-info {
	font-size: 14pt;
}

.user-info table {
	border-collapse: collapse;
}

.user-info table td, user-info table th {
	border: 1px solid #2F4F4F;
	padding: 4px;
}

.user-info table tr:first-child td {
	border-top: 0;
}

.user-info table tr:last-child td {
	border-bottom: 0;
}

.user-info table tr td:first-child, .user-info table tr th:first-child {
	border-left: 0;
}

.user-info table tr td:last-child, .user-info table tr th:last-child {
	border-right: 0;
}

.friend-button {
	margin-top: 20%;
	text-align: center;
}

.removeFriendButton {
	background-color: white;
	color: black;
	border: 2px solid #e7e7e7;
}
.cancelFriendButton {
	background-color: white;
	color: black;
	border: 2px solid #e7e7e7;
}
.addFriendButton {
	background-color: #33CCFF;
	color: black;
	border: 2px solid #e7e7e7;
}
.cancelFriendButton:hover {
	background-color: #EE4466;
	color: white;
}
.removeFriendButton:hover {
	background-color: #EE4466;
	color: white;
}

.addFriendButton:hover {
	background-color: #8ec3eb;
}

.button {
	background-color: #73E600;
	border: none;
	color: white;
	padding: 16px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 18px;
	margin: 4px 2px;
	transition-duration: 0.4s;
	cursor: pointer;
	border-radius: 6px;
}
.middle-section-container {
	order: 2;
	display: flex;
	flex-flow: column;
	margin-top: 1%;
	width: 60%;
}
.post-container {
	order: 1;
}
.post-container table {
	width: 70%;
	height: 16em;
	border-spacing: 0.2em;
	border-collapse: seperate;
}
.post-container table th {
	padding: 0.5em;
	font-size: 16pt;
}
.post-container table td {
	padding: 0.5em;
	font-size: 12pt;
}
.post {
	margin-top: 5%;
}
.loader {
	margin-top: 10%;
	order: 2;
	text-align: center;
	font-size: 14pt;
}
.friend-request-container {
	order: 3;
	right: 0%;
	width: 20%;
	background-color: #E6E6E6;
	text-align: center;
	align-content: center;
	border-left-style: solid;
	border-left-width: 5px;
	border-color: #CCCCCC;
	font-size: 14pt;
}
.no-friend-request-container {
	margin: 0 auto;
	margin-top: 30%;
	border: 3px solid black;
	width: 90%;
	height: 20%;
	text-align: center;
	line-height: 300%;
	font-weight: bold;
}
.friend-request-list {
	margin: 0 auto;
	margin-top: 10%;
	height: 3em;
	width: 100%;
	border-bottom-style: solid;
	border-bottom-width: 5px;
	border-color: #CCCCCC;
	font-size: 16pt;
	text-align: center;
	line-height: 1.5em;
}
.friend-request-box {
	display: flex;
	flex-flow: row;
	margin: 0 auto;
	margin-top: 10%;
	padding: 0.2em;
	width: 90%;
	height: 3em;
	background-color: #B0C4DE;
	border: 3px solid #4682B4;
	border-radius: 2px;
	font-size: 14pt;
	text-align: left;
	
}
.request-pic {
	order: 1;
	margin-left: 0;
	border: 1px solid black;
	border-radius: 2px;
}
.request-name3 {
	order: 2;
	height: 100%;
	width: 50%;
	margin-left: 1em;
}
.request-name4 {
	color: black;
	font-size: 18pt;
	line-height: 2em;
}
.request-name4:hover {
	text-decoration: underline;
}
.accept-friend-button {
	order: 3;
}
.acceptFriendButton {
	background-color: #73E600;
	width: 4em;
	height: 90%;
	font-size: 11pt;
	margin: 0.3em;
	border-radius: 4px;
	padding: 0;
}
.acceptFriendButton:hover {
	border: solid blue 1px;
}
.reject-friend-button {
	order: 4;
}
.rejectFriendButton {
	background-color: #FF4136;
	width: 4em;
	height: 90%;
	font-size: 11pt;
	margin: 0.3em;
	border-radius: 4px;
	padding: 0;
}
.rejectFriendButton:hover {
	border: solid blue 1px;
}

</style>

<script>

	var u_id = "${param.u_id}";
	var isFriend = ${isFriend};
	var sessionId = '${mid}';
	var flag = true;
	var replyCounter = 2;
	var repliesArray = new Map();
	
	$(document).ready(function(){
		
		$('.loader').hide();
		$('.replyLineClass').hide();
		$('.closeReplies').hide();
		
		if (u_id == sessionId) {
			location.href="mypage";
		}
		
		if (isFriend == 0) {
			$('#sendFriend').show();
			$('#cancelFriend').hide();
			$('#removeFriend').hide();
		} else if (isFriend == 1) {
			$('#sendFriend').hide();
			$('#cancelFriend').show();
			$('#removeFriend').hide();
		} else if (isFriend == 2) {
			$('#sendFriend').hide();
			$('#cancelFriend').hide();
			$('#removeFriend').show();
		}
		
			$.ajax({
				url: "show_more_user_posts",
				type: "POST",
				data: {'u_id':u_id},
				dataType: "JSON",
				cache: false,
				success: function(data) {
					if (!data.morePosts) {
						$('.loader').show();
					}
				},
				error: function(){
					
				}
			
		});
	});
	
	
	
	function replyPostOpen(idgroup) {
		$('#replyLine'+idgroup).show();
	}
	
	function replyPost(idgroup){
		$.ajax({
			url: "reply_post_send",
			type: "POST",
			data: {
				'm_id': sessionId,
				'r_idgroup': idgroup,
				'r_content': $('#replyBody'+idgroup).val()
				},
			success: function(data) {
				alert("Reply Success, data:" + data);
				getOneReply(idgroup);
			},
			error: function(){
				alert("Error")
			}	
		});
	}
	
	$(function(idgroup){
		$('.replyLineClass[onload]').trigger('onload');
	});
	$('body').on({
		DOMNodeInserted : function(){
			console.log('dynamic insert');
			$('.replyLineClass[onload]').trigger('onload');
			alert("dynamic");
		}
	});
	
	function createReplyArray(idgroup) {
		repliesArray.set(idgroup, replyCounter);
	}
	
	function getOneReply(idgroup) {
		var tempCounter = repliesArray.get(idgroup);
		$.ajax({
			url: "post_reply_show_one",
			type: "POST",
			data: {'r_idgroup': idgroup},
			success: function(data) {
				alert("success");
				$('.reply-list-container'+idgroup).prepend("<tr class='appendedTr'>" +
					"<td class='appendedTd'>like</td>" +
					"<td>"+data.oneReply.m_id+"</td>" +
					"<td colspan='2'>"+data.oneReply.r_content+"</td>" +
					"</tr>");
				tempCounter +=1;
				repliesArray.set(idgroup, tempCounter);		
			},
			error: function(){
				alert("Error");
			}
		});
	}
	
	function showReplies(idgroup) {
		console.log('showreplies idgrou: ' + idgroup);
		var tempCounter = 0;
		var tempCounter = repliesArray.get(idgroup);
		$('.closeReplies').show();
		$.ajax({
			url: "post_reply_show",
			type: "POST",
			data: {'r_idgroup': idgroup,
				'counter' : tempCounter
				},
			success: function(data) {
				alert("success");
				
				$.each(data.reply, function(index, value) {
				console.log(index + "" + value.r_idgroup);
					$('.reply-list-container'+value.r_idgroup).append("<tr class='appendedTr'>" +
							"<td>like</td>" +
							"<td>"+value.m_id+"</td>" +
							"<td colspan='2'>"+value.r_content+"</td>" +
							"</tr>");
				});
				tempCounter +=4;
				repliesArray.set(idgroup, tempCounter);		
			},
			error: function() {
				alert("error");
			}
		});
	}
	
	function closeReplies(idgroup) {
		$('.appendedTr').remove();
		var tempCounter = 2;
		repliesArray.set(idgroup, tempCounter);	
		$('.closeReplies').hide();
	}
	
	
	$(window).scroll(function(){
		if ($(window).scrollTop() == $(document).height() - $(window).height()) {
			flag = true;
			$('.loader').show();
			$.ajax({
				url: "show_more_user_posts",
				type: "POST",
				data: {'u_id':u_id},
				dataType: "JSON",
				cache: false,
				success: function(data) {
					if (flag && data.morePosts) {
						flag = false;
						$('.loader').hide();
							if (data != null) {
							$(".post-container").append("<table class='post' align='center' border='1'><tr height='5%'>" + 
							"<th width='15%'>카테고리</th><td width='15%' align='center'>"+data.post.p_cat+"</td>" + 
							"<th width='20%'>제목</th><td width='50%' align='center'>"+data.post.p_title+"</td>" +
							"</tr><tr height='40%'><td colspan='4' align='center'>"+data.post.p_content+"</td></tr>" +
							"<tr height='30%'><td colspan='4' align='center'>"+data.post.p_img +"</td></tr>" + 
							"<tr height='5%'><th>해시</th><td colspan='3'>"+data.post.p_hash+"</td><tr height='5%'><td>like</td>" + 
							"<th colspan='2'>작성자</th><td align='center'>"+data.post.m_id+"</td></tr>" +
							"<tr height='5%'><td colspan='4' align='center'>" +
							"<form action='#openReply'>" +
							"<input type='hidden' value='"+data.post.p_idgroup+"' name='idgroup'>"+
							"<input type='hidden' value='${param.u_id }' name='u_id'>"+
							"<input type='submit' value='댓글보기'>"+
							"</form></td></tr></table>");
							createReplyArray(data.post.p_idgroup);
							$('.replyLineClass').hide();
							
						} else {
							alert("더이상 글이 없습니다");
							$('.loader').show();
						}
					}
				},
				error: function(data) {
					flag = true;
					$('.loader').hide();
					alert("Error")
				}
			});
		}
	});
	

	function sendFriend(button){
		$.ajax({
			url: "u_page_friendsend",
			type: "POST",
			data: {'u_id':u_id},
			success: function(data) {
				/*
				$('#sendFriend').removeClass('button sendFriendButton').addClass('button cancelFriendButton');
				$('#sendFriend').html('친구취소');
				*/
				$('#sendFriend').hide();
				$('#cancelFriend').show();
				alert("Send Success, data: " + data)
			},
			error: function(){
				alert("문제가 발생 하였습니다.");
			}
		});
	}
	
	function cancelFriend(){
		$.ajax({
			url: "u_page_friendCancel",
			type: "POST",
			data: {'u_id':u_id},
			success: function(){
				$('#cancelFriend').hide();
				$('#sendFriend').show();
				alert("Cancel Success")
			}
		});
	}
	function removeFriend(){
		$.ajax({
			url: "u_page_friendRemove",
			type: "POST",
			data: {'u_id':u_id},
			success: function(data){
				$('#removeFriend').hide();
				$('#sendFriend').show();
				alert("Remove Success, data: " + data)
			},
			error: function(){
				alert("문제가 발생 하였습니다.");
			}
		});
	}
	
	function acceptFriend(m_id){
		
		$.ajax({
			url: "u_page_friendAccept",
			type: "POST",
			data: {'m_id': m_id},
			success: function(data){
				$('#friendBox'+m_id).hide();
				alert(m_id);
				alert("Friend Accept Success, data: " + data);
			},
			error: function(){
				alert("문제가 발생 하였습니다.");
			}
		});
	}
	function rejectFriend(m_id){
			
			$.ajax({
				url: "u_page_friendReject",
				type: "POST",
				data: {'m_id': m_id},
				success: function(data){
					$('#friendBox'+m_id).hide();
					alert(m_id);
					alert("Friend Accept Success, data: " + data);
				},
				error: function(){
					alert("문제가 발생 하였습니다.");
				}
			});
		}
	
</script>




</head>

<jsp:include page="/WEB-INF/views/header/u_header.jsp" />

<div class="wrapper">

	<div class="main-wrapper">

		<div class="info-container">
			<span class="user-name">${member.m_id} 님</span> <img
				class="profile-pic" src="img/${member.m_pic }" />
			<div class="user-info">
				<table align="center">
					<c:choose>
					<c:when test="${isFriend == 2 }">
					<tr>
						<td>회원 이름</td>
						<td>${member.m_name }</td>
					</tr>
					<tr>
						<td>성별</td>
						<td>${member.m_strgender }</td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td>${member.m_idnum }</td>
					</tr>
					<tr>
						<td>연락처</td>
						<td>${member.m_tel }</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>${member.m_mail }</td>
					</tr>
					</c:when>
					<c:otherwise>
					<tr>
						<td class="info-member-name">회원 이름</td>
						<td class="member-name">${member.m_name }</td>
					</tr>
					</c:otherwise>
					</c:choose>
				</table>
			</div>
			<div class="friend-button">
			<button id="removeFriend" class="button removeFriendButton" 
						onclick="removeFriend(this)">친구삭제</button>
			<button id="cancelFriend" class="button cancelFriendButton" 
						onclick="cancelFriend(this)">친구취소</button>
			<button id="sendFriend" class="button sendFriendButton" 
						onclick="sendFriend(this)">친구추가</button>
			</div>

		</div>
		
		<div class="middle-section-container">
		
		<div class="post-container">
		
		<c:forEach var="post" items="${userPosts }" begin="0" end="2">
			<table class="post" align="center" border="1">
				<tr height="5%">
					<th width="15%">카테고리</th>
					<td width="15%" align="center">${post.p_cat }</td>
					<th width="20%">제목</th>
					<td width="50%" align="center">${post.p_title }</td>
				</tr>
				<tr height="40%">
					<td colspan="4" align="center">${post.p_content }</td>
				</tr>
				<tr height="30%">
					<td colspan="4" align="center">${post.p_img }</td>
				</tr>
				<tr height="5%">
					<th>해시</th>
					<td colspan="3">${post.p_hash }</td>
				<tr height="5%">
					<td>like</td>
					<th colspan="2">작성자</th>
					<td align="center">${post.m_id }</td>
				</tr>

				<tr height="5%">
					<td colspan="4" align="center">
					<form action="#openReply"> 
						<input type="hidden" value="${post.p_idgroup }" name="idgroup"> 
						<input type="hidden" value="${param.u_id }" name="u_id"> 
						<input type="submit" value="댓글보기">
					</form>  
					</td>
				</tr>   

			</table>
		</c:forEach>
		
		 <a href="#openReply">Open Reply</a>
				<div id="openReply" class="replyList">
					<div class="test">
						<a href="#close" title="Close" class="close">X</a>
						
					<div class="reply-big-container">
					<div class="repliesTable">
					
					<table border="1" align="center" class="table1">
					
					<tbody class="reply-list-big-container">
						<tbody align="center" class="reply-list-container${param.idgroup }" id="reply-list-container">
						<thead align="center"></thead>
						</tbody>
					</tbody>
					</table>
					</div>
					<div class="replyButtonsTable">
					<table border="1" align="center" class="table2">
					
					<tr>
						<td colspan="4" align="center">
							<input type="button" class="showReplies" onclick="showReplies('${param.idgroup}')" value="댓글보기">
							<input type="button" class="closeReplies" onclick="closeReplies('${param.idgroup}')" value="닫기">
						</td>
					</tr>
					</tbody>
					
					<tbody class="reply-button-container">
					<tr>
						<td colspan="1" align="center">
							<input type="button" class="replyPostOpen" onclick="replyPostOpen('${param.idgroup}')" value="댓글">
						</td>
						<td onload="createReplyArray('${param.idgroup}')" class="replyLineClass" id="replyLine${param.idgroup }" colspan="3" align="center">
						<form id="replyFrm">
							<input class="replyBody" id="replyBody${param.idgroup }" type="text" name="replyContent">
							<input type="button" class="replyPost" onclick="replyPost('${param.idgroup}')" value="답장">
						</form>
						</td>					
					</tr>	
					</tbody>
					</table>
					</div>
					</div>
				</div>
				</div>
		
		</div>
		<div class="loader">글이 더이상 없습니다</div>
		
		</div>
		
		<div class="friend-request-container">
			<c:choose>
			<c:when test="${noFriendRequests == true }">
				<div class="no-friend-request-container">
					현재 친구 요청이 없습니다
				</div>
			</c:when>
			<c:otherwise>
				
				<div class="friend-request-list">친구 요청</div>
				<c:forEach var="friendRequest" items="${friendRequests }">
					<div class="friend-request-box" id="friendBox${friendRequest.m_id}">
					<img class="request-pic" src="img/${friendRequest.m_pic }" width="20%" height="90%">
					<div class="request-name3">
						<a class="request-name4" href="u_page?u_id=${friendRequest.m_id}">
						${friendRequest.m_name }
						</a>
					</div>
						<div class="accept-friend-button">
						<button id="acceptFriend" class="button acceptFriendButton" 
							onclick="acceptFriend('${friendRequest.m_id}')">확인</button>
						</div>
						<div class="reject-friend-button">
						<button id="rejectFriend" class="button rejectFriendButton" 
							onclick="rejectFriend('${friendRequest.m_id}')">거절</button>
						</div>
					</div>
				</c:forEach>
				
			</c:otherwise>
			</c:choose>
		
		</div>
		
		
	</div>


</div>

</body>
</html>