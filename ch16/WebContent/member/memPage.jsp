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
	<div class="container">
		<h2>마이페이지</h2>
		<form action="" name="frm" method="post"></form>
		<button type="button" class="btn btn-primary" onclick="" value="즐겨찾기"></button>
		<div class="form-group">
			<label for="id">아이디 : <input type="text" class="form-control"
				id="id" name="id" value="${sessionScope.id }" disabled="disabled"></label>
			<p>
				<label for="email">이메일 : <input type="text"
					class="form-control" id="email" name="email"
					value="${sessionScope.email }" disabled="disabled"></label>
			<p>
				<label for="nickname">닉네임 : <input type="text"
					class="form-control" id="nickname" name="nickname"
					value="${sessionScope.nickname }" disabled="disabled"></label>
			<p>
				<label for="gender">성별 : <input type="text"
					class="form-control" id="gender" name="gender"
					value="${sessionScope.gender }" disabled="disabled"></label>
			<p>

				<br />
				<button type="button" class="btn btn-primary" onclick=""
					value="정보 수정"></button>
				<button type="button" class="btn btn-danger" onclick=""
					value="회원 탈퇴"></button>
		</div>
	</div>
	<%@ include file="/inc/footer.jsp"%>
</body>
</html>