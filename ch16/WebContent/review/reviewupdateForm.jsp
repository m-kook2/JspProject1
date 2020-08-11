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
<div class="container" >
	<div class="container col-sm text-center " style="padding: 30px">
	<form action="reviewupdatePro.do" method="post">
		<input type="hidden" name="p_idx" value="${review.p_idx}"> 
		<input type="hidden" name="pageNum" value="${pageNum}">
		<table class="table">
			<h2>게시판 수정</h2>
			<tr>
				<td>글번호 ${review.p_idx}</td>
				<td class="text-right">작성자 ${review.id}</td>
				<td class="text-right">작성일 ${review.p_date}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="2">
				<input class="form-control" type="text" name="p_title" required="required" value="${review.p_title}"></td>
				<td></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="2"><pre><textarea class="form-control" rows="10" cols="40" name="p_content" required="required">${review.p_content}</textarea>
				</pre></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="3">
					<input class="btn m-2 btn-dark mx-auto" type="submit" value="수정">
					<input class="btn m-2 btn-dark mx-auto" type="button" value="취소" onclick="location.href='r_list.do?&pageNum=${pageNum}'">
				</td>
			</tr>
		</table>
	
	</form>
	</div>
</div>	

	<%@ include file="/inc/footer.jsp"%>
</body>
</html>