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
<form action="memInsert.do" name="frm" method="post">
	아이디 : <input type="text" name="id" value=""/><input type="button" value="중복체크" onclick=""> <p>
	비밀번호 :<input type="password" name="password" value=""><p>
	비밀번호 확인 : <input type="password" name="chkpassword" value=""><p>
	이메일 : <input type="text" name="email" value=""><p>
	닉네임 :<input type="text" name="nickname" value=""><p>
	남:<input type="radio" name="gender" value="m">
	여 :<input type="radio" name="gender" value="w"><p>
	<input type="button" value="가입" onclick="reg();">
</form>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>