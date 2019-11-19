<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="resources/jquery-3.2.1.min.js">
</script>
<script>
	function kakaologout() {
		Kakao.init('acac96eb9f0e90e854ba87fe0dd84580')
		alert("카카오로그아웃");
		Kakao.Auth.logout(function(data){
			alert(data)
			location.href="login";
		});
	}
</script>
</head>
<body>
 <c:if test="${kid eq null}">
 		로그인 실패
    </c:if>
    <c:if test="${kid ne null}">
        <h1>로그인 성공입니다</h1>
        <input type="button" value="로그아웃" onclick="kakaologout()">
    </c:if>
</body>
</html>