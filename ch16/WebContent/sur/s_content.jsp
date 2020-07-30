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
					<td>설문 소개</td>
					<td colspan="2">${survey.s_content }</td>
				</tr>
				<tr>
					<td>설문 항목</td>
					<td colspan="2">
						<form action="">
							<c:if test="${survey.s_op1 != null && !survey.s_op1.equals('') }">
								<p><input type="radio" name="r_op" value="1" />${survey.s_op1 }</p>
							</c:if>
							<c:if test="${survey.s_op2 != null && !survey.s_op2.equals('') }">
								<p><input type="radio" name="r_op" value="12" />${survey.s_op2 }</p>
							</c:if>
							<c:if test="${survey.s_op3 != null && !survey.s_op3.equals('') }">
								<p><input type="radio" name="r_op" value="3" />${survey.s_op3 }</p>
							</c:if>
							<c:if test="${survey.s_op4 != null && !survey.s_op4.equals('') }">
								<p><input type="radio" name="r_op" value="4" />${survey.s_op4 }</p>
							</c:if>
							<c:if test="${survey.s_op5 != null && !survey.s_op5.equals('') }">
								<p><input type="radio" name="r_op" value="5" />${survey.s_op15 }</p>
							</c:if>
						</form>
					</td>
				</tr>
			</table>
			<div class="col mx-auto text-center">
				<a href="surveyList.do?pageNum=${pageNum }"><button
						class="button btn-primary">목록으로</button></a>
				<c:if test="${sessionScope.status == 2 }">
					<div class="row admin">
						<form action="surveyDelete.do">
							<input type="hidden" name="s_idx" value=${survey.s_idx } /> <input
								type="hidden" name="pageNum" value=${pageNum } /> <input
								type=submit class="btn m-2 btn-primary" value="설문조사 삭제">
						</form>
					</div>
				</c:if>
			</div>
		</div>



		<div class="row">
			<table>
				<tr>
					<th>댓글</th>
					<th colspan="2">
						<!-- 댓글 페이지 include -->
					</th>
				</tr>



				<c:if test="${surCnt > 0 }">
					<c:forEach var="sgComm" items="${list }">
						<tr>
							<td><b>${sgComm.nickname }</b></td>
							<td class="p-3" colspan="2">
								<p><b>${sgComm.nickname } 님은 ${sgComm.r_op}번 항목에 투표하셨습니다!</b></p>
								<p>${sgComm.r_content}</p>
								<p class="text-right">${sgComm.r_regdate}</p>
							</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${surCnt == 0 }">
					<tr>
						<td colspan="3">등록된 코멘트가 없습니다.</td>
					</tr>
				</c:if>
			</table>


		</div>
	</div>

	<%@ include file="/inc/footer.jsp"%>
</body>
</html>