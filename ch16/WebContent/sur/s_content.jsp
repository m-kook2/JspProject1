<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/inc/top.jsp"%>
</head>
<body>
	<%@ include file="/inc/header.jsp"%>
	<div class="container">
		<div class="row">
			<table class="table mx-auto">
				<tr>
					<td>제목</td>
					<td colspan="2">${s_sub }</td>
				</tr>
				<tr>
					<td>등록번호</td>
					<td colspan="2">${s_idx }</td>
				</tr>
				<tr>
					<td>시작일자</td>
					<td colspan="2">${s_sdate }</td>
				</tr>
				<tr>
					<td>종료일자</td>
					<td colspan="2">${s_edate }</td>
				</tr>
				<tr>
					<td>설문 내용</td>
					<td colspan="2">${s_content }</td>
				</tr>
				<tr>
					<td>댓글 작성</td>
					<td colspan="2">
						<!-- 댓글 페이지 include -->
					</td>
				</tr>

			</table>


		</div>
	</div>

	<%@ include file="/inc/footer.jsp"%>
</body>
</html>