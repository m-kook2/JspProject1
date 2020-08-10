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
<body>
<%@ include file="/inc/header.jsp"%>
	<div class="container">
		<div class="row justify-content-center">
		<form action="searchPW.do" name="frm" method="post">
				<p>
					<br />
				<h1>비밀번호 찾기</h1>
				<div class="form-group">
					<input type="text" id="id" class="form-control" name="id" placeholder="아이디">
					<input type="text" id="email" class="form-control" name="email" placeholder="이메일">
				</div>
				<input type="submit" style="" onclick="return fid();">
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
	<p>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<%@ include file="/inc/footer.jsp"%>
</body>
</html>