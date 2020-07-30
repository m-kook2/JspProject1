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
정렬</button>
<div class="dropdown-menu">
<a class="dropdown-item">최신순</a>
<a class="dropdown-item">장르별</a>
<a class="dropdown-item">국적별</a>
</div>
</div>

<div class="bk_href" style="float: right">
<button type="button" class="btn btn-primary btn-sm" onclick="location.href='movieList.do'">
찜추가</button>
</div>
<form action="delete.do">
	<table class="table">
		<tr>
		 <!-- <td>번호</td> -->
		 <td>순번</td>
		 <td>사진</td>
		 <td>아이디</td>
		<!--  <td>영화번호</td> -->
		 <td>장르</td>
		 <td>영화제목</td>
		 <td>개봉일</td>
		 <td>등록일</td>
		 <td>삭제</td>
		</tr>
		
		
		<c:if test="${totCnt > 0 }">
			<c:forEach var="bookmark" items="${list }">
				<input type="hidden" value="${pageNum }"/>
				<tr>
					<td>
						<a href="content.do?num=${bookmark.idx }&pageNum=${currentPage}">${bookmark.idx }</a>

						</td>
						<td><img src="./images/main/photo/${bookmark.m_photo}" width="65" height="93"/></td>
						<td>${bookmark.id}</td>
						<%-- <td>${bookmark.m_idx }</td> --%>
						<td>${bookmark.m_genre}</td>
						<td>${bookmark.m_name}</td>
						<td>${bookmark.m_date }</td>
						<td>${bookmark.reg_date }</td>
						<td><input type="submit" class="btn btn-primary" value="삭제"></input> </td>
					</form>

				</tr>
					<c:set var="startNum" value="${startNum-1 }"></c:set>
			</c:forEach>
		</c:if>
		<c:if test="${totIdCnt ==0 }">
				<tr><td colspan="5">데이터가 없습니다.</td></tr>
		</c:if>
	</table>
</form>	
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