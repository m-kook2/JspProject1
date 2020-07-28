<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/inc/top.jsp" %>
</head>
<body>
<%@ include file="/inc/header.jsp" %>
<h2>회원관리</h2>
	<table>
		<tr>
			<th width="50">번호</th> 
			<th width="100">아이디</th>
			<th width="100">이메일</th>
			<th width="100">닉네임</th>	
			<th width="100">성별</th>
			<th width="100">가입날짜</th>
			<th width="100">조회수</th>
		</tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="mng" items="${list}">
				<tr>
					<td>${startNum}</td>
					<td class="left" width=50>
						<a href="memberMngView.do?id=${mng.id}">${mng.idx}</a> 
					</td>
					<td class="left" width=100>${mng.id}</td>
					<td>${mng.email}</td>
					<td>${mng.nickname }</td>
					<td class="left" width=150 >${mng.gender }</td>
					<td>${mng.reg_date }</td>
					<td>${mng.del_yn }</td>
					<td>${mng.status }</td>
				</tr>
				<c:set var="startNum" value="${startNum - 1 }" />
			</c:forEach>
		</c:if>
		<c:if test="${totCnt == 0 }">
			<tr>
				<td colspan=7>데이터가 없네</td>
			</tr>
		</c:if>
	</table>
	
	<div style="text-align: center;">
		<c:if test="${startPage > blockSize }">
			<a href='memberMng.do?pageNum=${startPage-blockSize}'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='memberMng.do?pageNum=${i}'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='memberMng.do?pageNum=${startPage+blockSize}'>[다음]</a>
		</c:if>
	</div>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>