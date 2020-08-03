<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 탈퇴</title>
<style type="text/css">
#id2{
	width: 115px;
	float: left;
}
</style>
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
	<div class="container text-center">
		<div class="row justify-content-center">
			<form action="memDeletePro.do" name="d" method="post">
			<br/>
	<br/>
	<br/>
				<h2>회원 탈퇴</h2>
				<br /> 
						<label id="id2" for="id">아이디 </label> 
						<input type="text" style="text-align: center;" class="form-control" id="id" name="id" value="${sessionScope.id }" disabled="disabled">
				<p>
				<br/>
					<label id="id2" for="password">비밀 번호 </label> 
					<input type="password" style="text-align: center;" class="form-control" id="password" name="password" value="${sessionScope.password }" disabled="disabled">
				<p>
				
					<label id="id2" for="chkpassword">비밀번호 확인 :</label> 
					<input type="password" style="text-align: center;" class="form-control" id="chkpassword" name="chkpassword"> 
					<br />
					<input type="submit" style="margin-left: 220px;" class="btn btn-danger" onclick="del();" value="회원탈퇴">
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
	<%@ include file="/inc/footer.jsp"%>
</body>
</html>