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
<div style="margin-top:30px"></div>
<div class="col-sm text-center">
<h2 class="text">고객 의견함</h2>
<table class="table">
		<tr>
		 <td>번호</td>
		 <td>작성자</td>
		 <td>제목</td>
		 <td>내용</td>
		 <td>암호</td>
		 <td>글 등록일</td>
		</tr>
		
		
		<c:if test="${totCnt > 0 }">
			<c:forEach var="cs" items="${list }">
				<tr>
						<td>${startNum }</td>
						<td>${cs.writer }</td>
						<td>${cs.subject}</td>
						<td>${cs.content}</td>
						<td>${cs.passwd }</td>
						<td>${cs.reg_date }</td>
						<td>삭제</td>
				</tr>
					<c:set var="startNum" value="${startNum-1 }"></c:set>
			</c:forEach>
		</c:if>
		<c:if test="${totCnt ==0 }">
				<tr><td colspan="5">데이터가 없습니다.</td></tr>
		</c:if>
	</table>
</div>
	
	
	<div class="text-center">
		<c:if test="${startPage > blockSize }">
			<a href='csListForm.do?pageNum=${startPage-blockSize}'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='csListForm.do?pageNum=${i }'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage > pageCnt }">
			<a href='csListForm.do?pageNum=${startPage+blockSize }'>[다음]</a>
		</c:if>
	</div>

<%@ include file="/inc/footer.jsp" %>
</body>
</html>