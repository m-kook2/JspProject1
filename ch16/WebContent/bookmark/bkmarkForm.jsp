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
<h2 class="text">내가 찜한 목록</h2>

<div class="bk_array" style="float: right">
<button type="button" class="btn btn-secondary btn-sm dropdown-toggle dropdown-toggle" data-toggle="dropdown" > 
정렬
</button>
<div class="dropdown-menu">
<a class="dropdown-item">최신순</a>
<a class="dropdown-item">장르별</a>
<a class="dropdown-item">국적별</a>
</div>
</div>
	
	<table class="table">
		<tr>
		 <td rowsapan="2">사진</td>
		 <td rowsapan="2">사진</td>
		 <td rowsapan="2">사진</td>
		 <td rowsapan="2">사진</td>
		</tr>
		<tr>
		 <td>제목</td> 
		 <td>제목</td> 
		 <td>제목</td> 
		 <td>제목</td> 
		</tr>
		
		<c:if test="${totCnt > 0 }">
			<c:forEach var="bookmark" items="${list }">
				<tr>
					<td>${startNum }</td>
					<td>
					<a href="content.do?num=${bookmark.idx }&pageNum=${currentPage}">${bookmark.idx }</a>
					</td>
					<td>${bookmark.id}</td>
					<td>${bookmark.m_idx }</td>
					<td>${bookmark.reg_date }</td>
					</tr>
					<c:set var="startNum" value="${startNum-1 }"></c:set>
			</c:forEach>
		</c:if>
		<c:if test="${totCnt ==0 }">
				<tr><td colspan="5">데이터가 없네</td></tr>
		</c:if>
	</table>
	
	</div>
	<div class="text-center">
			<div id="bk_delete">
				<button class="btn m-2 btn-primary mx-auto">찜하기 삭제</button>
			</div>
		</div>
	</div>
	
	<div class="text-center">
		<c:if test="${startPage > blockSize }">
			<a href='bookmark.do?pageNum=${startPage-blockSize}'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='bkmarkForm.do?pageNum=${i }'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage > pageCnt }">
			<a href='bkmarkForm.do?pageNum=${startPage+blockSize }'>[다음]</a>
		</c:if>
	

<%@ include file="/inc/footer.jsp" %>
</body>
</html>