<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>스네이크게임</title>
<%@ include file="/inc/top.jsp"%>
</head>
<body>

<%@ include file="/inc/header.jsp"%>
	<div class="container text-center">
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<h1>환영한다.</h1>
		<br />
		<br />
		<br />
		<h1>게임을 시작하지.</h1>
		<br />
		<br />
		<br />
		<br />
		<div class="container">
			<!-- <label>Hard Mode</label> -->
			<!-- <form action="miniHard.do" name="frm" class="btn btn-danger" value="하드모드"> -->
			<a href='miniHard.do'>[하드모드]</a>
				<!-- <input type="button"> -->
			<!-- </form> -->
			<!-- <label>Easy Mode</label> -->
			<a href='miniEasy.do'>[이지모드]</a>
			<!-- <form action="miniEasy.do" name="frm" class="btn btn-danger" value="이지모드"> -->
			<!-- 	<input type="button"> -->
			</form>
		</div>
	</div>
	<br />
		<br />
		<br />
		<br />
	<%@ include file="/inc/footer.jsp"%>>
</body>
</html>