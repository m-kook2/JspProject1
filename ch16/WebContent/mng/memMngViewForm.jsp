<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/inc/top.jsp" %>
<script type="text/javascript">
function reg() {
	var f= document.frm;
	if(f.id.value==""){
		alert("회원정보가 수정되었습니다");
		f.id.focus();
		return false;
	}
	if(f.nickname.value == ""){
		alert("닉네임을 입력하세요");
		f.nickname.focus();
		return false;
	}
	if(f.email.value == ""){
		alert("이메일을 입력하세요");
		f.email.focus();
		return false;
	}
	f.submit();
}
</script>
</head>
<body>
<%@ include file="/inc/header.jsp" %>
<div class="container">
		<h2>회원정보수정</h2>
		<form action="memMngViewForm.do" name="frm" method="post">
			<div class="form-group">
				<label for="id">아이디:</label> 
				<input type="text" class="form-control" id="id" name="id" value="${id }"> 
				<label for="nickname">닉네임:</label> 
				<input type="text" class="form-control" id="nickname" name="nickname" value="${nickname }">
				<label for="nickname">이메일:</label> 
				<input type="text" class="form-control" id="email" name="email" value="${email }">
				<label for="nickname">회원상태확인:</label> 
				<input type="radio" class="form-control" id="status" name="status" value="1">회원
				<input type="radio" class="form-control" id="status" name="status" value="2">관리자
				<input type="radio" class="form-control" id="status" name="status" value="3">탈퇴
			</div>
			<br/>
			<button type="button" class="btn btn-primary" onclick="reg();">회원정보수정</button>
		</form>
	</div>
<%@ include file="/inc/footer.jsp"%>
</body>

</html>