<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/inc/top.jsp"%>
</head>
<body>
	<%@ include file="/inc/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-sm text-center" style="padding: 30px">
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
								<td><a
									href="reivewForm.do?p_idx=${review.p_idx }&pageNum=${currentPage}">${review.p_title }</a>
								</td>
								<td><c:if test="${fn:length(review.p_content) >= 50}">
										${fn:substring(review.p_content,0,50) }....</c:if> <c:if
										test="${fn:length(review.p_content) < 50}">
										${review.p_content}</c:if></td>
								<td>${review.id }</td>
								<td>${review.p_date }</td>
							</tr>
							<c:set var="startNum" value="${startNum-1 }"></c:set>
						</c:forEach>
					</c:if>
					<c:if test="${totCnt ==0 }">
						<tr>
							<td colspan="5">데이터가 없네</td>
						</tr>
					</c:if>
				</table>

				<div class="text-center">
					<c:if test="${startPage > blockSize }">
						<a href='r_list.do?pageNum=${startPage-blockSize}'>[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<a href='r_list.do?pageNum=${i }'>[${i}]</a>
					</c:forEach>
					<c:if test="${endPage > pageCnt }">
						<a href='r_list.do?pageNum=${startPage+blockSize }'>[다음]</a>
					</c:if>

				</div>
				<c:if test="${sessionScope.status eq '2'}">
					<div class="row" style="float: right">
						<button class="btn m-2 btn-primary mx-auto"
							onclick="location.href='reviewwriteForm.do?&pageNum=${pageNum}'">게시글
							작성</button>
					</div>
				</c:if>
			</div>
		</div>
	</div>



	<%@ include file="/inc/footer.jsp"%>
</body>
</html>