<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
var ctn = 4;
var page_no = 0;
var re_no = 0;
$(document).ready(function() {
//window.onload = function () {
	$("[class^=replyTag]").hide();
	
});

//=====================================================
//댓글창 열고 닫기
$(function(){
	$(document).off().on('click', '.replyBtn', function(){
	//$('.replyBtn').click(function(){
	 	var vid = $(this).attr("id");
	 	
	  	console.log("fIndex : " +vid);
	  	
		
		if($(".replyTag"+vid).is(":visible")){
		  	$(".replyTag"+vid).fadeOut('fast');
		  	//re_no = 0;
		  	$("#r_content"+vid).val("");
		  //	$("#replytable"+vid+ "> tbody").empty();
		  	
		}else{
			$(".replyTag"+vid).fadeIn('fast');
			getComment(vid);
			/*
			$.ajax({
				type:'POST',
			    url : "getComment",
			    data: $("#replyForm"+vid).serialize()+"&re_no="+re_no,
			    success : function(data){
			    	re_no = 0;
			    
			    	console.log(data);
			    	if(data.length > 0){
			               for(i=0; i<data.length; i++){
			            	   
		                	var id = data[i].m_id;
		     		    	var content = data[i].r_content;
		     		    	var date = data[i].r_date;
		     		    	var like = data[i].r_like;
		     		    	
		     		    	$(".replyTag"+vid).prepend (
		     		    	"<tr>" +
		     		    	"<td>"+id+"</td>"+
		     		    	"<td>"+content+"</td>"+
		     		   		"<td>"+date+"</td>"+
		     		   		"<td>"+like+"</td>"+
		     		   		"</tr>"
		     		    	)
		     		    	
			               }
			    	}
			    //re_no += 5;
			    },
			    error:function(){
			    	alert("에러 발생."); 
			    }    
			 });*/
		}
		
		
		
		/*
		$.ajax({
	    	type:'POST',
	       	url : "replyCount",
		    success : function(data){
		    	alert("ajax 성공!");
		    	$('#replyCount').text(data);
		 	},
		    error:function(){
		       	alert("에러 발생.");
		 	}   
		});
		*/
		
	 });
	
//});

//=================================================
	//댓글 추가 하기
//$(function(){
	$(document).on('click', '.addBtn', function(){
	//$('.addBtn').click(function(){
	 	var bid = $(this).attr("id");
	 	console.log(bid);
	 	$.ajax({
	    	type:'POST',
	       	url : "addComment",
		    data: $("#replyForm"+bid).serialize(),
		    success : function(data){
		       		alert("ajax 성공!");
			        getComment(bid);
			        $("#r_content"+bid).val("");
		 	},
		    error:function(){
	        	$("#r_content"+bid).val("");
		       	alert("댓글을 입력 바랍니다.");
		 	}   
		});
	});


	//댓글 보기 메소드
	function getComment(num){ 
		$.ajax({
			type:'POST',
		    url : "getComment",
		    data: $("#replyForm"+num).serialize()+"&re_no="+re_no,
		    success : function(data){
		    	
		    
		    	console.log(data);
		    	if(data.length > 0){
		    		for(i=0; i<data.length; i++){	   
	                var id = data[i].m_id;
	     		   	var content = data[i].r_content;
	     		    var date = data[i].r_date;
	     		    var like = data[i].r_like;
	     		    	
	     		    	$("#replytable"+num).prepend (
	     		    	"<tbody>"+
	     		   		"<tr>" +
	     		    	"<td>"+id+"</td>"+
	     		    	"<td>"+content+"</td>"+
	     		   		"<td>"+date+"</td>"+
	     		   		"<td>"+like+"</td>"+
	     		   		"</tr></tbody>"
	     		    	);
	     		    	
		               }
	     		    	
		    	}
		   // re_no += 5;
		    },
		    error:function(){
		    	alert("에러 발생."); 
		    }    
		 });
	}
});	
	
function getComment1(num){ 
	var snum = 5;
	$.ajax({
		type:'POST',
	    url : "getComment",
	    data: $("#replyForm"+num).serialize()+"&re_no="+snum,
	    success : function(data){
	    
	    	console.log(data);
	    	if(data.length > 0){
	    		for(i=0; i<data.length; i++){	   
                var id = data[i].m_id;
     		   	var content = data[i].r_content;
     		    var date = data[i].r_date;
     		    var like = data[i].r_like;
     		    	
     		    	$("#replytable"+num).prepend (
     		    	"<tbody>"+
     		   		"<tr>" +
     		    	"<td>"+id+"</td>"+
     		    	"<td>"+content+"</td>"+
     		   		"<td>"+date+"</td>"+
     		   		"<td>"+like+"</td>"+
     		   		"</tr></tbody>"
     		    	);
     		    	
	               }
     		    	
	    	}
	    },
	    error:function(){
	    	alert("에러 발생."); 
	    }    
	 });
	    snum += 5;
}


