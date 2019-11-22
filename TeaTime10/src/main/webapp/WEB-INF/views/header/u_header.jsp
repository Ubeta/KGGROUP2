<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>f_header.jsp</title>

<spring:url value="/resources/css/basic.css" var="basicCss" />
<spring:url value="/resources/images/logo2.png" var="logo" />
<spring:url value="/resources/images/searchicon.png" var="searchicon" />

<link href="https://fonts.googleapis.com/css?family=Nunito&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${basicCss }">

<style>
.headerbody {
	display: flex;
	width: 100%;
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
	height: 8%;
	display: flex;
	flex-flow: row;
	border-bottom-style: solid;
	border-bottom-width: 5px;
	border-color: #2F4F4F;
	flex: 1 0 100%;
}

.img-container {
	order: 1;
	display: flex;
	margin-left: 5%;
	margin-top: 1%;
}

.logo {
	display: block;
	margin: 0 auto;
	border-radius: 5px;
	flex: 1 1 auto;
}

.logo:hover {
	cursor: pointer;
}

.title-container {
	order: 2;
	margin-top: 1%;
	margin-left: 3.5%;
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
	display: flex;
	flex-flow: row;
}

#sFrm {
	order: 1;
	display: flex;
	flex-flow: row;
}

.search-bar-container {
	order: 1;
	width: 40%;
	margin-left: 35%;
	margin-top: 1.5%;
	flex: 0 1 auto;
}

.search-bar {
	height: 30px;
	width: 30.75rem;
	font-size: 16pt;
}

.search-button-container {
	order: 2;
	margin-top: 3%;
	margin-left: 53.5%;
	background-color: #DCDCDC;
	width: 34px;
	height: 34px;
}

.search-button {
	margin-top: 3%;
	margin-left: 2%;
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
	margin-top: 0.4%;
	margin-right: 5%;
	height: 80%;
	width: 25%;
	background-color: #2F4F4F;
	line-height: 50px;
	border-radius: 3px;
	border-style: solid;
	border-color: black;
	text-align: center;
	
}
.main-page {
	order: 1;
	margin-left: 1%;
	flex: 1 1 auto;
}
.main-page:hover {
	font-weight: bold;
	cursor: pointer;
}
.my-page {
	order: 2;
	padding-left: 1%;
	padding-right: 1%;
	margin-left: 2%;
	margin-right: 2%;
	border-left-style: solid;
	border-left-color: grey;
	border-left-width: 2px;
	border-right-style: solid;
	border-right-color: grey;
	border-right-width: 2px;
	flex: 1 1 auto;
}
.my-page:hover {
	font-weight: bold;
	cursor: pointer;
}
.logout {
	order: 3;
	margin-right: 1%;
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
		location.href="main";
	}
	function mypage(){
		location.href="mypage";
	}
	function logout(){
		location.href="everylogout";
	}
</script>

</head>
<body>

<div class="headerbody">

<div class="wrapper">
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
				<a href="main">메인</a>
			</div>
			<div class="my-page" onclick="mypage()">
				<a href="mypage">마이</a>
			</div>
			<div class="logout" onclick="logout()">
				<a href="everylogout">로그아웃</a>
			</div>
		</div>

	</div>
</div>

</div>

</body>
</html>