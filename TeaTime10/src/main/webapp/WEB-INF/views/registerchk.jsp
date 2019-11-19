<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
		<c:when test="${du =='iddu' || catchk=='c_iddu'}">
			<script>
					alert("이미 등록된 아이디 입니다.");
					location.href = "register";
			</script>
		</c:when>
		<c:when test="${du =='teldu' || catchk=='c_teldu'}">
			<script>
					alert("이미 등록된 전화번호 입니다.");
					location.href = "register";
			</script>
		</c:when>
		<c:when test="${du =='maildu' || catchk=='c_maildu'}">
			<script>
					alert("이미 등록된 이메일 입니다.");
					location.href = "register";
			</script>
		</c:when>
		<c:when test="${du =='regiOk' && catchk=='catOk'}">
			<script>
					alert("회원가입을 축하합니다.");
					location.href = "main";
			</script>
		</c:when>
		<c:otherwise>
			<script>
					alert("디비 에러 입니다.");
					location.href = "register";
			</script>
		</c:otherwise>
	</c:choose>


</body>
</html>