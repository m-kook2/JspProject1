<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>아이디 찾기</title>
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
	}
</script>
</head>
<body style="background-color: black;">
<%@ include file="/inc/header.jsp"%>
<div class="py-3" style="min-height:750px; width: 100%; background-color: white;">
	<div class="container">
		<div class="row justify-content-center">
			<form action="searchId.do" name="frm" method="post" class="was-validated">
				<p>
					<br />
				<div class="form-group">
				<h1>아이디 찾기</h1>
					<input type="text" id="email" class="form-control" name="email" placeholder="이메일" required>
					<div class="valid-feedback">&nbsp; 이메일값이 들어왔습니다.</div>
    				<div class="invalid-feedback">&nbsp;이메일을 적어주세요.</div>
				</div>
				
				<input type="submit" class="btn btn-warning" style="" onclick="return fid();">
				<br />
				<br />
			</form>
				<div class="container">
					<c:if test="${id ne null }">
						<%-- <c:out>아이디 : ${id }</c:out> --%>
						<c:out value="${id }">아이디 : ${id }</c:out>
					</c:if>
				</div>
		</div>
	</div>
	</div>
		<%@ include file="/inc/footer.jsp"%>
</body>
</html>