<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/inc/top.jsp"%>
</head>
<body>
	<%@ include file="/inc/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col"></div>
			<div class="col-sm text-center">
				<h2 class="text">설문 조사</h2>
				<p>등록된 설문조사의 수 : ${totCnt }</p>
			</div>
			<div class="col-sm"></div>
		</div>
		<table class="table">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>기간</th>
				<th>참여한 인원</th>
				<th>참여 가능</th>
			</tr>
			<c:if test="${totCnt > 0 }">
				<c:forEach var="sur" items="${list }">
					<tr>
						<td>${startNum }</td>
						<td>${sur.s_sub }</td>
						<td>${sur.s_sdate }~${sur.s_edate }</td>
						<td>--명</td>
						<td><c:if test=""></c:if></td>
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
			<div class="text-center">
				<c:if test="${startPage > blockSize }">
					<a href='surveyList.do?pageNum=${startPage - blockSize }'>[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<a href='surveyList.do?pageNum=${i}'>[${i}]</a>
				</c:forEach>
				<c:if test="${endPage > pageCnt }">
					<a href='surveyList.do?pageNum=${startPage - blockSize }'>[이전]</a>
				</c:if>
			</div>
		<div class="row admin">
				<button class="btn m-2 btn-primary mx-auto">설문조사 작성</button>
		</div>
	</div>


	<%@ include file="/inc/footer.jsp"%>
</body>
</html>