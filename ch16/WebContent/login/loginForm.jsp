<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/inc/top.jsp"%>
<style type="text/css">
.form-control {
	width: 280px;
	margin-left: 415px;
}
</style>
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
	<div class="container text-center">
		<h2>로그인</h2>
		<form action="login.do" name="frm" method="post">
			<div class="form-row">
				<div class="form-group">
					<label for="id">아이디:</label> <input type="text"
						class="form-control" style="" id="id" name="id"> <label
						for="password">비밀번호:</label> <input type="password"
						class="form-control" id="password" name="password">
				</div>
				<br />
				<button type="button" class="btn btn-primary" style="height: 50px;" position="" onclick="reg();">로그인</button>
				<div class="form-check mb-2 mr-sm-2">
					<label class="form-check-label"> <input
						class="form-check-input" type="checkbox"> id저장
					</label>
				</div>
			</div>
		</form>
	</div>
	<%@ include file="/inc/footer.jsp"%>
</body>
</html>