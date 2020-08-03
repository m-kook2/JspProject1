<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/inc/top.jsp"%>
<style type="text/css">
.form-control {
	width: 280px;
	margin-left: 415px;
}
/* input[id="chk"] {
        margin-left: 0px;
        display: inline-flex;
      } */
</style>
<script type="text/javascript">
	function reg() {
		var frm = document.frm;
		var pass = document.frm.password.value;
		var passChk = document.frm.chkpassword.value;
		var idChk = document.getElementById("msg").innerHTML;
		if (frm.id.value == "") {
			alert("아이디를 입력해주세요.");
			frm.id.value = "";
			frm.password.focus();
			return false;
		}
		if (pass == "") {
			alert("비밀번호를 입력해주세요.");
			frm.password.value = "";
			frm.password.focus();
			return false;
		}
		if (passChk == "") {
			alert("비밀번호확인을 입력해주세요.");
			frm.chkpassword.value = "";
			frm.chkpassword.focus();
			return false;
		}
		if (pass != passChk) {
			alert("비밀번호가 일치하지 않습니다.");
			frm.password.value = "";
			frm.chkpassword.value = "";
			frm.password.focus();
			return false;
		}
		if (frm.email.value == "") {
			alert("email을 입력해주세요.");
			frm.email.value = "";
			frm.email.focus();
			return false;
		}
		if (frm.nickname.value == "") {
			alert("닉네임을 입력해주세요.");
			frm.nickname.value = "";
			frm.nickname.focus();
			return false;
		}
		if (idChk == "") {
			alert("아이디 중복체크를 해주세요.");
			frm.id.focus();
			return false;
		}
		if (idChk == "사용불가") {
			alert("사용불가 아이디 입니다.");
			frm.id.focus();
			return false;
		}
		document.frm.submit();
	}
	$(function() {
		$('#chk').click(function() {
			var id = $('#id').val();
			if (id != "") {
				$.ajax({
					type : "POST",
					url : "idChk.do",
					data : {
						id : id
					},
					dataType : "text",
					success : function(data) {
						$('#msg').html(data);
					}
				});
			} else {
				alert("id를 입력하세요");
			}
		});
	});
</script>
</head>
<body>
	<%@ include file="/inc/header.jsp"%>
	<div class="container text-center">
		<div class="form-group">
			<h2>회원가입</h2>
			<form action="memInsert.do" name="frm" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="id">아이디</label> <input type="text" id="id"
						class="form-control" name="id" placeholder="아이디"> <input
						type="button" class="btn btn-secondary" id="chk" value="중복확인" />
					<span id="msg"></span>
				</div>
				<div class="form-group">
					<label for="password">비밀번호</label> <input type="password"
						class="form-control" id="password" name="password"
						placeholder="비밀번호"> <br /> <label for="chkpassword">비밀번호
						확인</label> <input type="password" class="form-control" id="chkpassword"
						name="chkpassword" placeholder="비밀번호 확인"><br />
				</div>
				<div class="form-group">
					<label for="email">이메일</label> <input type="text"
						class="form-control" id="email" name="email" placeholder="이메일">
				</div>
				<div class="form-group">
					<label for="nickname">닉네임</label> <input type="text"
						class="form-control" id="nickname" name="nickname"
						placeholder="닉네임">
				</div><br/>
				<input type="file" name="fime1">
				<br/><br/>
			</form>
		</div>
		<div class="form-check-inline">
			<label class="form-check-label" for="gender"> <input
				type="radio" class="form-check-input" id="gender" name="gender"
				value="M" checked>남
			</label>
		</div>
		<div class="form-check-inline">
			<label class="form-check-label" for="gender"> <input
				type="radio" class="form-check-input" id="gender" name="gender"
				value="W">여
			</label>
			<p>
				<br /> <br />
				<button type="button" class="btn btn-primary" onclick="reg();">회원
					가입</button>
					<br/><br/>
		</div>
	</div>
	<%@ include file="/inc/footer.jsp"%>
</body>
</html>