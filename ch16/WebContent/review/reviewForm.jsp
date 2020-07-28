<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/inc/top.jsp" %>
</head>
<body>
<%@ include file="/inc/header.jsp" %>
<div class="col-sm text-center">
<h2 class="text">리뷰 게시판</h2>
	<table class="table">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="review" items="${list }">
				<tr>
					<td>${startNum }</td>
					<td>
					<a href="content.do?num=${review.p_idx }&pageNum=${currentPage}">${review.p_title }</a>
					</td>
					<td>${review.p_content }</td>
					<td>${review.id }</td>
					<td>${review.p_date }</td>
					</tr>
					<c:set var="startNum" value="${startNum-1 }"></c:set>
			</c:forEach>
		</c:if>
		<c:if test="${totCnt ==0 }">
				<tr><td colspan="5">데이터가 없네</td></tr>
		</c:if>
	</table>
	
	<div class="text-center">
		<c:if test="${startPage > blockSize }">
			<a href='reivewForm.do?pageNum=${startPage-blockSize}'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='reivewForm.do?pageNum=${i }'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage > pageCnt }">
			<a href='reivewForm.do?pageNum=${startPage+blockSize }'>[다음]</a>
		</c:if>
	
	</div>
	<div class="row" style="float: right">
			<div id="admin-only">
				<button class="btn m-2 btn-primary mx-auto">게시글 작성</button>
			</div>
		</div>
	</div>

</body>
</html>