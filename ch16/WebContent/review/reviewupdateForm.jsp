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
	<form action="reviewupdatePro.do" method="post">
		<input type="hidden" name="p_idx" value="${review.p_idx}"> 
		<input type="hidden" name="pageNum" value="${pageNum}">
		<table class="table">
			<tr>

				<h2>게시판 수정</h2>
			
				<td>글번호 ${review.p_idx}</td>
				<td>작성자 ${review.id}</td>
				<td>작성일 ${review.p_date}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="p_title" required="required"
					value="${review.p_title}"></td>
				<td></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><pre><textarea rows="10" cols="40" name="p_content" required="required">
				${review.p_content}</textarea>
				</pre></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2">
				<input class="btn m-2 btn-primary mx-auto" type="submit" value="수정"></td>
				<td colspan="2">
				<input class="btn m-2 btn-primary mx-auto" type="reset" value="취소"></td>
			</tr>
		</table>
	
	</form>
	</div>

	<%@ include file="/inc/footer.jsp"%>
</body>
</html>