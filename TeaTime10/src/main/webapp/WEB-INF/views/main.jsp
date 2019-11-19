<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="resources/jquery-3.2.1.min.js"></script>
<script>
	// 네이버와 그냥 회원 둘 다 로그아웃 
	// 네이버의 경우 아래의 ajax를 통해서 네이버 자체의 세션을 지우고나서 logout 맵핑에 따라 세션이 지워짐.
	function click_logout() {
		if (confirm('로그아웃 하시겠습니까?')) {
			$.ajax({
				type : "POST",
				dataType : 'text',
				url : "http://nid.naver.com/nidlogin.logout",
				crossDomain : true,
				xhrFields : {
					withCredentials : true
				}
			}).done(function(data) {

				$('#logout').submit();
			}).fail(function(xhr, textStatus, errorThrown) {

				$('#logout').submit();
			});
			location.href = "logout";
		} else
			location.href = "main";
	}
	
	// 카카오 로그아웃 kakaologout 맵핑에 따라 세션을 지움
	function kakao_logout() {
		if (confirm('로그아웃 하시겠습니까?')) {
			location.href = "kakaologout";
		} else
			location.href = "main";
	}
</script>

<body>
	<jsp:include page="/WEB-INF/views/header/l_header.jsp" />
	<!-- 카카오로 로그인 했을 경우 -->
	<div>
	<c:if test="${kid != null}">
		<h1>메인 헤더부분</h1>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<a href="javascript:kakao_logout();">로그아웃</a>
	</c:if>
	<!-- 네이버 로그인 했을 경우 -->
	<c:if test="${nid != null }">
		<h1>메인 헤더부분</h1>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<a href="javascript:click_logout();">로그아웃</a>
	</c:if>
	<!-- member로그인 했을 경우 -->
	<c:if test="${sid != null }">
		<h1>메인 헤더부분</h1>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<a href="javascript:click_logout();">로그아웃</a>
	</c:if>
	</div>
	<br>
	<c:if test="${nid == null and kid==null and sid==null}">
		<script>
			alert("로그인 해 주세요");
			location.href = "login";
		</script>
	</c:if>
</body>
</html>