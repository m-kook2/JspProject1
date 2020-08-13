<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/inc/top.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
/* 별 뒤 0~10점 크기 사진에 맞게 수정함 */
#grade{
	font-size: 22px;
	text-align: center;
	font-weight: bolder;
}
/* 개요, 감독, ... 줄거리 등 글자 크기 키움 */
.step1{font-size: 18px;}

/* 개요 및 장르, 국적, 개봉일, 상영시간 구분자 표시 / 간격 사이를 더블클릭 때 블록 지정이 안되게끔 하고 싶었음 */
.step3{
    display: inline-block; /* display 속성이 inline-block으로 지정된 엘리먼트는 기본적으로 inline 엘리먼트처럼 전후 줄바꿈 없이 한 줄에 다른 엘리먼트들과 나란히 배치 */
    margin: 0 7px 0 0; /* margin: 0px 7px 0px 0px은 위 0px, 오른쪽 7px, 아래 0px, 왼쪽 0px을 의미 */ 
    padding-left: 7px;
    background: url(https://ssl.pstatic.net/static/movie/2012/06/bg_tx_line2.gif) no-repeat 0 9px; 
    /* url(~ ): 'ㅣ' 사진 이미지 / no-repeat : 이미지가 반복 배열되지 않음 / 가로 0px 세로 9px 크기*/ 
    color: #333;
}
#textarea1{
width:100%;
/* <줄거리> 칸을 반응형으로 container 안에서 100% 폭 유지 */
font-size: 15px;
}
</style>
</head>
<body>
<%@ include file="/inc/header.jsp" %>
	<div class="container py-5">
	<!-- Bootstrap class: .py-1 / py-*-# // 상하 여백 줌 py-5가 제일 큼 -->  
		<div class="row">
	  <div class="col-8">
<h1 style="text-align: center;">${mt.m_name}</h1>
<input type="hidden" name="m_idx" value="${m_idx}">
	<!-- <input type=“hidden”>은 사용자에게는 보이지 않는 숨겨진 입력 필드를 정의합니다.
	따라서 숨겨진 입력 필드는 폼 제출 시 사용자가 변경해서는 안 되는 데이터를 함께 보낼 때 유용하게 사용됩니다.
	이러한 입력 필드는 업데이트 되어야 하는 데이터베이스의 레코드를 저장하거나, 고유한 보안 토큰 등을 서버로 보낼 때 주로 사용됩니다. -->
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
<!-- 	dl, dt, dd 설명
	dl은 Description-List, dt는 Description-Term, 그리고 dd는 Description-Description의 약자
	dt는 진하게+기울기 느낌을 줌, A is B 나타내거나, 대상 정의 또는 설명할 때 사용함
	<dl>은 반드시 하나 이상의 <dt>-<dd> 짝을 담고 있어야 함 
	ps. 네이버 영화 양식을 참고함-->
	
<dl class="info_spec">
		<dt class="step1"><em>개요</em></dt> <!-- <em>(기본) 글자 기울임체로 표현됨 -->
			<dd>
				<span class="step3">${mt.m_genre}</span>
				<span class="step3">${mt.m_nation}</span>
				<span class="step3">
					<fmt:parseDate value="${mt.m_date }" var="m_date_date" pattern="yyyy-MM-dd" />
					<fmt:formatDate value="${m_date_date}" var="m_date_string" pattern="yyyy-MM-dd"/>
						${m_date_string} 개봉</span>
						<%-- <fmt:parseDate> = > 문자열로 표시된 날짜 및 시간 값을 java.util.Date로 파싱해 주는 태그 --%>
						<%-- <fmt:formatDate> = > 날짜 정보를 담고 있는 객체를 포맷팅하여 출력할 때 사용하는 태그 --%>
						<!-- DB date 값(날짜 및 시간까지 나옴)에서 String m_date로 가지고 와서 "yyyy-MM-dd" 값으로 나타내기 위해 사용함 
						/ 둘 중 하나만 사용하면 값이 안 나옴.-->
				<span class="step3">${mt.m_time}분</span>
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
						<!-- DB값에선 0 12 15 19로 나타내고, view로 보일 때는 위 멘트로 변환해서 반영함 -->
					</span>
				</dd>
		</dl>
</div>
<!-- 포스터를 우측에 두기 위해 class="col-4" 사용함 / 위에는 class="col-8" 사용 -->  
<div class="col-4" style="text-align: right;">
	<img src="./images/main/photo/${mt.m_poster}" width="280" height="400"/><br><br>
	
	<c:if test="${sessionScope.status eq '2' || sessionScope.status eq '1' }">
		<c:if test="${!isBookMark }">
			<input class="btn btn-dark mx-auto" type="button" id="bookmark" value="즐겨찾기 추가" onclick="location.href='bookMarkInsert.do?m_idx=${mt.m_idx}&pageNum=${pageNum}'">
		</c:if>
		<c:if test="${isBookMark }">
			<input class="btn btn-dark mx-auto" type="button" id="bookmark" value="즐겨찾기 삭제" onclick="location.href='delete.do?m_idx=${mt.m_idx}&pageNum=${pageNum}'">
		</c:if>
	</c:if>
</div></div>

<hr>
<dt class="step1"><em>줄거리</em></dt><p>
	<!-- "border : transparent;" 로 투명하게 만들고,  readonly="readonly" 로 수정 못하게 만듦 -->
	<textarea id="textarea1" cols="100%" rows="12" style="border : 1px solid transparent;" readonly="readonly"><c:out value=">${mt.m_story}" /></textarea><p>
	
<hr>
<dt class="step1" ><em>포토</em></dt>
	<p style="text-align: center;">
		<img src="./images/main/photo/${mt.m_photo}" width="800" height="450"/></p><br>

<hr>
<dt class="step1"><em>예고편</em></dt>
	<p style="text-align: center;">
		<!-- 유튜브 가져와서 크기 16:9로 게시판 크기에 맞게 수정함 / 유튜브-공유-퍼가기 하면 링크 나옴 / 이때, 퍼가기 안의 사이트 링크와 상단부 메인 링크가 다르니 꼭 퍼가기 통해서 링크 참고 해야 함.
		&autoplay=1 : 자동재생 / &loop=1 : 반복 / 이런 기능도 있음 -->
		<iframe width="800" height="450" src="${mt.m_video}?autoplay=1" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></p>

<p style="text-align: center;">
	<c:if test="${sessionScope.status eq '2'}">
	<input class="btn btn-dark mx-auto" type="button" value="수정" 
	            onclick="location.href='movieUpdateForm.do?m_idx=${mt.m_idx}&pageNum=${pageNum}'">
	<input class="btn btn-dark mx-auto" type="button" value="삭제"
	            onclick="location.href='movieDeleteForm.do?m_idx=${mt.m_idx}&pageNum=${pageNum}'">
	</c:if><br><br>
		<button type="button" class="btn btn-warning"  onclick="location.href='movieList.do?pageNum=${pageNum}'"><i class="fa fa-bars"></i></button>
</p>
</div>

<%@ include file="/movie/m_comm.jsp" %>
<%@ include file="/inc/footer.jsp"%>

</body>
</html>