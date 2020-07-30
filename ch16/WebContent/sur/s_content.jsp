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
					<th>제목</th>
					<th colspan="2">${survey.s_sub }</th>
				</tr>
				<tr>
					<td>등록번호</td>
					<td colspan="2">${survey.s_idx }</td>
				</tr>
				<tr>
					<td>시작일자</td>
					<td colspan="2">${survey.s_sdate }</td>
				</tr>
				<tr>
					<td>종료일자</td>
					<td colspan="2">${survey.s_edate }</td>
				</tr>
				<tr>
					<td>설문 내용</td>
					<td colspan="2">${survey.s_content }</td>
				</tr>
				<tr>
					<td></td>
					<td colspan="2"></td>
				</tr>
			</table>
			<div class="col mx-auto text-center">
				<a href="surveyList.do?pageNum=${pageNum }"><button
						class="button btn-primary">목록으로</button></a>
				<c:if test="${sessionScope.status == 2 }">
					<div class="row admin">
						<form action="surveyDelete.do?pageNum=${pageNum }">
							<button class="btn m-2 btn-primary">설문조사 삭제</button>
						</form>
					</div>
				</c:if>
			</div>
		</div>
			
			
			<div class="row">
			<table>
				<tr>
					<th>댓글 작성</th>
					<th colspan="2">
						<!-- 댓글 페이지 include -->
					</th>
				</tr>
			</table>


		</div>
	</div>

	<%@ include file="/inc/footer.jsp"%>
</body>
</html>