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
html, body {
	width: 100%;
	height: 100%;
}

.wrapper {
	width: 100%;
	height: 100%;
}

.main-wrapper {
	width: 1950px;
	height: 100%;
	display: flex;
	flex-flow: row;
}

.info-container {
	order: 1;
	display: flex;
	flex-flow: column;
	width: 20%;
	height: 100%;
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

.user-info table td, table th {
	border: 1px solid #2F4F4F;
	padding: 4px;
}

.user-info table tr:first-child td {
	border-top: 0;
}

.user-info table tr:last-child td {
	border-bottom: 0;
}

.user-info table tr td:first-child, table tr th:first-child {
	border-left: 0;
}

.user-info table tr td:last-child, table tr th:last-child {
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
	background-color: #33CCFF;
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

.post-container {
	order: 2;
	width: 60%;
	
}
.friend-request-container {
	order: 3;
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
	height: 2em;
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
	line-height: -40%;
}
.accept-friend-button {
	order: 3;
}
.acceptFriendButton {
	background-color: #73E600;
	padding: 0.5em 1em;
	font-size: 9pt;
	margin: 0.1em 0.1em;
	border-radius: 4px;
}
</style>

<script>

	

	var u_id = "${param.u_id}";
	var isFriend = ${isFriend};
	
	
	$(document).ready(function(){
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
	
</script>




</head>

<jsp:include page="/WEB-INF/views/header/f_header.jsp" />

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
		
		<div class="post-container">
		<c:forEach var="post" items="${userPosts }">
			<table class="post" align="center" border="1">
				<tr>
					<td>${post.p_title }</td>
					<td>${post.m_id }</td>
				</tr>
				<tr>
					<td>${post.p_content }</td>
				</tr>
			</table>
		</c:forEach>
		
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
					</div>
				</c:forEach>
				
			</c:otherwise>
			</c:choose>
		
		</div>
		
		
	</div>


</div>

</body>
</html>