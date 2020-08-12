<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/inc/top.jsp" %>

<style type="text/css">
#grade{
	font-size: 22px;
	text-align: center;
	font-weight: bolder;
}
.step1{font-size: 18px;}
.step3{
    display: inline-block;
    margin: 0 7px 0 0;
    padding-left: 7px;
    background: url(https://ssl.pstatic.net/static/movie/2012/06/bg_tx_line2.gif) no-repeat 0 9px;
    color: #333;
}
#textarea1{
width:100%;
font-size: 15px;
}
</style>
</head>
<body>
<%@ include file="/inc/header.jsp" %>
	<div class="container py-5" id="co">
		<div class="row">
	  <div class="col-8">
<h1 style="text-align: center;">${mt.m_name}</h1>
<input type="hidden" name="m_idx" value="${m_idx}">
<p id="grade">
		<c:if test="${comm2.m_grade == 0 }"><img alt="" src="images/grade/grade00_img.png" width="120px"> 0점</c:if>
		<c:if test="${comm2.m_grade == 1 }"><img alt="" src="images/grade/grade01_img.png" width="120px"> 1점</c:if>
		<c:if test="${comm2.m_grade == 2 }"><img alt="" src="images/grade/grade02_img.png" width="120px"> 2점</c:if>
		<c:if test="${comm2.m_grade == 3 }"><img alt="" src="images/grade/grade03_img.png" width="120px"> 3점</c:if>
		<c:if test="${comm2.m_grade == 4 }"><img alt="" src="images/grade/grade04_img.png" width="120px"> 4점</c:if>
		<c:if test="${comm2.m_grade == 5 }"><img alt="" src="images/grade/grade05_img.png" width="120px"> 5점</c:if>
		<c:if test="${comm2.m_grade == 6 }"><img alt="" src="images/grade/grade06_img.png" width="120px"> 6점</c:if>
		<c:if test="${comm2.m_grade == 7 }"><img alt="" src="images/grade/grade07_img.png" width="120px"> 7점</c:if>
		<c:if test="${comm2.m_grade == 8 }"><img alt="" src="images/grade/grade08_img.png" width="120px"> 8점</c:if>
		<c:if test="${comm2.m_grade == 9 }"><img alt="" src="images/grade/grade09_img.png" width="120px"> 9점</c:if>
		<c:if test="${comm2.m_grade == 10 }"><img alt="" src="images/grade/grade10_img.png" width="120px"> 10점</c:if>
	</p>
<dl class="info_spec">
			<dt class="step1"><em>개요</em></dt>
			<dd>
				<span>
					<span class="step3">${mt.m_genre}</span>
					<span class="step3">${mt.m_nation}</span>
					<span class="step3"><fmt:parseDate value="${mt.m_date }" var="m_date_date" pattern="yyyy-MM-dd" />
							<fmt:formatDate value="${m_date_date}" var="m_date_string" pattern="yyyy-MM-dd"/>
							${m_date_string} 개봉</span>
					<span class="step3">${mt.m_time}분</span>
				</span>
			</dd>
				<dt class="step1"><em>감독</em></dt>
				<dd><span>${mt.m_director}</span></dd>
				<dt class="step1"><em>출연</em></dt>
				<dd><span>${mt.m_cast}</dd></span>
				<dt class="step1"><em>등급</em></dt>
				<dd>
					<span>
						<c:if test="${mt.m_rate eq '0'}">전체 관람가</c:if>
						<c:if test="${mt.m_rate eq '12'}">12세 이상 관람가</c:if>
						<c:if test="${mt.m_rate eq '15'}">15세 이상 관람가</c:if>
						<c:if test="${mt.m_rate eq '19'}">청소년 관람불가</c:if>
					</span>
				</dd>
		</dl>
</div>
<div class="col-4" style="text-align: right;">
<img src="./images/main/photo/${mt.m_poster}"/><br>
<c:if test="${!isBookMark }">
<input class="btn m-2 btn-primary mx-auto" type="button" id="bookmark" value="즐겨찾기 추가" onclick="location.href='bookMarkInsert.do?m_idx=${mt.m_idx}&pageNum=${pageNum}'">
</c:if>
<c:if test="${isBookMark }">
<input class="btn m-2 btn-primary mx-auto" type="button" id="bookmark" value="즐겨찾기 삭제" onclick="location.href='delete.do?m_idx=${mt.m_idx}&pageNum=${pageNum}'">
</c:if>
</div></div>
<hr>
<dt class="step1"><em>줄거리</em></dt>
<p>
<textarea id="textarea1" cols="100%" rows="15" style="border : 1px solid transparent;" readonly="readonly"><c:out value=">${mt.m_story}" /></textarea>
<p>
<hr>
<dt class="step1" ><em>포토</em></dt>
<p style="text-align: center;"><img src="./images/main/photo/${mt.m_photo}"/></p>
<br>
<hr>
<dt class="step1"><em>동영상</em></dt>
<p style="text-align: center;"><iframe width="800" height="450" src="${mt.m_video}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></p>

<p style="text-align: right;">
	<c:if test="${sessionScope.status eq '2'}">
	<input class="btn m-2 btn-primary mx-auto" type="button" value="수정" 
	            onclick="location.href='movieUpdateForm.do?m_idx=${mt.m_idx}&pageNum=${pageNum}'">
	</c:if>
	<input class="btn m-2 btn-primary mx-auto" type="button" value="목록"
			    onclick="location.href='movieList.do?pageNum=${pageNum}'">
	<c:if test="${sessionScope.status eq '2'}">
	<input class="btn m-2 btn-primary mx-auto" type="button" value="삭제"
	            onclick="location.href='movieDeleteForm.do?m_idx=${mt.m_idx}&pageNum=${pageNum}'">
	</c:if>
</p>
</div>

<%@ include file="/movie/m_comm.jsp" %>
<%@ include file="/inc/footer.jsp"%>

</body>
</html>