<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/jquery-3.2.1.min.js"></script>
</head>
<body>
	<c:set var="aa" value="${lo }"/>
	<c:if test="${aa=='login' }">
		<script>
		if (true) {
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
		</script>
	</c:if>
	<c:if test="${aa.equals('logout') }">
		<script>
		alert("로그아웃을 완료했습니다.")
		if (true) {
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
		</script>
	</c:if>
</body>
</html>