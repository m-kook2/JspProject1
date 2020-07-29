<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/inc/top.jsp"%>
</head>
<body>
	<%@ include file="/inc/header.jsp"%>
	<div class="col-sm text-center" style="padding: 30px">

		<h2 class="text">영화 게시판</h2>
		<table class="table">
			<tr>
				<th>영화 목록</th>
			</tr>
			<c:if test="${totCnt > 0 }">
				<c:forEach var="mt" items="${list }">
					<tr>
						<td><a href="movieInfo.do?m_idx=${mt.m_idx }&pageNum=${currentPage}">${mt.m_poster } ${mt.m_idx }</a>
						</td>
					</tr>
					<c:set var="startNum" value="${startNum-1 }"></c:set>
				</c:forEach>
			</c:if>
			<c:if test="${totCnt ==0 }">
				<tr>
					<td colspan="2">데이터가 없네</td>
				</tr>

			</c:if>
		</table>
		<div class="text-center">
			<c:if test="${startPage > blockSize }">
				<a href='movieList.do?pageNum=${startPage-blockSize}'>[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href='movieList.do?pageNum=${i }'>[${i}]</a>
			</c:forEach>
			<c:if test="${endPage > pageCnt }">
				<a href='movieList.do?pageNum=${startPage+blockSize }'>[다음]</a>
			</c:if>

		</div>
		<c:if test="${sessionScope.status eq '2'}">
		<div class="row" style="float: right">
			<button class="btn m-2 btn-primary mx-auto">게시글 작성</button>
		</div>
		</c:if>
	</div>



	<%@ include file="/inc/footer.jsp"%>
</body>
</html>