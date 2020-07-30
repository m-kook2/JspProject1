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
					<td>시작일자/종료일자</td>
					<td>${survey.s_sdate }</td>
					<td>~ ${survey.s_edate }</td>
				</tr>
				<tr>
					<td>설문 소개</td>
					<td colspan="2">${survey.s_content }</td>
				</tr>
				<tr>
					<td>설문 항목</td>
					<td colspan="2"><c:if
							test="${survey.s_op1 != null && !survey.s_op1.equals('') }">
							<p><input type="radio" name="r_op" value="1" form="comment" />${survey.s_op1 }</p>
						</c:if> <c:if test="${survey.s_op2 != null && !survey.s_op2.equals('') }">
							<p><input type="radio" name="r_op" value="12" form="comment" />${survey.s_op2 }</p>
						</c:if> <c:if test="${survey.s_op3 != null && !survey.s_op3.equals('') }">
							<p><input type="radio" name="r_op" value="3" form="comment" />${survey.s_op3 }</p>
						</c:if> <c:if test="${survey.s_op4 != null && !survey.s_op4.equals('') }">
							<p><input type="radio" name="r_op" value="4" form="comment" />${survey.s_op4 }</p>
						</c:if> <c:if test="${survey.s_op5 != null && !survey.s_op5.equals('') }">
							<p><input type="radio" name="r_op" value="5" form="comment" />${survey.s_op15 }</p>
						</c:if></td>
				</tr>
				<tr>

					<td><p>댓글 :</p></td>
					<td colspan="2">
						<form action="surveyCommentWrite.do" name="scWrite" id="comment">
							<input type="hidden" name="pageNum" value="${pageNum }" /> <input
								type="hidden" name="s_idx" value="${s_idx }" /> 
							<p><textarea id="r_content" name="r_content" rows="10" cols="40"></textarea></p>
							<p><input type="submit" class="btn m-2 btn-primary"
								value="투표+댓글 작성" /> <input type="button"
								class="btn m-2 btn-secondary" value="댓글없이 투표" onclick="noCommentHandler()"/></p>
						</form>
					</td>
				</tr>
			</table>


		</div>
		<div class="row mx-auto text-center">
			<a href="surveyList.do?pageNum=${pageNum }"><button
					class="btn btn-primary m-2">목록으로</button></a>
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



		<div class="row">
			<table class="table">
				<tr>
					<th>작성자</th>
					<th colspan="2">내용</th>
				</tr>



				<c:if test="${surCnt > 0 }">
					<c:forEach var="sgComm" items="${list }">
						<tr>
							<td><b>${sgComm.nickname }</b></td>
							<td class="p-3" colspan="2">
								<p><b>${sgComm.nickname } 님은 ${sgComm.r_op}번 항목에
										투표하셨습니다!</b></p>
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
	<script>
	function noCommentHandler(){
		document.getElementById("r_content").value =""
		document.getElementById("comment").submit();
	}
	</script>
</body>
</html>