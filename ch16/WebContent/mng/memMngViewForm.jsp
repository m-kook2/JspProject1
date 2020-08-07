<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 12px;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.col-25 {
  float: left;
  text-align:center;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
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

<div class="container">
	<h2>회원정보수정</h2>
	<form action="memMngUpdatePro.do" name="frm" method="post">
		<input type="hidden" name="pic" value="${result.pic}"/>
	<div class="row">
		<img alt="${result.pic}" src="./images/member/img/${result.pic}" class="rounded mx-auto"/>
	</div>
	<div class="row">
		<div class="col-25">
	      <label for="file1">사진등록: </label>
	    </div>
	    <div class="col-75">
	      <input type="file" name="file1">
	    </div>
	</div>
	<div class="row">
		<div class="col-25">
	      <label for="id">아이디:</label>
	    </div>
	    <div class="col-75">
	      <input type="text" id="id" name="id" value="${result.id }">
	    </div>
	</div>
	<div class="row">
		<div class="col-25">
	      <label for="nickname">닉네임:</label>
	    </div>
	    <div class="col-75">
	      <input type="text" id="nickname" name="nickname" value="${result.nickname }">
	    </div>
	</div>
	<div class="row">
		<div class="col-25">
	      <label for="zip">우편번호:</label>
	    </div>
	    <div class="col-75">
	      <input type="text" id="zip" name="zip" value="${result.zip }">
	    </div>
	</div>
	<div class="row">
		<div class="col-25">
	      <label for="addr">주소:</label>
	    </div>
	    <div class="col-75">
	      <input type="text" id="addr" name="addr" value="${result.addr }">
	    </div>
	</div>
	<div class="row">
		<div class="col-25">
	      <label for="nickname">이메일:</label>
	    </div>
	    <div class="col-75">
	      <input type="text" id="email" name="email" value="${result.email }">
	    </div>
	</div>
	<div class="row">
		<div class="col-25">
	      <label for="gender">성별:</label>
	    </div>
	    <div class="col-75">
    		<input type="radio" id="gender" name="gender" value="남자" ${result.gender eq '남자'?"checked='checked'":'' }>남자
			<input type="radio" id="gender" name="gender" value="여자" ${result.gender eq '여자'?"checked='checked'":'' }>여자
	    </div>
	</div>
	<div class="row">
		<div class="col-25">
	      <label for="status">회원구분:</label>
	    </div>
	    <div class="col-75">
    		<input type="radio" id="status" name="status" value="1" ${result.status eq '1'?"checked='checked'":'' }>회원<br/>
			<input type="radio" id="status" name="status" value="2" ${result.status eq '2'?"checked='checked'":'' }>관리자<br/>
			<input type="radio" id="status" name="status" value="3" ${result.status eq '3'?"checked='checked'":'' }>정지
	    </div>
	</div>
	<div class="row">
		<div class="col-25">
	      <label for="del_yn">탈퇴여부:(Y:탈퇴)</label>
	    </div>
	    <div class="col-75">
    		<input type="radio" id="delYn" name="del_yn" value="Y" ${result.del_yn eq 'Y'?"checked='checked'":'' }>Y<br/>
			<input type="radio" id="delYn" name="del_yn" value="N" ${result.del_yn eq 'N'?"checked='checked'":'' }>N
	    </div>
	</div>
	<div class="row">
		<button type="button" class="btn btn-dark mx-auto" onclick="reg();">회원정보수정</button>
	</div>
</form>
</div>
<%@ include file="/inc/footer.jsp"%>
</body>

</html>