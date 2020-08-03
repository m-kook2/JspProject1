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
<form action="csWritePro.do?pageNum=${pageNum }" method="post">
<input type="hidden" name="c_idx" value="${c_idx }">
<table align="center">
	<h2>관리자에게 의견 보내기</h2>
	<tr><td>제목</td><td><input type="text" name="subject" required="required"></td></tr>
	<tr><td></td><td><input type="hidden" name="writer" value="${id }" required="required"></td></tr>
	<tr><td>내용</td><td><textarea rows="10" cols="30" name="content" required="required"></textarea></td></tr>
	<tr><td><input type="submit" value="전송"></td>
		<td><input type="reset" value="다시작성"></td></tr>
	
</table>
</form>
</div>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>