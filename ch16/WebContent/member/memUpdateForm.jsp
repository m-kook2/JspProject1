<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function mut() {
	var frm=document.f;
	alert("정말 수정할껀가?")
	alert("정말 수정할껀가?")
	alert("정말 수정할껀가?")
	if(frm.password.value != frm.chkpassword.value){
		alert("패스워드 확인이 필요합니다.");
		frm.chkpassword.value="";
		frm.chkpassword.focus();
		return false;
	}
	if(frm.id.value == ""){
		alert("아이디를 입력하세요");
		frm.id.value="";
		frm.id.focus();
		return false;
	}
	if(frm.email.value == "") {
		alert("이메일을 입력하세요");
		frm.email.value="";
		frm.email.focus();
		return false;
	}
	if(frm.nickname.value == "") {
		alert("닉네임을 입력하세요");
		frm.nickname.value="";
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
	<div class="container">
		<form action="memUpdatePro.do" name="f" method="post">
			<div class="form-group">
				<h2>회원정보 수정</h2>
				<br /> <label for="id">아이디 : </label> <input type="text"
					class="form-control" id="id" name="id" 
					value="${sessionScope.id }">
				<p>

					<label for="password">비밀번호 : </label> <input type="password"
						class="form-control" id="password" name="psssword"
						value="${sessionScope.password }">
				<p>

					<label for="chkpassword">비밀번호 확인:</label> <input type="password"
						class="form-control" id="chkpassword" name="chkpassword">
				<p>

					<label for="email">이메일 : </label> <input type="text"
						class="form-control" id="email" name="email" value="${sessionScope.email }">
				<p>

					<label for="nickname">닉네임 : </label> <input type="text"
						class="form-control" id="nickname" name="nickname" value="${sessionScope.nickname }">
				<p>
			</div>
			<br />
			<!-- <button type="button" class="btn btn-primary" onclick="return memUpdate()">정보수정</button> -->
			<!-- <input type="button" name="f" onsubmit="return memUpdate();" value="정보수정"> -->
			<button type="button" class="btn btn-danger" onclick="javascript:mut();">정보수정</button>
			<button type="button" class="btn btn-primary" value="reset">초기화</button>
		</form>
	</div>
	<%@ include file="/inc/footer.jsp"%>
</body>
</html>