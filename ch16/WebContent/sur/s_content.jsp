<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/inc/top.jsp"%>

</head>
<body>


	<!-- 
	
		설문조사 컨텐츠 s_content.jsp
		2020 08 06
		작성자 박종찬

		이 페이지가 제공하는/제공 받아야하는 파라메터 목록
	
		s_idx : 설문조사 ID
		pageNum : 설문조사 게시판 페이지 넘버
		commPageNum : 설문조사 게시판 코멘트의 페이지 넘버
		
		서비스에서 전송받는 어트리뷰트와 별개로 
		매 페이지 로딩에 필요한 파라메터 목록을 정리할 필요가 있었다.
		부트스트랩과 테이블을 이용해 출력
	
	-->
	<%@ include file="/inc/header.jsp"%>

	<div class="container">
		<div class="row">
			<table class="table table-hover table-condensed mx-auto m-1">
				<tr>
					<th style="width: 200px">제목</th>
					<th colspan="2">${survey.s_sub }</th>
				</tr>
				<tr>
					<td>등록번호</td>
					<td colspan="2">${survey.s_idx }</td>
				</tr>
				<tr>
					<td>시작일자/종료일자</td>
					<td colspan="2">${survey.s_sdate }~${survey.s_edate }</td>
				</tr>
				<tr>
					<td>설문 소개</td>
					<td colspan="2">${survey.s_content }
						<p><b>${survey.commCnt} 명이 이 설문조사에 참여했습니다.</b></p>
					</td>
				</tr>
				<tr>
					<td>설문 항목</td>
					<td colspan="2">
								<!--
									DIVIDED BY 0 처리를 위해 페이징에 사용되는 surCnt와 별개로
									설문조사 참여자 수 그래프 바 표시를 위한 surCnt2를 변수로 만들어 생성해두었다.
								
								-->
							<c:if test="${isVoted || !survey.votable}">
							<!--  
								투표에 이미 참여했거나 투표 참여기간이 지난 경우
							
							 -->
							<c:set var="surCnt2" value="${surCnt }"></c:set>
							<c:if test="${surCnt2 == 0}">
								<c:set var="surCnt2" value="1"></c:set>
							</c:if>

							<!-- 
							
								if문을 이용해서 s_op#이 null 또는 공백일 경우, 즉 작성되지 않은 선택지일 경우
								미표시하도록 처리했다.
								
								EL 표현식을 이용해 선택지의 투표율을 계산해 출력했고, #.# 패턴으로 작성되는 것을 
								피하기 위해서 formatNumber를 이용해 # 패턴으로 정리했다.
					
							 -->
							<c:if test="${survey.s_op1 != null && !survey.s_op1.equals('') }">
								${survey.s_op1 } : <fmt:formatNumber value="${survey.op1Cnt / surCnt2 * 100}" pattern="#" />%
								<div class="progress" style="background-color: transparent;">
									<div class="progress-bar" style="width:${survey.op1Cnt / surCnt2 * 100}%">
										<fmt:formatNumber value="${survey.op1Cnt / surCnt2 * 100}" pattern="#" />%
									</div>
								</div>
							</c:if>
							<c:if test="${survey.s_op2 != null && !survey.s_op2.equals('') }">
									${survey.s_op2 } : <fmt:formatNumber
									value="${survey.op2Cnt / surCnt2 * 100}" pattern="#" />
										%
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
									${survey.s_op3 } : <fmt:formatNumber
									value="${survey.op3Cnt / surCnt2 * 100}" pattern="#" />
										%
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
									${survey.s_op4 } : <fmt:formatNumber
									value="${survey.op4Cnt / surCnt2 * 100}" pattern="#" />
										%
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
									${survey.s_op5 } : <fmt:formatNumber
									value="${survey.op5Cnt / surCnt2 * 100}" pattern="#" /> %
								<div class="progress" style="background-color: transparent;">
									<div class="progress-bar"
										style="width:${survey.op5Cnt / surCnt2 * 100}%">
										<fmt:formatNumber value="${survey.op5Cnt / surCnt2 * 100}"
											pattern="#" />
										%
									</div>
								</div>
							</c:if>
						</c:if> 
						<!-- 
						
						투표를 한 경우에는 이미 투표했음을 출력 
						
						-->
						
						<!--
						
						투표하지 않았고, 투표 참여 가능기간일 경우에는 if문을 이용해
						투표 선택지를 출력한다. 공백인 투표 선택지는 미출력하도록 다시 if문을 사용. 
						
						투표 선택지와 설문 참여 버튼이 테이블 내의 다른 row에 들어있어
						form에 입력하기 까다로워, form attribute를 사용해 직접 넣어주었다.
						인터넷 익스플로러에선 지원하지 않는 경우도 있다고 하니 요주의
						
						 -->
						<c:if test="${isVoted }">
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
								<p><input type="radio" name="r_op" value="5" form="comment" />${survey.s_op5 }</p>
							</c:if>
						</c:if></td>
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
							<form action="surveyCommentWrite.do" method="post" name="scWrite" id="comment">
							
								<input type="hidden" name="pageNum" value="${pageNum }" /> 
								<input type="hidden" name="s_idx" value="${s_idx }" />
								
								<p>
									<textarea id="r_content" name="r_content" rows="10" cols="40"></textarea></p>
								<p>
									<input 	type="submit" class="btn m-2 btn-primary"
											value="투표+댓글 작성" /> 
									<input 	type="button" class="btn m-2 btn-secondary" 
											value="댓글없이 투표" onclick="noCommentHandler()" />
								</p>
								
								<!--  
								
									noCommentHandler는 댓글없이 투표를 눌렀을 때 호출되어
									r_content의 내용을 비우고 submit 해준다.
									
								 -->
							</form>
						</td>
					</tr>
				</c:if>
			</table>


		</div>
		<div class="row text-center m-3">
			<div class="mx-auto">
				<a href="surveyList.do?pageNum=${pageNum }">
					<button class="btn btn-primary">목록으로</button>
				</a>
				<c:if test="${sessionScope.status == 2 }">
					<form action="surveyModify.do" style="display: inline;">
						<input type="hidden" name="s_idx" value=${survey.s_idx } /> 
						<input type="hidden" name="pageNum" value=${pageNum } /> 
						<input type=submit class="btn btn-danger" value="설문조사 수정">
					</form>
					<form action="surveyDelete.do" style="display: inline;">
						<input type="hidden" name="s_idx" value=${survey.s_idx } /> 
						<input type="hidden" name="pageNum" value=${pageNum } /> 
						<input type=submit class="btn btn-danger" value="설문조사 삭제">
					</form>
				</c:if>
			</div>
		</div>



		<div class="row">
			<table class="table m-3">
				<tr>
					<th>작성자</th>
					<th colspan="2">코멘트</th>
				</tr>



				<c:if test="${surCnt > 0 }">
					<c:forEach var="sgComm" items="${list }">
						<tr>
							<td><b>${sgComm.nickname }</b></td>
							<td class="p-3" colspan="2">
								<p><b>${sgComm.nickname } 님은 ${sgComm.r_op}에 투표하셨습니다!</b></p>
								<p>${sgComm.r_content}</p>
								<p class="text-right">작성일 : ${sgComm.r_regdate}</p> <c:if
									test="${sgComm.id == sessionScope.id || sessionScope.status == 2 }">
									<div class="text-right">
										<form action="surveyCommentDelete.do">
											<input type="hidden" name="s_idx" value="${param.s_idx }">
											<input type="hidden" name="pageNum" value="${param.pageNum }">
											<input type="hidden" name="writerid" value="${sgComm.id }">
											<input type="hidden" name="commPageNum" value="${param.commPageNum }"> 
											<input type="submit" class="button btn btn-secondary" value="댓글 삭제" />
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
		<div class="row m-3">
			<div class="mx-auto">
				<c:if test="${startPage > blockSize }">
					<a href='surveyContent.do?pageNum=${param.pageNum }&s_idx=${param.s_idx }&commPageNum=${startPage - blockSize }'>[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<a href='surveyContent.do?pageNum=${param.pageNum }&s_idx=${param.s_idx }&commPageNum=${i}'>[${i}]</a>
				</c:forEach>
				<c:if test="${endPage > surCnt }">
					<a href='surveyContent.do?pageNum=${param.pageNum }&s_idx=${param.s_idx }&commPageNum=${startPage + blockSize }'>[다음]</a>
				</c:if>
			</div>
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