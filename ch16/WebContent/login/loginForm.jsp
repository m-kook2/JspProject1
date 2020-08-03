<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>로그인</title>
<%@ include file="/inc/top.jsp"%>
<script type="text/javascript">
	function reg() {
		var f = document.frm;
		if (f.id.value == "") {
			alert("id를 입력 하세요");
			f.id.focus();
			return false;
		}
		if (f.password.value == "") {
			alert("비밀번호를 입력하세요");
			f.password.focus();
			return false;
		}
		f.submit();
	}
</script>
</head>
<body>
	<%@ include file="/inc/header.jsp"%>
	<div class="container">
		<h2 class="text-center">로그인</h2>
		<form action="login.do" name="frm" method="post" class="was-validated">
			<div class="form-group">
				<label for="id">아이디</label> 
				<input type="text" class="form-control" id="id" name="id" placeholder="Enter username" required> 
				<div class="valid-feedback">Valid.</div>
    			<div class="invalid-feedback">Please fill out this field.</div>
			</div>
			<div class="form-group">
				<label for="password">비밀번호</label> 
				<input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
				<div class="valid-feedback">Valid.</div>
   				<div class="invalid-feedback">Please fill out this field.</div>
			</div><br/>
			<button type="button" class="btn btn-success" onclick="reg();">로그인</button>
			<br/><br/><br/>
		</form>
	</div>
	<%@ include file="/inc/footer.jsp"%>
</body>
</html>