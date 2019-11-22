<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function kakao_logout() {
	if (confirm('로그아웃 하시겠습니까?')) {
		location.href="kakaologout";
	} else
		history.back();
}
</script>
</head>
<body onload="kakao_logout()">

</body>
</html>