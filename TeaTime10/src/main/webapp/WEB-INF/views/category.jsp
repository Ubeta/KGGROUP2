<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
   function check_form() {
       $(".check_cate").each(function () {
           if ($(this).is(":checked")) {
               $(this).val("Y");
           }else{
           		var cat_name = $(this).attr("name");
        	   $("#regform").append("<input type='hidden' name='"+cat_name+"' value='N'>");
        	  // console.log(cat_name);
           }
       	});
    	//실행할때 지우기
   }
</script>
</head>
<body>
	<form action="categoryregister" onsubmit="return check_form(this)" id="regform">
		<table border="1">
			<tr>
				<td>뉴스<br><input type="checkbox" class="check_cate" name="c_news" ></td>
				<td>스포츠<br><input type="checkbox" class="check_cate" name="c_sports" ></td>
				<td>음식<br><input type="checkbox" class="check_cate" name="c_food" ></td>
				<td>언어<br><input type="checkbox" class="check_cate" name="c_language" ></td>
				<td>인물<br><input type="checkbox" class="check_cate" name="c_people" ></td>
			</tr>
			
			<tr>
				<td>동물<br><input type="checkbox" class="check_cate" name="c_animal" ></td>
				<td>패션<br><input type="checkbox" class="check_cate" name="c_fashion" ></td>
				<td>연애<br><input type="checkbox" class="check_cate" name="c_love" ></td>
				<td>영화<br><input type="checkbox" class="check_cate" name="c_movie" ></td>
				<td>종교<br><input type="checkbox" class="check_cate" name="c_religion" ></td>
			</tr>
	
			<tr>
				<td>지식<br><input type="checkbox" class="check_cate" name="c_knowledge" ></td>
				<td>여행<br><input type="checkbox" class="check_cate" name="c_travel" ></td>
				<td>만화<br><input type="checkbox" class="check_cate" name="c_cartoon" ></td>
				<td>게임<br><input type="checkbox" class="check_cate" name="c_game" ></td>
				<td>IT<br><input type="checkbox" class="check_cate" name="c_it" ></td>
			</tr>
			
			<tr>
				<td>날씨<br><input type="checkbox" class="check_cate" name="c_weather" ></td>
				<td>음악<br><input type="checkbox" class="check_cate" name="c_music" ></td>
				<td>자동차<br><input type="checkbox" class="check_cate" name="c_car" ></td>
				<td>경제<br><input type="checkbox" class="check_cate" name="c_economy" ></td>
				<td>기타<br><input type="checkbox" class="check_cate" name="c_etc" ></td>
			</tr>
			
			<tr>
				<td>Job<br><input type="checkbox" class="check_cate" name="c_job" ></td>
				<td>리빙<br><input type="checkbox" class="check_cate" name="c_living" ></td>
				<td>도서<br><input type="checkbox" class="check_cate" name="c_book" ></td>
				<td>축제<br><input type="checkbox" class="check_cate" name="c_festival" ></td>
				<td>건강<br><input type="checkbox" class="check_cate" name="c_health" ></td>
			</tr>
			<tr>
				<td colspan="5" style="text-align: center;">
				<input type="hidden" value="${result }" name="m_id">
				<input type="submit" value="등록">
				</td>
			</tr>
		</table>
   </form>

</body>
</html>