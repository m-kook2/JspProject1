<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/inc/top.jsp"%>


<style>
body {
  -ms-overflow-style: none; // IE에서 스크롤바 감춤
  &::-webkit-scrollbar { 
    display: none !important; // 윈도우 크롬 등
  }
}

</style>
</head>
<body style="background-color: black;">
	<%@ include file="/inc/header.jsp"%>
	
	<!-- 
	
	설문조사 리스트 s_list.jsp
	2020 08 06
	작성자 박종찬
	
	설문조사 게시글을 페이징하는 리스트 뷰
	bootstrap과 table로 구성했다.
	
	 -->
	 <div class="py-3" style="height:800px; width: 100%; background-color: white;">
	<div class="container">
		<div class="row">
			<div class="col-sm mx-auto text-center">
				<h2 class="text">설문 조사</h2>
			</div>
		</div>
		<table class="table">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>기간</th>
				<th>참여한 인원</th>
				<th>참여 가능</th>
			</tr>
			
			<!-- 
			
				foreach 구문을 이용해서 각 게시글을 불러온다.
			    참여자의 수와 참여 가능기간, 참여 가능 여부를 불러오는 것이 특징.

			 -->
			
			<c:if test="${totCnt > 0 }">
				<c:forEach var="sur" items="${list }">
					<tr>
						<td>${startNum }</td>
						<td><a
							href="surveyContent.do?s_idx=${sur.s_idx }&pageNum=${pageNum }">${sur.s_sub }</a></td>
						<td>${sur.s_sdate } ~ ${sur.s_edate }</td>
						<td>${sur.commCnt }명</td>
						<td><c:choose>
								<c:when test="${sur.votable }">
									<span style="color: green"> 참여가 가능합니다. </span>
								</c:when>
								<c:when test="${!sur.votable }">
									<span style="color: red"> 참여가 불가능합니다. </span>
								</c:when>
							</c:choose></td>
					</tr>
					<c:set var="startNum" value="${startNum -1 }"></c:set>
				</c:forEach>
			</c:if>
		</table>
		<c:if test="${totCnt == 0 }">
			<tr>
				<td colspan="5">등록된 설문조사가 없습니다.</td>
			</tr>
		</c:if>
			<div class="text-center m-3">
				<c:if test="${startPage > blockSize }">
					<a href='surveyList.do?pageNum=${startPage - blockSize }'>[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<a href='surveyList.do?pageNum=${i}' class="btn btn-dark">${i}</a>
				</c:forEach>
				<c:if test="${endPage > pageCnt }">
					<a href='surveyList.do?pageNum=${startPage + blockSize }'>[다음]</a>
				</c:if>
			</div>
			
			<!-- 
				관리자 전용 메뉴를 노출하기 위해
				세션에서 관리자 여부를 status로 가져온다.
				status == 2 라면 관리자
			
			 -->
			
		<c:if test="${sessionScope.status == 2 }">
			<div class="row admin mb-5">
				<div style="margin-left:auto; margin-right:0;">
					<form class="text-right" action="surveyWrite.do">
						<button class="btn btn-dark">작성</button>
					</form>
									<p>등록된 설문조사의 수 : ${totCnt }</p>

				</div>
			</div>
		</c:if>
	</div>
	 </div>


	<%@ include file="/inc/footer.jsp"%>
</body>
</html>