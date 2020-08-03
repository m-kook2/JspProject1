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

<h2 style="margin-bottom: 50px">의견 상세내역</h2>
<table class="table">
	<tr>
		<td>번호${cs.c_idx }</td>
		<td>${cs.c_idx }</td><td></td><td></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td>${cs.writer }</td><td></td><td></td><td></td>
	</tr>
	<tr>
		<td>작성일</td>
		<td>${cs.reg_date }</td><td></td><td></td><td></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" disabled value="${cs.subject }" 
		style="text-align:center; width:200px; height:30px;"></td><td></td><td></td><td></td>
	</tr>
	<tr>
		<td>내용</td>
		<td ><input type="text" disabled value="${cs.content }" 
		style="text-align:center; width:700px; height:300px;"></td><td></td><td></td><td></td>
	</tr>
</table>
	<c:if test="${sessionScope.status eq '2' || sessionScope.id eq cs.writer}">
	<input class="btn m-2 btn-primary mx-auto" type="button" value="수정" 
	            onclick="location.href='csUpdateForm.do?c_idx=${cs.c_idx}&pageNum=${pageNum}'">
	<input class="btn m-2 btn-primary mx-auto" type="button" value="삭제"
	            onclick="location.href='csDeleteForm.do?c_idx=${cs.c_idx}&pageNum=${pageNum}'">
	</c:if>
	
	<input type="button" value="목록" onclick="location.href='csList.do?pageNum=${pageNum }'"></td></tr>
</div>


<%@ include file="/inc/footer.jsp" %>
</body>
</html>