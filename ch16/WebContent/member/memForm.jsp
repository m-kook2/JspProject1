<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function reg() {
		var pass=document.frm.password.value;
		var passChk=document.frm.chkpassword.value;
		if(pass != passChk){
			alert("비밀번호가 일치하지 않습니다.");
			document.frm.password.value="";
			document.frm.chkpassword.value="";
			document.frm.password.focus();
			return false;
		}
		document.frm.submit();
	}
</script>
</head>
<body>
<%@ include file="/inc/header.jsp" %>
<div class="container">
	<h2>회원가입</h2>
	<form action="memInsert.do" name="frm" method="post">
		<div class="form-group">
			<label for="id">아이디:</label>
      		<input type="text" class="form-control" id="id" name="id">
      		<label for="password">비밀번호:</label>
      		<input type="password" class="form-control" id="password" name="password">
      		<label for="chkpassword">비밀번호 확인:</label>
      		<input type="password" class="form-control" id="chkpassword" name="chkpassword">
      		<label for="email">이메일:</label>
      		<input type="text" class="form-control" id="email" name="email">
      		<label for="nickname">닉네임:</label>
      		<input type="text" class="form-control" id="nickname" name="nickname">
      		<label for="gender">성별:</label>
      		남:<input type="radio" class="form-control" id="gender" name="gender" value="M">
			여 :<input type="radio" class="form-control" id="gender" name="gender" value="W">
			<button type="button" class="btn btn-primary" onclick="reg();">가입</button>
		</div>
	</form>
</div>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>