<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/inc/top.jsp" %>
<script type="text/javascript">
	function excelDown2() {
		document.frm.action="/commExcelDown.do";
		document.frm.method="post";
		document.frm.submit();
	}
	function mnglist() {
		document.frm.action="/commMngList.do";
		document.frm.method="post";
		document.frm.submit();
	}
</script>
</head>
<body>
<%@ include file="/inc/header.jsp" %>
<div class="container text-center">
<form name="frm" method="post">
	<h2 style="padding-bottom: 50px; margin-top: 50px;">댓글 관리 게시판<img src="https://img.icons8.com/plasticine/60/000000/delete-chat--v2.png"/></h2>
	<input type="button" value="회원 댓글 엑셀" onclick="excelDown2();" style="float: left;" class="btn btn-secondary m-1 btn-sm">
	<input type="button" value="확인" onclick="mnglist();" style="float: right; margin-right: 5px;" class="btn btn-dark"/>
	<br>
	<br>
	<table class="table table-hover">
		<thead>
	      <tr>
	      	<th>구분</th>
	        <th>순번</th> 
			<th>회원아이디</th>
			<th>댓글내용</th>
			<th>작성일자</th>	
			<th>삭제여부</th>
	      </tr>
	    </thead>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="result" items="${list}">
				<tr>
					<td><input type="checkbox" id="c_idx" name="c_idx" value="${result.c_idx}-${result.del_yn}"/></td>
					<td>${startNum}</td>
					<td>${result.id}</td>
					<td>${result.c_content }</td>
					<td class="left" width=150 >
						<fmt:parseDate value="${result.date }" var="date" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${date }" pattern="yyyy-MM-dd"/>
					</td>
					<td>
						<c:if test="${result.del_yn eq 'Y'}">
							삭제
						</c:if>
						<c:if test="${result.del_yn eq 'N'}">
							복구
						</c:if>
					</td>
				</tr>
				<c:set var="startNum" value="${startNum - 1 }" />
			</c:forEach>
		</c:if>
		<c:if test="${totCnt == 0 }">
			<tr>
				<td colspan=11>데이터가 없습니다</td>
			</tr>
		</c:if>
	</table>
</form>
	<div style="text-align: center; margin-bottom: 50px;">
		<c:if test="${startPage > blockSize }">
			<a href='commMngList.do?pageNum=${startPage-blockSize}'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='commMngList.do?pageNum=${i}'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='commMngList.do?pageNum=${startPage+blockSize}'>[다음]</a>
		</c:if>
	</div>
</div>	
<%@ include file="/inc/footer.jsp" %>
</body>
</html>