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
<div>
<h2>게사판</h2>
	<table>
		<tr>
			<td><a href="writeForm.do">글쓰기</a></td>
		</tr>
	</table>
	
	<div style="text-align: center;">
		<%-- <c:if test="${startPage > blockSize }">
			<a href='list.do?pageNum=${startPage-blockSize}'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='list.do?pageNum=${i }'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage > pageCnt }">
			<a href='list.do?pageNum=${startPage+blockSize }'>[다음]</a>
		</c:if> --%>
	
	</div>
</div>
</body>
</html>