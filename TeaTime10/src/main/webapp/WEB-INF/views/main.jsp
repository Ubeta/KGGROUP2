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


.replyList {
	position: fixed;
	font-family: Arial, Helvetica, sans-serif;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background: rgba(0,0,0,0.8);
	z-index: 99999;
	opacity:0;
	-webkit-transition: opacity 400ms ease-in;
	-moz-transition: opacity 400ms ease-in;
	transition: opacity 400ms ease-in;
	pointer-events: none;
	
	}
   
    .replyList:target {
	opacity:1;
	pointer-events: auto;
	}

	.replyList > div.test {
	width: 400px;
	position: relative;
	margin: 10% auto;
	padding: 5px 20px 13px 20px;
	border-radius: 10px;
	background: #fff;
	background: -moz-linear-gradient(#fff, #999);
	background: -webkit-linear-gradient(#fff, #999);
	background: -o-linear-gradient(#fff, #999);
	}  
	.close {
	background: #606061;
	color: #FFFFFF;
	line-height: 25px;
	position: absolute;
	right: -12px;
	text-align: center;
	top: -10px;
	width: 24px;
	text-decoration: none;
	font-weight: bold;
	-webkit-border-radius: 12px;
	-moz-border-radius: 12px;
	border-radius: 12px;
	-moz-box-shadow: 1px 1px 3px #000;
	-webkit-box-shadow: 1px 1px 3px #000;
	box-shadow: 1px 1px 3px #000;
	}

	.close:hover { background: #00d9ff; }
	
	.repliesTable {
		width: 100%;
		overflow-y: auto;
	}
	
	.replyButtonsTable .table2{
		height: 20px;
	}
	#reply-list-container {
		
		display: block;
		overflow-y: auto;
		height: 200px;
		width: 100%;
		
	}
	#reply-list-container th, #reply-list-container td, #reply-list-container tr {
		text-align: center;
		word-break:break-all;
	}
	.repliesTable .table1 {
		text-align: center;
		margin: 0 auto;

	}
	.reply-list-big-container {
		text-align: center;
		margin: 0 auto;
	}
	.appendedTr {
		text-align: center;
		word-break:break-all;
		width: 400px;
	}
	.appendedTd {
		text-align: center;
		word-break:break-all;
		width: 400px;
	}
	textarea {
		resize: none;
	}

#main {
         background-color: white;
         width: 80%; height: 100%;
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
   
   #tit{
    border:0;
    overflow-y:hidden;
    background:clear;
    font-size: 14px;
   }
   .bodyall{
         display: flex;
         flex-flow: row;
       background-color: gray;
        width: 100%;
        height: 100%;
        border: 1px solid red;
   }
   
   .right{
         order: 3;
         background-color: lightblue;
         float: right;
         width: 18%;
         height:100%;
         border: 1px solid blue;
   }
   .left{
         order: 1;
         background-color: lightblue;
         float: left;
         width: 18%;
         height:100%;
         border: 1px solid blue;
   }
   .mainlist{
         order: 2;
         background-color: lightyellow;
         float: center;
         width: 60%;
         height: 100%;
         border: 1px solid yellow;
   }
   #count{
      display: none;
   }
   
   .modalDialog {
   position: fixed;
   font-family: Arial, Helvetica, sans-serif;
   top: 0;
   right: 0;
   bottom: 0;
   left: 0;
   background: rgba(0,0,0,0.8);
   z-index: 99999;
   opacity:0;
   -webkit-transition: opacity 400ms ease-in;
   -moz-transition: opacity 400ms ease-in;
   transition: opacity 400ms ease-in;
   pointer-events: none;
   }
   
    .modalDialog:target {
   opacity:1;
   pointer-events: auto;
   }

   .modalDialog > div {
   width: 400px;
   position: relative;
   margin: 10% auto;
   padding: 5px 20px 13px 20px;
   border-radius: 10px;
   background: #fff;
   background: -moz-linear-gradient(#fff, #999);
   background: -webkit-linear-gradient(#fff, #999);
   background: -o-linear-gradient(#fff, #999);
   }  
   .close {
   background: #606061;
   color: #FFFFFF;
   line-height: 25px;
   position: absolute;
   right: -12px;
   text-align: center;
   top: -10px;
   width: 24px;
   text-decoration: none;
   font-weight: bold;
   -webkit-border-radius: 12px;
   -moz-border-radius: 12px;
   border-radius: 12px;
   -moz-box-shadow: 1px 1px 3px #000;
   -webkit-box-shadow: 1px 1px 3px #000;
   box-shadow: 1px 1px 3px #000;
   }

   .close:hover { background: #00d9ff; }
</style>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<script>


	//====== John 수정 12/2 =====
	var sessionId = '${mid}';
	var flag = true;
	var replyCounter = 2;
	var repliesArray = new Map();
	//=========================

	$(document).ready(function(){
		//====== John 수정 12/2 =====
		$('.replyLineClass').hide();
		$('.closeReplies').hide();
		//=========================
		$('#catlist').hide();
		$('#close').hide();
		$('#catbutton1').click(function(){
			var form = {m_id : '${mid}'}
			$.ajax({
				type:"POST",
				url:"categorycall",
				data: form,
				dataType: "json",
				success: function(data){
					console.log(data.Y)
					console.log(data.N)
					$("#catform").append("<div id='listdiv'></div>");
					$.each(data.Y, function (i, item) {   // item은 N Y 임 즉 스포츠부터 차례대로임.
// each(data,function(i,item)) i 만큼 돌고  item 은 data 가 하나하나 들어감 , list 가 data 라고 치면 행 하나하나가 들어감 ex) dto d = list.get(i) 이렇게 하나의 줄이 다 들어감
              //  alert("i : "+i);
                        //  alert("item : "+item.version);
                         // alert("item : "+item.codename);
                         $("#listdiv").append(item +"<input type='checkbox' class='check_cate' name='c_"+item+"' checked='checked'><br>");
                         console.log(item);
                      });
                   $.each(data.N, function (i, item) {
                    $("#listdiv").append(item +"<input type='checkbox' class='check_cate' name='c_"+item+"'><br>");
                    });
					 $('#listdiv').append("<input type='submit' value='등록'>");
					 $('#close').show();
					$("#catbutton1").hide();
					$("#catlist").show();
				}
			});	
		});
	});
	
	
	/////////////////////////////////////////////////////////////////
	  function catupdate() {
		   $("#catlist").hide();
	       $(".check_cate").each(function () {
	           if ($(this).is(":checked")) {
	        	   var cat_name = $(this).attr("name");
	               $("#catform").append("<input type='hidden' name='"+cat_name+"' value='Y'>");
	           }else{
	           		var cat_name = $(this).attr("name");
	      	  		 $("#catform").append("<input type='hidden' name='"+cat_name+"' value='N'>");
	           }
	   			$("#listdiv").remove(); // 여기까지 다 실행되고 서브밋 되기때문에 위에서 임의로 catform에 값을 넣어줘야 함.
	       	});
	   }

                

   
   
	function cateclose() {
		$("#catlist").hide();
		$("#catbutton1").show();
		$("#close").hide();
		$("#listdiv").remove();
	}
	
	//====== John 수정 12/2 =====
	function replyPostOpen(idgroup) {
		$('#replyLine'+idgroup).show();
	}
	function replyPost(idgroup){
		$.ajax({
			url: "reply_post_send",
			type: "POST",
			data: {
				'm_id': sessionId,
				'r_idgroup': idgroup,
				'r_content': $('#replyBody'+idgroup).val()
				},
			success: function(data) {
				alert("Reply Success, data:" + data);
				getOneReply(idgroup);
			},
			error: function(){
				alert("Error")
			}	
		});
	}
	$(function(idgroup){
		$('.replyLineClass[onload]').trigger('onload');
	});
	function createReplyArray(idgroup) {
		repliesArray.set(idgroup, replyCounter);
	}
	
	function getOneReply(idgroup) {
		var tempCounter = repliesArray.get(idgroup);
		$.ajax({
			url: "post_reply_show_one",
			type: "POST",
			data: {'r_idgroup': idgroup},
			success: function(data) {
				alert("success");
				$('.reply-list-container'+idgroup).prepend("<tr class='appendedTr'>" +
					"<td class='appendedTd'>like</td>" +
					"<td>"+data.oneReply.m_id+"</td>" +
					"<td colspan='2'>"+data.oneReply.r_content+"</td>" +
					"</tr>");
				tempCounter +=1;
				repliesArray.set(idgroup, tempCounter);		
			},
			error: function(){
				alert("Error");
			}
		});
	}
	
	function showReplies(idgroup) {
		console.log('showreplies idgrou: ' + idgroup);
		var tempCounter = 0;
		var tempCounter = repliesArray.get(idgroup);
		$('.closeReplies').show();
		$.ajax({
			url: "post_reply_show",
			type: "POST",
			data: {'r_idgroup': idgroup,
				'counter' : tempCounter
				},
			success: function(data) {
				alert("success");
				
				$.each(data.reply, function(index, value) {
				console.log(index + "" + value.r_idgroup);
					$('.reply-list-container'+value.r_idgroup).append("<tr class='appendedTr'>" +
							"<td>like</td>" +
							"<td>"+value.m_id+"</td>" +
							"<td colspan='2'>"+value.r_content+"</td>" +
							"</tr>");
				});
				tempCounter +=4;
				repliesArray.set(idgroup, tempCounter);		
			},
			error: function() {
				alert("error");
			}
		});
	}
	$('body').on({
		DOMNodeInserted : function(){
			console.log('dynamic insert');
			$('.replyLineClass[onload]').trigger('onload');
			alert("dynamic");
		}
	});
	
	function closeReplies(idgroup) {
		$('.appendedTr').remove();
		var tempCounter = 2;
		repliesArray.set(idgroup, tempCounter);	
		$('.closeReplies').hide();
	}
	
	//=========================
	
	   $(window).scroll(function() {
	    	if ($(window).scrollTop() == $(document).height() - $(window).height()) {
	    		var realcount = {countform : $('#realcount').val()}
	    		console.log(realcount);
	        	$.ajax({
					url:"mainajax",
					type:"POST",
					data:realcount,
					dataType: "json",
					cache 	: false,
					success: function(data){
						if(data.chk=='true'){ // 일단 3개이상일 때임 postForm
							var id1 = 'post'+data.count; //3들어옴
							var id2 = 'post'+(data.count+1); //4
							var id3 = 'post'+(data.count+2); //5 포스트 6개 가져옴
							$(".mainlist").append("<hr>");
							$(".mainlist").append("<table class='post' align='center' border='1' class='postForm' id='"+id1+"'></table>");
							$(".mainlist").append("<hr>");
							$(".mainlist").append("<table class='post' align='center' border='1' class='postForm' id='"+id2+"'></table>");
							$(".mainlist").append("<hr>");
							$(".mainlist").append("<table class='post' align='center' border='1' class='postForm' id='"+id3+"'></table>");
							for (var i = 0; i < 3; i++) {
								console.log(data.count+i);
								console.log(id2);
								$("#post"+(data.count+i)).append("<tbody><tr height='5%'>" + 
										"<th width='15%'>카테고리</th><td width='15%' align='center'>"+data.list2[i].p_cat+"</td>" + 
										"<th width='20%'>제목</th><td width='50%' align='center'>"+data.list2[i].p_title+"</td>" +
										"</tr><tr height='40%'><td colspan='4' align='center'>"+data.list2[i].p_content+"</td></tr>" +
										"<tr height='30%'><td colspan='4' align='center'>"+data.list2[i].p_img +"</td></tr>" + 
										"<tr height='5%'><th>해시</th><td colspan='3'>"+data.list2[i].p_hash+"</td><tr height='5%'><td>like</td>" + 
										"<th colspan='2'>작성자</th><td align='center'>"+data.list2[i].m_id+"</td></tr>" +
										"<tr height='5%'><td colspan='4' align='center'>" +
										"<form action='#openReply'>" +
										"<input type='hidden' value='"+data.list2[i].p_idgroup+"' name='idgroup'>"+
										"<input type='hidden' value='${param.u_id }' name='u_id'>"+
										"<input type='submit' value='댓글보기'>"+
										"</form></td></tr></table>");
										createReplyArray(data.list2[i].p_idgroup);
										$('.replyLineClass').hide();
								
							
							}
							var count = data.count+3; // 6
							console.log(count);
							$(".divcount").remove();
							$(".mainlist").append("<div class='divcount'><input type='hidden' id='realcount' value='"+count+"'></div>")
							//$(".mainlist").append()
							// <input type='hidden' id='realcount' value='${endcount }'>
						}else if(data.chk=='false'){
							alert("마지막 글입니다.")
						}else if(data.chk=='1'){
							var id1 = 'post'+data.count+1;
							$(".mainlist").append("<hr>");
							$(".mainlist").append("<table class='post' align='center' border='1' class='postForm' id='"+id1+"'></table>");
							for (var i = 0; i < 1; i++) {
								$("#post"+(data.count+i)).append("<tbody><tr height='5%'>" + 
										"<th width='15%'>카테고리</th><td width='15%' align='center'>"+data.list2[i].p_cat+"</td>" + 
										"<th width='20%'>제목</th><td width='50%' align='center'>"+data.list2[i].p_title+"</td>" +
										"</tr><tr height='40%'><td colspan='4' align='center'>"+data.list2[i].p_content+"</td></tr>" +
										"<tr height='30%'><td colspan='4' align='center'>"+data.list2[i].p_img +"</td></tr>" + 
										"<tr height='5%'><th>해시</th><td colspan='3'>"+data.list2[i].p_hash+"</td><tr height='5%'><td>like</td>" + 
										"<th colspan='2'>작성자</th><td align='center'>"+data.list2[i].m_id+"</td></tr>" +
										"<tr height='5%'><td colspan='4' align='center'>" +
										"<form action='#openReply'>" +
										"<input type='hidden' value='"+data.list2[i].p_idgroup+"' name='idgroup'>"+
										"<input type='hidden' value='${param.u_id }' name='u_id'>"+
										"<input type='submit' value='댓글보기'>"+
										"</form></td></tr></table>");
										createReplyArray(data.list2[i].p_idgroup);
										$('.replyLineClass').hide();
								
								
							}
							var count = data.count; // 6
							console.log(count);
							$(".divcount").remove();
							$(".mainlist").append("<div class='divcount'><input type='hidden' id='realcount' value='"+count+"'></div>")
						}else if(data.chk=='2'){
							var id1 = 'post'+data.count;
							var id2 = 'post'+(data.count+1);
							console.log(id2);
							$(".mainlist").append("<hr>");
							$(".mainlist").append("<table class='post' align='center' border='1' class='postForm' id='"+id1+"'></table>");
							$(".mainlist").append("<hr>");
							$(".mainlist").append("<table class='post' align='center' border='1' class='postForm' id='"+id2+"'></table>");
							for (var i = 0; i < 2; i++) {
								$("#post"+(data.count+i)).append("<tbody><tr height='5%'>" + 
										"<th width='15%'>카테고리</th><td width='15%' align='center'>"+data.list2[i].p_cat+"</td>" + 
										"<th width='20%'>제목</th><td width='50%' align='center'>"+data.list2[i].p_title+"</td>" +
										"</tr><tr height='40%'><td colspan='4' align='center'>"+data.list2[i].p_content+"</td></tr>" +
										"<tr height='30%'><td colspan='4' align='center'>"+data.list2[i].p_img +"</td></tr>" + 
										"<tr height='5%'><th>해시</th><td colspan='3'>"+data.list2[i].p_hash+"</td><tr height='5%'><td>like</td>" + 
										"<th colspan='2'>작성자</th><td align='center'>"+data.list2[i].m_id+"</td></tr>" +
										"<tr height='5%'><td colspan='4' align='center'>" +
										"<form action='#openReply'>" +
										"<input type='hidden' value='"+data.list2[i].p_idgroup+"' name='idgroup'>"+
										"<input type='hidden' value='${param.u_id }' name='u_id'>"+
										"<input type='submit' value='댓글보기'>"+
										"</form></td></tr></table>");
										createReplyArray(data.list2[i].p_idgroup);
										$('.replyLineClass').hide();
							}
							var count = data.count+1; // 6
							console.log(count);
							$(".divcount").remove();
							$(".mainlist").append("<div class='divcount'><input type='hidden' id='realcount' value='"+count+"'></div>")
							//$(".mainlist").append()
						}
					},
					error:function(){
						alert("에러.")
					}
					
				});
	          
	
	        }
	    });
	   
	   

   function cateclose() {
      $("#catlist").hide();
      $("#catbutton1").show();
      $("#close").hide();
      $("#listdiv").remove();
   }
   
   /*
      $(window).scroll(function() {
          if ($(window).scrollTop() == $(document).height() - $(window).height()) {
             var realcount = {countform : $('#realcount').val()}
             console.log(realcount);
              $.ajax({
               url:"mainajax",
               type:"POST",
               data:realcount,
               dataType: "json",
               cache    : false,
               success: function(data){
                  if(data.chk=='true'){ // 일단 3개이상일 때임 postForm
                     var id1 = 'post'+data.count; //3들어옴
                     var id2 = 'post'+(data.count+1); //4
                     var id3 = 'post'+(data.count+2); //5 포스트 6개 가져옴
                     $(".mainlist").append("<hr>");
                     $(".mainlist").append("<table class='post' align='center' border='1' class='postForm' id='"+id1+"'></table>");
                     $(".mainlist").append("<hr>");
                     $(".mainlist").append("<table class='post' align='center' border='1' class='postForm' id='"+id2+"'></table>");
                     $(".mainlist").append("<hr>");
                     $(".mainlist").append("<table class='post' align='center' border='1' class='postForm' id='"+id3+"'></table>");
                     for (var i = 0; i < 3; i++) {
                        $("#post"+(data.count+i)).append("<tr height='5%'><th width='15%'>카테고리</th><td width='15%' align='center'>"+data.list2[i].p_cat+"</td><th width='20%'>제목</th><td width='50%' align='center'>"
                                                +data.list2[i].p_title+"</td></tr><tr height='40%'><td colspan='4' align='center'>"+data.list2[i].p_content
                                                +"</td></tr><tr height='30%'><td colspan='4' align='center'>"+data.list2[i].p_img
                                                +"</td></tr><tr height='5%'><th>해시</th><td colspan='3'>"+data.list2[i].p_hash
                                                +"</td><tr height='5%'><td>like</td><th colspan='2'>작성자</th><td align='center'>"+data.list2[i].m_id
                                                +"</td></tr><tr height='5%'><td colspan='1' align='center'><input type='button' class='replyPostOpen' onclick='replyPostOpen()' value='댓글'>"
                                                +"<td id='replyLine' colspan='3' align='center'><form id='replyFrm'><input type='text' name='replyContent'><input type='button' class='replyPost' onclick='replyPost()' value='답장'>"
                                                +"</form></td></tr>");
                        
                        
                     }
                     var count = data.count+3; // 6
                     console.log(count);
                     $(".divcount").remove();
                     $(".mainlist").append("<div class='divcount'><input type='hidden' id='realcount' value='"+count+"'></div>")
                     //$(".mainlist").append()
                     // <input type='hidden' id='realcount' value='${endcount }'>
                  }else if(data.chk=='false'){
                     alert("마지막 글입니다.")
                  }else if(data.chk=='1'){
                     var id1 = 'post'+data.count+1;
                     $(".mainlist").append("<hr>");
                     $(".mainlist").append("<table class='post' align='center' border='1' class='postForm' id='"+id1+"'></table>");
                     for (var i = 0; i < 1; i++) {
                        $("#post"+(data.count+i)).append("<tr height='5%'><th width='15%'>카테고리</th><td width='15%' align='center'>"+data.list2[i].p_cat+"</td><th width='20%'>제목</th><td width='50%' align='center'>"
                                                +data.list2[i].p_title+"</td></tr><tr height='40%'><td colspan='4' align='center'>"+data.list2[i].p_content
                                                +"</td></tr><tr height='30%'><td colspan='4' align='center'>"+data.list2[i].p_img
                                                +"</td></tr><tr height='5%'><th>해시</th><td colspan='3'>"+data.list2[i].p_hash
                                                +"</td><tr height='5%'><td>like</td><th colspan='2'>작성자</th><td align='center'>"+data.list2[i].m_id
                                                +"</td></tr><tr height='5%'><td colspan='1' align='center'><input type='button' class='replyPostOpen' onclick='replyPostOpen()' value='댓글'>"
                                                +"<td id='replyLine' colspan='3' align='center'><form id='replyFrm'><input type='text' name='replyContent'><input type='button' class='replyPost' onclick='replyPost()' value='답장'>"
                                                +"</form></td></tr>");
                        
                        
                     }
                     var count = data.count; // 6
                     console.log(count);
                     $(".divcount").remove();
                     $(".mainlist").append("<div class='divcount'><input type='hidden' id='realcount' value='"+count+"'></div>")
                  }else if(data.chk=='2'){
                     var id1 = 'post'+data.count;
                     var id2 = 'post'+(data.count+1);
                     console.log(id2);
                     $(".mainlist").append("<hr>");
                     $(".mainlist").append("<table class='post' align='center' border='1' class='postForm' id='"+id1+"'></table>");
                     $(".mainlist").append("<hr>");
                     $(".mainlist").append("<table class='post' align='center' border='1' class='postForm' id='"+id2+"'></table>");
                     for (var i = 0; i < 2; i++) {
                        $("#post"+(data.count+i)).append("<tr height='5%'><th width='15%'>카테고리</th><td width='15%' align='center'>"+data.list2[i].p_cat+"</td><th width='20%'>제목</th><td width='50%' align='center'>"
                                                +data.list2[i].p_title+"</td></tr><tr height='40%'><td colspan='4' align='center'>"+data.list2[i].p_content
                                                +"</td></tr><tr height='30%'><td colspan='4' align='center'>"+data.list2[i].p_img
                                                +"</td></tr><tr height='5%'><th>해시</th><td colspan='3'>"+data.list2[i].p_hash
                                                +"</td><tr height='5%'><td>like</td><th colspan='2'>작성자</th><td align='center'>"+data.list2[i].m_id
                                                +"</td></tr><tr height='5%'><td colspan='1' align='center'><input type='button' class='show_reply' onclick='reply_test(${post.p_idgroup })' value='show_reply'> "
                                                +"<td id='replyLine' colspan='3' align='center'><form id='replyFrm'><input type='text' name='replyContent'><input type='button' class='replyPost' onclick='replyPost()' value='답장'>"
                                                +"</form></td></tr>");
                        
                        
                     }
                     var count = data.count+1; // 6
                     console.log(count);
                     $(".divcount").remove();
                     $(".mainlist").append("<div class='divcount'><input type='hidden' id='realcount' value='"+count+"'></div>")
                     //$(".mainlist").append()
                  }
               },
               error:function(){
                  alert("에러.")
               }
            });
             
   
           }
       });
      */
      
      
      
      //여기부터 추가 했음 12-01
      var cnt=0;
         function reply_test(p_idgroup) {
               num = p_idgroup;
               console.log(num)

               var form = {
                     p_idgroup : p_idgroup
               }
               var lists = new Array();
               console.log(cnt)
               if((cnt%2)==0){
                  $.ajax({
                     url:"replylist",
                     type:"POST",
                     data: form,
                     cache    : false,
                     dataType: "json",
                     success: function(data){
                        console.log(data)
                        lists=data.replylist_1;
                        for(var i=0; i<lists.length; i++){
                           $(".reply_add"+num).append(
                              "<table border='1' class='reply_table"+num+"'>"+
                              "<tr><td>"+lists[i].m_id+"</td></tr>"+
                              "<tr><td>"+lists[i].r_idgroup+"</td></tr>"+
                              "<tr><td>"+lists[i].r_content+"</td></tr>"+
                              "<tr><td>"+lists[i].r_date+"</td><td>"+lists[i].r_like+"</td></tr>"+
                              "</table>"
                            );
                        }
                           $(".reply_add"+num).append(
                              "<table class='reply_table_w"+num+"'>"+
                              "<tr><td>글작성</td></tr>"+
                              "<tr><td><input class='w_re"+num+"' type='text' placeholder='댓글작성'></td></tr>"+
                              "<tr><td><input type='button' onclick='reply_write("+num+")' value='add' ></td></tr>"+
                              "</table>"
                            );
                     },
                  error:function(){
                     alert("문제가 발생 하였습니다.")
                  }
                  });
                  cnt++;
               }else if((cnt%2)!=0){
                  $(".reply_table"+num).remove();
                  $(".reply_table_w"+num).remove();
                  cnt++;
               }
         }
       //여기까지 추가 했음

</script>

<body>
   <!-- 카카오로 로그인 했을 경우 -->
   <jsp:include page="/WEB-INF/views/header/m_header.jsp" />
    <c:set var="postlist" value="${postlist }"/>
   <c:if test="${mid!=null}">
   <div class="bodyall" align="center">
      <div class="left">
         <input type="button" id="catbutton1" value="카테고리 등록하기">
         <input type="button" id="close" value="접기" onclick="cateclose()">
         <div id="catlist">
            <form action="catupdate" id="catform" method="post" onsubmit="return catupdate()">
               <input type="hidden" name="m_id" value="${mid }">
            </form> 
         </div>
      </div>            
         
         
           <div class="mainlist" align="center">
           <h1>메인페이지</h1>
         
         <div class="divcount">
            <input type="hidden" id="realcount" value="${pdtosize }">
        </div>
        
            <c:forEach var="post" items="${pdto1 }">
            <hr>
          
            <table class="post" align="center" border="1" class="postForm">
            <tr height="5%">
               <th width="15%">카테고리</th>
               <td width="15%" align="center">${post.p_cat }</td>
               <th width="20%">제목</th>
               <td width="50%" align="center">${post.p_title }</td>
            </tr>
            <tr height="40%">
               <td colspan="4" align="center">${post.p_content }</td>
            </tr>
            <tr height="30%">
               <td colspan="4" align="center"><!--  ${post.p_img }-->사진첨부해야됨</td>
            </tr>
            <tr height="5%">
               <th>해시</th>
               <td colspan="3">${post.p_hash }</td>
            <tr height="5%">
               <td>like</td>
               <th colspan="2">작성자</th>
               <td align="center">${post.m_id }</td>
            </tr>
            
            <tr height="5%">
				<td colspan="4" align="center">
					<form action="#openReply"> 
						<input type="hidden" value="${post.p_idgroup }" name="idgroup"> 
						<input type="submit" value="댓글보기">
					</form>  
				</td>
			</tr>   
			</table>
  	   </c:forEach>
  	   
  	    <a href="#openReply">Open Reply</a>
				<div id="openReply" class="replyList">
					<div class="test">
						<a href="#close" title="Close" class="close">X</a>
						
					<div class="reply-big-container">
					<div class="repliesTable">
					
					<table border="1" align="center" class="table1">
					
					<tbody class="reply-list-big-container">
						<tbody align="center" class="reply-list-container${param.idgroup }" id="reply-list-container">
						<thead align="center"></thead>
						</tbody>
					</tbody>
					</table>
					</div>
					<div class="replyButtonsTable">
					<table border="1" align="center" class="table2">
					
					<tr>
						<td colspan="4" align="center">
							<input type="button" class="showReplies" onclick="showReplies('${param.idgroup}')" value="댓글보기">
							<input type="button" class="closeReplies" onclick="closeReplies('${param.idgroup}')" value="닫기">
						</td>
					</tr>
					</tbody>
					
					<tbody class="reply-button-container">
					<tr>
						<td colspan="1" align="center">
							<input type="button" class="replyPostOpen" onclick="replyPostOpen('${param.idgroup}')" value="댓글">
						</td>
						<td onload="createReplyArray('${param.idgroup}')" class="replyLineClass" id="replyLine${param.idgroup }" colspan="3" align="center">
						<form id="replyFrm">
							<input class="replyBody" id="replyBody${param.idgroup }" type="text" name="replyContent">
							<input type="button" class="replyPost" onclick="replyPost('${param.idgroup}')" value="답장">
						</form>
						</td>					
					</tr>	
					</tbody>
					</table>
					</div>
					</div>
				</div>
				</div>
  	   
      		</div>
      		
      		
      	 <br><br>
  	   
  	   
  	   <div class="right">
  	   	우측페이지
  	   </div>
  	  </div>
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
	

</body>
</html>