//==============================================
$(function(){
        $(window).scroll(function(){
            let $window = $(this);
            let scrollTop = $window.scrollTop();
            let windowHeight = $window.height();
            let documentHeight = $(document).height();
            
            console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight );
            
            // scrollbar의 thumb가 바닥 전 30px까지 도달 하면 리스트를 가져온다.
            if( scrollTop + windowHeight == documentHeight ){
                postList();
            }
        })
       // postList();
    })
 
    let postList = function(){
	
		$.ajax({
			url:"fpostList",
			type:"POST",
			//dataType: "json",
			cache 	: false,
			data:  {page_no : page_no},
			success: function(data){
			console.log(data)
			var mid = $('.replyBtn').attr("value");
			
				  if(data.length > 0){
		               for(i=0; i<data.length; i++){
		            	   
		            	   
		            	//   if(i==data.length) {
			     		   // 	isEnd=true;
			     		//    	return;
			     		//    }
	                	var id = data[i].m_id;
	     		    	var title = data[i].p_title;
	     		    	var cat = data[i].p_cat;
	     		    	var hash = data[i].p_hash;
	     		    	var content = data[i].p_content;
	     		    	var img = data[i].p_img;
	     		    	var date = data[i].p_date;
	     		    	var pnum = data[i].p_num;
	   
	     		    	$("#friendPage").append(
	     		    	"<table border='1' class='postForm'><tr>"+
	     	            "<tr height='5%'>"+
	     	               "<th width='15%'>카테고리</th>"+
	     	               "<td width='15%' align='center'>"+cat+"</td>"+
	     	               "<th width='20%'>제목</th>"+
	     	               "<td width='50%' align='center'>"+title+"</td>"+
	     	           	"</tr>"+
	     	           	
	     	           "<tbody height='40%' class='post-image"+pnum+"'></tbody>"+
	     	            
	     	            "<tr height='5%'>"+
	     	               "<th>해시</th>"+
	     	               "<td colspan='3'>"+hash+"</td>"+
	     	            "<tr height='5%'>"+
	     	              "<td><input type='button' value='좋아요'><label id='likeCount'>0</label></td>"+
	     	              "<th colspan='2'>작성자</th>"+
	     	              "<td align='center'>"+id+"</td>"+
	     	            "</tr>"+
	     	            "<tr height='5%'>"+
	     	               "<td colspan='1' align='center'>"+
	     	                  "<div class='replyBtn' id='"+ctn+"'>댓글 <label id='replyCount'>0</label>개 모두 보기</div></td>"+
	     	            "</tr>"+"</table>"+
	     	            "<div class='replyTag"+ctn+"'>"+
	     	       		
	     	       		"<table border='1'>"+
 						"<tr>"+
 							"<td>#내사진 </td>"+
 							"<td colspan='3'><b>"+mid+"</b><br>"+
 							"<form id='replyForm"+ctn+"' method='post' class='r_form'>"+
 								"<textarea  id='r_content"+ctn+"' name='r_content' placeholder='댓글 달기...' style='width: 600px; height: 30px'></textarea>"+
 								"<input type='hidden' name='r_postNum' value='"+pnum+"'>"+
 								"<input class='addBtn' id='"+ctn+"' type='button' value='게시' style='height: 50px; width: 80px;'></form></td></tr>"+
 						"</table>"+
 						"</div><br>"
	     				);
	     		    	if (img != 'null') {
							$(".post-image"+pnum).append("<tr height='40%'>"+
									"<td height='40%' colspan='3' align='center'>"+content+"</td>"+
									"<td height='40%' colspan='1' align='center'><img src='img/"+img+"' width='200px' height='200px'></td>"+
								"</tr>");
						} else {
							$(".post-image"+pnum).append("<tr height='40%'>"+
									"<td height='200px' colspan='4' align='center'>"+content+"</td>"+
									"</tr>");
						}
			     		   
	     		    	ctn+=1;
	     		    	$(document).ready(function() {
	     		    		
	     		    			$("[class^=replyTag]").hide();
	     		    		});   
	     		    	
	     		    	}
	                
				  }else {
					  alert("마지막 게시글 입니다.");
		          }
				
			page_no += 3;},
			error:function(){
				alert("에러.")
			}
		});
	}
	
		

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
   <style type="text/css">
      html, body {
         width: 100%;
         height: 100%;
      }
      
      .pagewrap{
         background-color: lightred;
         width: 100%;
         height: 100%;
      }
      .bodywrap{
         background-color: gray;
         width: 1900px;
         height: 100%;
         border: 1px solid red;
      }
      
      .left{
         background-color: lightblue;
         float: left;
         width: 19%;
         height: 100%;
         border: 1px solid blue;
      }
      #le {
      	background-color: skyblue;
      	width: 70%;
      	height: 100%;
      	margin : 10px 0 0 50px;
      
      }
      #f_img {
      	padding : 0 0 0 20px;
      }
      
      ul,li {margin:0; padding:0; font-size: 20px; list-style: none; }
      ol {
      	margin: 0 0 0 10px;
      	font-size: 15px;
      }
   
      .center{
         background-color: lightyellow;
         float: left;
         width: 60%;
         border: 1px solid yellow;
      }
      
      .right{
         background-color: lightgreen;
         float: left;
         width: 19%;
         height: 100%;
         border: 1px solid green;
      }
      
      #friendPage {
      	background-color: white;
      	width: 80%; 
  		margin : 0 0 0 10%;
  		
      }
      
    <!-- 게시글 스타일 -->
    
    .postForm {
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
	
	textarea[id^=r_content]{
	 border:0;
	 overflow-y:hidden;
	 background:clear;
	 font-size: 14px;
	}
	
	td,th {
	font-size: 15px;
	
	}
	
	div[class^=replyBtn]{
	   float:left; 
	   cursor:pointer; 
	   color: gray;
   }
   
   div[class^=replyTag] {
   	visibility: none;
   }
   </style>
</head>
<body>
<div class="pagewrap">
<jsp:include page="/WEB-INF/views/header/my_header.jsp"/>
   <div class="bodywrap">	
      <div class="left">
         <div id="le">
         	<img id="f_img" src="https://img.icons8.com/officel/50/000000/user-group-man-woman.png">
         	<b style="font-size: 30px; position: absolute; left: 130px; top: 100px;">내 친구</b>
         		<ul>
	         		<c:forEach items="${flist}" var="list">
	         			<li><a style="color: black; border-bottom: 2px solid black;font-size: 25px; display:block; 
     						text-decoration:none;" href="u_page?u_id=${list.m_id}">
     						<img src="img/${list.m_pic}" width="75px" height="75px"> : ${list.m_id }</a></li>
	         		</c:forEach>
         		</ul>	
         </div>
      </div>
      <div class="center">
	  <div id="friendPage" align="center">
			<!-- ############################################## -->
			<c:forEach var="fPosts" items="${fPost}" varStatus="status" end="3">
			<table class="postForm" border="1">
            <tr height="5%">
               <th width="15%">카테고리</th>
               <td width="15%" align="center">${fPosts.p_cat }</td>
               <th width="20%">제목</th>
               <td width="50%" align="center">${fPosts.p_title }</td>
            </tr>
            <!-- ============ POST PICTURE PART ============ -->
				<c:choose>
				<c:when test="${fPosts.p_img != 'null'}">
				<tr height="40%">
					<td colspan="3" align="center">${fPosts.p_content }</td>
					<td colspan="1" align="center"><img src="img/${fPosts.p_img }" width="200px" height="200px"></td>
				</tr>
				</c:when>
				<c:otherwise>
				<tr height="40%">
					<td colspan="4" align="center">${fPosts.p_content }</td>
				</tr>
				</c:otherwise>
				</c:choose>
				<!-- =========================================== -->
            <tr height="5%">
               <th>해시</th>
               <td colspan="3">${fPosts.p_hash }</td>
            </tr>
            <tr height="5%">
               <td><input type='button' value='좋아요'><label id='likeCount'>0</label></td>
               <th colspan="2">작성자</th>
               <td align="center">${fPosts.m_id }</td>
            </tr>
            <tr height="5%">
               <td colspan="1" align="center">
                  <div class="replyBtn" id="${status.index }" value="${mid}">댓글 <label id="replyCount${status.index }">0</label>개 모두 보기</div></td>
            </tr>
            </table>
            
            <div class="replyTag${status.index }" >
				<table border="1" id="replytable${status.index }" style="width: 878px;">
					<tr>
						<td><input type="button" onclick="getComment1(${status.index});" value="더보기"></td>
					</tr>
					<tr>
						<td width="15%">#내사진 </td>
						<td width="85%"><b>${mid}</b><br>
					<form id="replyForm${status.index }"  method="post" class="r_form">
							<textarea  id="r_content${status.index }" name="r_content" placeholder="댓글 달기..." style="width: 200px; height: 30px"></textarea>
							<input type="hidden" name="r_idgroup" value="${fPosts.p_num}">
							<input class="addBtn" id="${status.index }" type="button" value="게시" style="height: 50px; width: 80px;">
					</form>
					</td>
					</tr>
				</table>
			</div>
			
			<br>
         </c:forEach>
	  </div>
      </div>
	      <div class="right">
	         <h1>우측</h1>
	      </div>
   </div>
</div>
</body>
<script>



</script>
</html>