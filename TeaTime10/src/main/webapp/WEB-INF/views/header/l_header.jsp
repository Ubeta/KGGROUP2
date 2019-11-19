<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>l_header.jsp</title>

<spring:url value="/resources/css/basic.css" var="basicCss"/>
<spring:url value="/resources/images/logo2.png" var="logo"/>

<link href="https://fonts.googleapis.com/css?family=Nunito&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${basicCss }"> 

<style>

	.headerbody {
		display: flex;
		width: 1950px;
	}
	
	.header-wrapper {
		margin-top: 0;
		background-color: #66CCCC;
		height: 140px;
		display: flex;
		flex-flow: row;
	}
	
	.img-container: {
		order: 1;
	}
	
	.logo {
		margin-top: 30px;
		margin-left: 8rem;
		border-radius: 5px;
	}
	.logo:hover {
		cursor: pointer;
	}
	
	.title-container {
		order: 2;
		margin-top: 30px;
		margin-left: 4rem;
	}
	.title {
		font-size: 48pt;
		color: white;
	}
	.title:hover {
		cursor: pointer;
		font-weight: bold;
	}
	
</style>

</head>
<body>

<div class="headerbody">

<div class="header-wrapper">

	<div class="img-container">
		<img class="logo" src="${logo }" width="80px" height="80px">
	</div>
	<div class="title-container">
		<span class="title">Tea Time</span>
	</div>

</div>

</div>


</body>
</html>