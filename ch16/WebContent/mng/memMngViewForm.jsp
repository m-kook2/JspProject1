<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style> 
input[type=text], select, textarea {
  width: 60%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}
</style>
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
<div class="container text-center">
	<div class="row justify-content-center">
	<div>
		<h2>회원정보수정</h2>
		<br>
		<img alt="" src="./images/member/img/${result.pic}" class="rounded"><p><br/>
				<input type="hidden" name="pic" value="${result.pic}"/>
				<input type="file" name="file1"> 
		<form action="memMngUpdatePro.do" name="frm" method="post">
				<div class="form-group">
					<label for="id">아이디:</label> 
					<input type="text" id="id" name="id" value="${result.id }"> 
				</div>
				<div class="form-group">
					<label for="nickname">닉네임:</label> 
					<input type="text" id="nickname" name="nickname" value="${result.nickname }">
				</div>
				<div class="form-group">
					<label for="nickname">이메일:</label> 
					<input type="text" id="email" name="email" value="${result.email }">
				</div>
				<div class="form-group">
					<div class="form-check-inline">
					  <label class="form-check-label">
					    <input type="radio" class="form-check-input" id="gender" name="gender" value="남자" ${result.gender eq '남자'?"checked='checked'":'' }>남자
					  </label>
					</div>
					<div class="form-check-inline">
					  <label class="form-check-label">
					    <input type="radio" class="form-check-input" id="gender" name="gender" value="여자" ${result.gender eq '여자'?"checked='checked'":'' }>여자
					  </label>
					</div>
				</div>
				<div class="form-group">
					<div class="form-check-inline">
					  <label class="form-check-label">
					    <input type="radio" class="form-check-input" id="status" name="status" value="1" ${result.status eq '1'?"checked='checked'":'' }>회원
					  </label>
					</div>
					<div class="form-check-inline">
					  <label class="form-check-label">
					    <input type="radio" class="form-check-input" id="status" name="status" value="2" ${result.status eq '2'?"checked='checked'":'' }>관리자
					  </label>
					</div>
					<div class="form-check-inline">
					  <label class="form-check-label">
					    <input type="radio" class="form-check-input" id="status" name="status" value="3" ${result.status eq '3'?"checked='checked'":'' }>정지
					  </label>
					</div>
				</div>
				<div class="form-group">
					<div class="form-check-inline">
					  <label class="form-check-label">
					    <input type="radio" class="form-check-input" id="delYn" name="del_yn" value="Y" ${result.del_yn eq 'Y'?"checked='checked'":'' }>탈퇴
					  </label>
					</div>
					<div class="form-check-inline">
					  <label class="form-check-label">
					    <input type="radio" class="form-check-input" id="delYn" name="del_yn" value="N" ${result.del_yn eq 'N'?"checked='checked'":'' }>미탈퇴
					  </label>
					</div>
				</div>
				<button type="button" class="btn btn-primary" onclick="reg();">회원정보수정</button>
		</form>
		</div>
	</div>
</div>
<%@ include file="/inc/footer.jsp"%>
</body>

</html>