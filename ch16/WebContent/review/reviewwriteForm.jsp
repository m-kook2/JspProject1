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
	
	<div class="container text-center" style="padding: 30px">
	<form action="reviewwritePro.do?pageNum=${pageNum}&id=${id}" method="post">
		<input class="form-control" type="hidden" name="p_idx" value="${p_idx}">
		<h2>게시판 글쓰기</h2>
		<table width="100%">
			<tr>
				<td style="float: left">
				영화
				</td>
			</tr>
			<tr>	
				<td>
				<select class="form-control" name="m_idx">
					<c:forEach var="result" items="${list}">
						 <option class="form-control" value="${result.m_idx}">${result.m_name}</option>
					</c:forEach>
				</select>
				<td>
			</tr>
			<tr>
				<td style="float: left">제목 </td>
				
			</tr>
			<tr>
				<td>
					 <input class="form-control" type="text" name="p_title" required="required">
				</td>
			</tr>
			<tr>
				<td style="float: left">내용 </td>
				
			</tr>
			<tr>
				<td>
					<textarea class="form-control" rows="10" cols="30" name="p_content" required="required"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<input class="btn m-2 btn-primary mx-auto" type="submit" value="확인">  
					<input class="btn m-2 btn-primary mx-auto" type="reset" value="다시작성">
				</td>
			</tr>
		</table>
	</form>
	</div>

	<%@ include file="/inc/footer.jsp"%>
</body>
</html>