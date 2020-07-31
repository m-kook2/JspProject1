<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/inc/top.jsp"%>
<style>
.graph {
	width: 100%;
}

#graph_op1 {
	width: 1%;
	height: 12px;
	background-color: green;
}

#graph_op2 {
	width: 1%;
	height: 12px;
	background-color: green;
}

#graph_op3 {
	width: 1%;
	height: 12px;
	background-color: green;
}

#graph_op4 {
	width: 1%;
	height: 12px;
	background-color: green;
}

#graph_op5 {
	width: 1%;
	height: 12px;
	background-color: green;
}
</style>
</head>
<body>


	<!-- 

	이 페이지가 제공하는/제공 받아야하는 파라메터 목록

	s_idx : 설문조사 ID
	pageNum : 설문조사 게시판 페이지 넘버
	commPageNum : 설문조사 게시판 코멘트의 페이지 넘버
	
 -->
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
					<td colspan="2"><c:if test="${isVoted || !survey.votable}">
							<c:set var="surCnt2" value="${surCnt }"></c:set>
							<c:if test="${surCnt2 == 0}">
								<c:set var="surCnt2" value="1"></c:set>
							</c:if>

							<c:if test="${survey.s_op1 != null && !survey.s_op1.equals('') }">
									${survey.s_op1 } : 
								<div class="progress" style="background-color: transparent;">
									<div class="progress-bar"
										style="width:${survey.op1Cnt / surCnt2 * 100}%">
										<fmt:formatNumber value="${survey.op1Cnt / surCnt2 * 100}"
											pattern="#" />
										%
									</div>
								</div>
							</c:if>
							<c:if test="${survey.s_op2 != null && !survey.s_op2.equals('') }">
									${survey.s_op2 } : 
								<div class="progress" style="background-color: transparent;">
									<div class="progress-bar"
										style="width:${survey.op2Cnt / surCnt2 * 100}%">
										<fmt:formatNumber value="${survey.op2Cnt / surCnt2 * 100}"
											pattern="#" />
										%
									</div>
								</div>
							</c:if>
							<c:if test="${survey.s_op3 != null && !survey.s_op3.equals('') }">
									${survey.s_op3 } : 
								<div class="progress" style="background-color: transparent;">
									<div class="progress-bar"
										style="width:${survey.op3Cnt / surCnt2 * 100}%">
										<fmt:formatNumber value="${survey.op3Cnt / surCnt2 * 100}"
											pattern="#" />
										%
									</div>
								</div>
							</c:if>
							<c:if test="${survey.s_op4 != null && !survey.s_op4.equals('') }">
									${survey.s_op4 } : 
								<div class="progress" style="background-color: transparent;">
									<div class="progress-bar"
										style="width:${survey.op4Cnt / surCnt2 * 100}%">
										<fmt:formatNumber value="${survey.op4Cnt / surCnt2 * 100}"
											pattern="#" />
										%
									</div>
								</div>
							</c:if>
							<c:if test="${survey.s_op5 != null && !survey.s_op5.equals('') }">
									${survey.s_op5 } style="background-color: transparent;": 
								<div class="progress">
									<div class="progress-bar"
										style="width:${survey.op5Cnt / surCnt2 * 100}%">
										<fmt:formatNumber value="${survey.op5Cnt / surCnt2 * 100}"
											pattern="#" />
										%
									</div>
								</div>
							</c:if>
						</c:if> <c:if test="${isVoted }">
							<p>이미 투표하셨습니다!</p>
						</c:if> <c:if test="${!isVoted && survey.votable}">
							<c:if test="${survey.s_op1 != null && !survey.s_op1.equals('') }">
								<p><input type="radio" name="r_op" value="1" form="comment"
									required />${survey.s_op1 }</p>
							</c:if>
							<c:if test="${survey.s_op2 != null && !survey.s_op2.equals('') }">
								<p><input type="radio" name="r_op" value="2" form="comment" />${survey.s_op2 }</p>
							</c:if>
							<c:if test="${survey.s_op3 != null && !survey.s_op3.equals('') }">
								<p><input type="radio" name="r_op" value="3" form="comment" />${survey.s_op3 }</p>
							</c:if>
							<c:if test="${survey.s_op4 != null && !survey.s_op4.equals('') }">
								<p><input type="radio" name="r_op" value="4" form="comment" />${survey.s_op4 }</p>
							</c:if>
							<c:if test="${survey.s_op5 != null && !survey.s_op5.equals('') }">
								<p><input type="radio" name="r_op" value="5" form="comment" />${survey.s_op15 }</p>
							</c:if>
						</c:if>
						<p>참여 인원수 : ${survey.commCnt}</p></td>
				</tr>
				<c:if test="${!survey.votable}">
					<tr>
						<td></td>
						<td colspan="1">
							<p><b>투표가 종료되었습니다!</b></p>
						</td>
						<td></td>
					</tr>
				</c:if>

				<c:if test="${!isVoted && survey.votable}">
					<tr>
						<td><p>댓글</p></td>
						<td colspan="2">
							<form action="surveyCommentWrite.do" method="post" name="scWrite"
								id="comment">
								<input type="hidden" name="pageNum" value="${pageNum }" /> <input
									type="hidden" name="s_idx" value="${s_idx }" />
								<p><textarea id="r_content" name="r_content" rows="10"
										cols="40"></textarea></p>
								<p><input type="submit" class="btn m-2 btn-primary"
									value="투표+댓글 작성" /> <input type="button"
									class="btn m-2 btn-secondary" value="댓글없이 투표"
									onclick="noCommentHandler()" /></p>
							</form>
						</td>
					</tr>
				</c:if>
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
							type=submit class="btn m-2 btn-danger" value="설문조사 삭제">
					</form>
				</div>
			</c:if>
		</div>



		<div class="row">
			<table class="table">
				<tr>
					<th>작성자</th>
					<th colspan="2">코멘트</th>
				</tr>



				<c:if test="${surCnt > 0 }">
					<c:forEach var="sgComm" items="${list }">
						<tr>
							<td><b>${sgComm.nickname }</b></td>
							<td class="p-3" colspan="2">
								<p><b>${sgComm.nickname } 님은 ${sgComm.r_op}번 항목에
										투표하셨습니다!</b></p>
								<p>${sgComm.r_content}</p>
								<p class="text-right">작성일 : ${sgComm.r_regdate}</p> <c:if
									test="${sgComm.id == sessionScope.id || sessionScope.status == 2 }">
									<div class="text-right">
										<form action="surveyCommentDelete.do">
											<input type="hidden" name="s_idx" value="${param.s_idx }">
											<input type="hidden" name="pageNum" value="${param.pageNum }">
											<input type="hidden" name="writerid" value="${sgComm.id }">
											<input type="hidden" name="commPageNum"
												value="${param.commPageNum }"> <input type="submit"
												class="button btn btn-secondary" value="댓글 삭제" />
										</form>
									</div>
								</c:if>
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
		<div class="row text-center">
			<c:if test="${startPage > blockSize }">
				<a
					href='surveyContent.do?pageNum=${param.pageNum }&s_idx=${param.s_idx }&commPageNum=${startPage - blockSize }'>[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<a
					href='surveyContent.do?pageNum=${param.pageNum }&s_idx=${param.s_idx }&commPageNum=${i}'>[${i}]</a>
			</c:forEach>
			<c:if test="${endPage > surCnt }">
				<a
					href='surveyContent.do?pageNum=${param.pageNum }&s_idx=${param.s_idx }&commPageNum=${startPage + blockSize }'>[다음]</a>
			</c:if>
		</div>
	</div>

	<%@ include file="/inc/footer.jsp"%>
	<script>
		function noCommentHandler() {
			document.getElementById("r_content").value = ""
			document.getElementById("comment").submit();
		}
	</script>
</body>
</html>