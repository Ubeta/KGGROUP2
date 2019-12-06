<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check() {
		var pw1 = document.getElementById("pw1").value;
		var pw2 = document.getElementById("pw2").value;
		if(pw1!=''){
			if(pw1==pw2){
				document.getElementById("frm").submit();
			}else{
				alert("비밀번호가 일치하지 않습니다.")
				document.getElementById("pw2").value="";
				document.getElementById("pw2").focus();
			}
		}else if(pw1==''){
			alert("새로운 비밀번호를 입력하세요");
			document.getElementById("pw1").focus();
		}
		
	}
</script>
</head>
<body>
	<c:if test="${idfind != null }">
		<c:if test="${idfind=='notfindid' }">
			<script>
			alert("존재하는 아이디가 없습니다.");
			location.href="login";
			</script>
		</c:if>
		<c:if test="${idfind!='notfindid' }">
			<h2>ID : ${idfind }</h2>
			<a href="login">로그인 하러가기</a>
		</c:if>
	</c:if>
	<c:if test="${pwfind != null}">
		<c:if test="${pwfind != 'notfindpw' }">
        <div>
			<form action="pwchange" method="post" id="frm">
				<input type="hidden" name="m_id" value="${pwfind1 }">
				<input type="password" name="m_pw" id="pw1" placeholder="New password"><label id="label1">필수입력!</label><br>
				<input type="password" id="pw2" placeholder="check password"><label id="label2">필수입력!</label><br>
				<input type="button" value="비밀번호 변경하기" onclick="check()">
			</form>				 
        </div>
        </c:if>
        <c:if test="${pwfind == 'notfindpw' }">
        	<script>
        	alert("존재하는 아이디가 없습니다.")
        	location.href="login"
        	</script>
        </c:if>
	</c:if>
		
</body>
</html>