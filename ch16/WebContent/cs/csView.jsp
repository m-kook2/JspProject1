<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css">
#cs3{
	width: 140px;
	float: left;
	
}

.form-control{
	width: 150px;
	float: light;
	
}

input[type=button] {
  background-color: #fc863b;
  border: none;
  color: black;
  padding: 8px 10px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}
</style>
<%@ include file="/inc/top.jsp"%>
</head>
<body>

	<%@ include file="/inc/header.jsp"%>
	
	
	<div class="container text-center">
	<div class="row justify-content-center">
<div class="form-group">
		<h2 style="padding-bottom: 50px; margin-top: 50px;"><strong>의견 상세내역</strong></h2>
		
		<!-- CSViewAction에서 c_idx,pageNum, cs의 모든 정보를 받아옴 -->
		<br/><img alt="csViewPhoto" src="./images/cs/hh.jpg" width="500">
				<p>
					<br/>
				<label id="cs3" for="c_idx"><strong>번호</strong></label>
				<input type="text" style="text-align: center;" class="form-control" id="c_idx" name="c_idx" value="${cs.c_idx }" disabled="disabled">
				<p>
					<br/>					
				<label id="cs3" for="writer"><strong>작성자</strong></label>
				<input type="text" style="text-align: center;" class="form-control" id="writer" name="writer" value="${cs.writer }" disabled="disabled">
				<p>
					<br/>			
				<label id="cs3" for="reg_date"><strong>작성일</strong></label>
				<input type="text" style="text-align: center;" class="form-control" id="reg_date" name="reg_date" value="${cs.reg_date }" disabled="disabled">
				<p>
					<br/>			
				<label id="cs3" for="subject"><strong>제목</strong></label>
				<input type="text" style="text-align: center;" class="form-control" id="subject" name="subject" value="${cs.subject }" disabled="disabled">
				<p>
					<br/>			
				<label id="cs3" for="content"><strong>내용</strong></label>
				<input type="text" style="text-align: center;" class="form-control" id="content" name="content" value="${cs.content }" disabled="disabled">
			</div>
			</div>
				<!-- (2=관리자)    관리자이거나 작성자와 id가 일치할경우 수정과 삭제 버튼이 보인다 -->
		<c:if
			test="${sessionScope.status eq '2' || sessionScope.id eq cs.writer}">
			<button type="button" class="btn btn-warning" onclick="location.href='csUpdateForm.do?c_idx=${cs.c_idx}&pageNum=${pageNum}'">수정</button>
			<button type="button" class="btn btn-warning" onclick="location.href='csDeleteForm.do?c_idx=${cs.c_idx}&pageNum=${pageNum}'">삭제</button>
			</c:if>
				<!-- (2=관리자)    관리자면 답변작성이 보인다 -->
		<c:if test="${sessionScope.status eq '2'}">
		<button type="button" class="btn btn-warning" onclick="location.href='csWriteForm.do?ref=${cs.ref }&c_idx=${cs.c_idx}&pageNum=${pageNum }'">답변작성</button>
			</c:if>
		<p>
		<p>
		<button type="button" class="btn btn-outline-dark" onclick="location.href='csList.do?pageNum=${pageNum }'">목록</button>
	</div>


	<%@ include file="/inc/footer.jsp"%>
</body>
</html>