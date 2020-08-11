<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/inc/top.jsp"%>
<script>
	function excelDown(){
		document.frm.action="/csExcelDown.do";
		document.frm.method="post";
		document.frm.submit();
	}
</script>
</head>
<body>
	<%@ include file="/inc/header.jsp"%>
	
	<div class="container">
	<div style="margin-top: 30px"></div>
	<div class="col-sm text-center">
		<h2 class="text">고객 의견함</h2>
		<c:if test="${sessionScope.status eq '2'}">
		<form action="" name="frm">
		<p><input type="button" value="엑셀 다운로드" onclick="excelDown();" style="float: left;" class="btn btn-secondary m-1 btn-sm" /></p>
		</form>
		</c:if>
		<table class="table">
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>글 등록일</td>
			</tr>


			<c:if test="${totCnt > 0 }">
				<c:forEach var="cs" items="${list }">
					<tr>
						<td>${startNum }</td>
						<td class="left" width="200">
							<!-- ref=본문 참조 번호 || ref_step=같은 본문의 댓글순차번호 || re_level=0:본문/1:첫번째 댓글/ 2:대댓글 -->
							<!-- 댓글 빈칸이미지-->
							<c:if test="${cs.re_level > 0 }">
							<!-- re_level * 10px -->
								<img src='images/level.gif' width="${cs.re_level * 10 }">
								<img src='images/next.png' width="10">
							</c:if> <a href='csView.do?c_idx=${cs.c_idx }&pageNum=${currentPage}'>
								${cs.subject}</a>
						</td>
						<td>${cs.writer }</td>
						<td>${cs.reg_date }</td>
					</tr>
					<c:set var="startNum" value="${startNum-1 }"></c:set>
				</c:forEach>
			</c:if>
			<c:if test="${totCnt ==0 }">
				<tr>
					<td colspan="5">데이터가 없습니다.</td>
				</tr>
			</c:if>
		</table>
	</div>


	<div class="text-center">
		<c:if test="${startPage > blockSize }">
			<a href='csList.do?pageNum=${startPage-blockSize}'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='csList.do?pageNum=${i }'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage > pageCnt }">
			<a href='csList.do?pageNum=${startPage+blockSize }'>[다음]</a>
		</c:if>
	</div>
</div>
	<%@ include file="/inc/footer.jsp"%>
</body>
</html>