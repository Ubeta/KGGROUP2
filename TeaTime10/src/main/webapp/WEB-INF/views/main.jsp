<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#friendPage {
         background-color: white;
         width: 80%; height: 100%;
        margin : 0 0 0 10%;
        
      }
      
    <!-- 게시글 스타일 -->
    
    #postForm {
   height: 250px;
   font-size: 10px;
   }
   
   #profile {
      border-radius: 50%;
      -moz-border-radius: 50%;
      -khtml-border-radius: 50%;
      -webkit-border-radius: 50%;
      whdth: 60px; height: 60px;
   }
   #ta ,#hash{
    border:0;
    overflow-y:hidden;
    background:clear;
    width: 640px;
    font-size: 14px;
   }
   
   #tit{
    border:0;
    overflow-y:hidden;
    background:clear;
    font-size: 14px;
   }
</style>
<script type="text/javascript" src="resources/jquery-3.2.1.min.js"></script>

<body>
	<!-- 카카오로 로그인 했을 경우 -->
	<jsp:include page="/WEB-INF/views/header/m_header.jsp" />
	<div>
	<c:if test="${mid!=null}">
		<h1>메인 헤더부분</h1>
		<br>
		<br>
		<br>
         <c:set var="postlist" value="${postlist }"/>
		<div id="friendPage" align="center">
         <h1>메인페이지</h1>
         <c:forEach var="post" items="${postlist }">
      <table border="1"  id="postForm">
         <tr>
            <!-- 프로필 사진 부분 src경로 수정 -->
            <td align="center"><img id="profile" src="http://upload2.inven.co.kr/upload/2018/10/23/bbs/i15928556651.jpg"/><br>
            ${post.m_id }</td>
            <td colspan="2">${post.p_title }</td>
          </tr>
         <tr>
            <td colspan="3" width="500px">
               ${post.p_content }
            </td>
         </tr>
         <tr>
            <td>카테고리 설정</td>
            <td colspan="2">${post.p_cat }</td>
         </tr>
         <tr>
            <td>태그</td>
            <td colspan="2">
               ${post.p_hash }
            </td>
         </tr>
      </table>
     </c:forEach>
     </div>
		<br>
		<br>
		<br>
		<br>
	</c:if>
	<c:if test="${mid==null and nid!=null}">
		<script>
			location.href = "userpost";
		</script>
	</c:if>
	<c:if test="${mid==null and kid!=null }">
		<script>
			location.href = "kakaologout";
		</script>
	</c:if>
	<c:if test="${mid==null and kid==null and nid==null}">
		<script>
			alert("로그인 해주세요")
			location.href = "login";
		</script>
	</c:if>
	</div>
</body>
</html>