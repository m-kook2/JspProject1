<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<%@ include file="/inc/top.jsp"%>
</head>
<body>
	<%@ include file="/inc/header.jsp"%>
	<div class="col-sm text-center" style="padding: 30px">
	<form action="reviewwritePro.do?pageNum=${pageNum}&id=${id}" method="post">
		<input type="hidden" name="p_idx" value="${p_idx}">
		<h2>게시판 글쓰기</h2>
		<table class=table >
			<tr>
				<select name="m_idx">
					<c:forEach var="result" items="${list}">
						<option value="${result.m_idx}">${result.m_name}</option>
					</c:forEach>
				</select>
			</tr>
			<tr>
				<td>제목  <input type="text" name="p_title" required="required"></td>
				
			</tr>
			<tr>
				<td>내용  <textarea rows="10" cols="30" name="p_content" required="required"></textarea></td>
				
			</tr>
			<tr>
				<td><input type="submit" value="확인">  <input type="reset" value="다시작성"></td>
			</tr>
		</table>
	</form>
	</div>

	<%@ include file="/inc/footer.jsp"%>
</body>
</html>