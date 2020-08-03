<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css">
p {
	text-align: center;
}
</style>
<%@ include file="/inc/top.jsp"%>
</head>
<body>
	<%@ include file="/inc/header.jsp"%>
	<div class="container text-center">
		<br/>
	<br/><p>
	<br/><p>
	<h2><strong><span style="color: red;">사</span><span style="color: orange;">용</span><span style="color: #FFC81E;">할</span> <span style="color: green;">메</span><span style="color: blue;">뉴</span><span style="color: Indigo;">를</span> <span style="color: violet;">눌</span><span style="color: red;">러</span><span style="color: orange;">주</span><span style="color: #FFC81E;">세</span>요.</strong></h2>
	<!-- <br/><p>
		<br/>
		<br/>
	<br/>
	<br/> -->
	<br/>
		<br/>
		<a class="btn btn-success" class="form-control" href="bookMarkList.do"><img src="https://img.icons8.com/cotton/64/000000/filled-star.png"/> 즐겨찾기</a>
		<a class="btn btn-primary" class="form-control" href="memUpdateForm.do"><img src="https://img.icons8.com/cotton/64/000000/name--v2.png"/>정보 수정</a>
		<a class="btn btn-primary" class="form-control" href="csWriteForm.do"><img src="https://img.icons8.com/color/64/000000/same-opinion.png"/>의견보내기</a>
		<a class="btn btn-danger" class="form-control" href="memDeleteForm.do"><img src="https://img.icons8.com/cotton/64/000000/fire-alarm.png"/>회원탈퇴</a>
	</div>
	<p>
	<br/>
	<br/><br/>
	<br/>
	 <br/><br/>
	<br/><br/>
	<br/><br/>
	<br/> 
	
	<%@ include file="/inc/footer.jsp"%>
</body>
</html>