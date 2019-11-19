<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
	      html, body {
	         width: 100%;
	         height: 100%;
	      }
	      
	      .pagewrap{
	         width: 100%;
	         height: 100%;
	      }
	      .bodywrap{
	         width: 1900px;
	         height: 100%;
	         border: 1px solid red;
	      }
	      .left{
	         float: left;
	         width: 19%;
	         height: 100%;
	         border: 1px solid blue;
	      }
	      .center{
	         float: left;
	         width: 60%;
	         height: 100%;
	         border: 1px solid yellow;
	      }
	      .right{
	         float: left;
	         width: 19%;
	         height: 100%;
	         border: 1px solid green;
	      }
	      .my_info_btn{
	      	background-color: red;
	      	margin-left: 20px;
	      	margin-top: 30px;
	      	margin-right: 20px;
	      	text-align: center;
	      }
	      
	      .my_info_btn button{
	      	width: 300px;
	      	height: 30px;
	      }
	      
	      .my_info{
	      	background-color: lightgreen;
	      	margin-left: 20px;
	      	margin-top: 30px;
	      	margin-right: 20px;
	      	text-align: center;
	      }
	      .my_info input[type="text"] {
	      	width: 300px;
	      	height: 30px;
	      }
	      
	      .my_cat{
	      	background-color: lightgreen;
	      	margin-left: 20px;
	      	margin-top: 30px;
	      	margin-right: 20px;
	      	text-align: center;
	      }
	      .my_cat table{
	      	margin-left: auto;
	      	margin-right: auto;
	      	margin-bottom: 20px;
	      }
	      
	      .f_find{
	      	background-color: lightblue;
	      	margin-left: 10px;
	      	margin-top: 20px;
	      	margin-right: 10px;
	      	text-align: center;
	      }
	      
	      
	      .w_board{
	      	background-color: green;
	      	margin-left: 10px;
	      	margin-right: 10px;
	      }
	      
	      .board{
	      	background-color: lightyellow;
	      	margin-left: 10px;
	      	margin-right: 10px;
	      }
	      
	      
	</style>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<jsp:useBean id="dao" class="com.care.modelDAO.ModelDAO"/>
	
	<script type="text/javascript">
		$(document).ready(function() {
		       $('.my_info_btn').show(); 
		       $('.my_info').hide(); 
		       $('.my_info_btn').click(function(){ 
		       $ ('.my_info_btn').hide(); 
		       $ ('.my_info').show();
		       return false;
		     }); 
		  });
		
		
		function f_find(){
			
			$.ajax({
				url:"f_test",
				type:"POST",
				dataType: "json",
				cache 	: false,
				success: function(data){
					console.log(data);			
				},
				error:function(){
					alert("문제가 발생 하였습니다.")
				}
			});	
		}
		
	</script>
</head>
<body>
<c:set var="mylist" value="${myinfo }"/>
<c:set var="my_catlist" value="${mycat }"/>
<div class="pagewrap">
<jsp:include page="/WEB-INF/views/header/my_header.jsp"/>
   <div class="bodywrap">
      <div class="left">
      	<div class="my_info_btn">
      		<button>내 정보 확인 및 수정</button>
      	</div>
         <div class="my_info">
         	<h3>내정보 리스트</h3>
         	<img alt="my_pic" src=""><br>
         	<input type="text" placeholder="${mylist.m_pw }"><br>
         	<input type="text" placeholder="${mylist.m_name }"><br>
         	<input type="text" placeholder="${mylist.m_idnum }"><br>
         	<input type="text" placeholder="<c:choose><c:when test="${mylist.m_gender==1 }">남자</c:when>	<c:when test="${mylist.m_gender==0 }">여자</c:when></c:choose>"><br>
         	<input type="text" placeholder="${mylist.m_tel }"><br>
         	<input type="text" placeholder="${mylist.m_mail }"><br>
         	<input type="button" value="Fix">
         </div>
         <div class="my_cat">
         	<h3>내 카테고리 리스트</h3>
         	${my_catlist.c_sports }
         	<table border="1">
         		<tr>
         			<td><img alt="my_cat1" src=""></td>
         			<td><img alt="my_cat2" src=""></td>
         		</tr>
         		<tr>
         			<td><img alt="my_cat3" src=""></td>
         			<td><img alt="my_cat4" src=""></td>
         		</tr>         		
         	</table>
         </div>
      </div>
      <div class="center">
         <div class="w_board">
         	<h4>게시글 작성</h4>
         </div>
         <hr>
         <div class="board">
         	<h4>게시글 </h4>
         </div>
      </div>
      <div class="right">
         <div class="f_find">
         	<h4>친구 찾기</h4>
         	<input type="text" name="m_id" id="m_id" placeholder="찾을 친구의 이름을 입력하세요." style="width: 300px; height: 40px;"><br>
         	<input type="button" value="Find" onclick="f_find()">
         </div>
         <div>
         	<h4>친구 찾기 성공</h4>
	         <label id="result">0</label>
         </div>
      </div>
   </div>
</div>
</body>
</html>