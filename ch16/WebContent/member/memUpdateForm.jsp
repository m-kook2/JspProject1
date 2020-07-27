<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function chg() {
	var frm=document.frm;
	var pass=document.frm.password.value;
	var passChk=document.frm.chkpassword.value;
	var email=document.frm.email.value;
	var nick=document.frm.nickname.value;
if(frm.pass.value==""){
	alert("비밀번호를 입력하세요.");
	frm.password.value="";
	frm.password.focus-"비밀번호";
return false;
}
if(pass != passChk){
	alert("비밀번호가 일치하지 않습니다.");
	frm.password.value="";
	frm.chkpassword.value="";
	frm.password.focus();
return false;
if(frm.email.value=""){
	alert="이메일을 입력하세요.";
	frm.email.value="";
	frm.email.focus="이메일";
return false;
}
if(frm.nick.value=""){
	alert("닉네임을 입력하세요.");
	frm.nickname.value="";
	frm.nickname.focus="닉네임";
return false;
}
	document.frm.submit();
}
</script>
<%@ include file="/inc/top.jsp"%>
</head>
<body>
	<%@ include file="/inc/header.jsp"%>
	<div class="container">
		<form action="memUpdatdForm.do" name="frm" method="post">
			<div class="form-group">
				<h2>회원정보 수정</h2>
				<br /> <label for="id">아이디 : </label> <input type="hidden"
					class="form-control" id="id" name="id">
				<p>
					<label for="password">비밀번호 : </label> <input type="password"
						class="form-control" id="password" name="psssword">
				<p>
					<label for="chkpassword">비밀번호 확인:</label> <input type="password"
						class="form-control" id="chkpassword" name="chkpassword">
					<label for="email">이메일 : </label> <input type="text"
						class="form-control" id="email" name="email"> <label
						for="nickname">닉네임 : </label> <input type="text"
						class="form-control" id="nickname" name="nickname">
			</div>
			<br />
			<button type="button" class="btn btn-primary" onclick="chg();">정보
				수정</button>
		</form>
	</div>
	<%@ include file="/inc/footer.jsp"%>
</body>
</html>