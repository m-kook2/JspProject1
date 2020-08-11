<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/inc/top.jsp" %>
</head>
<body>
<%@ include file="/inc/header.jsp" %>
<h2>영화 정보 입력</h2>

<div class="container" >
 	<form action="movieInsertPro.do"  name="ff" method="post" enctype="multipart/form-data">
			영화제목<br>
				<input  class="form-control" type="text" name="m_name" id="m_name" placeholder="영화제목을 입력하세요." required="required"><hr>
			영화장르<br>
					<input type="checkbox" id="m_genre" name="m_genre" value="액션">액션<br>
					<input type="checkbox" id="m_genre" name="m_genre" value="SF">SF<br>
					<input type="checkbox" id="m_genre" name="m_genre" value="전쟁">전쟁<br>
					<input type="checkbox" id="m_genre" name="m_genre" value="모험">모험<br>
					<input type="checkbox" id="m_genre" name="m_genre" value="스릴러">스릴러<br>
					<input type="checkbox" id="m_genre" name="m_genre" value="범죄">범죄<br>
					<input type="checkbox" id="m_genre" name="m_genre" value="미스터리">미스터리<br>
					<input type="checkbox" id="m_genre" name="m_genre" value="호러">호러<br>
					<input type="checkbox" id="m_genre" name="m_genre" value="판타지">판타지<br>
					<input type="checkbox" id="m_genre" name="m_genre" value="코미디">코미디<br>
					<input type="checkbox" id="m_genre" name="m_genre" value="뮤지컬">뮤지컬<br>
					<input type="checkbox" id="m_genre" name="m_genre" value="로맨스">로맨스<br>
					<input type="checkbox" id="m_genre" name="m_genre" value="멜로">멜로<br>
					<input type="checkbox" id="m_genre" name="m_genre" value="드라마">드라마<br>
					<input type="checkbox" id="m_genre" name="m_genre" value="가족">가족<br>
					<input type="checkbox" id="m_genre" name="m_genre" value="애니메이션">애니메이션<br>
					<input type="checkbox" id="m_genre" name="m_genre" value="다큐">다큐<hr>
			영화개봉일<br>
				<input class="form-control" type="date" name="m_date" id="m_date" placeholder="YYYY.MM.DD." required="required"><hr>
			영화국적<br>
			<select name="m_nation" id="m_nation">
				<option value="한국">한국</option>
				<option value="프랑스">프랑스</option>
				<option value="중국">중국</option>
				<option value="일본">일본</option>
				<option value="인도">인도</option>
				<option value="이탈리아">이탈리아</option>
				<option value="영국">영국</option>
				<option value="스페인">스페인</option>
				<option value="미국">미국</option>
				<option value="독일">독일</option>
				<option value="기타">기타</option>
			</select><hr>
			상영시간<br>
			<input class="form-control" type="number" name="m_time" id="m_time" placeholder="mm분" min="0" max="300" required="required"><hr>
			등급<br>
				<input class="form-check-input"  type="radio" id="m_rate" name="m_rate" value="0"  checked="checked">전체 관람가<br>
				<input class="form-check-input"  type="radio" name="m_rate" value="12">12세 이상 관람가<br>
				<input class="form-check-input"  type="radio" name="m_rate" value="15">15세 이상 관람가<br>
				<input class="form-check-input"  type="radio" name="m_rate" value="19">청소년 관람불가<hr>
			줄거리<br>
				<textarea id="m_story" name="m_story" rows="10" style="width:100%" placeholder="내용을 입력하세요." ></textarea><hr>
			출연진<br>
			<!-- <input  class="form-control" type="hidden" name="m_cast"/> -->
				<input  class="form-control" type="text" name="m_cast1" placeholder="이름(배역)" id="m_cast1">
				<input  class="form-control" type="text" name="m_cast1" placeholder="이름(배역)">
				<input  class="form-control" type="text" name="m_cast1" placeholder="이름(배역)">
				<input  class="form-control" type="text" name="m_cast1" placeholder="이름(배역)">
				<input  class="form-control" type="text" name="m_cast1" placeholder="이름(배역)">
				<input  class="form-control" type="text" name="m_cast1" placeholder="이름(배역)">
				<input  class="form-control" type="text" name="m_cast1" placeholder="이름(배역)">
				<input  class="form-control" type="text" name="m_cast1" placeholder="이름(배역)">
				<input  class="form-control" type="text" name="m_cast1" placeholder="이름(배역)">
				<input  class="form-control" type="text" name="m_cast1" placeholder="이름(배역)">
				<input  class="form-control" type="text" name="m_cast1" placeholder="이름(배역)">
				<input  class="form-control" type="text" name="m_cast1" placeholder="이름(배역)"><hr>
			영화감독<br>
				<input  class="form-control" type="text" name="m_director" id="m_director" placeholder="이름"><hr>

			포토<br>
			<input multiple="multiple" class="form-control" type="file" id="m_photo" name="m_photo" accept="image/*"><hr>
			에고편<br>
			<input class="form-control" type="text" name="m_video" id="m_video" placeholder="URL 주소(Youtube)를 복사하여 입력하세요." ><hr>
			포스터<br>
			<input class="form-control" type="file" name="m_poster" id="m_poster" accept="image/*"><hr>
			<input type="reset" class="btn btn-danger" value="작성 취소">
			<input class="btn btn-success" type="submit" value="작성 완료">
	</form>
</div>
	<%@ include file="/inc/footer.jsp"%>
</body>
</html>