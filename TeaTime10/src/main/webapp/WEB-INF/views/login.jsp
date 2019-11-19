<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="resources/jquery-3.2.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<spring:url value="/resources/images/naver.png" var="naver" />
<spring:url value="/resources/images/KakaoTalk_loginbutton.png"
	var="kakao" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Nunito&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${basicCss }">

<style>
.main-wrapper {
	text-align: center;
}

.id-box {
	width: 300px;
	height: 30px;
	font-size: 16pt;
}

.id-box:focus {
	outline-width: 1px;
	outline-style: solid;
	outline-color: #228B22;
}

.pw-box {
	width: 300px;
	height: 30px;
	font-size: 16pt;
}

.pw-box:focus {
	outline-width: 1px;
	outline-style: solid;
	outline-color: #228B22;
}

.submit-box {
	width: 300px;
	height: 30px;
	font-size: 16px;
	text-shadow: lime;
}
</style>
<script type='text/javascript'>
	function kakaologin() {

		//<![CDATA[
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		var id = null;
		var nickname = null;
		Kakao.init('b650720b5095783f10df72e812329f99');
		Kakao.Auth.loginForm({
			success : function(authObj) {
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(res) {
						aaa = JSON.stringify(res);
						id = res.id;
						nickname = res.properties.nickname;
						location.href = "kakao_loginchk?id=" + id
								+ "&nickname=" + nickname;
						alert(aaa);
					},
					fail : function(errorObj) {
						alert(JSON.stringify(error));
					}
				})
			}

		});
	}
</script>
</head>
<body>
	<c:choose>
		<c:when test="${sid != null}">
			<script type="text/javascript">
				location.href = "main";
			</script>
		</c:when>
		<c:when test="${kid != null }">
			<script>
				location.href = "main";
			</script>
		</c:when>
		<c:when test="${nid != null }">
			<script>
				location.href = "main";
			</script>
		</c:when>
		<c:otherwise>
			<form action="loginchk" method="post" name="frm"
				style="width: 470px;">
				<div id="teatime_id_login" style="text-align: center">
					<h2>로그인</h2>
					<input class="id-box" type="text" name="id" placeholder="아이디">
					<br> <input class="pw-box" type="password" name="pw"
						placeholder="비밀번호"> <br> <input class="submit-box"
						type="submit" value="로그인"> <br>
				</div>
			</form>
			<br>
			<!-- 네이버 로그인 창으로 이동 -->
			<div id="naver_id_login" style="text-align: center">
				<a href="${url}"> <img width="300"
					src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
			</div>
			<br>
			<!-- 카카오 로그인 -->
			<!-- 
			<a href="https://kauth.kakao.com/oauth/authorize?client_id=acac96eb9f0e90e854ba87fe0dd84580
			&redirect_uri=http://localhost:8785/controller/kakaologin
			&response_type=code"><img src="${kakao }" width="300px">
			</a>
			  -->
			<div>
				<a href="javascript:kakaologin();"><img width="300"
					src="${kakao }"></a>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>