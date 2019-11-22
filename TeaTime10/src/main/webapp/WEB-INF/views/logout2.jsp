<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function logout() {
	if (confirm('로그아웃 하시겠습니까?')) {
		location.href="logout";
	} else
		location.href = "main";
}
</script>
<body  onload="logout()">

</body>
</html>