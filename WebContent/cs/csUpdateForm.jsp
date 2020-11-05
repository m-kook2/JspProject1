<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>의견관리 수정</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
#cs4 {
	width: 140px;
	float: left;
}

.form-control {
	width: 150px;
	float: light;
}

.form-group .label_container,
.form-group .input_container{
width: 100%;
display: flex;
justify-content: space-between;
align-items: center;
}
.form-group .label,
 .form-group .input_container input{
width: 33%;
}

.form-group .input_content_container{
width: 100%;
}
.form-group .input_content{
width : 100%;
height : 100px;
border : 1px solid #ced4da;
border-radius : .25rem;

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
					<h2 style="padding-bottom: 50px; margin-top: 50px;">
						<strong>글 수정</strong>
					</h2>
					<br /> <img alt="csUpdatePhoto" src="./images/cs/jj.jpg"
						width="500">
					<p>

						<!-- hidden으로  c_idx, pageNum정보를 csUpdatePro.do 보내줌 -->
						<input type="hidden" name="c_idx" value="${cs.c_idx}"> <input
							type="hidden" name="pageNum" value="${pageNum}">
					<div class="label_container">
						<label id="cs4" for="c_idx"><strong>글번호</strong></label> <label
							id="cs4" for="writer"><strong>작성자</strong></label> <label
							id="cs4" for="reg_date"><strong>작성일</strong></label>
					</div>

					<div class="input_container">
						<input type="text" style="text-align: center;"
							class="form-control" id="c_idx" name="c_idx" value="${cs.c_idx}"
							disabled="disabled"> <input type="text"
							style="text-align: center;" class="form-control" id="writer"
							name="writer" value="${cs.writer}" disabled="disabled"> <input
							type="text" style="text-align: center;" class="form-control"
							id="reg_date" name="reg_date" value="${cs.reg_date}"
							disabled="disabled">
					</div>
					<p>
					<p>
						<br /> <label id="cs4" for="subject"><strong>제목</strong></label>
						<input type="text" style="text-align: center;"
							class="form-control" id="subject" name="subject"
							value="${cs.subject}" required="required">
					<p>
						<br /> <label id="cs4" for="content"><strong>내용</strong></label>
					<div class="input_content_container">
						<input type="text" style="text-align: center;"
							class="form-control input_content" id="content" name="content"
							value="${cs.content}" required="required">
					</div>
				</div>
				<br />
				<button type="submit" class="btn btn-dark">수정</button>
				<button type="reset" class="btn btn-dark">취소</button>
				<p>
				<p>
					<button type="button" class="btn btn-warning"
						onclick="location.href='csList.do?pageNum=${pageNum }'">
						<i class="fa fa-bars"></i>
					</button>
				<p>
					<br /> <br />
			</form>
		</div>
	</div>
	<%@ include file="/inc/footer.jsp"%>
</body>
</html>