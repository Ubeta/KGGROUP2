<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="login" value="${login }"/>

<c:set var="mdto" value="${memdto }"/>
<c:set var="m_id" value="${mdto.m_id }"/>
<c:if test="${login==0 }">
	<script>
		alert("아이디가 없습니다.");
		location.href="login";
	</script>
</c:if>
<c:if test="${login==1 }">
	<script>
		alert("패스워드가 틀립니다.");
		location.href="login";
	</script>
</c:if>
<c:if test="${login==2 }">
	<script>
		alert("로그인 성공!");
		location.href="main"
	</script>
</c:if>
</body>
</html>