<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my_header.jsp</title>

<spring:url value="/resources/css/basic.css" var="basicCss" />
<spring:url value="/resources/images/logo2.png" var="logo" />
<spring:url value="/resources/images/searchicon.png" var="searchicon" />

<link href="https://fonts.googleapis.com/css?family=Nunito&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${basicCss }">

<style>
.headerbody {
	display: flex;
	width: 1950px;
}

.wrapper {
	min-width: 100%;
	display: flex;
	margin-right: 0;
	left: 0;
	right: 0;
	flex: 1 1 auto;
}
.header-wrapper {
	margin-right: 0;
	min-width: 100%;
	top: 0;
	left: 0;
	right: 0;
	background-color: #66CCCC;
	height: 80px;
	display: flex;
	flex-flow: row;
	border-bottom-style: solid;
	border-bottom-width: 5px;
	border-color: #2F4F4F;
	flex: 1 0 100%;
}

.img-container: {
	order: 1;
	display: flex;
}

.logo {
	margin: 15px;
	margin-left: 3.75rem;
	border-radius: 5px;
	flex: 1 1 auto;
}

.logo:hover {
	cursor: pointer;
}

.title-container {
	order: 2;
	margin-top: 12px;
	margin-left: 2.625rem;
	display: flex;
}

.title {	
	font-size: 32pt;
	color: white;
	flex: 1 0 auto;
}

.title:hover {
	cursor: pointer;
	font-weight: bold;
}

.search-container {
	order: 3;
}

#sFrm {
	display: flex;
	flex-flow: row;
}

.search-bar-container {
	order: 1;
	margin-left: 20.5rem;
	margin-top: 15px;
	flex: 0 1 auto;
}

.search-bar {
	height: 30px;
	width: 30.75rem; 
	font-size: 16pt;
}

.search-button-container {
	order: 2;
	margin-top: 24px;
	background-color: #DCDCDC;
	width: 34px;
	height: 34px;
}

.search-button {
	margin-top: 3px;
	margin-left: 0.1rem;
	width: 30px;
	height: 30px;
	flex: 0 1 auto;
}
.search-button-container:hover {
	opacity: .8;
}
.search-button:hover {
	cursor: pointer;
	opacity: .8;
}
a {
	text-decoration: none;
	font-size: 12pt;
	text-align: center;
	color: white;
	
}

.list-container {
	order: 4;
	display: flex;
	flex-flow: row;
	right: 0;
	margin-left: 16rem;
	margin-right: 1rem;
	margin-top: 6px;
	height: 60px;
	width: 26rem;
	background-color: #2F4F4F;
	line-height: 50px;
	border-radius: 3px;
	border-style: solid;
	border-color: black;
	text-align: center;
	flex: 0 1 auto;
	
}
.main-page {
	order: 1;
	margin-left: 0.75rem;
	flex: 1 1 auto;
}
.main-page:hover {
	font-weight: bold;
	cursor: pointer;
}
.friend-page {
	order: 2;
	padding-left: 0.625rem;
	padding-right: 0.625rem;
	margin-left: 1rem;
	margin-right: 1rem;
	border-left-style: solid;
	border-left-color: grey;
	border-left-width: 2px;
	border-right-style: solid;
	border-right-color: grey;
	border-right-width: 2px;
	flex: 1 1 auto;
}
.friend-page:hover {
	font-weight: bold;
	cursor: pointer;
}
.logout {
	order: 3;
	margin-right: 0.75rem;
	flex: 1 1 auto;
}
.logout:hover {
	font-weight: bold;
	cursor: pointer;
}
</style>

<script>
	function searchFunc(){
		var frm = document.getElementById("sFrm");
		frm.submit();
	}
	function mainpage(){
		location.href="#";
	}
	function friendpage(){
		location.href="#";
	}
	function logout(){
		location.href="#";
	}
</script>

</head>
<body>
<div class="headerbody">
	<div class="header-wrapper">

		<div class="img-container">
			<img class="logo" src="${logo }" width="50px" height="50px">
		</div>
		<div class="title-container">
			<span class="title">Tea Time</span>
		</div>

		<div class="search-container">
			<form id="sFrm" action="main-search" method="get">
				<div class="search-bar-container">
					<input class="search-bar" type="text" name="m_search">
				</div>
				<div class="search-button-container">
					<img class="search-button" src="${searchicon }"
						onclick="searchFunc">
				</div>
			</form>
		</div>
		
		<div class="list-container">
			<div class="main-page" onclick="mainpage()">
				<a href="#">메인 페이지</a>
			</div>
			<div class="friend-page" onclick="friendpage()">
				<a href="#">친구 페이지</a>
			</div>
			<div class="logout" onclick="logout()">
				<a href="#">로그아웃</a>
			</div>
		</div>

	</div>
</div>
</body>
</html>