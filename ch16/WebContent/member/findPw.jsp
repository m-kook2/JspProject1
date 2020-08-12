<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호찾기</title>
<%@ include file="/inc/top.jsp"%>
<script type="text/javascript">
	function fid() {
		var frm = document.frm;
		var fi = document.frm.email.value;
		if (frm.email.value == "") {
			alert("이메일을 입력해주세요.");
			frm.email.value = "";
			frm.email.focus();
			return false;
		}
		if (frm.id.value == "") {
			alert("아이디를 입력해주세요.");
			frm.id.value = "";
			frm.id.focus();
			return false;
		}
	}
</script>
</head>
<body style="background-color: black;">
<%@ include file="/inc/header.jsp"%>
<div class="py-3" style="min-height:750px; width: 100%; background-color: white;">
	<div class="container">
		<div class="row justify-content-center">
		<form action="searchPW.do" name="frm" method="post" class="was-validated">
				<p>
					<br />
				<h1>비밀번호 찾기</h1>
				<div class="form-group">
					<input type="text" id="id" class="form-control" name="id" placeholder="아이디" required>
						<div class="valid-feedback">&nbsp;아이디 값이 들어왔습니다.</div>
	   					<div class="invalid-feedback">&nbsp;아이디를 적어주세요.</div>
	   			</div>
	   			<div class="form-group">
					<input type="text" id="email" class="form-control" name="email" placeholder="이메일" required>
						<div class="valid-feedback">&nbsp;이메일 값이 들어왔습니다.</div>
	   					<div class="invalid-feedback">&nbsp;이메일을 적어주세요.</div>
				</div>
				<input type="submit" class="btn btn-warning" style="" onclick="return fid();">
				<br />
				<br />
				<div class="container">
					<c:if test="${pw ne null }">
						<c:out value="${pw }">비밀번호 : ${pw }</c:out>
					</c:if>
				</div>
			</form>
		</div>
	</div>
	</div>
	<%@ include file="/inc/footer.jsp"%>
</body>
</html>