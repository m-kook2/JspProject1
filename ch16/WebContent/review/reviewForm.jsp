<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/inc/top.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<%@ include file="/inc/header.jsp" %>

<div class="container text-center" style="padding: 30px">
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
		<td>예고</td>
		<td colspan="2">
			<iframe  width="750" height="420" src="${review.m_video }?autoplay=1" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
		</td>
		<td></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea class="form-control" cols="50" rows="10">${review.p_content}</textarea></td>
		<td><img src="./images/main/photo/${review.m_photo}" width="350"></td>
	</tr>
	
</table>
<table class="container text-center table">
	
		
</table>
	<c:if test="${sessionScope.status eq '2'}">
		<input class="btn btn-dark mx-auto" type="button" value="수정" 
	            onclick="location.href='reviewupdateForm.do?p_idx=${review.p_idx}&pageNum=${pageNum}'">
		<input class="btn btn-dark mx-auto" type="button" value="삭제"
	            onclick="location.href='reviewdeleteForm.do?p_idx=${review.p_idx}&pageNum=${pageNum}'">
		</c:if>
		<p>
		<br>
	<button type="button" class="btn btn-warning mx-auto" value="목록" onclick="location.href='r_list.do?pageNum=${pageNum}'"><i class="fa fa-bars"></i></button>
</div>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>