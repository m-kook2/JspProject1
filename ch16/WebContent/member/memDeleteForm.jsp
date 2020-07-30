<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function del() {
		var del = document.d;
		if (frm.password.value != frm.chkpassword.value) {
			alert("패스워드 확인이 필요합니다.");
			frm.chkpassword.value = "";
			frm.chkpassword.focus();
			return false;
		}
		del.submit();
	}
</script>
<%@ include file="/inc/top.jsp"%>
</head>
<body>
	<%@ include file="/inc/header.jsp"%>
	<div class="container">
		<form action="memDeletePro.do" name="d" method="post">
			<h2>회원 탈퇴</h2>
			<br /> <label for="id">아이디 : </label> <input type="text"
				class="form-control" id="id" name="id" value="${sessionScope.id }"
				disabled="disabled">
			<p>

				<label for="password">비밀 번호 : </label> <input type="password"
					class="form-control" id="password" name="password"
					value="${sessionScope.password }" disabled="disabled">
			<p>

				<label for="chkpassword">비밀번호 확인 :</label> <input type="password"
					class="form-control" id="chkpassword" name="chkpassword">
					<br />
				<!-- <button type="button" class="btn btn-danger" onclick="javascript:del();">회원 탈퇴</button> -->
				<input type="submit" class="btn btn-danger" onclick="del();" value="회원탈퇴">
		</form>
	</div>
	<%@ include file="/inc/footer.jsp"%>
</body>
</html>