<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>의견관리 작성</title>
<link rel="stylesheet" href="style.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
#cs2{
	width: 140px;
	float: left;
	
}

.form-control{
	width: 150px;
	float: light;
	
}

</style>
<%@ include file="/inc/top.jsp"%>
</head>
<body>
	<%@ include file="/inc/header.jsp"%>
	
	
	<div class="container text-center">
	<div class="row justify-content-center">
	
		<!-- CSWriteFormAction에서 c_idx,pageNum, writer, ref, re_level, re_step 정보를 받아옴 -->
		<form action="csWritePro.do" method="get">
		<!-- hidden으로  c_idx,pageNum, writer, ref, re_level, re_step 정보를 csWritePro.do에 보내줌 -->
			<div class="form-group">
				<h2 style="padding-bottom: 50px; margin-top: 50px;"><strong>관리자에게 의견 보내기</strong></h2>
				<br/><img alt="csWritePhoto" src="./images/cs/cs.jpg" width="500">
				<p>

			<input type="hidden" name="c_idx" value="${c_idx }"> <input
				type="hidden" name="pageNum" value="${pageNum }"> <input
				type="hidden" name="ref" value="${ref }"> <input
				type="hidden" name="re_level" value="${re_level }"> <input
				type="hidden" name="re_step" value="${re_step }">
				
			<p>
				<br/>
					<label id="cs2" for="subject"><strong>제목</strong></label>
					<input type="text" style="text-align: center;" class="form-control" id="subject" name="subject" required="required">

					<!-- 로그인 해서 저장되어있는 id를 writer로 넘겨줌 -->
					<input type="hidden" name="writer" value="${id }" required="required">
			<p>
				<br/>
					<label id="cs2" for="content"><strong>내용</strong></label>
					<textarea rows="3" cols="10" style="text-align: center;" class="form-control" id="content" name="content" required="required"></textarea>
					<!-- <input type="text" style="text-align: center;" class="form-control" id="content" name="content" required="required"> -->
				</div>
			<br />				
					<button type="submit" class="btn btn-dark">전송</button>
					<button type="reset" class="btn btn-dark">다시작성</button>
				<p>
				<p>
					<button type="button" class="btn btn-warning" onclick="location.href='csList.do?pageNum=${pageNum }'"><i class="fa fa-bars"></i></button>
			<br />
				<p>
	</div>
			<br />
		</form>
	</div>
</div>
	<%@ include file="/inc/footer.jsp"%>
</body>
</html>