<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/inc/top.jsp" %>
</head>
<body>
<%@ include file="/inc/header.jsp" %>
<div class="col-sm text-center" style="padding: 30px">
<table class="table">
	<tr>
		<td>글번호 ${review.p_idx}</td>
		<td>작성자 ${review.id}</td>
		<td>작성일 ${review.p_date}</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>${review.p_title}</td>
		<td></td>
	</tr>
	<tr>
		<td>포스터</td>
		<td><img src="./images/main/photo/${review.m_photo}" width="270" height="385"></td>
		<td></td>
	</tr>
	<tr>
		<td>내용</td>
		<td> <textarea rows="100" cols="100">${review.p_content}</textarea></td>
		<td></td>
	</tr>
	
</table>
	<c:if test="${sessionScope.status eq '2'}">
	<input class="btn m-2 btn-primary mx-auto" type="button" value="수정" 
	            onclick="location.href='reviewupdateForm.do?p_idx=${review.p_idx}&pageNum=${pageNum}'">
	<input class="btn m-2 btn-primary mx-auto" type="button" value="삭제"
	            onclick="location.href='reviewdeleteForm.do?p_idx=${review.p_idx}&pageNum=${pageNum}'">
	</c:if>
	<input class="btn m-2 btn-primary mx-auto" type="button" value="목록"
			    onclick="location.href='r_list.do?pageNum=${pageNum}'">

</div>


<%@ include file="/inc/footer.jsp" %>
</body>
</html>