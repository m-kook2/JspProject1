<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/inc/top.jsp"%>
</head>
<body>
	<%@ include file="/inc/header.jsp"%>
	<div class="container text-center">
		<h2>마이페이지</h2>
		<a class="btn btn-success" class="form-control" href="#0001"><img src="https://img.icons8.com/cotton/64/000000/filled-star.png"/> 즐겨찾기</a>
		<a class="btn btn-primary" class="form-control" href="memUpdateForm.do"><img src="https://img.icons8.com/cotton/64/000000/name--v2.png"/>정보 수정</a>
		<a class="btn btn-danger" class="form-control" href="memDeleteForm.do"><img src="https://img.icons8.com/cotton/64/000000/fire-alarm.png"/>회원탈퇴</a>
	</div>
	<%@ include file="/inc/footer.jsp"%>
</body>
</html>