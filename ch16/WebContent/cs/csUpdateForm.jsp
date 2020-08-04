<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css">
#cs4 {
	width: 140px;
	float: left;
}

.form-control {
	width: 150px;
	float: light;
}

input[type=submit], input[type=reset] {
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

			<!-- csView에서 c_idx, pageNum, cs의  모든 정보를 받아옴 -->
			<form action="csUpdatePro.do" method="post">
				<div class="form-group">
							<h2 style="padding-bottom: 50px; margin-top: 50px;"><strong>글 수정</strong></h2>
							<br />
							<img alt="csUpdatePhoto" src="./images/cs/jj.jpg" width="500">
							<p>
							
					<!-- hidden으로  c_idx, pageNum정보를 csUpdatePro.do 보내줌 -->
					<input type="hidden" name="c_idx" value="${cs.c_idx}">
					 <input	type="hidden" name="pageNum" value="${pageNum}">

								<label id="cs4" for="c_idx"><strong>글번호</strong></label>
								<input type="text" style="text-align: center;"
									class="form-control" id="c_idx" name="c_idx"
									value="${cs.c_idx}" disabled="disabled">
							<p>
								<br /> <label id="cs4" for="writer"><strong>작성자</strong></label>
								<input type="text" style="text-align: center;"
									class="form-control" id="writer" name="writer"
									value="${cs.writer}" disabled="disabled">
							<p>
								<br /> <label id="cs4" for="reg_date"><strong>작성일</strong></label>
								<input type="text" style="text-align: center;"
									class="form-control" id="reg_date" name="reg_date"
									value="${cs.reg_date}" disabled="disabled">
							<p>
								<br /> <label id="cs4" for="subject"><strong>제목</strong></label>
								<input type="text" style="text-align: center;"
									class="form-control" id="subject" name="subject"
									value="${cs.subject}" required="required">
							<p>
								<br /> <label id="cs4" for="content"><strong>내용</strong></label>
								<input type="text" style="text-align: center;"
									class="form-control" id="content" name="content"
									value="${cs.content}" required="required">
							</div>
							<br />
							<input type="submit" value="수정">
							<input type="reset" value="취소">
						<p>
					<br /> <br />
				</form>
				</div>
				</div>
		<%@ include file="/inc/footer.jsp"%>
</body>
</html>