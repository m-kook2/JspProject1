<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/inc/top.jsp" %>
</head>
<body>
<%@ include file="/inc/header.jsp" %>
<h2>영화 정보 입력</h2>

<div class="container" >
 	<form action="movieUpdatePro.do" name="ff" method="post" enctype="multipart/form-data">
		<input type="hidden" name="m_idx" value="${m_idx}">
			영화제목<br>
				<input  class="form-control" type="text" name="m_name" id="m_name" value="${mt.m_name}" placeholder="영화제목을 입력하세요." required="required"><hr>
			영화장르<br>
					<input type="checkbox" id="m_genre" name="m_genre" value="액션" ${mt.m_genre eq '액션' ? "checked='checked'" : '' }>액션<br>
					<input type="checkbox" id="m_genre" name="m_genre" value="드라마" ${mt.m_genre eq '드라마' ? "checked='checked'" : '' }>드라마<br>
					<input type="checkbox" id="m_genre" name="m_genre" value="로맨스" ${mt.m_genre eq '로맨스' ? "checked='checked'" : '' }>로맨스<br>
					<input type="checkbox" id="m_genre" name="m_genre" value="다큐" ${mt.m_genre eq '다큐' ? "checked='checked'" : '' }>다큐<br>
					<input type="checkbox" id="m_genre" name="m_genre" value="스릴러" ${mt.m_genre eq '스릴러' ? "checked='checked'" : '' }>스릴러<br>
					<input type="checkbox" id="m_genre" name="m_genre" value="호러" ${mt.m_genre eq '호러' ? "checked='checked'" : '' }>호러<hr>
			영화개봉일<br>
				<fmt:parseDate value="${mt.m_date }" var="m_date_date" pattern="yyyy-MM-dd" />
				<fmt:formatDate value="${m_date_date}" var="m_date_string" pattern="yyyy-MM-dd"/>
				<input class="form-control" type="date" name="m_date" id="m_date" value="${m_date_string}" placeholder="YYYY.MM.DD." required="required"><hr>
			영화국적<br>
			<select name="m_nation" id="m_nation" value="${mt.m_nation}">
				<option value="한국" ${mt.m_nation eq '한국' ? "selected='selected'" : '' }>한국</option>
				<option value="프랑스" ${mt.m_nation eq '프랑스' ? "selected='selected'" : '' }>프랑스</option>
				<option value="중국" ${mt.m_nation eq '중국' ? "selected='selected'" : '' }>중국</option>
				<option value="일본" ${mt.m_nation eq '일본' ? "selected='selected'" : '' }>일본</option>
				<option value="인도" ${mt.m_nation eq '인도' ? "selected='selected'" : '' }>인도</option>
				<option value="이탈리아" ${mt.m_nation eq '이탈리아' ? "selected='selected'" : '' }>이탈리아</option>
				<option value="영국" ${mt.m_nation eq '영국' ? "selected='selected'" : '' }>영국</option>
				<option value="스페인" ${mt.m_nation eq '스페인' ? "selected='selected'" : '' }>스페인</option>
				<option value="미국" ${mt.m_nation eq '미국' ? "selected='selected'" : '' }>미국</option>
				<option value="독일" ${mt.m_nation eq '독일' ? "selected='selected'" : '' }>독일</option>
				<option value="기타" ${mt.m_nation eq '기타' ? "selected='selected'" : '' }>기타</option>
			</select><hr>
			상영시간<br>
			<input class="form-control" type="number" name="m_time" id="m_time" value="${mt.m_time}" placeholder="mm분" min="0" max="300" required="required"><hr>
			등급<br>
				<input class="form-check-input"  type="radio" id="m_rate" name="m_rate" value="0"  ${mt.m_rate eq '0' ? "checked='checked'" : '' }>전체 관람가<br>
				<input class="form-check-input"  type="radio" name="m_rate" value="12" ${mt.m_rate eq '12' ? "checked='checked'" : '' }>12세 이상 관람가<br>
				<input class="form-check-input"  type="radio" name="m_rate" value="15" ${mt.m_rate eq '15' ? "checked='checked'" : '' }>15세 이상 관람가<br>
				<input class="form-check-input"  type="radio" name="m_rate" value="19" ${mt.m_rate eq '19' ? "checked='checked'" : '' }>청소년 관람불가<hr>
			줄거리<br>
				<textarea id="m_story" name="m_story" rows="10" value="m_story" style="width:100%" placeholder="내용을 입력하세요." >${mt.m_story}</textarea><hr>
			출연진<br>
			<!-- <input  class="form-control" type="hidden" name="m_cast"/> -->
			<c:set var="cast" value="${fn:split(mt.m_cast,',')}"/>
				<input  class="form-control" type="text" name="m_cast1" placeholder="이름(배역)" id="m_cast1" value="${fn:trim(cast[0])}"/>
				<input  class="form-control" type="text" name="m_cast1" placeholder="이름(배역)" value="${fn:trim(cast[1])}">
				<input  class="form-control" type="text" name="m_cast1" placeholder="이름(배역)" value="${fn:trim(cast[2])}">
				<input  class="form-control" type="text" name="m_cast1" placeholder="이름(배역)" value="${fn:trim(cast[3])}">
				<input  class="form-control" type="text" name="m_cast1" placeholder="이름(배역)" value="${fn:trim(cast[4])}">
				<input  class="form-control" type="text" name="m_cast1" placeholder="이름(배역)" value="${fn:trim(cast[5])}">
				<input  class="form-control" type="text" name="m_cast1" placeholder="이름(배역)" value="${fn:trim(cast[6])}">
				<input  class="form-control" type="text" name="m_cast1" placeholder="이름(배역)" value="${fn:trim(cast[7])}">
				<input  class="form-control" type="text" name="m_cast1" placeholder="이름(배역)" value="${fn:trim(cast[8])}">
				<input  class="form-control" type="text" name="m_cast1" placeholder="이름(배역)" value="${fn:trim(cast[9])}">
				<input  class="form-control" type="text" name="m_cast1" placeholder="이름(배역)" value="${fn:trim(cast[10])}">
				<input  class="form-control" type="text" name="m_cast1" placeholder="이름(배역)" value="${fn:trim(cast[11])}"><hr>

			영화감독<br>
				<input  class="form-control" type="text" name="m_director" id="m_director" value="${mt.m_director}" placeholder="이름"><hr>
  
			포토<br>
			<c:choose>
				<c:when test="${not empty mt.m_photo}">
					${mt.m_photo}<a href="movieDelete.do?m_photo=${mt.m_photo}">삭제하기</a><hr>
					<input multiple="multiple" class="form-control" type="hidden" id="m_photo" name="m_photo" value="${mt.m_photo}" accept="image/*"><hr>
				</c:when>
				<c:otherwise>
					<input multiple="multiple" class="form-control" type="file" id="m_photo" name="m_photo" value="${mt.m_photo}" accept="image/*"><hr>	
				</c:otherwise>				
			</c:choose>
			에고편<br>
			<input class="form-control" type="t	ext" name="m_video" id="m_video" value="${mt.m_video}" placeholder="URL 주소(Youtube)를 복사하여 입력하세요." ><hr>
			포스터<br>
			<c:choose>
				<c:when test="${not empty mt.m_poster}">
					${mt.m_poster}<a href="MovieDeleteForm.do?m_poster=${mt.m_poster}">삭제하기</a><hr>
					<input class="form-control" type="hidden" id="m_poster" name="m_poster" value="${mt.m_poster}" accept="image/*" required="required"><hr>
				</c:when>
				<c:otherwise>
					<input class="form-control" type="file" id="m_poster" name="m_poster" value="${mt.m_poster}" accept="image/*" required="required"><hr>	
				</c:otherwise>
			</c:choose>
			<input type="reset" class="btn btn-danger" value="작성 취소">
			<input class="btn btn-success" type="submit" value="작성 완료">
	</form>
</div>
	<%@ include file="/inc/footer.jsp"%>
</body>
</html>