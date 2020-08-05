<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정</title>
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css">
#id2{
	width: 140px;
	float: left;
}
.form-control{
	width: 150px;
	float: light;
}
</style>
<script type="text/javascript">
	function mut() {
		var frm = document.f;
		if (frm.password.value != frm.chkpassword.value) {
			alert("패스워드 확인이 필요합니다.");
			frm.chkpassword.value = "";
			frm.chkpassword.focus();
			return false;
		}
		if (frm.id.value == "") {
			alert("아이디를 입력하세요");
			frm.id.value = "";
			frm.id.focus();
			return false;
		}
		if (frm.email.value == "") {
			alert("이메일을 입력하세요");
			frm.email.value = "";
			frm.email.focus();
			return false;
		}
		if (frm.nickname.value == "") {
			alert("닉네임을 입력하세요");
			frm.nickname.value = "";
			frm.nickname.focus();
			return false;
		}
		frm.submit();
	}
</script>
<%@ include file="/inc/top.jsp"%>
</head>
<body>
	<%@ include file="/inc/header.jsp"%>
	<div class="container text-center">
		<div class="row justify-content-center">
			<form action="memUpdatePro.do" name="f" method="post" enctype="multipart/form-data">
				<div class="form-group">
				<br/>
					<h2><strong>회원정보 수정</strong></h2>
					<br /> <img id="pm" alt="profilPhoto" src="./images/member/img/${sessionScope.pic}">
					<p>
						<br /> <input type="hidden" name="pic" value="${sessionScope.pic}" />
						
						<input type="file" name="file1"><p> <br /> 
						
						<label id="id2" for="id2"><strong>아이디</strong></label>
						<input type="text" style="text-align: center;" class="form-control" id="id" name="id" value="${sessionScope.id }" disabled="disabled">
					<p>
						<br /> 
						<label id="id2" for="password"><strong>비밀번호 </strong></label> 
						<input type="password" style="text-align: center;" class="form-control" id="password" name="psssword" value="${sessionScope.password }" disabled="disabled">
					<p>
						<br /> 
						<label id="id2" for="chkpassword"><strong>비밀번호 확인</strong></label> 
						<input type="password" style="text-align: center;" class="form-control" id="chkpassword" name="chkpassword">
					<p>
						<br /> 
						<label id="id2" for="zip"><strong>주소</strong></label> 
						<input type="text" style="text-align: center;" class="form-control" id="zip" name="zip" value="${sessionScope.zip }">
						<input type="text" style="text-align: center;" class="form-control" id="addr" name="addr" value="${sessionScope.addr }">
						<p>
						<br /> 
						<label id="id2" for="email"><strong>이메일 </strong></label> 
						<input type="text" style="text-align: center;" class="form-control" id="email" name="email" value="${sessionScope.email }">
					<p>
						<br /> <label id="id2" for="nickname"><strong>닉네임</strong> </label> 
						<input type="text" style="text-align: center;" class="form-control" id="nickname" name="nickname" value="${sessionScope.nickname }">
					<p>
						<br /> <label for="gender"><strong>성별</strong> </label>
					<div class="form-check-inline">
						<label class="form-check-label" for="gender"> 남</label>
						<input type="radio"  class="form-check-input" id="gender" name="gender" value="M" disabled="disabled" checked>
					</div>
					<div class="form-check-inline">
						<label class="form-check-label" for="gender"> 여</label>
						<input type="radio" class="form-check-input" id="gender" name="gender" value="W" disabled="disabled" checked>
					</div>
				</div>
				<br />
				<button type="button" class="btn btn-info" onclick="javascript:mut();">정보수정</button>
				<p>
				<br/>
				<br/>
			</form>
		</div>
	</div>
	<%@ include file="/inc/footer.jsp"%>
</body>
</html>