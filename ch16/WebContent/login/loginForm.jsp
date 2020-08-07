<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>로그인</title>
<%@ include file="/inc/top.jsp"%>
<style type="text/css">
	#id{
		width: 65%;
		float: left;
		text-align: reft;
	}
	#password{
		width: 65%;
		float: left;
		text-align: reft;
	}
</style>
<script type="text/javascript">
	function reg() {
		var f = document.frm;
		if (f.id.value == "") {
			alert("id를 입력 하세요");
			f.id.focus();
			return false;
		}
		if (f.password.value == "") {
			alert("비밀번호를 입력하세요");
			f.password.focus();
			return false;
		}
		f.submit();
	}
</script>
</head>
<body>
	<%@ include file="/inc/header.jsp"%>
	<div class="container">
	<p>
	<br/>
		<h2 class="text-center">로그인</h2>
		<form action="login.do" name="frm" method="post" class="was-validated">
			<div class="form-group">
				<label for="id"></label> 
				<input type="text" style="margin-left: 190px;" class="form-control" id="id" name="id" placeholder="Enter userid" required> 
				<div class="valid-feedback">&nbsp; 아이디값이 들어왔습니다.</div>
    			<div class="invalid-feedback">아이디를 적어주세요.</div>
			</div>
			<p><br/> 
			<div class="form-group">
				<label for="password"></label>  
				<input type="password" style="margin-left: 190px;" class="form-control" id="password" name="password" placeholder="Enter password" required>
				<div class="valid-feedback">&nbsp;비밀번호 값이 들어왔습니다.</div>
   				<div class="invalid-feedback">비밀번호를 적어주세요.</div>  
			</div>   
		</form> 
	</div>
			<button type="button" style="position: absolute; top: 47%; left: 70%;/* top:0; bottom: 0; right: 0; left: 0; */" class="btn btn-success" onclick="reg();">로그인</button>
			<p><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<%@ include file="/inc/footer.jsp"%>
</body>
</html>