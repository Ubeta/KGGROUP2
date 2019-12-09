<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/resources/images/placeholder.jpg" var="placeholder" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <style type="text/css">
         body {
            overFlow : auto;
            width: 100%;
            height: 100%;
            margin: 0px;
            padding: 0px;
         }
         
         .pagewrap{
            width: 100%;
            height: 100%;
         }
         .bodywrap{
            width: 1900px;
            height: 1000px;
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
            margin-bottom: 30px;
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
         
         .f_info{
            background-color: lightblue;
            text-align: center;
         }
         
         
        
         .write_board{
            margin: 10px;
            padding: 10px;
            text-align: center;
            border-top: 1px solid black;
         }
         .write_board h3{
            height:45px;
              margin-left:150px;
             margin-right:150px;
             color:#fff;
              font-size:14px; 
              line-height:45px; 
              background-color:#495164;
         }
         .write_board_table{
            margin-left: auto;
            margin-right: auto;
         }
         
         .board{
            background-color: lightyellow;
            height: 650px;
            margin-left: 10px;
            margin-right: 10px;
            margin-bottom: 50px;
         }
         .board_table{
         text-align: center;
         width: 100%;
         height: 300px;
         font-size: 0.3em;
         border-top: 1px solid black;
         margin-bottom: 50px;
         }
         .reply_table{
         width: 100%;
         background-color: gray;
         height: 100px;
         font-size: 0.3em;
         border-top: 1px solid black;
         margin-bottom: 50px;
         }
         
         
         
         
         
         
         
         
         
         
         
         .post-container {
            order: 1;
         }
         .post-container table {
            width: 70%;
            height: 16em;
            border-spacing: 0.2em;
            border-collapse: seperate;
         }
         .post-container table th {
            padding: 0.5em;
            font-size: 16pt;
         }
         .post-container table td {
            padding: 0.5em;
            font-size: 12pt;
         }
         .post {
            margin-top: 5%;
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
   width: 700px;
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
   <style type="text/css">
   
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
   
   
   .repliesTable {
      width: 100%;
      overflow: auto;
   }
   
   .replyButtonsTable .table2{
      height: 20px;
   }
   #reply-list-container {
      
      display: block;
      overflow: auto;
      height: 200px;
      width: 100%;
      
   }
   #reply-list-container th, #reply-list-container td, #reply-list-container tr {
      text-align: center;
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
   }
   .appendedTd {
      text-align: center;
   }
   
   
   
   </style>
   
   
   
   
   
   
   <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
   <jsp:useBean id="dao" class="com.care.modelDAO.ModelDAO"/>
   
   <script type="text/javascript">
   $(document).ready(function(){
        $('.replyLineClass').hide();
      $('.closeReplies').hide();
      console.log('${postSuccess}');
      if ('${postSuccess}' != "") {
         console.log('${postSuccess}');
         if ('${postSuccess}' == '1') {
            alert("글 작성 완료");
         } else {
            alert("문제 발생");
         }
      }
 });
  
  
  function replyPostOpen(idgroup) {
      $('#replyLine'+idgroup).show();
   }
   
   function replyPost(idgroup){
      $.ajax({
         url: "reply_post_send",
         type: "POST",
         data: {
            'm_id': '${mid}',
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
   $('body').on({
      DOMNodeInserted : function(){
         console.log('dynamic insert');
         $('.replyLineClass[onload]').trigger('onload');
         alert("dynamic");
      }
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
               "<td class='appendedTd'><button onload='r_like_btn("+value.m_id+","+value.r_idgroup+","+value.r_num+")' id='rbtn"+value.r_num+"' class='rr_btn_class'  onclick='r_like("+value.r_idgroup+","+value.r_num+")' >좋아<br>"+value.r_like+"</button></td>" +
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
      console.log(idgroup)
      $('.closeReplies').show();
      $.ajax({
         url: "post_reply_show",
         type: "POST",
         data: {'r_idgroup': idgroup,
            'counter' : tempCounter
            },
         success: function(data) {
            console.log(data)
            alert("success");
            
            $.each(data.reply, function(index, value) {
            console.log(index + "" + value.r_idgroup);
               $('.reply-list-container'+value.r_idgroup).append("<tr class='appendedTr'>" +
                     "<td><button onload='r_like_btn("+value.m_id+","+value.r_idgroup+","+value.r_num+")' id='rbtn"+value.r_num+"' class='r_btn_class'  onclick='r_like("+value.r_idgroup+","+value.r_num+")' >좋아<br>"+value.r_like+"</button></td>" +
                     "<td>"+value.m_id+"</td>" +
                     "<td>"+value.r_num+"</td>" +
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
   
    function r_like(r_idgroup,r_num){
         var r_num = r_num
         var r_dto = {
               m_id : m_id,
               r_idgroup : r_idgroup,
               r_num : r_num
         }
         
         $.ajax({
            url:"r_like_up",
            type:"POST",
            data: r_dto,
            dataType: "json",
            success: function(data){
               if(data.chk==0){
                  alert("댓글 좋아요 올리기 성공.")
                  location.href='mypage';
               }else if(data.chk==1){
                  alert("댓글 좋아요 취소.")
                  location.href='mypage';
               }else if(data.chk==2){
                  alert("댓글 좋아요 초기 올리기 성공.")
                  location.href='mypage';
               }
            },
             error:function(){
                alert("문제가 발생 하였습니다.")
            }
         });
      }
    
       $(function(id,r_idgroup , r_num){
            $('.r_btn_class[onload]').trigger('onload');
         });
       
      var rbtn="#rbtn"
      function r_like_btn(id,r_idgroup,r_num){
      console.log('온로드')
      var form = {
            m_id : id,
            r_idgroup :r_idgroup,
            r_num : r_num
      }
      $.ajax({
         url: "r_like_btn",
         type: "POST",
         data: form,
         success: function(data) {
            if(data.chk==1){
            console.log(data.r_num)
            $( rbtn+data.rr_num ).css({
               color: "red"
            });
      }
      },
      error: function() {
      
         }
      });
      }
   
   function closeReplies(idgroup) {
      $('.appendedTr').remove();
      var tempCounter = 2;
      repliesArray.set(idgroup, tempCounter);   
      $('.closeReplies').hide();
   }
   </script>
   
<script type="text/javascript">
   var m_id = '${mid}';
   var flag = true;
   var replyCounter = 2;
   var repliesArray = new Map();
   var testmap = new Map();
 
 
    //윈도우 열림
   window.onload = function(){
      setTimeout (function(){
      scrollTo(0,0);
      },100);
   }   
   
   function my_info(){
       location.href='#openModal';
        $.ajax({
           url:"my_info",
            type:"POST",
            dataType: "json",
            cache    : false,
            success: function(data){
               $('#my_id').val(data.memdto.m_id);
               $('#my_pw').val(data.memdto.m_pw);
               $('#my_name').val(data.memdto.m_name);
               $('#my_idnum').val(data.memdto.m_idnum);
               $('#my_pic').attr('src', 'img/'+data.memdto.m_pic);
               
               var gender=null;
               if(data.memdto.m_gender==1){
                  gender="남자";
               }else{
                  gender="여자";
               }
               $('#my_gender').val(gender);
               $('#my_tel').val(data.memdto.m_tel);
               $('#my_mail').val(data.memdto.m_mail);
            },
            error:function(){
               alert("문제가 발생 하였습니다.")
            }
         });
      }
      
      function user_find(){
         var u_id = $('#m_id').val();
         var form = {
               m_id : u_id
         }
         $.ajax({
            url:"user_find",
            type:"POST",
            data: form,
            dataType: "json",
            cache    : false,
            success: function(data){
               console.log(data)
               console.log(data.chk)
               if(data.chk == 0){
                  alert("없는 아이디 입니다.")
                  
               }else if (data.chk == 1){
                  $('#td_id').text(data.dto.m_id);
                  $('#td_name').text(data.dto.m_name);
                  $('#td_tel').text(data.dto.m_tel);
               }
            },
            error:function(){
               alert("문제가 발생 하였습니다.")
            }
         });
      }
      function enter(){
         $('.user_find').keypress(function(e) { 
            if (e.keyCode == 13){
               user_find();
               $('.u_find_btn').focus();
             }
         });
      }
      
      function friend_page(){
         var f_id = $('#td_id').text();
         location.href='u_page?u_id='+f_id;
      }
      
      /*
      function write_board(){
         alert("1")
         alert("2")
         var p_cat = $("#p_cat option:selected").val();
         var p_hash = $('#p_hash').val();
         var p_title = $('#p_title').val();
         var p_content =  $('#p_content').val();
         var p_img = $('#postImage').val();
         var p_scope = $('#p_scope').val();
<<<<<<< HEAD
         var form = {
               m_id : m_id,
               p_cat : p_cat,
               p_hash : p_hash,
               p_title : p_title,
               p_content : p_content,
               p_img : p_img,
               p_scope : p_scope,
         };
         
         
         var formData = new FormData();
         formData.append('p_cat', $("#p_cat option:selected").val())
         formData.append('p_hash', $('#p_hash').val())
         formData.append('p_title', $('#p_title').val())
         formData.append('p_content', $('#p_content').val())
         formData.append('p_scope', $('#p_scope').val())
         formData.append("pImg", $('#postImage').files[0]);
         
         
         var formData = new FormData();
         if ($('#postImage').get(0).files.length === 0 ) {
            formData.append("pImg", null);
         } else {
            formData.append("pImg", $('#postImage').files[0]);
         }
         console.log(form);
         $.ajax({
            url:"write_board",
            type:"POST",
            data: { 'pdto' : form, 'formData' : formData},
            processData: false,
            contentType: false,
            enctype:"multipart/form-data",
            success: function(data){
               alert("글 작성 완료.")
               location.href='mypage';
            },
            error:function(){
               alert("문제가 발생 하였습니다.")
            }
         });
      
     };

         if(p_title=="" || p_title==null){
            alert('제목을 입력하세요')
         }else{
            if(p_cat=="" || p_cat==null){
                alert('카테고리를 입력하세요')
             }else{
                if(p_scope=="" || p_scope==null){
                    alert('공개범위를 입력하세요')
                 }else{
                    var form = {
                             m_id : m_id,
                             p_cat : p_cat,
                             p_hash : p_hash,
                             p_title : p_title,
                             p_content : p_content,
                             p_img : p_img,
                             p_scope : p_scope,
                       }
                       console.log(form);
                       $.ajax({
                          url:"write_board",
                          type:"POST",
                          data: form,
                          cache    : false,
                          success: function(data){
                             alert("글 작성 완료.")
                             location.href='mypage';
                          },
                          error:function(){
                             alert("문제가 발생 하였습니다.")
                          }
                       });
                 }
             }
         }        
      }

      */
      
      
      
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
      
      function reply_write(num) {
         var id = '${mid}';
         var idgroup = num;
         var content = $(".w_re"+num).val();
         var like = 0;
         console.log(content)
         
         if(content==""){
            alert('댓글 내용을 입력하세요')
         }else{
         
            var r_dto = {
                  m_id : id,
                  r_idgroup : idgroup,
                  r_content : content,
                  r_like : like
            }
            
            $.ajax({
               url:"reply_write",
               type:"POST",
               data: r_dto,
               success: function(data){
                  alert("댓글 등록 완료.")   
                  reply_test(num);
                  reply_test(num);
               },
                error:function(){
                   alert("문제가 발생 하였습니다.")
               }
            });
         }
      }
      
      function p_like(p_idgroup){
         var idgroup = p_idgroup
         var p_dto = {
               m_id : m_id,
               p_idgroup : idgroup
         }
         
         $.ajax({
            url:"like_up",
            type:"POST",
            data: p_dto,
            dataType: "json",
            success: function(data){
               if(data.chk==0){
                  alert("좋아요 올리기 성공.")
                  location.href='mypage';
               }else if(data.chk==1){
                  alert("좋아요 취소.")
                  location.href='mypage';
               }else if(data.chk==2){
                  alert("좋아요 초기 올리기 성공.")
                  location.href='mypage';
               }
            },
             error:function(){
                alert("문제가 발생 하였습니다.")
            }
         });
      }
      
      
      
      
      
      
      
      
      
      
      
      $(window).scroll(function(){
        if ($(window).scrollTop() == $(document).height() - $(window).height()) {
           flag = true;
           $('.loader').show();
           $.ajax({
              url: "boardlist",
              type: "POST",
              data: {'u_id':m_id},
              dataType: "JSON",
              cache: false,
              success: function(data) {
                 if (flag && data.morePosts) {
                    flag = false;
                    $('.loader').hide();
                       if (data != null) {
                          console.log(data.post.m_id)
                            console.log(data.post.p_idgroup)
                            console.log(data.post.p_num)
                       p_like_btn( data.post.m_id, data.post.p_idgroup );
                       
                       $(".post-container").append(
                           "<table class='post' align='center' border='1'>"+
                             "<tr height='5%'>" + 
                                "<th width='15%'>카테고리</th>"+
                                "<td width='15%' align='center'>"+data.post.p_cat+"</td>"+ 
                                "<th width='20%'>제목</th>"+
                                "<td width='50%' align='center'>"+data.post.p_title+"</td>"+
                             "</tr>"+
                             
                             "<tbody height='40%' class='post-image"+data.post.p_num+"'></tbody>"+
                             
                             "<tr height='5%'>"+
                                "<th>해시</th>"+
                                "<td colspan='3'>"+data.post.p_hash+"</td>"+
                             "<tr height='5%'>" +
                                "<td><button onload='p_like_btn("+data.post.m_id+",'"+data.post.p_idgroup+"')' id='btn"+data.post.p_idgroup+"' class='p_btn_class'  onclick='p_like("+data.post.p_idgroup+")' >좋아요 : "+data.post.p_like+"</button></td>"+
                                "<th>작성자</th><td align='center'>"+data.post.m_id+"</td>"+
                                "<td><button class='del_post' onclick='del_post("+data.post.p_num+")'>글삭제</button></td>"+
                             "</tr>"+                          
                             "<tr height='5%'><td colspan='4' align='center'>" +
                          "<form action='#openReply'>" +
                          "<input type='hidden' value='"+data.post.p_idgroup+"' name='idgroup'>"+
                          "<input type='hidden' value='${mid }' name='u_id'>"+
                          "<input type='submit' value='댓글보기'>"+
                          "</form></td></tr></table>");
                       if (data.post.p_img != 'null') {
                        $(".post-image"+data.post.p_num).append("<tr height='40%'>"+
                              "<td height='40%' colspan='3' align='center'>"+data.post.p_content+"</td>"+
                              "<td height='40%' colspan='1' align='center'><img src='img/"+data.post.p_img+"' width='200px' height='200px'></td>"+
                           "</tr>");
                     } else {
                        $(".post-image"+data.post.p_num).append("<tr height='40%'>"+
                              "<td height='200px' colspan='4' align='center'>"+data.post.p_content+"</td>"+
                              "</tr>");
                     }
                          createReplyArray(data.post.p_idgroup);
                          $('.replyLineClass').hide();
                       
                    } else {
                       alert("더이상 글이 없습니다");
                       $('.loader').show();
                    }
                 }
              },
              error: function(data) {
                 flag = true;
                 $('.loader').hide();
                 alert("Error")
              }
           });
        }
     });
      
      function del_post(p_num){
         var num = p_num;
         var form = {
            p_num : num
         }
         $.ajax({
             url: "del_post",
              type: "POST",
              data: form,
              success: function() {
                 alert('글삭제 성공');
                 location.href="mypage"
              },
              error: function() {
                 
              }
           });
      }
      
     
  $(function(id, idgroup){
      $('.p_btn_class[onload]').trigger('onload');
   });
     
     var btn="#btn"
     function p_like_btn(id,idgroup){
        var form = {
              m_id : id,
              p_idgroup : idgroup
        }
        $.ajax({
           url: "p_like_btn",
         type: "POST",
         data: form,
         success: function(data) {
            console.log(idgroup)
            console.log(data)
            if(data.chk==1){
               $( btn+idgroup ).css({
                  color: "red"
               });
            }
         },
         error: function() {
            
         }
      });
     }
     
   </script>
   
   <script type="text/javascript">
    
        $(function() {
            $("#postImage").on('change', function(){
                
                readURL(this);
            });
        });
        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();
 
            reader.onload = function (e) {
                    $('#previewPic').attr('src', e.target.result);
                }
              reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
   
</head>
<body>
<div class="pagewrap">
<jsp:include page="/WEB-INF/views/header/my_header.jsp"/>
   <div class="bodywrap">
      <div class="left">
         <hr>
         <div class="my_info_btn">
            <button onclick="my_info()">내 정보 확인 및 수정</button>
           </div>
           <div>
           <hr>
           <div id="openModal" class="modalDialog">
              <div>
            <a href="#close" title="Close" class="close">X</a>
                  <div class="frm_test" >
                     <form action="fix_myinfo" method="post">
                     <table border="1" class="fix_table">
                        <tr>
                        <td>비밀번호</td><td> <input type="text" id="my_pw" name="my_pw" > <input type="hidden" id="my_id" name="my_id" ></td>
                        </tr>
                        <tr>
                           <td>사진</td><td>  <img alt="error" id="my_pic" src="" onerror="this.onerror=null; this.src='${placeholder }'"></td>
                        </tr>
                     <tr>
                        <td>이름</td><td>  <input type="text" id="my_name" name="my_name" ></td>
                        </tr>
                     <tr>
                        <td>전화</td><td>   <input type="text" id="my_tel" name="my_tel" ></td>
                        </tr>
                     <tr>
                        <td>메일</td><td>  <input type="text" id="my_mail" name="my_mail" ></td>
                        </tr>
                     <tr>
                        <td colspan="2"><input type="submit" value="Fix" style="width: 200px; height: 40px;"></td>
                       </tr>
                     </table>
                     </form>
                  </div>
              </div>
           </div>
           
        </div>
      </div>
      <div class="center">
            <div class="write_board" >

            <form action="write_board" name="postForm" id="frm" method="post" enctype="multipart/form-data">
               <table border="1">
               <tr>
                  <td colspan="1" style="font-size: 0.5em;">제목</td><td colspan="5"><input type="text" id="p_title" name="p_title" style="width: 500px; height: 40px;" required></td>
               </tr>
               <tr>
                  <td colspan="6"><input type="text" id="p_content" name="p_content" placeholder="글내용" style="width: 700px; height: 200px;" required></td>
               </tr>
               <tr>
                  <td colspan="1"><input type="file" id="postImage" name="postImage" value="사진첨부"></td>
                  <td colspan="5" align="center"><img id="previewPic" src="${placeholder}" width="200px" height="200px"></td>
               </tr>
               <tr>
                  <td colspan="1">
                  <span>카테고리선택</span>
                     <select id="p_cat" name="p_cat">
                     <!-- 
                        <option value="" selected data-default>카테고리선택</option>
                         -->
                         <option value="news">뉴스</option>      <option value="sports">스포츠</option>   <option value="food">음식</option>   <option value="language">언어</option>   <option value="people">인물</option>
                        <option value="animal">동물</option>      <option value="fashion">패션</option>      <option value="love">연애</option>   <option value="movie">영화</option>      <option value="religion">종교</option>
                        <option value="knowledge">지식</option>   <option value="travel">여행</option>      <option value="cartoon">만화</option>   <option value="game">게임</option>      <option value="it">IT</option>
                        <option value="weather">날씨</option>      <option value="music">음악</option>      <option value="car">자동차</option>   <option value="economy">경제</option>      <option value="etc">기타</option>
                         <option value="job">직업</option>         <option value="living">리빙</option>      <option value="book">도서</option>   <option value="festival">축제</option>   <option value="health">건강</option>
                     </select>
                  </td>
                  <td colspan="1">
                  <span>공개범위</span>
                     <select id="p_scope" name="p_scope">
                     <!-- 
                     <option value="" selected data-default>공개범위</option>
                      -->
                     <option value="0">나만보기</option><option value="1">친구공개</option><option value="2">전체공개</option></select>
                  </td>
                  <td colspan="4" style="font-size: 0.5em;">해시태그<input type="text" id="p_hash" name="p_hash" placeholder="해시태그 입력" style="width:350px; height: 40px;"></td>
               </tr>
               <tr>
                  <td colspan="6"><input type="submit" id="sub" value="작성완료"></td>
               </tr>
            </table>
            </form>
            
            </div>
         <hr>
         
         
        <div class="post-container">
      <c:forEach var="m_list" items="${boardlist }" begin="0" end="2">
         <table class="post" align="center" border="1">
            <tr height="5%">
               <th width="15%">카테고리</th>
               <td width="15%" align="center">${m_list.p_cat }</td>
               <th width="20%">제목</th>
               <td width="50%" align="center">${m_list.p_title }</td>
            </tr>
            <!-- ============ POST PICTURE PART ============ -->
            <c:choose>
            <c:when test="${m_list.p_img != 'null'}">
            <tr height="40%">
               <td colspan="3" align="center">${m_list.p_content }</td>
               <td colspan="1" align="center"><img src="img/${m_list.p_img }" width="200px" height="200px"></td>
            </tr>
            </c:when>
            <c:otherwise>
            <tr height="40%">
               <td colspan="4" align="center">${m_list.p_content }</td>
            </tr>
            </c:otherwise>
            </c:choose>
            <!-- =========================================== -->
            <tr height="5%">
               <th>해시</th>
               <td colspan="3">${m_list.p_hash }</td>
            <tr height="5%">
               
               <td>
               <button onload="p_like_btn('${m_list.m_id }','${m_list.p_idgroup }')" id="btn${m_list.p_idgroup }" class="p_btn_class"  onclick="p_like('${m_list.p_idgroup }')" >좋아요 : ${m_list.p_like }</button>
               </td>
               
               
               <th>작성자</th>
               <td align="center">${m_list.m_id }</td>
               <td><button class="del_post" onclick="del_post(${m_list.p_num })">글삭제</button></td>
            </tr>
            <!-- 댓글 수정 작업 -->
            <tr height="5%">
               <td colspan="4" align="center">
               <form action="#openReply"> 
                  <input type="hidden" value="${m_list.p_idgroup }" name="idgroup"> 
                  <input type="hidden" value="${mid }" name="u_id"> 
                  <input type="submit" value="댓글보기">
               </form>  
               </td>
            </tr>   

         </table>
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
      </c:forEach>
      
      </div>
      </div>
      <div class="right">
         <div class="f_find">
            <h4>유저 찾기</h4>
            <div class="u_find">
                <input type="text" class="user_find" onkeypress="enter()" name="m_id" id="m_id" placeholder="찾을 친구의 이름을 입력하세요." style="width: 200px; height: 40px;">
                <input type="button" class="u_find_btn" value="Find" onclick="user_find()">
           </div>
         </div>
         <div class="f_info">
            <h3>유저 찾기 성공</h3>
           <table border="1">
              <tr>
                 <td>아이디</td>
                 <td id="td_id"></td>
              </tr>
              <tr>
                 <td>이름</td>
                 <td id="td_name"></td>
              </tr>
              <tr>
                 <td>전화</td>
                 <td id="td_tel"></td>
              </tr>
              <tr>
                 <td>친구 추가</td>
                 <td><input type="button" value="friend_page" onclick="friend_page()"></td>
              </tr>
           </table>
           
         </div>
      </div>
   </div>
</div>
 
      
      
</body>
</html>