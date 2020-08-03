<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css">
body {
	background-image : url("../images/memUpdate.png");
	background-repeat: repeat;
	background-size: 50px;
}
 div:hover{
            background-image: url("../images/hot.gif"); 
            background-repeat: repeat;
			background-size: 150px;
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
	<h2>사용할 메뉴를 눌러주세요.</h2>
	<br/><p>
		<br/>
		<br/>
		<a class="btn btn-success" class="form-control" href="bookMarkList.do"><img src="https://img.icons8.com/cotton/64/000000/filled-star.png"/> 즐겨찾기</a>
		<a class="btn btn-primary" class="form-control" href="memUpdateForm.do"><img src="https://img.icons8.com/cotton/64/000000/name--v2.png"/>정보 수정</a>
		<a class="btn btn-primary" class="form-control" href="csWriteForm.do"><img src="https://img.icons8.com/cotton/64/000000/name--v2.png"/>의견보내기</a>
		<a class="btn btn-danger" class="form-control" href="memDeleteForm.do"><img src="https://img.icons8.com/cotton/64/000000/fire-alarm.png"/>회원탈퇴</a>
	</div>
	<br/>
	<br/>
	<br/>
	
	
	
	<%@ include file="/inc/footer.jsp"%>
</body>
</html>