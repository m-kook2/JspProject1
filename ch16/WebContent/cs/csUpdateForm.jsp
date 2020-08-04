<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/inc/top.jsp"%>
</head>
<body>
	<%@ include file="/inc/header.jsp"%>
	<div class="col-sm text-center" style="padding: 30px">
	
			<!-- csView에서 c_idx, pageNum, cs의  모든 정보를 받아옴 -->
		<form action="csUpdatePro.do" method="post">
		<!-- hidden으로  c_idx, pageNum정보를 csUpdatePro.do 보내줌 -->
			<input type="hidden" name="c_idx" value="${cs.c_idx}"> <input
				type="hidden" name="pageNum" value="${pageNum}">
			<table class="table">
				<tr>

					<h2>글 수정</h2>

					<td>글번호 ${cs.c_idx}</td>
					<td>작성자 ${cs.writer}</td>
					<td>작성일 ${cs.reg_date}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject" required="required"
						value="${cs.subject}"></td>
					<td></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><pre>
							<textarea rows="5" cols="30" name="content"
								style="text-align: left;" required="required">
				${cs.content}</textarea>
				</pre></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" class="btn m-2 btn-primary mx-auto"><input
						type="submit" value="수정"></td>
					<td colspan="2"><input type="submit" value="취소"></td>
				</tr>
			</table>

		</form>
	</div>

	<%@ include file="/inc/footer.jsp"%>
</body>
</html>