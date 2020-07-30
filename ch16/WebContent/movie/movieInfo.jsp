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
<div class="col-sm text-center" style="padding: 30px">
<table class="table">
	<tr>

영화번호 : ${mt.m_idx}<p><p>
영화이름 : ${mt.m_name}<p>
영화장르 : ${mt.m_genre}<p>
영화개봉일 : ${mt.m_date}<p>
영화국적 : ${mt.m_nation}<p>
상영시간 : ${mt.m_time}<p>
등급 : ${mt.m_rate}<p>
줄거리 : ${mt.m_story}<p>
출연진 : ${mt.m_cast}<p>
영화감독 : ${mt.m_director}<p>
포토 : ${mt.m_photo}<p>
동영상 : ${mt.m_video}<p>
포스터 : ${mt.m_poster}<p>
	<input class="btn m-2 btn-primary mx-auto" type="button" value="즐겨찾기 추가"
			    onclick="location.href='BookList.do'">
	<input class="btn m-2 btn-primary mx-auto" type="button" value="평점 및 댓글 추가"
			    onclick="location.href='r_list.do'">


	</tr>

</table>
	<c:if test="${sessionScope.status eq '2'}">
	<input class="btn m-2 btn-primary mx-auto" type="button" value="수정" 
	            onclick="location.href='movieUpdateForm.do?p_idx=${mt.m_idx}&pageNum=${pageNum}'">
	<input class="btn m-2 btn-primary mx-auto" type="button" value="삭제"
	            onclick="location.href='movieDeleteForm.do?p_idx=${mt.m_idx}&pageNum=${pageNum}'">
	</c:if>
	<input class="btn m-2 btn-primary mx-auto" type="button" value="목록"
			    onclick="location.href='movieList.do?pageNum=${pageNum}'">

</div>


</body>
</html>